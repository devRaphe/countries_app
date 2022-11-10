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
- Have a [RiverPod](www.riverpod.dev) state management implementation

## Design 
   The figma design that will be implemented for this project can be found [here](https://www.figma.com/proto/v9AXj4VZNnx26fTthrPbhX/Explore?node-id=33%3A1390&scaling=scale-down&page-id=0%3A1&starting-point-node-id=33%3A1390&show-proto-sidebar=1) 

## Hosted App Link
   [Here]() is the link to the app hosted on appetize.

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




