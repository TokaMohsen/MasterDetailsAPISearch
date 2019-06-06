
Master Details API Search

This application is an example of searching the Flickr API for photos in Swift after searching in json file using search bar and grouping results.

Getting Started

1.Clone the repo and run FlickrSearch.xcodeproj

2.the only Pod used is SDWebImage

3.Create a Flickr API key and replace placeholder with key in FlickerAPISearch.swift
The Flickr API


Images are retrieved by hitting the Flickr API.

Search Path: https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=FLICKR_API_KEY&tags=SEARCH_TEXT&per_page=25&format=json&nojsoncallback=1
Response includes an array of photo objects, each represented as:
{
    "farm": 8,
    "id": 15981410640,
    "isfamily": 0,
    "isfriend": 0,
    "ispublic": 1,
    "owner": "28339853@N03",
    "secret": "a0d5006167",
    "server": 7564,
    "title": "Chi shark week"
}
We use the farm, server, id, and secret to build the image path.

Image Path: https://farmFARM.staticflickr.com/SERVER/ID_SECRET_m.jpg
Example: https://farm8.staticflickr.com/7564/15981410640_a0d5006167_m.jpg
Response object is the image file


