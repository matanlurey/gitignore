import 'dart:io';

import 'package:path/path.dart' as path;

void main(List<String> args) {
  if (args.length > 1) {
    _printUsage();
  }
  var location = args.isEmpty ? path.current : args.first;
  var target = new File(path.join(location, '.gitignore'));
  if (target.existsSync()) {
    throw 'File already exists: ${target.path}';
  }
  target.writeAsStringSync(_source);
  print('Wrote ${target.path}');
}

void _printUsage() {
  print('Usage: gitignore <path>');
  print('Creates a .gitignore with nice defaults in the <path> directory');
  exit(1);
}

const String _source = r'''
# See https://www.dartlang.org/tools/private-files.html

# Files and directories created by pub
.buildlog
.packages
.project
.pub
**/build
**/packages

# Files created by dart2js
# (Most Dart developers will use pub build to compile Dart, use/modify these
#  rules if you intend to use dart2js directly
#  Convention is to use extension '.dart.js' for Dart compiled to Javascript to
#  differentiate from explicit Javascript files)
*.dart.js
*.part.js
*.js.deps
*.js.map
*.info.json

# Directory created by dartdoc
doc/api/

# Don't commit pubspec lock file
# (Library packages only! Remove pattern if developing an application package)
pubspec.lock

*.iml
.idea
''';
