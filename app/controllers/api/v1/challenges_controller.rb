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

      def create
        challenge = Challenge.new(challenge_params)
        if challenge.save
          render json: { message: 'Added sucessfully', data: challenge }, status: 200
        else
          render json: { message: 'Failed to add', data: challenge.errors }
        end
      end

      def show
        challenge = Challenge.find(params[:id])
        if challenge
          render json: challenge
        else
          render json: { message: 'Challenge not found' }
        end
      end

      def update
        challenge = Challenge.find(params[:id])
        if challenge.update(challenge_params)
          render json: { message: 'updated successfully' }
        else
          render json: { message: 'challenge not found' }
        end
      end

      def destroy
        challenge = Challenge.find(params[:id])
        if challenge.destroy
          render json: { message: 'Challenge deleted' }
        else
          render json: { message: 'Challenge not found' }
        end
      end

      private

      def challenge_params
        params.require(:challenge).permit(:title, :description, :start_date, :end_date)
      end

      # def update
      # end

      # def destroy
      # end
    end
  end
end
