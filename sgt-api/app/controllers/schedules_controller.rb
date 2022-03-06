class SchedulesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_schedule, only: %i[show update destroy]

    def create
        @schedule = Schedule.new(user_params)
        if @schedule.save
            render json: ScheduleSerializer.new(@schedule)
        else
            render json: @schedule.error
        end
    end

    
    private
    def user_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
