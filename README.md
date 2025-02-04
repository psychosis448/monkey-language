# Writing an Interpreter and a Compiler in Go

Following along [Thorsten Ball's](https://thorstenball.com/) books on
[writing an interpreter in Go](https://interpreterbook.com/) and
[writing a compiler in Go](https://compilerbook.com/).

## Monkey Language

The monkey language has the following features:

- C-like syntax
- variable bindings
- integers and booleans
- arithmetic expressions
- built-in functions
- first-class and higher-order functions
- closures
- a string data structure
- an array data structure
- a hash data structure

```monkey
let age = 1;
let name = "Monkey";
let result = 10 * (20/2);
let myArray = [1, 2, 3, 4, 5];
let thorsten = { "name": "Thorsten", "age": 28 };

myArray[0];
thorsten["name"];

let add = fn(a, b) { return a + b; };
let add = fn(a, b) { a + b; };

add(1, 2);

let fibonacci = fn(x) {
    if (x == 0) {
        0
    } else {
        if (x == 1) {
            1
        } else {
            fibonacci(x - 1) + fibonacci(x -2);
        }
    }
};

let twice = fn(f, x) {
    return f(f(x));
}
```

## Interpreter

Major parts of the interpreter:

- lexer
- parser (Pratt parser; top down operator precedence; recursive descent parser)
- abstract syntax tree (AST)
- internal object system
- evaluator
