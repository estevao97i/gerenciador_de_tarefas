class TasksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_task, only: %i[ show update destroy ]

    def index
        render json: TaskSerializer.new(Task.all)
    end

    def create
        @task = Task.new(set_params)
        if @task.save
            render json: TaskSerializer.new(@task), status: :created
        else
            render json: {message: "error to create task"}, status: :unprocessable_entity
        end        
    end

    def update
        if @task.update(set_params)
            render json: TaskSerializer.new(@task), status: :created
        else
            render json: {message: "error to update task"}, status: :unprocessable_entity
        end   
    end
    
    def show
        render json: TaskSerializer.new(@task)
    end

    def destroy
        if @task.destroy
            render json: {message: "task destroyed"}
        end    
    end

    private
    def set_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    def set_task
        @task = Task.find(params[:id])
    end
end
