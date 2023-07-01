import 'package:flutter/material.dart';
import 'package:flutter_test_assignment/services/fact.dart';
import 'package:flutter_test_assignment/services/hive_service.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<Fact>? savedFacts = [];

  @override
  void initState() {
    super.initState();
    _getSavedFacts();
  }

  _getSavedFacts() async {
    savedFacts = HiveService.getDisplayedFacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved facts'),
      ),
      body: Container(
        color: Colors.amber,
        height: 400,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: savedFacts?.length,
          itemBuilder: (ctx, index) {
            return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(savedFacts![index].text!),
                    const SizedBox(height: 20),
                    Text(savedFacts![index].updatedAt!),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
