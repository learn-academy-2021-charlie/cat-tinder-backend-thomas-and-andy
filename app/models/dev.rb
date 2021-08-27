class Dev < ApplicationRecord
    validates :name, :age, :technologies ,:skills , :enjoys, :img, presence:true

    validates :enjoys, length: { minimum: 10 }
end
