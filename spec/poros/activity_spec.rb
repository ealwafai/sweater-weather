require 'rails_helper'

RSpec.describe Activity do
  it 'can initialize from activity params' do
    activity_params = {
                      activity: "Play a video game",
                      type: "recreational",
                      participants: 1,
                      price: 0
    }

    activity = Activity.new(activity_params)

    expect(activity).to be_a(Activity)
    expect(activity.title).to eq(activity_params[:activity])
    expect(activity.type).to eq(activity_params[:type])
    expect(activity.participants).to eq(activity_params[:participants])
    expect(activity.price).to eq(activity_params[:price])
  end
end
