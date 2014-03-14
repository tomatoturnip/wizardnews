require 'sinatra'
require 'pry'
require 'shotgun'
require 'csv'
require_relative 'lib/wizard_article'

get '/' do

  erb :article_index
end

post '/articles' do
  @name = params['article_name']
  @url = params['url_name']
  @description = params['description']


  @article = WizardArticle.new(@name, @url, @description)
  @article.write_to_csv('articles.csv')

  redirect '/'
end

# read from CSV, create new array of objects
get '/all-articles' do
  @articles = []
  CSV.foreach('articles.csv') do |row|
    @articles << WizardArticle.new(row[0], row[1], row[2])
    # binding.pry
  end

  erb:all_articles
end


# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
