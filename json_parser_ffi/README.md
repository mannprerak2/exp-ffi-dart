A demo library for JSON parsing using cJSON and dart:ffi
# Benchmark
```
Test file size: 4.243239mb
Time is average of 100 iterations...
CJSON: (String to char*) + (char* to CJSON) + (CJSON to dart object)
          25.14ms         +     51.42ms       +       963.11ms
        Time = 1039ms
dart:convert: (String to dart object)
        Time = 35ms
Are both jsons same?
true
```
```
Test file size: 4.243239mb
Time is average of 1 iterations...
CJSON: (String to char*) + (char* to CJSON) + (CJSON to dart object)
          33.0ms         +     50.0ms       +       1043.0ms
        Time = 1126ms
dart:convert: (String to dart object)
        Time = 58ms
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
