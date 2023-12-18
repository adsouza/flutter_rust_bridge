// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:build_cli_annotations/build_cli_annotations.dart';
import 'package:flutter_rust_bridge_internal/src/frb_example_pure_dart_generator/generator.dart'
    as frb_example_pure_dart_generator;
import 'package:flutter_rust_bridge_internal/src/makefile_dart/consts.dart';
import 'package:flutter_rust_bridge_internal/src/utils/makefile_dart_infra.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

part 'generate.g.dart';

List<Command<void>> createCommands() {
  return [
    SimpleConfigCommand('generate-internal', generateInternal,
        _$populateGenerateConfigParser, _$parseGenerateConfigResult),
    SimpleConfigCommand(
        'generate-run-frb-codegen-command-generate',
        generateRunFrbCodegenCommandGenerate,
        _$populateGeneratePackageConfigParser,
        _$parseGeneratePackageConfigResult),
    SimpleConfigCommand(
        'generate-run-frb-codegen-command-integrate',
        generateRunFrbCodegenCommandIntegrate,
        _$populateGeneratePackageConfigParser,
        _$parseGeneratePackageConfigResult),
    // more detailed command, can be used to execute just a portion of the main command
    SimpleConfigCommand(
        'generate-internal-frb-example-pure-dart',
        generateInternalFrbExamplePureDart,
        _$populateGenerateConfigParser,
        _$parseGenerateConfigResult),
    SimpleConfigCommand('generate-internal-rust', generateInternalRust,
        _$populateGenerateConfigParser, _$parseGenerateConfigResult),
    SimpleConfigCommand('generate-internal-book-help', generateInternalBookHelp,
        _$populateGenerateConfigParser, _$parseGenerateConfigResult),
    SimpleConfigCommand(
        'generate-internal-contributor',
        generateInternalContributor,
        _$populateGenerateConfigParser,
        _$parseGenerateConfigResult),
    SimpleConfigCommand('generate-internal-readme', generateInternalReadme,
        _$populateGenerateConfigParser, _$parseGenerateConfigResult),
    SimpleConfigCommand(
        'generate-internal-dart-source',
        generateInternalDartSource,
        _$populateGenerateConfigParser,
        _$parseGenerateConfigResult),
    SimpleCommand('generate-website', generateWebsite),
    SimpleCommand('generate-website-build', generateWebsiteBuild),
    SimpleCommand('generate-website-merge', generateWebsiteMerge),
    SimpleCommand('generate-website-serve', generateWebsiteServe),
  ];
}

@CliOptions()
class GenerateConfig {
  @CliOption(defaultsTo: false)
  final bool setExitIfChanged;

  const GenerateConfig({
    required this.setExitIfChanged,
  });
}

@CliOptions()
class GeneratePackageConfig implements GenerateConfig {
  @override
  @CliOption(defaultsTo: false)
  final bool setExitIfChanged;
  final String package;

  const GeneratePackageConfig({
    required this.setExitIfChanged,
    required this.package,
  });
}

Future<void> generateInternal(GenerateConfig config) async {
  await generateInternalFrbExamplePureDart(config);
  await generateInternalRust(config);
  await generateInternalBookHelp(config);
  await generateInternalDartSource(config);
  await generateInternalBuildRunner(config);
  await generateInternalContributor(config);
  await generateInternalReadme(config);
}

Future<void> generateInternalFrbExamplePureDart(GenerateConfig config) async {
  await _wrapMaybeSetExitIfChanged(config, () async {
    await frb_example_pure_dart_generator.generate();
  });
}

Future<void> generateInternalDartSource(GenerateConfig config) async {
  await _wrapMaybeSetExitIfChanged(config, () async {
    final path = randomTempDir();
    await exec('''
    #!/usr/bin/env bash
    set -eux
    mkdir -p $path && cd $path

    git clone --depth 1 --filter=blob:none --sparse --branch stable https://github.com/dart-lang/sdk.git
    (cd sdk && git sparse-checkout set runtime/include)
    cp -rf ./sdk/runtime/include/* ${exec.pwd}frb_rust/src/dart_api/
    rm -rf sdk
  ''');
  });
}

Future<void> generateInternalRust(GenerateConfig config) async {
  await _wrapMaybeSetExitIfChanged(config, () async {
    for (final package in kDartPackages) {
      await runPubGetIfNotRunYet(package);
    }

    await exec('cargo run -- internal-generate', relativePwd: 'frb_codegen');
  });
}

