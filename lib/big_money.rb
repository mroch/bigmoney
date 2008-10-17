dir = File.dirname(__FILE__)
$LOAD_PATH << dir unless $LOAD_PATH.include?(dir)

require 'big_money/currency'
require 'big_money/currency/iso4217' # TODO: Optional?
require 'big_money/exchange'
require 'big_money/exchange/yahoo' # TODO: Optional?
require 'big_money/big_money'
require 'big_money/core_extensions'
