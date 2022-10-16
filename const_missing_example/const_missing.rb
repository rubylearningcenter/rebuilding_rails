class Object
  def self.const_missing(_c)
    # super
    # warn "Missing constant: #{c}"
    require './bobo'
    Bobo
  end
end

Bobo.new.print_bobo

# 1.does_not_exist

# Integer > Numeric > Object > BasicObject
# Does Integer know about `does_not_exist`? No, then:
# Does Numeric know about `does_not_exist`? No, then:
# Does Object know about `does_not_exist`? No, then:
# Does BasicObject know about `does_not_exist`?
# No parent! Method Missing?

# Method Missing chain:

# Does Integer implement `method_missing`? No, then:
# Does Numeric implement `method_missing`? No, then:
# Does Object implement `method_missing`? No, then:
# Does BasicObject implement `method_missing`?
# No parent! Guess it isn't there, raise error!
#

# (method)_missing
# (const)_missing
# (module)_missing
