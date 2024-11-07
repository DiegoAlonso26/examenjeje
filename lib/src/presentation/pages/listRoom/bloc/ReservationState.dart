import 'package:equatable/equatable.dart';
import 'package:examen/src/domain/models/Reservation.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object?> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationLoaded extends ReservationState {
  final List<Reservation> reservations;

  const ReservationLoaded(this.reservations);

  @override
  List<Object?> get props => [reservations];
}

class ReservationError extends ReservationState {
  final String error;

  const ReservationError(this.error);

  @override
  List<Object?> get props => [error];
}
