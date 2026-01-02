# 101 Flutter Commands

## Overview
Flutter is Google's open-source UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase using Dart. This cheat sheet covers essential widgets, state management, navigation, layout patterns, and development commands for creating beautiful, performant GUIs. Master these widgets and patterns to build responsive, cross-platform apps efficiently.

## Target Audience
- Mobile developers building cross-platform apps
- Dart programmers creating modern UIs
- Web/desktop engineers targeting multiple platforms
- UI designers using Flutter's widget system
- Anyone building beautiful native interfaces

## Command Categories

### 1. App Entry & Material Design (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| runApp | Starts the app with root widget | Main entry | runApp(MyApp()) |
| MaterialApp | Material design app wrapper | Root widget | MaterialApp(home: Scaffold(...)) |
| CupertinoApp | iOS-style app wrapper | iOS look | CupertinoApp(home: CupertinoPageScaffold(...)) |
| ThemeData | Defines app theme | Custom styles | ThemeData(primarySwatch: Colors.blue) |
| debugShowCheckedModeBanner | Hides debug banner | Clean UI | MaterialApp(debugShowCheckedModeBanner: false) |
| Scaffold | Basic app structure | Layout base | Scaffold(appBar: AppBar(...), body: ...) |
| AppBar | Top app bar | Navigation | AppBar(title: Text('My App')) |
| FloatingActionButton | Primary action button | Actions | FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)) |
| BottomNavigationBar | Bottom nav bar | Tab switching | BottomNavigationBar(items: [...]) |
| Drawer | Side navigation drawer | Menu | Drawer(child: ListView(...)) |

### 2. Layout Widgets (12)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Container | Versatile box widget | Styling | Container(color: Colors.blue, child: Text('Box')) |
| Row | Horizontal arrangement | Columns | Row(children: [Text('Left'), Text('Right')]) |
| Column | Vertical arrangement | Stacks | Column(children: [Text('Top'), Text('Bottom')]) |
| Stack | Overlapping widgets | Layers | Stack(children: [Image(...), Positioned(...)]) |
| Expanded | Fills available space | Flexible | Row(children: [Expanded(child: Text('Fills space'))]) |
| Flexible | Flexible sizing | Proportions | Row(children: [Flexible(flex: 2, child: ...), Flexible(flex: 1, child: ...)]) |
| Padding | Adds spacing | Margins | Padding(padding: EdgeInsets.all(16), child: ...) |
| SizedBox | Fixed size box | Spacing | SizedBox(width: 20, height: 20) |
| Align | Aligns child | Positioning | Align(alignment: Alignment.center, child: ...) |
| Center | Centers child | Centering | Center(child: Text('Centered')) |
| GridView | Grid layout | Galleries | GridView.count(crossAxisCount: 2, children: [...]) |
| ListView | Scrollable list | Feeds | ListView(children: [ListTile(...), ...]) |

### 3. Text & Display Widgets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Text | Displays text | Labels | Text('Hello Flutter', style: TextStyle(fontSize: 24)) |
| RichText | Styled text spans | Formatted | RichText(text: TextSpan(children: [TextSpan(text: 'Bold', style: TextStyle(fontWeight: FontWeight.bold))])) |
| Icon | Material icons | Icons | Icon(Icons.star, color: Colors.yellow) |
| Image | Displays images | Photos | Image.asset('assets/image.png') |
| Image.network | Loads network image | Online | Image.network('https://example.com/img.jpg') |
| Card | Material card | Content | Card(child: ListTile(title: Text('Card'))) |
| ListTile | Row with icon/text | Items | ListTile(leading: Icon(Icons.person), title: Text('User')) |
| Divider | Horizontal line | Separators | Divider(height: 2, color: Colors.grey) |
| Chip | Compact elements | Tags | Chip(label: Text('Tag')) |
| CircleAvatar | Circular image | Profiles | CircleAvatar(radius: 30, backgroundImage: NetworkImage('...')) |

