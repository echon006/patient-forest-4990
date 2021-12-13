require 'rails_helper'

RSpec.describe 'Studio index page' do
  before :each do
    @studio_1 = Studio.create(name: "Studio 1", location: "Denver")
    @studio_2 = Studio.create(name: "Studio 2", location: "Aurora")
  end

  it "shows all the studios and thier informaiton " do
    visit "/studio"

    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.location)
    expect(page).to have_content(@studio_2.name)
    expect(page).to have_content(@studio_2.location)
  end
end
