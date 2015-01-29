class PagesController < ApplicationController
  def index
    @categories = {
      "happy!"         => %w(sports comedy music random),
      "tired"          => %w(late-night documentary short-film random),
      "yearn to learn" => %w(science ideas ted random),
      "bored"          => %w(fail kiss-cam cat random)
    }
  end
end
