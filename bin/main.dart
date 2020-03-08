void main(List<String> arguments) {
  if (arguments.length > 1) {
    print('Too many arguments');
    printHelp();
  } else {
    if (arguments[0] == '--help' || arguments[0] == '-h') {
      printHelp();
    } else {
      
    }
  }
}

void printHelp() {
  print('Simple program to generate blurhash for an image');
  print('Usage:');
  print('\targuments - [file-path]');
}
