part of 'cabs_bloc.dart';

@immutable
abstract class CabsEvent {}

class StartScrape extends CabsEvent {}

class SetToBloc extends CabsEvent {}

class UberDataScraped extends CabsEvent {
  UberDataScraped(String trim);
}

class OlaDataScraped extends CabsEvent {
  OlaDataScraped(String trim);
}
