class WorkoutDetailsController < ApplicationController

  def index
    @workouts = Workout.where(user_id: current_user.id)
  end

  def show
    respond_to do |format|
      workout_details = WorkoutDetail.where(workout_id: params[:workout_id])
      format.json {render json: workout_details.as_json}
    end
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
    workout_id = params[:workout_id]
    workout_details = WorkoutDetail.where workout_id: workout_id
    workout_details.delete_all
    workout_detail_params.each do |item|
      detail = WorkoutDetail.new(item)
      detail.workout_id = workout_id
      if !detail.save
        puts 'error'
      end
    end
    respond_to do |format|
      format.json {render json: 'success', status: :created}
    end
  end

  def destroy
  end

  private
  def workout_detail_params
    params.require(:workout_details).map do |workout_detail|
      workout_detail.permit(:menu_kind, :times, :interval, :note, :distance)
    end
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
