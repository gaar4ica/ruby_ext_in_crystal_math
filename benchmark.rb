require './rb_math'
require './cr_math'
require "benchmark"

iterations = 10_000
number = 20

Benchmark.bm do |bm|
  bm.report("rb") do
    iterations.times { RbMath.new.fibonacci(number) }
  end

  bm.report("cr") do
    iterations.times { CrMath.new.fibonacci(number) }
  end
end
