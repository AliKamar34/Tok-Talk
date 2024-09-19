part of 'requests_cubit.dart';

sealed class RequestsState extends Equatable {
  const RequestsState();

  @override
  List<Object> get props => [];
}

final class RequestsInitial extends RequestsState {}


final class RequesLoading extends RequestsState {}
final class RequestsSuccess extends RequestsState {
  final List<PersonModel> requests;

  const RequestsSuccess({required this.requests});

     @override
  List<Object> get props => [requests];

}

final class RequestsFailuer extends RequestsState {
  final String errMessage;

 const RequestsFailuer({required this.errMessage});

   
}