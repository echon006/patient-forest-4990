require 'rails_helper'

RSpec.describe 'Movies show page' do
  before :each do
    @studio_1 = Studio.create(name: "Studio 1", location: "Denver")
    @studio_2 = Studio.create(name: "Studio 2", location: "Aurora")

    @movie_1 = @studio_1.movies.create(title: "Movie 1", creation_year: 1990, genre: "Action")
    @movie_2 = @studio_1.movies.create(title: "Movie 2", creation_year: 1991, genre: "Comedy")
    @movie_3 = @studio_2.movies.create(title: "Movie 3", creation_year: 1992, genre: "Horror")
    @movie_4 = @studio_2.movies.create(title: "Movie 4", creation_year: 1993, genre: "Sci-Fi")

    @actor1 = @movie_1.actors.create(name: "actor 1", age: 20)
    @actor2 = @movie_1.actors.create(name: "actor 2", age: 20)
    @actor3 = @movie_1.actors.create(name: "actor 3", age: 20)
    @actor4 = @movie_1.actors.create(name: "actor 4", age: 20)

    @movie_actor1 = MovieActor.create!(actor: @actor1, movie: @movie_1)
    @movie_actor2 = MovieActor.create!(actor: @actor2, movie: @movie_1)

  end



  it "shows all the movies and their information" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
    expect(page).to have_content(@actor1.name)

  end
end
