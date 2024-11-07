import 'package:examen/src/domain/models/Reservation.dart';
import 'package:examen/src/domain/utils/Resource.dart';

abstract class ReservationRepository {
  // Método para obtener la lista de reservas
  Future<Resource<List<Reservation>>> fetchReservations();

  // Método para obtener los detalles de una reserva específica
  Future<Resource<Reservation>> fetchReservationDetail(int reservationId);

  // Método para crear una nueva reserva
  Future<Resource<Reservation>> createReservation(Reservation reservation);

  // Método para actualizar una reserva existente
  Future<Resource<Reservation>> updateReservation(int reservationId, Reservation reservation);

  // Método para eliminar una reserva
  Future<Resource<bool>> deleteReservation(int reservationId);
}
