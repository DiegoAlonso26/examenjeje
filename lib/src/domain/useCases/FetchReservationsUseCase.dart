import 'package:examen/src/domain/models/Reservation.dart';
import 'package:examen/src/domain/repositroy/ReservationRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class FetchReservationsUseCase {
  final ReservationRepository reservationRepository;

  FetchReservationsUseCase(this.reservationRepository);

  Future<Resource<List<Reservation>>> call() async {
    return await reservationRepository.fetchReservations();
  }
}
