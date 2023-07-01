// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'facts_bloc.dart';

@immutable
abstract class FactsState {}

class FactsInitial extends FactsState {}

class FactsLoadingState extends FactsState {}

class FactsLoadedState extends FactsState {
  Facts facts;

  FactsLoadedState({
    required this.facts,
  });
}
