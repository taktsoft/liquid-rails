class PagesController < ApplicationController
  if ::Rails::VERSION::MAJOR < 5
    before_filter :set_book
  else
    before_action :set_book
  end

  def index_witout_filter
  end

  private

    def liquid_filters
      []
    end

    def set_book
      @book = { 'name' => 'Liquid on Rails' }
    end
end