module Api
  module V1
    class ChallengesController < ApplicationController
      def index
        @challenge = Challenge.all
        puts @challenge
        render json: @challenge
      end

      # def show
      # end

      # def create
      #   puts params
      #   @challenge = Challenge.new(params)

      #   return unless @challenge.save

      #   render json: @challenge
      # end

      # def update
      # end

      # def destroy
      # end
    end
  end
end
