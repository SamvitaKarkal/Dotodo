class TaskController < ApplicationController
  def index
    tasks = Task.all
    render status: :ok, json: { tasks: tasks }
  end
end
