import 'package:equatable/equatable.dart';
import 'package:examen/src/domain/models/Reservation.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object?> get props => [];
}

class CreateReservationEvent extends ReservationEvent {
  final Reservation reservation;

  const CreateReservationEvent(this.reservation);

  @override
  List<Object?> get props => [reservation];
}

class UpdateReservationEvent extends ReservationEvent {
  final Reservation reservation;

  const UpdateReservationEvent(this.reservation);

  @override
  List<Object?> get props => [reservation];
}

class FetchReservations extends ReservationEvent {
  const FetchReservations();
}
