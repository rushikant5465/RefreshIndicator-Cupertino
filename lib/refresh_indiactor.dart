import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResfreshDemo extends StatefulWidget {
  const ResfreshDemo({super.key});

  @override
  State<ResfreshDemo> createState() => _ResfreshDemoState();
}

class _ResfreshDemoState extends State<ResfreshDemo> {
  List<String> items = ["Item 1"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Refresh Indicator Demo')),
      body: Center(
        child: RefreshIndicator(
          backgroundColor: Colors.yellow,
          color: Colors.black,
          displacement: 400,
          strokeWidth: 6,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 3));

            setState(() {
              var len = items.length;
              items.add("Item ${len + 1}");
            });
          },
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: ((context, index) =>
                  ListTile(title: Text(items[index])))),
        ),
      ),
    );
  }
}
