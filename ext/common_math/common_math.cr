lib CrRuby
  type VALUE = Void*
  type METHOD_FUNC = VALUE, VALUE -> VALUE

  $rb_cObject : VALUE

  fun rb_num2int(value : VALUE) : Int32
  fun rb_int2inum(value : Int32) : VALUE

  fun rb_define_module(name: UInt8*) : VALUE
  fun rb_define_class_under(module: VALUE, name: UInt8*, super: VALUE) : VALUE
  fun rb_define_method(klass: VALUE, name: UInt8*, func: METHOD_FUNC, argc: Int32)
end

def fibonacci_cr_wrapper(self : CrRuby::VALUE, value : CrRuby::VALUE)
  int_value = CrRuby.rb_num2int(value)
  CrRuby.rb_int2inum(fibonacci_cr(int_value))
end

def fibonacci_cr(n)
  n <= 1 ? n :  fibonacci_cr(n - 1) + fibonacci_cr(n - 2)
end

fun init = Init_common_math
  GC.init
  LibCrystalMain.__crystal_main(0, Pointer(Pointer(UInt8)).null)

  math_module = CrRuby.rb_define_module("CommonMath")
  cr_math = CrRuby.rb_define_class_under(math_module, "CrMath", CrRuby.rb_cObject);
  CrRuby.rb_define_method(cr_math, "fibonacci", ->fibonacci_cr_wrapper, 1)
end
