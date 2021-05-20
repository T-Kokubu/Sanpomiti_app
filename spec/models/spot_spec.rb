require 'rails_helper'

RSpec.describe Spot, type: :model do
  let!(:user) { create(:user) }
  let!(:walkcourse) { create(:walkcourse, user: user) }
  let!(:spot) { create(:spot, user: user, walkcourse: walkcourse) }

  describe 'name' do

  end
  describe 'address' do

  end
  describe 'description' do

  end
  describe 'transit_time' do

  end
  describe 'time_required' do

  end
end
