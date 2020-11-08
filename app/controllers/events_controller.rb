class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
      if @event.save
         redirect_to @event, flash: {success: "イベントが追加されました"}
      else
         render :new
      end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
      if @event.update(event_params)
        redirect_to @event, flash: {info: "イベントが更新されました"}
      else
       render :edit
      end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    redirect_to events_url, flash: {danger: "イベントが削除されました"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :body, :start_date, :end_date)
    end
end
