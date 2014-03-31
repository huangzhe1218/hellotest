# encoding: utf-8
class PhoneFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^(?:13\d|15[012356789]|14[7]|18\d)-?\d{5}(\d{3}|\*{3})$/i
      object.errors[attribute] << (options[:message] || "格式不正确")
    end
  end
end 
