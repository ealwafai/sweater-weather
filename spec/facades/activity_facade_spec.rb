require 'rails_helper'

RSpec.describe ActivityFacade do
  describe 'class methods' do
    describe '.get_activity' do
      it 'returns an activity', :vcr do
        type = 'recreational'

        activity = ActivityFacade.get_activity(type)

        expect(activity).to be_a(Activity)
        expect(activity.title).to be_a(String)
        expect(activity.type).to be_a(String)
        expect(activity.participants).to be_an(Integer)
      end
    end
  end
end
