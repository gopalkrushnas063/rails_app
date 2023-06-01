class HomeController < ApplicationController
    def index
        @title_text = 'Hello World'
        @subtitle_text = 'I am learning Rails!'
    end
end