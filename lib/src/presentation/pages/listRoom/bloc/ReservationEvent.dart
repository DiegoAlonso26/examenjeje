import 'package:equatable/equatable.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object?> get props => [];
}

class FetchReservations extends ReservationEvent {
  const FetchReservations();
}
class DeleteReservationEvent extends ReservationEvent {
  final int reservationId;

  const DeleteReservationEvent(this.reservationId);
}
