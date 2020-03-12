import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'structs.dart';

// Native C functions ============================>
typedef _cJSON_CreateNull = Pointer<CJson> Function();
typedef _cJSON_CreateTrue = Pointer<CJson> Function();
typedef _cJSON_CreateFalse = Pointer<CJson> Function();
typedef _cJSON_CreateBool = Pointer<CJson> Function(Int32);
typedef _cJSON_CreateNumber = Pointer<CJson> Function(Double);
typedef _cJSON_CreateString = Pointer<CJson> Function(Pointer<Utf8>);
typedef _cJSON_CreateRaw = Pointer<CJson> Function(Pointer<Utf8>);
typedef _cJSON_CreateArray = Pointer<CJson> Function();
typedef _cJSON_CreateObject = Pointer<CJson> Function();

typedef _cJSON_AddItemToArray = void Function(Pointer<CJson>, Pointer<CJson>);
typedef _cJSON_AddItemToObject = void Function(
    Pointer<CJson>, Pointer<Utf8>, Pointer<CJson>);

typedef _cJSON_Delete = void Function(Pointer<CJson>);

typedef _cJSON_Parse = Pointer<CJson> Function(Pointer<Utf8>);
typedef _cJSON_Print = void Function(Pointer<CJson>);
typedef _cJSON_PrintUnformatted = void Function(Pointer<CJson>);

typedef _cJSON_GetObjectItem = Pointer<CJson> Function(
    Pointer<CJson>, Pointer<Utf8>);
typedef _cJSON_GetObjectItemCaseSensitive = Pointer<CJson> Function(
    Pointer<CJson>, Pointer<Utf8>);
// ============================

// Dart functions
