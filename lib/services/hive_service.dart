// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_test_assignment/services/fact.dart';
import 'package:hive/hive.dart';

class HiveService {
  static late Box _userSettingsBox;

  static Future<void> init() async {
    _userSettingsBox = await Hive.openBox<Fact>('userSettings');
  }

  static Future<bool> saveDisplayedFacts(Fact fact) async {
    List<Fact> displayedFacts = getDisplayedFacts() ?? [];

    displayedFacts.add(fact);

    await _userSettingsBox.put('displayed_facts', displayedFacts);
    return true;
  }

  static List<Fact>? getDisplayedFacts() {
    final List<Fact> displayedFacts =
        _userSettingsBox.get('displayed_facts') as List<Fact>;
    return displayedFacts;
  }
}