Future<void> generateInternalBookHelp(GenerateConfig config) async {
  await _wrapMaybeSetExitIfChanged(config, () async {
    for (final (cmd, extraArgs) in [
      ('', ''),
      ('generate', ''),
      ('create', ''),
      ('integrate', ''),
      ('build-web', '--dart-root ${exec.pwd}frb_example/pure_dart'),
    ]) {
      final resp = await exec('cargo run -- $cmd $extraArgs --help',
          relativePwd: 'frb_codegen');
      File('${exec.pwd}website/docs/generated/_frb-codegen-command-${cmd.isEmpty ? "main" : cmd}.mdx')
          .writeAsStringSync('```\n${resp.stdout}```');
    }
  });
}

Future<void> generateInternalContributor(GenerateConfig config) async {
  await _wrapMaybeSetExitIfChanged(config, () async {
    final customRaw = loadYaml(
        File('${exec.pwd}/.all-contributors-custom.yaml').readAsStringSync());
    final customConverted = [
      for (final item in customRaw)
        {
          'login': (item as Map<dynamic, dynamic>).keys.single,
          'customMessage': item.values.single,
        }
    ];
    print('customConverted=$customConverted');

    final fileAllContributorsrc = File('${exec.pwd}/.all-contributorsrc');
    final allContributorsrcOld =
        jsonDecode(fileAllContributorsrc.readAsStringSync());

    final contributorNamesNew = [
      'fzyzcjy',
      for (final item in customConverted) item['login'],
    ];
    final allContributorsrcNew = {
      ...allContributorsrcOld,
      'contributors': [
        for (final login in contributorNamesNew)
          allContributorsrcOld['contributors']
              .where((x) => x['login'] == login)
              .single
      ]
    };
    fileAllContributorsrc.writeAsStringSync(
        const JsonEncoder.withIndent('  ').convert(allContributorsrcNew));

    final messageTextNew = [
      for (final item in customConverted)
        '* [${item["login"]}](https://github.com/${item["login"]}): ${item["customMessage"]}\n',
    ].join('');

    File('${exec.pwd}/website/docs/generated/_contributor-custom-message.md')
        .writeAsStringSync(messageTextNew);

    await exec('all-contributors generate');
  });
}

Future<void> generateInternalReadme(GenerateConfig config) async {
  await _wrapMaybeSetExitIfChanged(config, () async {
    final dirBase = '${exec.pwd}/website/docs/';
    const prelude =
        '# [flutter_rust_bridge](https://github.com/fzyzcjy/flutter_rust_bridge)\n';
    final text = prelude +
        File('$dirBase/snippets/_readme-one.md').readAsStringSync() +
        File('$dirBase/generated/_contributor-custom-message.md')
            .readAsStringSync();
    File('${exec.pwd}/README.md').writeAsStringSync(text);
  });
}

Future<void> generateInternalBuildRunner(GenerateConfig config) async {
  await _wrapMaybeSetExitIfChanged(config, () async {
    for (final package in kDartNonExamplePackages) {
      await runPubGetIfNotRunYet(package);
      await exec('dart run build_runner build --delete-conflicting-outputs',
          relativePwd: package);
    }
  });
}

Future<void> generateRunFrbCodegenCommandGenerate(
    GeneratePackageConfig config) async {
  await _wrapMaybeSetExitIfChanged(config, () async {
    await runPubGetIfNotRunYet(config.package);
    await executeFrbCodegen(
      relativePwd: config.package,
      cmd: 'generate',
    );
  });
}

Future<void> generateRunFrbCodegenCommandIntegrate(
    GeneratePackageConfig config) async {
  await _wrapMaybeSetExitIfChanged(config,
      extraArgs:
          "':(exclude)*Podfile' ':(exclude)*.xcconfig' ':(exclude)pubspec.lock'",
      () async {
    final dirPackage = path.join(exec.pwd!, config.package);

    // Use temp dir within the repo. If use system-wide temp directory,
    // may see "OS Error: Cross-device link, errno = 18" and cannot use the
    // cheap "move directory" operation.
    final dirTemp = path.join(exec.pwd!, 'target',
        'GenerateRunFrbCodegenCommandIntegrate', randomTempDirName());
    print('Pick temporary directory: $dirTemp');
    await Directory(dirTemp).create(recursive: true);

    // We move instead of delete folder for extra safety of this script
    final dirTempOriginal = path.join(dirTemp, 'original');
    if (await Directory(dirPackage).exists()) {
      await Directory(dirPackage).rename(dirTempOriginal);
    }

    switch (config.package) {
      case 'frb_example/flutter_via_create':
        await executeFrbCodegen(
            relativePwd: 'frb_example', cmd: 'create flutter_via_create');

      case 'frb_example/flutter_via_integrate':
        await exec('flutter create flutter_via_integrate',
            relativePwd: 'frb_example');
        await executeFrbCodegen(relativePwd: config.package, cmd: 'integrate');

      default:
        throw Exception('Do not know how to handle package ${config.package}');
    }

    // move back compilation cache to speed up future usage
    for (final subPath in ['build', 'rust/target']) {
      await _renameDirIfExists(
          path.join(dirTempOriginal, subPath), path.join(dirPackage, subPath));
    }
  });
}

