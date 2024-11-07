import 'package:examen/src/domain/models/Reservation.dart';
import 'package:examen/src/domain/repositroy/ReservationRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class FetchReservationDetailUseCase {
  final ReservationRepository reservationRepository;

  FetchReservationDetailUseCase(this.reservationRepository);

  Future<Resource<Reservation>> call(int reservationId) async {
    return await reservationRepository.fetchReservationDetail(reservationId);
  }
}