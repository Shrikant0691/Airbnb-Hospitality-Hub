In our case study on Airbnb's Hospitality Intelligence Hub, we have two tables: 'Listings' and ‘Booking_Details. The ‘Listings' table contains information on the various neighborhoods in New York City, including
the types of listings available in each neighborhood. The 'Reviews' table, on the other hand, has information on the prices of these
listings, reviews and their availability. Both the tables, ‘Listings’ and ‘Reviews’ are provided in the form of .csv file.
Description of Listings Table:
 id: A unique identifier for each listing.
 name: The name of the listing.
 host_id: A unique identifier for the host of the listing.
 host_name: The name of the host.
 neighbourhood_group: The group of neighborhoods that the
listing belongs to.
 neighbourhood: The name of the neighborhood that the listing
belongs to.
 room_type: The type of room that is being listed (e.g. private
room, entire apartment)

Now let's take a closer look at the ‘Booking_Details table description:
 listing_id: A unique identifier for each listing.
 price: The nightly price of the listing.
 minimum_nights: The minimum number of nights that a guest
must book in order to stay at the listing.
 number_of_reviews: The total number of reviews that the listing
has received.
 reviews_per_month: The average number of reviews that the
listing receives per month.
 calculated_host_listings_count: The number of listings that the
host has on Airbnb.
 availability_365: The number of days that the listing is available
for booking throughout the year