### 4. Input & Form Widgets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| TextField | Text input field | Forms | TextField(decoration: InputDecoration(labelText: 'Name')) |
| TextFormField | Form-validated field | Validation | TextFormField(validator: (value) => value.isEmpty ? 'Required' : null) |
| Form | Groups fields | Validation | Form(key: _formKey, child: Column(children: [...])) |
| ElevatedButton | Material button | Actions | ElevatedButton(onPressed: () {}, child: Text('Submit')) |
| OutlinedButton | Outline button | Secondary | OutlinedButton(onPressed: () {}, child: Text('Cancel')) |
| TextButton | Text button | Links | TextButton(onPressed: () {}, child: Text('Forgot password?')) |
| Checkbox | Toggle option | Checks | Checkbox(value: _checked, onChanged: (bool? value) {...}) |
| Switch | On/off toggle | Settings | Switch(value: _enabled, onChanged: (bool value) {...}) |
| Radio | Single selection | Groups | Radio(value: 1, groupValue: _selected, onChanged: ...) |
| Slider | Value selector | Ranges | Slider(value: _value, min: 0, max: 100, onChanged: ...) |

### 5. Navigation & Routing (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Navigator.push | Navigate to new screen | Forward | Navigator.push(context, MaterialPageRoute(builder: (_) => SecondScreen())) |
| Navigator.pop | Go back | Back | Navigator.pop(context) |
| Navigator.pushNamed | Named route | Navigation | Navigator.pushNamed(context, '/second') |
| MaterialPageRoute | Material transition | Route | MaterialPageRoute(builder: (_) => Screen()) |
| Navigator.popUntil | Pop multiple | Clean stack | Navigator.popUntil(context, ModalRoute.withName('/home')) |
| Navigator.pushReplacement | Replace current | No back | Navigator.pushReplacementNamed(context, '/home') |
| Navigator.of | Get navigator | Context | Navigator.of(context).push(...) |
| WillPopScope | Handle back button | Confirm | WillPopScope(onWillPop: () async => false, child: ...) |
| Hero | Shared element transition | Animations | Hero(tag: 'image', child: Image.asset('...')) |
| ModalRoute | Base route class | Custom | ModalRoute.of(context) |

### 6. State Management Basics (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| StatefulWidget | Mutable state widget | Dynamic UI | class MyWidget extends StatefulWidget {} |
| setState | Update state | Rebuild | setState(() { _count++; }) |
| ValueNotifier | Simple value change | Notifications | ValueNotifier<int> _count = ValueNotifier(0) |
| ValueListenableBuilder | Listen to value | Rebuild | ValueListenableBuilder(valueListenable: _count, builder: ...) |
| InheritedWidget | Share data down tree | Provider-like | class MyInherited extends InheritedWidget {} |
| ChangeNotifier | Observable model | Provider | class Counter extends ChangeNotifier {} |
| Provider | State management package | Simple | Provider.of<Counter>(context).increment() |
| Consumer | Rebuild on change | Scoped | Consumer<Counter>(builder: (context, counter, child) => ...) |
| FutureBuilder | Async data | Loading | FutureBuilder(future: fetchData(), builder: ...) |
| StreamBuilder | Stream data | Real-time | StreamBuilder(stream: myStream, builder: ...) |

### 7. List & Grid Widgets (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| ListView.builder | Efficient list | Long lists | ListView.builder(itemCount: 100, itemBuilder: (context, index) => ...) |
| GridView.builder | Efficient grid | Galleries | GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), ...) |
| ListTile | List item row | Items | ListTile(title: Text('Item $index')) |
| ExpansionTile | Expandable list | Sections | ExpansionTile(title: Text('Section'), children: [...]) |
| ReorderableListView | Draggable reorder | Sorting | ReorderableListView(onReorder: ..., children: [...]) |
| SingleChildScrollView | Scroll single child | Long content | SingleChildScrollView(child: Column(...)) |
| RefreshIndicator | Pull-to-refresh | Data | RefreshIndicator(onRefresh: () async {...}, child: ListView(...)) |
| SliverAppBar | Collapsible app bar | Scrolling | SliverAppBar(expandedHeight: 200, flexibleSpace: ...) |
| SliverList | Sliver list | Custom scroll | CustomScrollView(slivers: [SliverList(...)]) |
| SliverGrid | Sliver grid | Custom | SliverGrid(...) |

