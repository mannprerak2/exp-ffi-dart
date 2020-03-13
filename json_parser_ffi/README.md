A demo library for JSON parsing using cJSON and dart:ffi

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

