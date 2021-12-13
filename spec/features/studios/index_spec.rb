require 'rails_helper'

RSpec.describe 'Studio index page' do
  before :each do
    @studio_1 = Studio.create(name: "Studio 1", location: "Denver")
    @studio_2 = Studio.create(name: "Studio 2", location: "Aurora")

    @movie_1 = @studio_1.movies.create(title: "Movie 1", creation_year: 1990, genre: "Action")
    @movie_2 = @studio_1.movies.create(title: "Movie 2", creation_year: 1991, genre: "Comedy")
    @movie_3 = @studio_2.movies.create(title: "Movie 3", creation_year: 1992, genre: "Horror")
    @movie_4 = @studio_2.movies.create(title: "Movie 4", creation_year: 1993, genre: "Sci-Fi")
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

    # expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)
    expect(page).to have_content(@movie_3.title)
    expect(page).to have_content(@movie_4.title)
  end
end
