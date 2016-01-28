# Fyber Challenge

## Framework
### Why Sinatra ?
RoR would be an obvious choice for a majority of the projects, however Rails does a lot of things for developers automagically and some developers might not understand what is happening behind the scene.
My intention here was to demonstrate that I am capable of creating a project from base bones, going with minimalistic approach where every part matters for this particular task. Every bit was specifically made around the challenge.
In my humble opinion Rails would be an overkill for a lot of things required in this project.

## Testing
### RSpec, VCR and Capybara
As we are doing quite a few requests to external API and want to speedup our tests as much as we can.
Capybara was a nice way to do acceptance test for a separated spec for this challenge.

## Services
### Fyber Offer
As I don't know all the Fyber endpoints, my intention was to make the service as modular as possible, therefore it allows quickly plugging in other endpoints.
Also that structure allows extracting pieces from the project into gems or reusable libraries. Apparently documentation is missing, but I've thought it will be way outside of the task scope.

## Security
Given information strings were separated into 3 groups:

1. Authentication with endpoint: these were extracted into .env file for development purpose. On production it stored inside the environment
2. Three params provided through the website form.
3. Other dynamic params, such as device_id, locale, ip etc. were hardcoded in the code only for the purpose of this challenge. In the ideal scenario they should have been given dynamically to the application, but it wasn't part of the challenge.

## Frontend
### Pure CSS
Great library for quick prototypes
