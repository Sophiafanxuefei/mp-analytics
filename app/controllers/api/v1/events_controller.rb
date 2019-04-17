class Api::V1::EventsController < Api::V1::BaseController

   def index
    @events = Event.all
  end

   def new
    @event = Event.new
  end

   def create
    @event = Event.new(event_params)
    @event.save
  end

   def event_params
    params.require(:event).permit(:id, :description, :timestamp, :page, :customer_id, :shop_id)
  end
end
