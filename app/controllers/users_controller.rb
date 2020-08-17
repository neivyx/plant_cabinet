class UsersController < ApplicationController
    has_secure_password

    has_many :plants
end