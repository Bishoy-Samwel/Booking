class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :update, :destroy]

  # GET /sessions
  def index
    @sessions = Session.all

    render json: @sessions
  end

  # GET /sessions/1
  def show
    render json: @session
  end

  # POST /sessions
  def create
    @session = Session.new(session_params)
    lDuration = Lesson.find(@session.lesson_id).duration
    availability = Availability.where("duration >= ?", lDuration)[0]    
    @session.duration = lDuration;
    if availability
      @session.teacher_id = availability.teacher_id
      @session.start_time = availability.start_time
      @session.end_time =  @session.start_time + (lDuration*60*60)
    end    
    if @session.save
      newStart_time = availability.start_time +  (lDuration*60*60);
      availability.update(start_time:newStart_time)
      availability.update(duration: (availability.end_time - availability.start_time)/(60*60) )
      if availability.duration < 1
        availability.destroy
      end
      render json: @session, status: :created, location: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sessions/1
  def update
    if @session.update(session_params)
      render json: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/1
  def destroy
    @session.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def session_params
      params.permit(:lesson_id, :student_id)
    end
end