Future<void> executeFrbCodegen({
  required String relativePwd,
  required String cmd,
}) async {
  await exec(
    'cargo run --manifest-path ${exec.pwd}frb_codegen/Cargo.toml -- $cmd',
    relativePwd: relativePwd,
    extraEnv: {'RUST_BACKTRACE': '1'},
  );
}

Future<void> _renameDirIfExists(String src, String dst) async {
  if (!await Directory(src).exists()) return;
  await Directory(src).rename(dst);
}

Future<void> _wrapMaybeSetExitIfChanged(
    GenerateConfig config, Future<void> Function() inner,
    {String? extraArgs}) async {
  // Before actually executing anything, check whether git repository is already dirty
  await _maybeSetExitIfChanged(config, extraArgs: extraArgs);
  await inner();
  // The real check
  await _maybeSetExitIfChanged(config, extraArgs: extraArgs);
}

Future<void> _maybeSetExitIfChanged(GenerateConfig config,
    {String? extraArgs}) async {
  if (config.setExitIfChanged) {
    await exec('git diff --exit-code ${extraArgs ?? ""}');
  }
}

Future<void> generateWebsite() async {
  await generateWebsiteBuild();
  await generateWebsiteMerge();
}

Future<void> generateWebsiteBuild() async {
  await exec('yarn install --frozen-lockfile', relativePwd: 'website');
  await exec('yarn build', relativePwd: 'website');

  await exec(
      'flutter build web '
      '--base-href /flutter_rust_bridge/demo/ '
      // Pwa seems to have conflict with the enable-threads.js hack
      // enable-threads.js: https://github.com/orgs/community/discussions/13309
      '--pwa-strategy none',
      relativePwd: 'frb_example/gallery');

  await exec('mdbook build .', relativePwd: 'website/v1_mdbook');
}

const _kWebsiteDir = 'website/merged_target/flutter_rust_bridge';

Future<void> generateWebsiteMerge() async {
  await exec('rm -rf website/merged_target');
  await exec('mkdir -p website/merged_target');
  await exec('cp -r website/build/ $_kWebsiteDir');
  await exec('cp -r website/v1_mdbook/book/ $_kWebsiteDir/v1');
  await exec('cp -r frb_example/gallery/build/web/* $_kWebsiteDir/demo');
  _generateWebsiteMergeDemoIndexHtml();
  await exec('ls -al $_kWebsiteDir');
}

void _generateWebsiteMergeDemoIndexHtml() {
  // https://docs.flutter.dev/deployment/web#hostelement
  const headCode = '''
  <script src="enable-threads.js"></script>
  <script src="flutter.js" defer></script>
  ''';
  const bodyCode = '''
    <script>
      window.addEventListener("load", function (ev) {
        _flutter.loader.loadEntrypoint({
          onEntrypointLoaded: async function(engineInitializer) {
            let appRunner = await engineInitializer.initializeEngine({
              // Pass a reference to "div#flutter_host" into the Flutter engine.
              hostElement: document.querySelector("#flutter_host")
            });
            await appRunner.runApp();
          }
        });
      });
    </script>
  ''';

  final htmlDocusaurus =
      File('${exec.pwd}/website/build/demo/index.html').readAsStringSync();
  final ans = htmlDocusaurus
      .replaceFirst('</head>', '$headCode</head>')
      .replaceFirst('</body>', '$bodyCode</body>');
  File('${exec.pwd}/$_kWebsiteDir/demo/index.html').writeAsStringSync(ans);
}

Future<void> generateWebsiteServe() async {
  await exec('python -m http.server 8765',
      relativePwd: 'website/merged_target');
}
