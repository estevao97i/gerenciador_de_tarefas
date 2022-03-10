class SchedulesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_params, only: %i[show update destroy]

    def create
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
            render json: ScheduleSerializer.new(@schedule)
        else
            render json: {message: "error to create the schedule"}, status: unprocessable_entity
        end
    end

    def show
        render json: ScheduleSerializer.new(@schedule)
    end

    def update
        if @schedule.update(schedule_params)
            render json: ScheduleSerializer.new(@schedule)
        end    
    end

    def index
        render json: ScheduleSerializer.new(Schedule.all)
    end

    def destroy
        if @schedule.destroy
            render json: {message: "destroyed!"}
        end    
    end

    private
    def schedule_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    def set_params
        if Schedule.find(params[:id])
            @schedule = Schedule.find(params[:id])
        end

    end
end