### 8. Dialogs & Bottom Sheets (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| showDialog | Show modal dialog | Alerts | showDialog(context: context, builder: (_) => AlertDialog(...)) |
| AlertDialog | Simple alert | Messages | AlertDialog(title: Text('Title'), content: Text('Message')) |
| showModalBottomSheet | Bottom sheet | Options | showModalBottomSheet(context: context, builder: (_) => ...) |
| BottomSheet | Persistent sheet | Info | BottomSheet(...) |
| SnackBar | Temporary message | Feedback | ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved'))) |
| showDatePicker | Date selection | Forms | showDatePicker(context: context, initialDate: DateTime.now(), ...) |
| showTimePicker | Time selection | Forms | showTimePicker(context: context, initialTime: TimeOfDay.now()) |
| SimpleDialog | Choice dialog | Options | SimpleDialog(title: Text('Choose'), children: [...]) |

### 9. Animation & Motion (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| AnimatedContainer | Animated changes | Transitions | AnimatedContainer(duration: Duration(seconds: 1), color: _color, ...) |
| AnimatedOpacity | Fade animation | Visibility | AnimatedOpacity(opacity: _visible ? 1.0 : 0.0, duration: ...) |
| AnimatedPositioned | Position animation | Movement | AnimatedPositioned(left: _left, duration: ...) |
| AnimatedBuilder | Custom animation | Complex | AnimatedBuilder(animation: _animation, builder: ...) |
| TweenAnimationBuilder | Tween-based | Custom | TweenAnimationBuilder(tween: Tween(begin: 0.0, end: 1.0), ...) |
| Hero | Shared element | Transitions | Hero(tag: 'hero', child: Image(...)) |
| FadeTransition | Fade | Effects | FadeTransition(opacity: _animation, child: ...) |
| ScaleTransition | Scale | Effects | ScaleTransition(scale: _animation, child: ...) |
| RotationTransition | Rotate | Effects | RotationTransition(turns: _animation, child: ...) |
| AnimationController | Control animations | Custom | AnimationController(vsync: this, duration: Duration(seconds: 1)) |

### 10. Gesture & Interaction (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| GestureDetector | Detect gestures | Touches | GestureDetector(onTap: () {}, child: Container(...)) |
| InkWell | Ripple effect | Material | InkWell(onTap: () {}, child: Container(...)) |
| Dismissible | Swipe to dismiss | Lists | Dismissible(key: Key('item'), onDismissed: ..., child: ListTile(...)) |
| Draggable | Drag widget | Drag-drop | Draggable(data: 'data', child: ..., feedback: ...) |
| DragTarget | Drop target | Drag-drop | DragTarget(onAccept: ..., builder: ...) |
| LongPressDraggable | Long press drag | Advanced | LongPressDraggable(...) |
| Listener | Raw pointer events | Custom | Listener(onPointerDown: ..., child: ...) |
| AbsorbPointer | Block events | Disable | AbsorbPointer(absorbing: true, child: ...) |

### 11. Assets & Resources (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| AssetImage | Load asset image | Icons | Image(image: AssetImage('assets/logo.png')) |
| NetworkImage | Load network image | Online | Image(image: NetworkImage('https://...')) |
| pubspec.yaml | Declare assets | Config | flutter: assets: - assets/images/ |
| rootBundle | Load file | JSON | rootBundle.loadString('assets/data.json') |
| precacheImage | Preload image | Performance | precacheImage(AssetImage('...'), context) |
| AssetBundle | Load assets | Custom | AssetBundle.load(...) |
| DefaultAssetBundle | Access bundle | Context | DefaultAssetBundle.of(context).loadString(...) |
| Font loading | Custom fonts | Text | flutter: fonts: - family: MyFont family: MyFont fonts: - asset: fonts/MyFont.ttf |

