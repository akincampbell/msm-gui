class MoviesController < ApplicationController
  def create
    # Paramters look like this: 
    # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "query_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}

    a = Movie.new
    a.title = params.fetch("the_title")
    a.year = params.fetch("the_year")
    a.duration = params.fetch("the_duration")
    a.description = params.fetch("the_description")
    a.image = params.fetch("the_image")
    a.director_id = params.fetch("the_director_id")

    a.save

    redirect_to("/movies")

    # Retrieve the user's inputs from params
    # Create a record in the movie table
    # Populate each column with user input
    # Save

    # Redirect the user back to the /movies URL
  end

  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
