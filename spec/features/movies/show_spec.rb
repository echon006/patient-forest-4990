require 'rails_helper'

RSpec.describe 'Movies show page' do
  before :each do
    @studio_1 = Studio.create(name: "Studio 1", location: "Denver")
    @studio_2 = Studio.create(name: "Studio 2", location: "Aurora")

    @movie_1 = @studio_1.movies.create(title: "Movie 1", creation_year: 1990, genre: "Action")
    @movie_2 = @studio_1.movies.create(title: "Movie 2", creation_year: 1991, genre: "Comedy")
    @movie_3 = @studio_2.movies.create(title: "Movie 3", creation_year: 1992, genre: "Horror")
    @movie_4 = @studio_2.movies.create(title: "Movie 4", creation_year: 1993, genre: "Sci-Fi")
  end

  it "shows all the movies and their information" do
    visit "/movies"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
    expect(page).to have_content(@movie_4.title)
    expect(page).to have_content(@movie_4.creation_year)
    expect(page).to have_content(@movie_4.genre)
  end
end
