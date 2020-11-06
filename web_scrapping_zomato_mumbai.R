
library(robotstxt)
p = paths_allowed("https://www.zomato.com/pune/order-food-online?delivery_subzone=1165")

#reading the website
library(rvest)
web = read_html("https://www.zomato.com/pune/order-food-online?delivery_subzone=1165")
View(web)
#importing dplyr library to work with dataframes
library(dplyr)

#reading names of restaurants
name = web%>%html_nodes(".ln20")%>%html_text()
View(name)

#reading ratings
ratings = web%>%html_nodes(".rating-value")%>%html_text()
View(ratings)

#reading cuisines
cuisines = web%>%html_nodes(".clear+ .ln24")%>%html_text()
View(cuisines)

#reading average cost for 1 person
cost_for_one = web%>%html_nodes(".ln24+ .grey-text")%>%html_text()
View(cost_for_one)

#reading minimum cost and delivery time
min_cost_delivery_time = web%>%html_nodes(".ln24~ .grey-text+ .ln24")%>%html_text()
View(min_cost_delivery_time)

#reading payment methods
payment_methods = web%>%html_nodes(".ln24:nth-child(5)")%>%html_text()
View(payment_methods)

#reading total number of reviews
total_reviews = web%>%html_nodes("#orig-search-list .medium")%>%html_text()
View(total_reviews)

#creating a dataframe and concatinating the above lists
zomato_mumbai_df = data.frame(name, cuisines, ratings, total_reviews,cost_for_one, min_cost_delivery_time, payment_methods)
View(zomato_mumbai_df)

