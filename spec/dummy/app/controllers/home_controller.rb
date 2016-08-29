class HomeController < ApplicationController
  if ::Rails::VERSION::MAJOR < 5
    before_filter :set_book
  else
    before_action :set_book
  end

  def index
    render layout: false
  end

  def index_with_layout
  end

  def index_partial
  end

  def index_partial_with_full_path
  end

  def index_with_filter
  end

  def erb_with_html_liquid_partial
  end

  private

    def set_book
      @book = { 'name' => 'Liquid on Rails' }
    end
end
