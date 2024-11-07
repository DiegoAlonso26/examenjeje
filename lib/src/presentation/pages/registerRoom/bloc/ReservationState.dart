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

class ReservationSuccess extends ReservationState {
  final Reservation reservation;

  const ReservationSuccess(this.reservation);

  @override
  List<Object?> get props => [reservation];
}

class ReservationUpdatedSuccess extends ReservationState {
  final Reservation reservation;

  const ReservationUpdatedSuccess(this.reservation);

  @override
  List<Object?> get props => [reservation];
}

class ReservationFailure extends ReservationState {
  final String error;

  const ReservationFailure(this.error);

  @override
  List<Object?> get props => [error];
}
