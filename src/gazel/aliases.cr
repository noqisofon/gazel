
module Gazel

  alias SignedInteger    =  Int8 |  Int16 |  Int32 |  Int64

  alias UnsiginedInteger = UInt8 | UInt16 | UInt32 | UInt64

  alias Integer          = SignedInteger | UnsiginedInteger

  alias Float            = Float32 | Float64

  # collection without any type
  alias Any              = Integer | Float | Bool | Symbol | String | IO | Nil
  
end
