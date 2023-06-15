import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAppDemo extends StatelessWidget {
  const CupertinoAppDemo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(primaryColor: CupertinoColors.activeBlue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime selectedDate;
  Map<int, Widget> children = <int, Widget>{
    0: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text('Node Js'),
    ),
    1: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text('React Js'),
    ),
    2: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text('Flutter'),
    ),
  };
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    final ValueChanged<String> fieldValue;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.link,
        middle: Text(
          widget.title,
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              CupertinoButton(
                  padding: const EdgeInsets.all(10),
                  pressedOpacity: 0.5,
                  color: CupertinoColors.activeBlue,
                  child: const Text('Cupertino Action Sheet'),
                  onPressed: () {
                    showActionSheet(context);
                  }),
              const SizedBox(
                height: 15,
              ),

              // ElevatedButton(
              //     onPressed: () {},
              //     child: const Text('Cupertino Action Sheet')),
              SizedBox(height: 20.0),

              // LOADER
              const CupertinoActivityIndicator(
                radius: 20,
                color: Colors.pink,
                animating: true,
              ),

              SizedBox(height: 20.0),

              ///ALERT DIALOG BUTTON
              CupertinoButton(
                  child: const Text("Alert Dialog"),
                  onPressed: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text("Are you Sure?"),
                            content:
                                const Text("This action cannot be undone!"),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text("Yes"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoDialogAction(
                                child: const Text("No"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  }),
              const SizedBox(
                height: 15,
              ),

              //CONTEXT MENU
              CupertinoContextMenu(
                  actions: [
                    CupertinoContextMenuAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isDestructiveAction: true,
                      child: const Text('Delete'),
                    ),
                    const CupertinoContextMenuAction(child: Text("Share")),
                  ],
                  child: const Icon(
                    Icons.home,
                    size: 40,
                  )),

              const SizedBox(height: 20),

              ///SEGMENTED CONTROL
              CupertinoSegmentedControl<int>(
                children: children,
                onValueChanged: (value) {
                  selectedValue = value;
                  setState(() {});
                },
                selectedColor: CupertinoColors.black,
                unselectedColor: CupertinoColors.white,
                borderColor: CupertinoColors.inactiveGray,
                pressedColor: CupertinoColors.inactiveGray,
                groupValue: selectedValue,
              ),
              const SizedBox(height: 20),

              //DATE PICKER
              const SizedBox(height: 20.0),
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                child: Text('Select Date'),
                onPressed: () {
                  _selectDate(context);
                },
              ),

              ///LIST VIEW
              CupertinoListSection(
                header: const Text('My Reminders'),
                children: <CupertinoListTile>[
                  CupertinoListTile(
                      title: const Text('Item 1'),
                      leading: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: CupertinoColors.activeGreen,
                      ),
                      onTap: () {}),
                  CupertinoListTile(
                    title: const Text('Item 2'),
                    leading: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: CupertinoColors.systemRed,
                    ),
                    additionalInfo: const Text('Item 2'),
                  ),
                  CupertinoListTile(
                      title: const Text('Item 3'),
                      leading: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: CupertinoColors.activeOrange,
                      ),
                      additionalInfo: const Text('12 days ago'),
                      onTap: () {}),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void showActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Choose an Option'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('Option 1'),
              onPressed: () {
                // Handle Option 1
                Navigator.pop(context); // Close the action sheet
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Option 2'),
              onPressed: () {
                // Handle Option 2
                Navigator.pop(context); // Close the action sheet
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context); // Close the action sheet
            },
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300.0,
          child: CupertinoDatePicker(
            backgroundColor: Colors.grey,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime dateTime) {
              setState(() {
                selectedDate = dateTime;
              });
            },
          ),
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
