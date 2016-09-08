import 'dart:io';

import '../bin/generate.dart' as generate;

import 'package:path/path.dart' as path;
import 'package:test/test.dart';

void main() {
  Directory project;
  File file;

  setUp(() {
    project = Directory.systemTemp.createTempSync();
    file = new File(path.join(project.path, '.gitignore'));
  });

  tearDown(() => project.deleteSync(recursive: true));

  test('should not generate a .gitingore file if one exists', () {
    file.writeAsStringSync('# Purposefully not empty');
    expect(() => generate.main([project.path]), throws);
  });

  test('should generate a .gitignore file if one does not exist', () {
    expect(file.existsSync(), isFalse);
    generate.main([project.path]);
    expect(file.existsSync(), isTrue);
  });
}
