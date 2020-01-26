class User < Struct.new(:first_name,
                        :last_name,
                        :email,
                        :password,
                        :image_url)

  include ActiveModel::Model
end