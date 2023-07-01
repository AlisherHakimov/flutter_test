import 'package:bloc/bloc.dart';
import 'package:flutter_test_assignment/api/api_helper.dart';
import 'package:flutter_test_assignment/model/facts_model.dart';
import 'package:flutter_test_assignment/services/fact.dart';
import 'package:flutter_test_assignment/services/hive_service.dart';
import 'package:meta/meta.dart';

part 'facts_event.dart';
part 'facts_state.dart';

class FactsBloc extends Bloc<FactsEvent, FactsState> {
  FactsBloc() : super(FactsInitial()) {
    on<FactsLoadEvent>((event, emit) async {
      emit(FactsLoadingState());

      Facts facts = await ApiHelper.getClient().getFacts();

      emit(FactsLoadedState(facts: facts));

      HiveService.saveDisplayedFacts(
          Fact(text: facts.text, updatedAt: facts.updatedAt));
    });
  }
}
