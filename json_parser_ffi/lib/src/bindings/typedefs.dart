import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'structs.dart';

// Native C functions ============================>
typedef cJSON_CreateNull = Pointer<CJson> Function();
typedef cJSON_CreateTrue = Pointer<CJson> Function();
typedef cJSON_CreateFalse = Pointer<CJson> Function();
typedef cJSON_CreateBool = Pointer<CJson> Function(Int32);
typedef cJSON_CreateNumber = Pointer<CJson> Function(Double);
typedef cJSON_CreateString = Pointer<CJson> Function(Pointer<Utf8>);
typedef cJSON_CreateRaw = Pointer<CJson> Function(Pointer<Utf8>);
typedef cJSON_CreateArray = Pointer<CJson> Function();
typedef cJSON_CreateObject = Pointer<CJson> Function();

typedef cJSON_AddItemToArray = Void Function(Pointer<CJson>, Pointer<CJson>);
typedef cJSON_AddItemToObject = Void Function(
    Pointer<CJson>, Pointer<Utf8>, Pointer<CJson>);

typedef cJSON_Delete = Void Function(Pointer<CJson>);

typedef cJSON_Parse = Pointer<CJson> Function(Pointer<Utf8>);
typedef cJSON_Print = Pointer<Utf8> Function(Pointer<CJson>);
typedef cJSON_PrintUnformatted = Pointer<Utf8> Function(Pointer<CJson>);

typedef cJSON_GetObjectItem = Pointer<CJson> Function(
    Pointer<CJson>, Pointer<Utf8>);
typedef cJSON_GetObjectItemCaseSensitive = Pointer<CJson> Function(
    Pointer<CJson>, Pointer<Utf8>);
typedef cJSON_HasObjectItem = Int32 Function(Pointer<CJson>, Pointer<Utf8>);
// ============================

// Dart functions ============================>
typedef JSON_CreateNull = Pointer<CJson> Function();
typedef JSON_CreateTrue = Pointer<CJson> Function();
typedef JSON_CreateFalse = Pointer<CJson> Function();
typedef JSON_CreateBool = Pointer<CJson> Function(int);
typedef JSON_CreateNumber = Pointer<CJson> Function(double);
typedef JSON_CreateString = Pointer<CJson> Function(Pointer<Utf8>);
typedef JSON_CreateRaw = Pointer<CJson> Function(Pointer<Utf8>);
typedef JSON_CreateArray = Pointer<CJson> Function();
typedef JSON_CreateObject = Pointer<CJson> Function();

typedef JSON_AddItemToArray = void Function(Pointer<CJson>, Pointer<CJson>);
typedef JSON_AddItemToObject = void Function(
    Pointer<CJson>, Pointer<Utf8>, Pointer<CJson>);

typedef JSON_Delete = void Function(Pointer<CJson>);

typedef JSON_Parse = Pointer<CJson> Function(Pointer<Utf8>);
typedef JSON_Print = Pointer<Utf8> Function(Pointer<CJson>);
typedef JSON_PrintUnformatted = Pointer<Utf8> Function(Pointer<CJson>);

typedef JSON_GetObjectItem = Pointer<CJson> Function(
    Pointer<CJson>, Pointer<Utf8>);
typedef JSON_GetObjectItemCaseSensitive = Pointer<CJson> Function(
    Pointer<CJson>, Pointer<Utf8>);
typedef JSON_HasObjectItem = int Function(Pointer<CJson>, Pointer<Utf8>);
// =============================
