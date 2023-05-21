### Description

Example of a Rails app that uses pgvector in Postgres and OpenAI model to create and store vector embeddings to find similar records in a model

### Ruby and Rails versions

* `ruby-3.1.x`
* `Rails 7.0.x`

### Tools and Services:

* [Supabase](https://app.supabase.com/) for Postgres Database that supports pgvector
  * See [here](https://supabase.com/docs/guides/getting-started/local-development) for how to setup and run Supabase for local development 
* OpenAI for creating embeddings
  * Get OpenAI API key here: https://platform.openai.com/account/api-keys
* [TheMovieDB](https://www.themoviedb.org) for populating a seed database for the example
  * Get TheMovieDB key here: https://www.themoviedb.org/settings/api

### ENV Variables

This app uses `dotenv` for environment variables

Set `MOVIEDB_API_KEY` and `OPENAI_SK` in `.env` file

### Try this yourself

1. Install all gems
```bundle install`

2. Create the database:
```rails db:create```

3. Migrate database:
```rails db:migrate```

4. Create seed data with embeddings:
```rails db:seed```

5. See it in action:
```
movie = Movie.first
similar_movie = movie.nearest_neighbors(:embedding, distance: "inner_product").first
puts "#{similar_movie.title} - #{similar_movie.neighbor_distance}"
```

### How to run the app

```
foreman start
```