### 12. Responsive & Adaptive (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| MediaQuery | Device info | Size | MediaQuery.of(context).size |
| LayoutBuilder | Constraints | Responsive | LayoutBuilder(builder: (context, constraints) => ...) |
| OrientationBuilder | Orientation | Landscape | OrientationBuilder(builder: (context, orientation) => ...) |
| ResponsiveBuilder | Package | Breakpoints | ResponsiveBuilder(builder: (context, sizingInfo) => ...) |
| FractionallySizedBox | Relative size | Portions | FractionallySizedBox(widthFactor: 0.5, child: ...) |
| AspectRatio | Maintain ratio | Images | AspectRatio(aspectRatio: 16/9, child: ...) |
| Flexible | Flexible space | Proportions | Flexible(flex: 2, child: ...) |
| SafeArea | Avoid notches | Devices | SafeArea(child: Scaffold(...)) |

### 13. Forms & Validation (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| GlobalKey<FormState> | Form key | Validate | final _formKey = GlobalKey<FormState>() |
| validator | Field validation | Rules | validator: (value) => value.isEmpty ? 'Required' : null |
| onSaved | Save value | Submit | onSaved: (value) => _name = value |
| autovalidateMode | Auto validate | Forms | autovalidateMode: AutovalidateMode.onUserInteraction |
| TextEditingController | Control text | Input | TextEditingController(text: 'Initial') |
| FocusNode | Focus control | Navigation | FocusNode() |
| onFieldSubmitted | Submit action | Enter | onFieldSubmitted: (_) => _focusNext() |
| FormField | Custom field | Advanced | FormField(builder: ...) |

### 14. Miscellaneous Utilities (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| FutureBuilder | Async future | Loading | FutureBuilder(future: fetch(), builder: ...) |
| StreamBuilder | Async stream | Real-time | StreamBuilder(stream: myStream, builder: ...) |
| Visibility | Show/hide | Toggle | Visibility(visible: _show, child: ...) |
| Opacity | Transparency | Effects | Opacity(opacity: 0.5, child: ...) |
| IgnorePointer | Ignore events | Disable | IgnorePointer(ignoring: true, child: ...) |
| RepaintBoundary | Optimize repaint | Performance | RepaintBoundary(child: ...) |
| NotificationListener | Listen notifications | Scroll | NotificationListener<ScrollNotification>(...) |
| Builder | Build context | Scope | Builder(builder: (context) => ...) |
| DefaultTextStyle | Text defaults | Theme | DefaultTextStyle(style: ..., child: ...) |
| MediaQuery.removePadding | Remove padding | Clean | MediaQuery.removePadding(removeTop: true, ...) |

### 15. Development Commands (CLI) (10)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| flutter create | Create new project | Start | flutter create my_app |
| flutter run | Run app | Development | flutter run |
| flutter pub get | Get dependencies | Install | flutter pub get |
| flutter pub add | Add package | Dependencies | flutter pub add provider |
| flutter doctor | Check setup | Diagnose | flutter doctor |
| flutter build apk | Build Android APK | Release | flutter build apk --release |
| flutter build ios | Build iOS | Release | flutter build ios |
| flutter clean | Clean build | Reset | flutter clean |
| flutter test | Run tests | Testing | flutter test |
| flutter analyze | Static analysis | Code quality | flutter analyze |

