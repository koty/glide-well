class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
  end

  def new
    @initial_date = '20190524'
    @initial_kind = 2
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = 1
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
end
