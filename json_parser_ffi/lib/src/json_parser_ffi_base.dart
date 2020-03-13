import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io' show Platform;
import 'bindings/typedefs.dart';

String _getPath() {
  var path = './lib/cjson_library/libcjson.so';
  if (Platform.isMacOS) path = './lib/cjson_library/libstructs.dylib';
  if (Platform.isWindows) path = r'cjson_library\Debug\structs.dll';
  return path;
}

final _dylib = DynamicLibrary.open(_getPath());

final cJson_CreateNull =
    _dylib.lookupFunction<cJSON_CreateNull, JSON_CreateNull>('cJSON_CreateNull');
final cJson_CreateTrue =
    _dylib.lookupFunction<cJSON_CreateTrue, JSON_CreateTrue>('cJSON_CreateTrue');
final cJson_CreateFalse = _dylib
    .lookupFunction<cJSON_CreateFalse, JSON_CreateFalse>('cJSON_CreateFalse');
final cJson_CreateBool =
    _dylib.lookupFunction<cJSON_CreateBool, JSON_CreateBool>('cJSON_CreateBool');
final cJson_CreateNumber =
    _dylib.lookupFunction<cJSON_CreateNumber, JSON_CreateNumber>(
        'cJSON_CreateNumber');
final cJson_CreateString =
    _dylib.lookupFunction<cJSON_CreateString, JSON_CreateString>(
        'cJSON_CreateString');
final cJson_CreateRaw =
    _dylib.lookupFunction<cJSON_CreateRaw, JSON_CreateRaw>('cJSON_CreateRaw');
final cJson_CreateArray = _dylib
    .lookupFunction<cJSON_CreateArray, JSON_CreateArray>('cJSON_CreateArray');
final cJson_CreateObject =
    _dylib.lookupFunction<cJSON_CreateObject, JSON_CreateObject>(
        'cJSON_CreateObject');
final cJson_AddItemToArray =
    _dylib.lookupFunction<cJSON_AddItemToArray, JSON_AddItemToArray>(
        'cJSON_AddItemToArray');
final cJson_AddItemToObject =
    _dylib.lookupFunction<cJSON_AddItemToObject, JSON_AddItemToObject>(
        'cJSON_AddItemToObject');
final cJson_Delete =
    _dylib.lookupFunction<cJSON_Delete, JSON_Delete>('cJSON_Delete');
final cJson_Parse =
    _dylib.lookupFunction<cJSON_Parse, JSON_Parse>('cJSON_Parse');
final cJson_Print =
    _dylib.lookupFunction<cJSON_Print, JSON_Print>('cJSON_Print');
final cJson_PrintUnformatted =
    _dylib.lookupFunction<cJSON_PrintUnformatted, JSON_PrintUnformatted>(
        'cJSON_PrintUnformatted');
final cJson_GetObjectItem =
    _dylib.lookupFunction<cJSON_GetObjectItem, JSON_GetObjectItem>(
        'cJSON_GetObjectItem');
final cJson_GetObjectItemCaseSensitive = _dylib.lookupFunction<
    cJSON_GetObjectItemCaseSensitive,
    JSON_GetObjectItemCaseSensitive>('cJSON_GetObjectItemCaseSensitive');
final cJson_HasObjectItem =
    _dylib.lookupFunction<cJSON_HasObjectItem, JSON_HasObjectItem>(
        'cJSON_HasObjectItem');
