![Pub](https://img.shields.io/pub/v/env_banner.svg?style=popout)

# env_banner

EnvBanner is a decorative wrapper that displays a small text in the corner of a widget. It is designed to be used as an aid in the development stages, to show the environment in which the application is running and also to show the version or build number.

It is also designed to be used as a decoration on widgets within the application.

![demonstration](https://raw.githubusercontent.com/melvinsalas/env_banner/main/demonstration.jpeg)

## Getting Started
Using the env banner is quite intuitive and simple. Below is a quick example of how to use it!

#### In your main.dart when creating the app
```dart
import 'package:env_banner/env_banner.dart';
...
class MainApp extends StatelessWidget {
  ...
  @override
  Widget build(BuildContext context) {
    ...
    return MaterialApp(
        ...
        home: EnvBanner(
          primary: 'DEV',
          secondary: '1.0.0',
          child: Scaffold(...),
        ),
    );
  }
}
```

## Planned improvements
If this package gets any traction, I plan to add support for images, custom widgets, animation... etc. If you have any ideas for making this package more applicable, just open an issue!