
import 'package:examen/src/domain/repositroy/ReservationRepository.dart';
import 'package:examen/src/domain/utils/Resource.dart';

class DeleteReservationUseCase {
  final ReservationRepository reservationRepository;

  DeleteReservationUseCase(this.reservationRepository);

  Future<Resource<bool>> call(int reservationId) async {
    return await reservationRepository.deleteReservation(reservationId);
  }
}
