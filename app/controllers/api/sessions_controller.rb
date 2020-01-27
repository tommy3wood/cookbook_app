class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
                        { #this hash is the payload
                          user_id: user.id, # the data to encode
                          exp: 24.hours.from_now.to_i # the expiration time
                        },
                        Rails.application.credentials.fetch(:secret_key_base), # the secret key, SALT
                        "HS256" # the encryption algorithm, this can change over time. Posted places like ruby weekly news letter
                      )
      render json: { jwt: jwt, email: user.email, user_id: user.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
