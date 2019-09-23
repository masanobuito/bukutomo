# class Inquiry < ApplicationRecord
# end

class Inquiry include ActiveModel::Model
   
    attr_accessor :name, :message
   
    validates :name, :presence => {:message => '名前を入力してください'}
    validates :name, length: { maximum: 20 }

    validates :message, :presence => {:message => 'メッセージを入力してください'}
    validates :message, length: { maximum: 200 }
end