### 16. Performance & Debugging (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| const constructor | Immutable widgets | Performance | const Text('Constant') |
| const | Const literals | Optimization | const EdgeInsets.all(16) |
| Flutter DevTools | Profiling tools | Debug | flutter pub global activate devtools |
| Inspector | Widget tree | Inspect | Enable in DevTools |
| Performance overlay | FPS display | Monitor | showPerformanceOverlay: true |
| const ListView | Avoid rebuilds | Lists | ListView(children: const [...]) |
| RepaintBoundary | Isolate repaints | Optimize | RepaintBoundary(child: ...) |
| debugPaintSizeEnabled | Show borders | Layout | debugPaintSizeEnabled = true |

### 17. Accessibility & Internationalization (8)
| Command | Description | Common Usage | Examples |
| --- | --- | --- | --- |
| Semantics | Accessibility info | Screen readers | Semantics(label: 'Button', child: ...) |
| MergeSemantics | Merge semantics | Groups | MergeSemantics(child: ...) |
| excludeFromSemantics | Hide from readers | Decorative | excludeFromSemantics: true |
| Flutter Intl | Localization | Translations | flutter pub add intl |
| Localizations.delegate | Intl delegates | Setup | Localizations.delegate: GlobalMaterialLocalizations.delegate |
| supportedLocales | Languages | Config | supportedLocales: [Locale('en'), Locale('es')] |
| Text('key', style: ...) | Translated text | i18n | Text(AppLocalizations.of(context)!.helloWorld) |
| MediaQuery.textScaleFactor | Text scaling | Accessibility | MediaQuery.textScaleFactorOf(context) |

## Tips and Best Practices
* Always use const constructors for immutable widgets to improve performance.
* Prefer StatelessWidget when possible; only use StatefulWidget when state is needed.
* Break down complex UIs into small, reusable widgets.
* Use const for literals like EdgeInsets, TextStyle, and lists.
* Leverage hot reload for rapid UI iteration.
* Keep widget trees shallow to reduce rebuild costs.
* Use ListView.builder and GridView.builder for long lists.
* Implement proper form validation with Form and validators.
* Follow Material Design guidelines for consistent look.
* Use MediaQuery for responsive layouts.
* Add accessibility labels and semantics early.
* Profile performance with DevTools regularly.
* Organize code with separate files for each screen/widget.
* Use named routes or go_router for complex navigation.
* Keep pubspec.yaml clean and dependencies minimal.
* Test UI with widget tests and integration tests.
* Use Provider or Riverpod for simple state management.
* Handle platform differences with Platform widgets.
* Internationalize from the start with flutter_localizations.

