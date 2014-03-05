#CL - Homes

A NYC based housing/apartment-listing application. I began this as a clone of craigslist's housing section but immediately became fascinated with the NYC housing market and the role the vital role Internet plays in it.  

As far as the functionality goes, my goals here are two fold:  

1. To implement a wide range of features varying in scope, complexity, and utilized technologies.  
2. To build on the core features standard to most urban housing apps such as craigslist, nakedapartments, View the Space and Trulia, adding touches and functionality where I feel other apps are lacking.  

This is very much a work-in-progress, but please have a look around! You can also see it live at www.cl-homes.us.  

##Features  

### Multi-Parameter Search Filtering
* Utilize both pg_search gem as well as custom SQL query to collect only posts with attributes matching all search parameters.  

### Custom RESTful JSON API  
* Post controllers respond to both html requests, as well as xhr request make by UJS and Ajax calls, effectively doubling as a json APIs.

### Multiple User Types
* User model enables two distinct client types - regular user who cannot make posts and broker/owner users who can.
* Before_filters on restricted controller actions require a user to have a broker account before posting listing. This is handled through custom validations and provides for a better user experience as normal users need only provide an email to sign up.  

### Map View powered by Mapbox API  
* Employs Mapbox's javascript API for map view of housing post index.

### Backbone.js Powered Post Index View  
* Searches are executed through background Ajax requests to the RESTful API, allowing for instant page load.  
* Backbone post collection preserves search results when switching between list and map index views.  

### Google REST API integration  
* Interfaces with Google Geocoder API to set geometric location of posts from parsed address attributes for map placement.
* Also interfaces with Google Places API to acquire real addresses for seeding development and production-demo databases.  

## TODO  

### Messaging  
* Allow users to message brokers about listings that they are interested in.  

### Schedules/Calendars  
* Calendar feature which allows searching users and broker users to view and organize their appointments with each other.  

### Notifications
* Notify normal users and brokers when they have received a message.  
* Notify brokers when their listings are about to expire.  
* Notify users of schedule changes.  

### OAuth Integration  
* Sign in with facebook, Twitter, Google, etc.  

### Map Markerclusters  
* Research Leaflet markercluster plugin for consolidating map markers when zoom level clutters map. 