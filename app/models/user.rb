# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP.freeze
  PASSWORD_REGEX = /\A
    (?=.*[[:^alnum:]]) # Must contain at least one special character
    (?=.*[a-z])        # Must contain at least one lowercase letter
    (?=.*[A-Z])        # Must contain at least one uppercase letter
    (?=.*\d)           # Must contain at least one digit
  /x

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX, message: I18n.t('user.errors.email') }
  validates :password, presence: true, length: { minimum: 8 },
                       format: { with: PASSWORD_REGEX, message: I18n.t('user.errors.password') }
  validates :password_confirmation, presence: true, if: -> { password.present? }

  private_constant :EMAIL_REGEX, :PASSWORD_REGEX
end