## Additional Resources
* [Official Flutter Documentation](https://docs.flutter.dev/)
* [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
* [Flutter Cookbook](https://docs.flutter.dev/cookbook)
* [Flutter Samples on GitHub](https://github.com/flutter/samples)
* [Flutter DevTools](https://docs.flutter.dev/tools/devtools)
* [Flutter Codelabs](https://codelabs.developers.google.com/?product=flutter)
* [Flutter for Android Developers](https://docs.flutter.dev/get-started/flutter-for/android-devs)
* [Flutter Community](https://flutter.dev/community)
* [pub.dev Package Repository](https://pub.dev/)

## Mini-Glossary
This section defines key Flutter terms and concepts.

### 1. Core Concepts
| Term/Concept | Description |
| --- | --- |
| Widget | Basic building block of UI; everything is a widget |
| StatelessWidget | Immutable widget; no internal state |
| StatefulWidget | Mutable widget with state |
| Build Method | Returns widget tree description |
| Hot Reload | Instant UI updates without restart |
| Widget Tree | Hierarchy of widgets composing UI |
| Element | Internal representation of widget |
| RenderObject | Handles layout, painting, hit-testing |
| InheritedWidget | Passes data down widget tree |
| Key | Identifies widgets across rebuilds |

### 2. Layout Types
| Term/Concept | Description |
| --- | --- |
| Row | Horizontal linear layout |
| Column | Vertical linear layout |
| Stack | Overlapping children |
| Container | Box with styling |
| Expanded | Takes available space |
| Flexible | Flexible space allocation |
| GridView | 2D scrollable grid |
| ListView | 1D scrollable list |
| Padding | Adds space around child |
| Align | Positions child within parent |

### 3. Material Design
| Term/Concept | Description |
| --- | --- |
| MaterialApp | Root widget for Material Design |
| Scaffold | App structure (appBar, body, FAB) |
| AppBar | Top navigation bar |
| FloatingActionButton | Primary action button |
| Card | Elevated content container |
| ElevatedButton | Filled button |
| TextButton | Flat text button |
| ThemeData | App-wide styling |
| primarySwatch | Color theme base |
| darkTheme | Dark mode support |

### 4. State Management
| Term/Concept | Description |
| --- | --- |
| setState | Rebuilds widget with new state |
| Provider | Simple dependency injection |
| ChangeNotifier | Observable model |
| Riverpod | Modern provider alternative |
| BLoC | Business logic component pattern |
| InheritedWidget | Built-in data sharing |
| ValueNotifier | Simple value change |
| FutureBuilder | Handles async futures |
| StreamBuilder | Handles async streams |
| GlobalKey | Access widget state globally |

### 5. Navigation
| Term/Concept | Description |
| --- | --- |
| Navigator | Manages route stack |
| push | Add new route |
| pop | Remove current route |
| MaterialPageRoute | Material transition route |
| Named Routes | Route by name string |
| go_router | Advanced routing package |
| Hero | Shared element animation |
| WillPopScope | Handle back button |
| ModalRoute | Base route class |
| pushReplacement | Replace current route |

### 6. Animation
| Term/Concept | Description |
| --- | --- |
| AnimationController | Controls animation |
| Tween | Value interpolation |
| CurvedAnimation | Easing curves |
| AnimatedBuilder | Custom animation |
| AnimatedContainer | Implicit animation |
| Hero | Shared element transition |
| Implicit Animations | Built-in animation widgets |
| Explicit Animations | Controller-based |
| Ticker | Animation frame callback |
| vsync | Ticker provider |

### 7. Assets & Resources
| Term/Concept | Description |
| --- | --- |
| pubspec.yaml | Project configuration |
| assets | Declare image/font files |
| AssetImage | Load bundled image |
| NetworkImage | Load remote image |
| rootBundle | Load file as string |
| precacheImage | Preload images |
| Font family | Custom fonts |
| flutter: fonts | Declare custom fonts |
| flutter: assets | Declare assets |
| flutter: uses-material-design | Enable Material icons |

### 8. Performance
| Term/Concept | Description |
| --- | --- |
| const | Compile-time constant |
| const constructor | Immutable widget |
| RepaintBoundary | Isolate repaints |
| const List | Avoid rebuilds |
| DevTools | Performance profiling |
| Flutter Inspector | Widget tree inspection |
| Hot Restart | Full app restart |
| Build Modes | Debug vs release |
| Skia | Rendering engine |
| Impeller | New rendering engine |

### 9. Accessibility
| Term/Concept | Description |
| --- | --- |
| Semantics | Accessibility metadata |
| screenReader | VoiceOver/TalkBack |
| MergeSemantics | Combine semantics |
| excludeFromSemantics | Hide decorative elements |
| textScaleFactor | Accessibility text size |
| highContrast | High contrast mode |
| MediaQuery | Device accessibility info |
| SemanticsProperties | Label, value, hint |
| FocusNode | Keyboard focus |
| SemanticsDebugger | Debug accessibility |

### 10. Development Tools
| Term/Concept | Description |
| --- | --- |
| flutter doctor | Setup diagnostics |
| flutter run | Run app |
| flutter pub get | Install dependencies |
| flutter build | Build release |
| hot reload | Instant UI update |
| DevTools | Debugging suite |
| Widget Inspector | Tree visualization |
| Performance View | FPS profiling |
| Network Inspector | API calls |
| Memory View | Memory usage |
