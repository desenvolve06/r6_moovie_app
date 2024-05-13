import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SeriesEvent extends Equatable {
  const SeriesEvent();
  @override
  List<Object> get props => [];
}

class LoadingSeriesSuccessEvent extends SeriesEvent {
}
class NetworkSeriesErrorEvent extends Error {}