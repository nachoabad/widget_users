class Widget < Struct.new(:id,
                          :name,
                          :description,
                          :kind,
                          :owner)

  include ActiveModel::Model

  def self.from_hash(hash)
    obj = self.new
    hash.each {|key,value| obj.send("#{key}=", value)}
    obj
  end
end