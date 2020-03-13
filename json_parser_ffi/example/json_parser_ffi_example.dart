import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:json_parser_ffi/json_parser_ffi.dart';

void main() {
  var parent = cJson_CreateObject();
  if (parent == nullptr) {
    print('Error!');
    return;
  }
  var name = cJson_CreateString(Utf8.toUtf8('Prerak Mann'));
  var age = cJson_CreateNumber(21);
  cJson_AddItemToObject(parent, Utf8.toUtf8('name'), name);
  cJson_AddItemToObject(parent, Utf8.toUtf8('age'), age);

  var nickNames = cJson_CreateArray();
  var nameList = ['Mr. P', 'Witch Burner', 'mannprerak2'];

  var nameObjects = nameList.map<Pointer<CJson>>((f) {
    var o = cJson_CreateObject();
    var i = cJson_CreateString(Utf8.toUtf8(f));
    cJson_AddItemToObject(o, Utf8.toUtf8('name'), i);
    var j = cJson_CreateNumber(f.length.toDouble());
    cJson_AddItemToObject(o, Utf8.toUtf8('length'), j);
    return o;
  });

  for (var o in nameObjects) {
    cJson_AddItemToArray(nickNames, o);
  }

  cJson_AddItemToObject(parent, Utf8.toUtf8('nicknames'), nickNames);

  var jsonString = Utf8.fromUtf8(cJson_Print(parent));

  // cleanup memory
  cJson_Delete(parent);

  print(
      "Here's a JSON file created programatically using cJSON native library:-");
  print(jsonString);

  print("Let's parse this JSON string back...");

  var parsedJson = cJson_Parse(Utf8.toUtf8(jsonString));

  if (parsedJson == nullptr) {
    print('Error in parsing json');
    return;
  }
  print(
      'JSON is parsed and stored as a C structure, let\'s iterate over it and make a Map');
}
