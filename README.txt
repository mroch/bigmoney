= BigMoney

== DESCRIPTION:

Represents an amount of money in a particular currency. Backed by BigDecimal, 
so is safe from float rounding errors.

== FEATURES:

* Encapsulates an amount with its currency into a single object.

* Backed by BigDecimal, so it can store arbitrary-precision values without 
  rounding errors. Useful if you're dealing with fractional cents.

== PROBLEMS:

* Does not implement all of Numeric, so doesn't quite act like a real number

* Doesn't allow currency conversion (patches welcome)

* Has a slightly different API than the Money package 
  (http://dist.leetsoft.com/api/money/)

== SYNOPSIS:

  bm = BigMoney.new('3.99')
  bm.amount                       #=> BigDecimal.new('3.99')
  bm.currency                     #=> :USD
  bm.to_s                         #=> '3.99'
  bm.to_formatted_s('$%.2f')      #=> '$3.99'
  bm.to_formatted_s('$%.2f %s')   #=> '$3.99 USD'
  
  bm2 = BigMoney.new(1)
  bm + bm2                        #=> BigMoney.new(4.99)
  bm + 1                          #=> BigMoney.new(4.99)

== INSTALL:

* Via git:

    git clone git://github.com/mroch/bigmoney.git

* From RubyForge: TBA

* Via gem: TBA

== LICENSE:

(The MIT License)

Copyright (c) 2008 Marshall Roch

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
