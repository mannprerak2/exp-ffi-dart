A demo library for JSON parsing using cJSON and dart:ffi
# Benchmark
JIT compiler
```
Test file size: 4.243239mb
Time is average of 100 iterations...
CJSON: (String to char*) + (char* to CJSON) + (CJSON to dart object)
          25.44ms         +     50.89ms       +       958.99ms
        Time = 1035ms
dart:convert: (String to dart object)
        Time = 38ms
Are both jsons same?
true
```

AOT compiler
```
Test file size: 4.243239mb
Time is average of 100 iterations...
CJSON: (String to char*) + (char* to CJSON) + (CJSON to dart object)
          52.8ms         +     41.34ms       +       831.56ms
        Time = 925ms
dart:convert: (String to dart object)
        Time = 55ms
Are both jsons same?
true
```
# Example (see example folder)

Demo Run
```
Here's some JSON created programatically using cJSON native library:-
{
        "name": "Prerak Mann",
        "age":  21,
        "nicknames":    [{
                        "name": "Mr. P",
                        "length":       5
                }, {
                        "name": "Witch Burner",
                        "length":       12
                }, {
                        "name": "mannprerak2",
                        "length":       11
                }]
}
Let's parse this JSON string back...
JSON is parsed and stored as a C structure, let's iterate over it and make a dartMap...
Print the Map-
{name: Prerak Mann, age: 21.0, nicknames: [{name: Mr. P, length: 5.0}, {name: Witch Burner, length: 12.0}, {name: mannprerak2, length: 11.0}]}
```
