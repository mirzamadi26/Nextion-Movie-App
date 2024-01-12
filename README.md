# Nextion Movie App

# Dependencies

    Get: State management library for Flutter.
    CachedNetworkImage: Caches network images to improve performance.
    Shared Preferences: Persists key-value data on the device.

Architecture

The app follows the GetX architecture, a lightweight and reactive state management solution for Flutter. Key components include:

    Controllers: Responsible for managing application state.
    Views: User interfaces built using Flutter widgets.
    Models: Represent data structures used by the app.

## Folder Structure
### lib

 data/ <br>
       &nbsp;&nbsp; models/ <br>
     &nbsp;&nbsp;  services/ <br>
  &nbsp; interface/ <br>
      &nbsp; utils/ <br>
           &nbsp;&nbsp; constants/<br>
          &nbsp;&nbsp;  themes/ <br>
      &nbsp; views/ <br>
      &nbsp; controllers/ <br>

## Instructions for folders:
* Models folder contains data models i.e. movie-model
* Services contains movie-service containing all functions for popular-movies
* Utils contains theme for app and constants for app like widgets, paddings, spacings etc.
* Views contains pages of the app with frontend only along with GetX controllers injection.
* Controllers contains GetX controllers for the entire app.

## Controllers:
* Watch Controller handles the movie service to load popular movies.
* used for controlling loading in watch view.
* Splash controller used for loading splash.

  ## Splash Screen
  <img src="https://github.com/mirzamadi26/Nextion-Movie-App/assets/91668851/d7fe16eb-7488-4109-b53d-4a5d73226534" width=20% height=20%>

## Popular Movies
 <img src="https://github.com/mirzamadi26/Nextion-Movie-App/assets/91668851/e848463a-ff94-404d-b97a-50e14f74db60" width=20% height=20%>
 
 
## Movie Details

 <img src="https://github.com/mirzamadi26/Nextion-Movie-App/assets/91668851/2f719233-4ed2-4282-806a-7ed449553f9c" width=20% height=20%>
 
## Loading while fetching Data

 <img src="https://github.com/mirzamadi26/Nextion-Movie-App/assets/91668851/b36624d9-f665-4368-ab22-8d9863e9d9cf" width=20% height=20%>

## Favorite Movies
 <img src="https://github.com/mirzamadi26/Nextion-Movie-App/assets/91668851/38f030f7-54b4-4200-be44-a44600c7271d" width=20% height=20%>

