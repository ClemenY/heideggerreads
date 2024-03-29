require 'twitter'
require 'sinatra'
require "sinatra/reloader" if development?
require 'httparty'
require 'json'
require 'easy_translate'


response_G = HTTParty.get('https://newsapi.org/v1/articles?source=gruenderszene&sortBy=latest&apiKey=d827bc4d53bc4731af89098c268553f7')

#response["articles"].each do |i|

  #puts i["title"]
  
  #end

  #get and translate news from gruenderszene
ARTICLES_G = response_G["articles"].sample
TITLE_G = ARTICLES_G["title"]

puts TITLE_G

EasyTranslate.api_key = 'AIzaSyAnXSTcGwUOO5ona5tM4MCxSwkSwT6j6P8'

TITLE_G_EN = EasyTranslate.translate(TITLE_G, :from => :german, :to => :en)

puts TITLE_G_EN

#get and translate news from Wired.de

response_W = HTTParty.get('https://newsapi.org/v1/articles?source=gruenderszene&sortBy=latest&apiKey=d827bc4d53bc4731af89098c268553f7')

ARTICLES_W = response_W["articles"].sample
TITLE_W = ARTICLES_W["title"]

puts TITLE_W

EasyTranslate.api_key = 'AIzaSyAnXSTcGwUOO5ona5tM4MCxSwkSwT6j6P8'

TITLE_W_EN = EasyTranslate.translate(TITLE_W, :from => :german, :to => :en)

puts TITLE_W_EN

#get and translate news from T3n

response_T = HTTParty.get('https://newsapi.org/v1/articles?source=t3n&sortBy=top&apiKey=d827bc4d53bc4731af89098c268553f7')

ARTICLES_T = response_T["articles"].sample
TITLE_T = ARTICLES_T["title"]

puts TITLE_T

EasyTranslate.api_key = 'AIzaSyAnXSTcGwUOO5ona5tM4MCxSwkSwT6j6P8'

TITLE_T_EN = EasyTranslate.translate(TITLE_T, :from => :german, :to => :en)

puts TITLE_T_EN

#select a news from the above sources
NEWS = [TITLE_G_EN, TITLE_W_EN, TITLE_T_EN]
puts NEWS

#select a quote from Heidegger

QUOTE = ["Tell me how you read and I'll tell you who you are", 
  "Making itself intelligible is suicide for philosophy",
  "Every man is born as many men and dies as a single one",
  "Why are there beings at all, instead of Nothing",
  "Everyone is the other and no one is himself",
  "Longing is the agony of the nearness of the distant",
  "The possible ranks higher than the actual",
  "Truth is that which makes a people certain, clear, and strong",
  "He who thinks great thoughts often makes great errors",
  "The human being is not the lord of beings, but the shepherd of being",
  "Das Nichts nichtet",
  "The nothing nothings",
  "But what is great can only begin great",
  "We are too late for the gods and too early for Being",
  "Only he who already understands can listen",
  "Mere anxiety is the source of everything",
  "Understanding of being is itself a determination of being of Da-sein",
  "Language is the house of Being",
  "The song still remains which names the land over which it sings",
  "Man dies constantly until the moment of his demise",
  "Nothing is everything that doesn't happen at this very moment",
  "To dwell is to garden",
  "Excessive brightness drove the poet into darkness",
  "Nature has no history",
  "He who never says anything cannot keep silent at any given moment",
  "Let himself be drawn hither by the coercion of the phenomena themselves",
  "The essence of technology is by no means anything technological",
  "What is decision anyway",
  "The poets are in the vanguard of a changed conception of Being",
  "Transcendence constitutes selfhood",
  "In its essence, technology is something that man does not control",
  "The grandeur of man is measured according to what he seeks and according to the urgency by which he remains a seeker",
  "The human body is essentially something other than an animal organism",
  "The most thought-provoking thing in our thought-provoking time is that we are still not thinking",
  "Everywhere we remain unfree and chained to technology, whether we passionately affirm or deny it",
  "We ourselves are the entities to be analyzed",
  "In order to remain silent Da-sein must have something to say",
  "In everything well known something worthy of thought still lurks.",
  "Enjoyment of the work consists in participation in the creative state of the artist",
  "The word 'art' does not designate the concept of a mere eventuality; it is a concept of ran"]
  

#!/usr/bin/env ruby

client = Twitter::REST::Client.new do |config|
config.consumer_key        = "0yC1gdUh0KYA661SRe4gGuscc"
config.consumer_secret     = "Az0MDINMeMsd6ioioGW23NgBdsRD7wyTmv3fo3Y6AxYY8q26u3"
config.access_token        = "915275729478266881-VLaEoVYVnYRDQZXkxw7ebC790SnSD7X"
config.access_token_secret = "7LxJJmRbYLeBdXM9QgFDNsByH21d236eLHncTNJwp80T2"
end


#search tweets around cmu campus mention German related topics
#search_options = {result_type: "recent",geocode: "40.4434119,-79.9429875,10mi"}
#client.search("#Berlin", search_options).take(1).each do |tweet|
 #puts "#{tweet.user.screen_name}: #{tweet.text}"
  #client.update(QUOTE.sample+": "+NEWS.sample+". " + "@#{tweet.user.screen_name}")
  #end


#search_options = {result_type: "recent", geocode: "40.4434119,-79.9429875,10mi"}
#client.search("#Hamburg", search_options).take(1).each do |tweet|
 #puts "#{tweet.user.screen_name}: #{tweet.text}"
  #client.update(QUOTE.sample+": "+NEWS.sample+". " + "@#{tweet.user.screen_name}")
  #end

#search_options = {result_type: "recent", geocode: "40.4434119,-79.9429875,10mi"}
#client.search("#Germany", search_options).take(1).each do |tweet|
 #puts "#{tweet.user.screen_name}: #{tweet.text}"
  #client.update(QUOTE.sample+": "+NEWS.sample+". " + "@#{tweet.user.screen_name}")
  #end

client.update (QUOTE.sample+": "+NEWS.sample+". ")
