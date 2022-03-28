require 'pry'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  delete '/reviews/:id' do
    # find the review using the ID
    # delete the review
    # send a response with the deleted review as JSON
  end
  
    post '/reviews' do
      review = Review.create(
        score: params[:score],
        comment: params[:comment],
        game_id: params[:game_id],
        user_id: params[:user_id]
      )
      review.to_json
    end
  
    patch '/reviews/:id' do
      review = Review.find(params[:id])
      review.update(
        score: params[:score],
        comment: params[:comment]
      )
      review.to_json
    end
  delete '/reviews/:id' do
    # find the review using the ID
    review = Review.find(params[:id])
    # delete the review
    review.destroy
    # send a response with the deleted review as JSON
    review.to_json
  end

end
