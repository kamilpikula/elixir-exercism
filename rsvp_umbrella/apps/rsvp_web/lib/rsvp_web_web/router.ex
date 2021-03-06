defmodule RsvpWebWeb.Router do
  use RsvpWebWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RsvpWebWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/events", EventController, :list
    get "/events/new", EventController, :create
    post "/events/new", EventController, :add
    get "/events/:id", EventController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", RsvpWebWeb do
  #   pipe_through :api
  # end
end
