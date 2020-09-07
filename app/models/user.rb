class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  NAME_REGEX =  /\A[ぁ-んァ-ン一-龥]+\z/
  validates_format_of :first_name, :last_name, with: NAME_REGEX, message: 'には全角文字を使用してください'
  

  NAME_KANA_REGIX = /\A[ァ-ン]+\z/
  validates_format_of :first_name_kana, :last_name_kana, with: NAME_KANA_REGIX, message: 'には全角カナを使用してください'
  
  validates :birthday, presence: true
end
