class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :destroy]

  def index
    @workouts = Workout.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @initial_date = '20190524'
    @initial_kind = 2
  end

  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html {redirect_to @workout, notice: 'Workout was successfully updated.'}
        format.json {render action: 'show', status: :created, location: @workout}
      else
        format.html {render action: 'new'}
        format.json {render json: @workout.errors, status: :unprocessable_entity}
      end
    end
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    @workout.timestamps = Time.now
    respond_to do |format|
      if @workout.save
        format.html {redirect_to @workout, notice: 'Workout was successfully created.'}
        format.json {render action: 'show', status: :created, location: @workout}
      else
        format.html {render action: 'new'}
        format.json {render json: @workout.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
  end

  private
  def workout_params
    params.require(:workout).permit(:date, :kind)
  end
  def set_workout
    @workout = Workout.find(params[:id])
  end
end
