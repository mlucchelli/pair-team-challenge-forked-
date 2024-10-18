class UsersController < ApplicationController
    def index
        render json: { users: User.all.map(&:as_json) }
    end

    def create_random_user
        random_number = (SecureRandom.random_number * 10_000).to_i.to_s.rjust(4, '0')
        user = User.create!(
            name: "John #{random_number}",
            email: "john.#{random_number}@pairteam.com",
            phone_number: "(555) 555-#{random_number}")
        render json: user.as_json, status: :created
    end
end
