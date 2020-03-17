import 'dart:ffi';
import 'dart:io';
import 'dart:convert';
import 'package:ffi/ffi.dart';
import 'package:json_parser_ffi/json_parser_ffi.dart';

// for cJSON
int stringToCString = 0;
int cStringToCJson = 0;
int cJsonToDartObj = 0;

// for dart:convert
int stringToDartObj = 0;

int count = 10;

String cjsonStringMinified, dartConvertJsonStringMinified;
void main() {
  var jsonString = getJsonAsString();

  for (var i = 0; i < count; i++) {
    cjson_parseJson(jsonString);
    dartConvertParseJson(jsonString);
  }

  printDetails();
  print('Are both jsons same?');
  print(cjsonStringMinified == dartConvertJsonStringMinified);
}

String getJsonAsString() {
  var file = File('./example/big_json.json');
  print('Test file size: ${file.lengthSync() / 1000000}mb');
  print('Time is average of $count iterations...');
  return file.readAsStringSync();
}

void cjson_parseJson(String jsonString) {
  var stopwatch = Stopwatch()..start();
  var cString = Utf8.toUtf8(jsonString);
  stringToCString += stopwatch.elapsedMilliseconds;
  stopwatch.reset();

  var parsedJson = cJson_Parse(cString);
  cStringToCJson += stopwatch.elapsedMilliseconds;
  stopwatch.reset();

  var obj = _convertCJsonToDartObj(parsedJson);
  cJsonToDartObj += stopwatch.elapsedMilliseconds;
  stopwatch.stop();

  // free(cString);
  // free(parsedJson);
  
  cjsonStringMinified = json.encode(obj);
}

void dartConvertParseJson(String jsonString) {
  var stopwatch = Stopwatch()..start();
  var obj = json.decode(jsonString);
  stringToDartObj += stopwatch.elapsedMilliseconds;
  stopwatch.stop();

  dartConvertJsonStringMinified = json.encode(obj);
}

void printDetails() {
  print('CJSON: (String to char*) + (char* to CJSON) + (CJSON to dart object)');
  print(
      '\t  ${stringToCString / count}ms         +     ${cStringToCJson / count}ms       +       ${cJsonToDartObj / count}ms');
  print(
      '\tTime = ${(stringToCString + cStringToCJson + cJsonToDartObj) ~/ count}ms');
  print('dart:convert: (String to dart object)');
  print('\tTime = ${stringToDartObj ~/ count}ms');
}

dynamic _convertCJsonToDartObj(Pointer<CJson> cjson) {
  dynamic obj;
  if (cjson.ref.type == Types.cJSON_Object) {
    obj = <String, dynamic>{};

    Pointer<CJson> ptr;
    ptr = cjson.ref.child;
    while (ptr != nullptr) {
      var o = _convertCJsonToDartObj(ptr);
      _addToObj(obj, o, ptr.ref.string);
      ptr = ptr.ref.next;
    }
  } else if (cjson.ref.type == Types.cJSON_Array) {
    obj = <dynamic>[];

    Pointer<CJson> ptr;
    ptr = cjson.ref.child;
    while (ptr != nullptr) {
      var o = _convertCJsonToDartObj(ptr);
      _addToObj(obj, o);
      ptr = ptr.ref.next;
    }
  } else if (cjson.ref.type == Types.cJSON_String) {
    obj = Utf8.fromUtf8(cjson.ref.valueString);
  } else if (cjson.ref.type == Types.cJSON_Number) {
    if (cjson.ref.valueInt.toDouble() == cjson.ref.valuedouble) {
      obj = cjson.ref.valueInt;
    } else {
      obj = cjson.ref.valuedouble;
    }
  } else if (cjson.ref.type == Types.cJSON_True) {
    obj = true;
  } else if (cjson.ref.type == Types.cJSON_False) {
    obj = false;
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
