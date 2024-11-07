import 'package:examen/src/data/dataSource/service/ReservationService.dart';
import 'package:examen/src/domain/models/Reservation.dart';
import 'package:examen/src/domain/repositroy/ReservationRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationService reservationService;

  ReservationRepositoryImpl(this.reservationService);

  // Implementación del método para obtener la lista de reservas
  @override
  Future<Resource<List<Reservation>>> fetchReservations() {
    return reservationService.fetchReservations();  // Llama al método de ReservationService para hacer la solicitud GET
  }

  // Implementación del método para obtener los detalles de una reserva específica
  @override
  Future<Resource<Reservation>> fetchReservationDetail(int reservationId) {
    return reservationService.fetchReservationDetail(reservationId); // Llama al método de ReservationService para obtener el detalle de la reserva
  }

  // Implementación del método para crear una nueva reserva
  @override
  Future<Resource<Reservation>> createReservation(Reservation reservation) {
    return reservationService.createReservation(reservation); // Llama al método de ReservationService para crear la reserva
  }

  // Implementación del método para actualizar una reserva existente
  @override
  Future<Resource<Reservation>> updateReservation(int reservationId, Reservation reservation) {
    return reservationService.updateReservation(reservationId, reservation); // Llama al método de ReservationService para actualizar la reserva
  }

  // Implementación del método para eliminar una reserva
  @override
  Future<Resource<bool>> deleteReservation(int reservationId) {
    return reservationService.deleteReservation(reservationId); // Llama al método de ReservationService para eliminar la reserva
  }
}