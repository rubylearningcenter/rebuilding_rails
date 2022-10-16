class Object
  def self.const_missing(c)
    @calling_const_missing ||= {}
    return nil if @calling_const_missing[c]

    @calling_const_missing[c] = true

    require Rulers.to_underscore(c.to_s)
    klass = Object.const_get(c)

    @calling_const_missing[c] = false
    klass
  end
end
