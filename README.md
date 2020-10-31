## flutter-GitConnect ![Twitter URL](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Ftwitter.com%2Fthealphamerc) [![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_octo_job_search?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_octo_job_search) ![GitHub forks](https://img.shields.io/github/forks/TheAlphamerc/flutter_octo_job_search?style=social) 
![GitHub pull requests](https://img.shields.io/github/issues-pr/TheAlphamerc/flutter_octo_job_search) ![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/Thealphamerc/flutter_octo_job_search) ![GitHub last commit](https://img.shields.io/github/last-commit/Thealphamerc/flutter_octo_job_search)  ![GitHub issues](https://img.shields.io/github/issues-raw/Thealphamerc/flutter_octo_job_search) [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/Thealphamerc/flutter_octo_job_search) 

Octo Job Search app is a job search app built in flutter framwork. It uses [Github Jobs](https://jobs.github.com/api) data to display jobs.
App design is taken from [Fronntend Mentor](https://www.frontendmentor.io/challenges/github-jobs-api-93L-NL6rP) and [Bhanu Taneja's Article](https://dev.to/pbteja1998/revamped-github-jobs-website-using-design-from-frontend-mentor-3m0n)

## Download App
Will be available soon

## Screenshots

Home                |  Job detail               | Settings                |  About us
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_octo_job_search/blob/main/screenshots/screenshot_1.jpg?raw=true) | ![](https://github.com/TheAlphamerc/flutter_octo_job_search/blob/main/screenshots/screenshot_2.jpg?raw=true)| ![](https://github.com/TheAlphamerc/flutter_octo_job_search//blob/main/screenshots/screenshot_3.jpg?raw=true)| ![](https://github.com/TheAlphamerc/flutter_octo_job_search//blob/main/screenshots/screenshot_4.jpg?raw=true)|

Home (Light Theme)       |  Job detail (Light Theme)  | Settings  (Light Theme) |  About us (Light Theme) 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_octo_job_search//blob/main/screenshots/screenshot_1.png?raw=true) |![](https://github.com/TheAlphamerc/flutter_octo_job_search//blob/main/screenshots/screenshot_2.png?raw=true)|![](https://github.com/TheAlphamerc/flutter_octo_job_search//blob/main/screenshots/screenshot_3.png?raw=true)|![](https://github.com/TheAlphamerc/flutter_octo_job_search//blob/main/screenshots/screenshot_4.png?raw=true)|




## Dependencies
<details>
     <summary> Click to expand </summary>
     
* [intl](https://pub.dev/packages/intl)
* [dio](https://pub.dev/packages/dio)
* [share](https://pub.dev/packages/share)
* [get_it](https://pub.dev/packages/get_it)
* [graphql](https://pub.dev/packages/graphql)
* [equatable](https://pub.dev/packages/equatable)
* [flutter_bloc](https://pub.dev/packages/flutter_bloc)
* [url_launcher](https://pub.dev/packages/url_launcher)
* [google_fonts](https://pub.dev/packages/google_fonts)
* [flutter_html](https://pub.dev/packages/flutter_html)
* [flutter_custom_tabs](https://pub.dev/packages/flutter_custom_tabs)
* [shared_preferences](https://pub.dev/packages/shared_preferences)
* [cached_network_image](https://pub.dev/packages/cached_network_image)
     
</details>


## Features
* Job Listing
* Search - title, title, expertise, companies. 
* Filters - city, state, zip code or country, full time.
* Result paginations
* Job Details


## Project structure
<details>
     <summary> Click to expand </summary>
     
```
|
|-- lib
|   |-- app_delegate.dart
|   |-- bloc
|   |   |-- job
|   |   |   |-- job_bloc.dart
|   |   |   |-- job_event.dart
|   |   |   |-- job_model.dart
|   |   |   '-- job_state.dart
|   |   '-- theme
|   |       |-- theme_bloc.dart
|   |       |-- theme_event.dart
|   |       '-- theme_state.dart
|   |-- helper
|   |   |-- config.dart
|   |   |-- dummy_data.dart
|   |   |-- icons.dart
|   |   '-- utility.dart
|   |-- locator.dart
|   |-- main.dart
|   |-- resources
|   |   |-- dio_client.dart
|   |   |-- exceptions.dart
|   |   |-- gatway
|   |   |   |-- api_gateway.dart
|   |   |   '-- api_gateway_impl.dart
|   |   '-- repository.dart
|   '-- ui
|       |-- app.dart
|       |-- page
|       |   |-- detail
|       |   |   |-- job_detail_page.dart
|       |   |   '-- widget
|       |   |       |-- company_card.dart
|       |   |       |-- html_view.dart
|       |   |       '-- job_description_card.dart
|       |   |-- home
|       |   |   |-- home_page.dart
|       |   |   '-- widget
|       |   |       |-- filter_dialog.dart
|       |   |       '-- job_tile.dart
|       |   |-- settings
|       |   |   '-- about_us_page.dart
|       |   '-- settings.dart
|       |-- theme
|       |   |-- colors
|       |   |   |-- dark_colors.dart
|       |   |   '-- light_color.dart
|       |   |-- extentions.dart
|       |   |-- text_theme.dart
|       |   '-- theme.dart
|       '-- widget
|           '-- erorr_widget.dart
|-- pubspec.yaml

```    
</details>
     
## Contributing

If you wish to contribute a change to any of the existing feature or add new in this repo,
Send a [pull request](https://github.com/TheAlphamerc/flutter_octo_job_search/pulls). I welcome and encourage all pull requests. It usually will take me within 24 hours to respond to any issue or request.

## Created & Maintained By

[Sonu Sharma](https://github.com/TheAlphamerc) ([Twitter](https://www.twitter.com/TheAlphamerc)) ([Youtube](https://www.youtube.com/user/sonusharma045sonu/)) ([Insta](https://www.instagram.com/_sonu_sharma__)) ([Dev.to](https://dev.to/thealphamerc))
  ![Twitter Follow](https://img.shields.io/twitter/follow/thealphamerc?style=social) 

> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> * [PayPal](https://paypal.me/TheAlphamerc/)

## Visitors Count

<img align="left" src = "https://profile-counter.glitch.me/flutter_octo_job_search/count.svg" alt ="Loading">
