part of 'cabs_bloc.dart';

@immutable
abstract class CabsState extends Equatable {}

class CabsInitial extends CabsState {
  @override
  List<Object?> get props => [];
}

class CabScrapeInProcess extends CabsState {
  @override
  List<Object?> get props => ["Scraping in process"];
}

class CabDataFetched extends CabsState {
  var priceList;
  CabDataFetched({this.priceList});

  @override
  List<Object?> get props => [priceList];
}
