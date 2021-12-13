require 'rails_helper'

RSpec.describe 'Studio index page' do
  before :each do
    @studio_1 = Studio.create(name: "Studio 1", location: "Denver")
    @studio_2 = Studio.create(name: "Studio 2", location: "Aurora")

    @movie_1 = Movie.create(title: "Movie 1", creation_year: 1990, genre: "Action", studio_id: 1)
    @movie_2 = Movie.create(title: "Movie 2", creation_year: 1991, genre: "Comedy", studio_id: 1)
    @movie_3 = Movie.create(title: "Movie 3", creation_year: 1992, genre: "Horror", studio_id: 2)
    @movie_4 = Movie.create(title: "Movie 4", creation_year: 1993, genre: "Sci-Fi", studio_id: 2)
  end

  it "shows all the studios and thier informaiton " do
    visit "/studios"

    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.location)
    expect(page).to have_content(@studio_2.name)
    expect(page).to have_content(@studio_2.location)
  end

  it "shows all the movies that are related to the studio" do
    visit "/studios"

    expect(page).to have_content(@movie_1.name)
    expect(page).to have_content(@movie_2.name)
    expect(page).to have_content(@movie_3.name)
    expect(page).to have_content(@movie_4.name)
  end
end
