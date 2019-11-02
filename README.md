## Learning

1. global theme
2. widgets
    - scroll view
        - SingleChildScrollView
        - ListView
    - ListView
        - ListView() -> render all childer
        - ListView.build() -> only render children which are visible
    - SizedBox
        - can treat like div, can set height and width to be a space block
    - Stack
    - FractionallySizedBox
    - TextField
3. showDatePicker
4. Get size information
    - class: MediaQuery.of(context)
        - get device information (orientation, width, height)
    - widget: LayoutBuilder(builder: (ctx, constraints) {})
        - get widget information
5. how to set portait mode only:
    - SystemChrome.setPerferredOrientations([]) in main function
6. platform check: 
    - Platform.isIOS
7. adaptive widgets: some widgets have `adaptive` constructor to build the widget depends on different platform
8. Theme suggestion for now: using MaterialApp to set theme because CupertinoApp does not have enought flexbility to setup
9. `CupertinoButton` is similar with `FlatButton` in default
