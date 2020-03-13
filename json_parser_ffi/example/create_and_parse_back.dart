import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:json_parser_ffi/json_parser_ffi.dart';

void main() {
  var parent = designSomeJsonObject();
  if (parent == nullptr) return;

  var jsonString = Utf8.fromUtf8(cJson_Print(parent));

  // cleanup memory
  cJson_Delete(parent);

  print(
      "Here's some JSON created programatically using cJSON native library:-");
  print(jsonString);
  print("Let's parse this JSON string back...");

  var parsedJson = cJson_Parse(Utf8.toUtf8(jsonString));
  if (parsedJson == nullptr) {
    print('Error in parsing json');
    return;
  }
  print(
      'JSON is parsed and stored as a C structure, let\'s iterate over it and make a dart Map...');

  var dartJson = convertCJsonToDartObj(parsedJson);

  // cleanup memory
  cJson_Delete(parsedJson);
  print('Print the Map-');
  print(dartJson.toString());
}

Pointer<CJson> designSomeJsonObject() {
  var parent = cJson_CreateObject();
  if (parent == nullptr) {
    print('Error!');
    return nullptr;
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

  return parent;
}

dynamic convertCJsonToDartObj(Pointer<CJson> cjson) {
  dynamic obj;
  if (cjson.ref.type == Types.cJSON_Object) {
    obj = <String, dynamic>{};

    Pointer<CJson> ptr;
    ptr = cjson.ref.child;
    while (ptr != nullptr) {
      var o = convertCJsonToDartObj(ptr);
      _addToObj(obj, o, ptr.ref.string);
      ptr = ptr.ref.next;
    }
  } else if (cjson.ref.type == Types.cJSON_Array) {
    obj = <dynamic>[];

    Pointer<CJson> ptr;
    ptr = cjson.ref.child;
    while (ptr != nullptr) {
      var o = convertCJsonToDartObj(ptr);
      _addToObj(obj, o);
      ptr = ptr.ref.next;
    }
  } else if (cjson.ref.type == Types.cJSON_String) {
    obj = Utf8.fromUtf8(cjson.ref.valueString);
  } else if (cjson.ref.type == Types.cJSON_Number) {
    obj = cjson.ref.valuedouble;
  }

  return obj;
}

void _addToObj(obj, o, [Pointer<Utf8> name]) {
  if (obj is Map<String, dynamic>) {
    obj[Utf8.fromUtf8(name)] = o;
  } else if (obj is List<dynamic>) {
    obj.add(o);
  }
}
