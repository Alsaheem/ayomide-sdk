# Design of the SDK


The src folder contains the code for the sdk 
the test folder contains the tests written to test out the different functionalities of the sdk

The `src` folder contains the ayomide_sdk , which houses the main code and functionalities of the sdk

The `api_resources` folder contains some abstract classes, api_requester class , constants and helpers

The abstact class is used for abstraction of common functionalities used across the different apis like the movie and quote classes
the helper file holds various helper functions to reduce code repetition
the constants file holds variables that would not change
the api_requester file has the APIRequester class that handles all api and over the internet requests

The `rest` folder contains the various functionalities across various parts of the api 

e.g
1. movie
2. quote
2. character

These various parts each have their classes 

The `init.py` file in the rest folder contains the client class

The client class is used for initialization of the package 
the client class requires 2 parameters 
1. the api key
2. the api_version (this can be v1 or v2)  # i added this for backward compatibility

## Installing the package from pypi

```
# create a virtual environment
>>> python3 -m venv venv
>>> pip install ayomide-sdk==0.0.6
```

## Here are various ways which the client can be initialised to use the sdk

Register on https://the-one-api.dev/ to get your API token used to authenticate your requests


```
>>> from ayomide_sdk.rest import Client
>>> client = Client(version="v2", api_key="API-KEY")
>>> quotes = client.quote.get()
>>> quotes["status"]
200
>>> quotes["json"]
{}
```

### for /movie
```
>>> from ayomide_sdk.rest import Client
>>> client = Client(version="v2", api_key="API-KEY")
>>> movies = client.quote.get()
>>> movies["status"]
200
>>> movies["json"]
{}
```

### for /movie/id
```
>>> from ayomide_sdk.rest import Client
>>> client = Client(version="v2", api_key="API-KEY")
>>> single_movie = client.movie.get(params={'id':"5cd95395de30eff6ebccde57"})
>>> single_movie["status"]
200
>>> single_movie["json"]
{}
```

### for /movie/id/quote
```
>>> from ayomide_sdk.rest import Client
>>> client = Client(version="v2", api_key="API-KEY")
>>> movie_quotes = client.quote.get(params={"id":"5cd95395de30eff6ebccde57","subquery"="quote"})
>>> movie_quotes["status"]
200
>>> movie_quotes["json"]
{}
```

### for /quote
```
>>> from ayomide_sdk.rest import Client
>>> client = Client(version="v2", api_key="API-KEY")
>>> quotes = client.quote.get(params={"id":"5cd95395de30eff6ebccde57","subquery"="quote"})
>>> quotes["status"]
200
>>> quotes["json"]
{}
```

### for /quote/id
```
>>> from ayomide_sdk.rest import Client
>>> client = Client(version="v2", api_key="API-KEY")
>>> single_quote = client.quote.get(params={'id':"5cd95395de30eff6ebccde57"})
>>> single_quote["status"]
200
>>> single_quote["json"]
{}
```

### for pagination filter (can be used for movie and quotes on any edpoints)
```
>>> from ayomide_sdk.rest import Client
>>> client = Client(version="v2", api_key="API-KEY")
>>> single_movie = client.movie.get(params={'id':"5cd95395de30eff6ebccde57"}, filters={"limit":"100","page":"2"})
>>> single_movie["status"]
200
>>> single_movie["json"]
{}
```

