import 'package:examen/src/domain/models/Reservation.dart';
import 'package:examen/src/domain/repositroy/ReservationRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class CreateReservationUseCase {
  final ReservationRepository reservationRepository;

  CreateReservationUseCase(this.reservationRepository);

  Future<Resource<Reservation>> call(Reservation reservation) async {
    return await reservationRepository.createReservation(reservation);
  }
}
