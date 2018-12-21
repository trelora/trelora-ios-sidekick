# Setup #

1. Clone branch
2. Select scheme
3. Run


# Architecture #
## VIPER ##

This app uses the `VIPER` arcitecture. Here's the [Github link](https://github.com/ColdLogical/VIPER-Templates) for the `xctemplates` and more info about the it.


# How it Works #

Selecting an environment stores its `api` and `web` url into `UserDefaults`. The Trelora app upon open generates an environment by tapping into the shared userDefaults `group.com.trelora.environmentkeys` and grabs the api and web urls. The Trelora app will automatically point to the production environment if no environment is selected (since users don't have access to the Sidekick app). This allows testers to point to any environment to test new changes on a production build (App Store) or dev build (HockeApp).


# Distribution #

## Hockey App ##

1. Select `Sidekick` scheme
2. Archive the app
3. Upload the archived build to HockeyApp
