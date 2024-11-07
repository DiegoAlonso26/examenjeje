
import 'package:examen/src/domain/models/Reservation.dart';
import 'package:examen/src/domain/repositroy/ReservationRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class UpdateReservationUseCase {
  final ReservationRepository reservationRepository;

  UpdateReservationUseCase(this.reservationRepository);

  Future<Resource<Reservation>> call(int reservationId, Reservation reservation) async {
    return await reservationRepository.updateReservation(reservationId, reservation);
  }
}
