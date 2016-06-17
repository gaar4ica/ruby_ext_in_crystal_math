# Extension for Ruby written in Crystal via gem

Make sure [installed crystal](http://crystal-lang.org/docs/installation/index.html) first.
Then add gem *ruby_ext_in_crystal_math* to Gemfile
```Gemfile
gem 'ruby_ext_in_crystal_math', git: 'git@github.com:gaar4ica/ruby_ext_in_crystal_math.git'
```
and execute `bundle install`
 
### Benchmarking

```sh
$ irb
2.1.6 :001 > require 'common_math'
 => true
2.1.6 :002 > CommonMath.measure
       user     system      total        real
rb  7.940000   0.010000   7.950000 (  7.963207)
cr  0.430000   0.000000   0.430000 (  0.431696)
 => nil
```
