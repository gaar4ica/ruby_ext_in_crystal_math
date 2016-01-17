# Extension for Ruby written in Crystal

Make sure [installed crystal](http://crystal-lang.org/docs/installation/index.html) first.

Compile project with:
```sh
$ make
```

### Benchmarking

```sh
$ ruby banchmark.rb 
```

After complete copilation we'll have `cr_math.bundle` file.

### Usage

```sh
$ irb
2.1.6 :001 > require './cr_math'
 => true
2.1.6 :002 > CrMath.new.fibonacci(20)
 => 6765
```
