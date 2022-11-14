# Countries_app

 ## Overview 
  This is the **Countries Explorer App** which allows users to explore countries the have intrest in. This project was written with pure [Flutter](https://flutter.dev/).
This project uses the [Countries Api V3](https://restcountries.com/v3.1/all) to provide the list of contries and their detailed information.

This project is a starting point for a Flutter application.

### Features
- Countries List
- Tap country to get more details.
- Filter country results.
- Supports dark and light theme mode
- Uses [Very_Good_Analysis Linter](https://pub.dev/packages/very_good_analysis)

### Upcoming features
- Localization of of each country
- Have a [RiverPod](www.riverpod.dev) state management implementation.

#### Design 
   The figma design that will be implemented for this project can be found [here](https://www.figma.com/proto/v9AXj4VZNnx26fTthrPbhX/Explore?node-id=33%3A1390&scaling=scale-down&page-id=0%3A1&starting-point-node-id=33%3A1390&show-proto-sidebar=1) 

#### Hosted App Link
   [Here](https://appetize.io/embed/amfx2ooztcwy5iusnlayzkhnei) is the link to the app hosted on appetize.

#### Challenges Faced.
   There were no challenges faced while building this project.

#### Things that could be made better
 - followed TDD pattern




#### External Libraries used
  
  # helps cache images from the network to avoid uncessary network calls
  cached_network_image: ^3.2.2

  # Used to make network calls
  dio: ^4.0.6

  # Implements google fonts api to provide custom fonts
  google_fonts: ^3.0.1

  # An efficient way to for object equality
  equatable: ^2.0.5


   # This library provides custom hook to improve code reusability
  flutter_hooks: ^0.18.5+1

  # Consistent and pixel perfect helper
  flutter_screenutil: ^5.6.0

  # Provides fluent page view indicators
  smooth_page_indicator: ^1.0.0+2

  # used to display a shimmer effect when UI loading
  shimmer: ^2.0.0

  # Provider state management library extension with classes to boost mvvm architecture
  stacked: ^3.0.0
  stacked_hooks: ^0.2.2
  stacked_services: ^0.9.8

  # Logging info to the console
  logger: ^1.1.0

  # package used to incorperate webview in flutter
  webview_flutter: ^3.0.0

## Code Style
  **i. Naming Convention:**

|Naming Convention|Effective Style|Example|   
|-----------------|---------------|-------|
|Classes, enum types,typedefs,and type parameters,etensions|PascalCase|An example is HomeScreen|
|Libraries, packages, directories, and source files, import prefixes|snake_case|An example is home_screen|
|Class members, top-level definitions, variables, parameters, and named parameters, constants|camelCase|An example is verifiedUser|


   
**ii. Style Rule**
   * Always declare return types in your methods.
   * Put required named parameters first.
   * Always require non-null named parameters (@required).
   * Indent your code where appropriate `(e.g Use two-space indentation.)`
       Click [Here](https://docs.google.com/document/d/1kgVwGVgKrMXKgxuMowgqsBkFXsJdli-4Zl-oP_NZFoI/edit "Github home") to know more


## Project Architecture
This project will follow a [MVVM pattern](https://www.geeksforgeeks.org/mvvm-model-view-viewmodel-architecture-pattern-in-android/) with a slight variation due to the peculiarities of the Flutter Framework. This project will follow the [Stacked MVVM Archiecture by Dane Mackier](www.filledstacks.com), for flutter. Its pattern follows the concept of MVVM architectural pattern just without [Two way binding](https://developer.android.com/topic/libraries/data-binding/two-way).




