import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_assignment/bloc/facts_bloc.dart';
import 'package:flutter_test_assignment/ui/saved_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FactsBloc factsBloc = FactsBloc();
  String imageUrl = 'https://cataas.com/cat';
  @override
  void initState() {
    factsBloc.add(FactsLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facts About Cat'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 500,
                  child: BlocBuilder<FactsBloc, FactsState>(
                    bloc: factsBloc,
                    builder: (context, state) {
                      if (state is FactsLoadedState) {
                        return Column(
                          children: [
                            Image.network(
                              imageUrl,
                              height: 300,
                              width: 300,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 20),
                            Text(state.facts.text!),
                            const SizedBox(height: 20),
                            Text(state.facts.updatedAt!),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    factsBloc.add(FactsLoadEvent());
                  },
                  child: const Text('Another fact!'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SavedPage()),
                    );
                  },
                  child: const Text('Fact history'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
