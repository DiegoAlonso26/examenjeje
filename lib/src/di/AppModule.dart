import 'package:examen/src/data/dataSource/service/ReservationService.dart';
import 'package:examen/src/data/repository/ReservationRepositoryImpl.dart';
import 'package:examen/src/domain/repositroy/ReservationRepository.dart';
import 'package:examen/src/domain/useCases/CreateReservationUseCase.dart';
import 'package:examen/src/domain/useCases/DeleteReservationUseCase.dart';
import 'package:examen/src/domain/useCases/FetchReservationDetailUseCase.dart';
import 'package:examen/src/domain/useCases/FetchReservationsUseCase.dart';
import 'package:examen/src/domain/useCases/UpdateReservationUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  // Inyección para ReservationService
  @injectable
  ReservationService get reservationService => ReservationService();

  // Inyección para ReservationRepository
  @injectable
  ReservationRepository get reservationRepository => ReservationRepositoryImpl(reservationService);

  // Inyección para casos de uso de Reservations
  @injectable
  FetchReservationsUseCase get fetchReservationsUseCase => FetchReservationsUseCase(reservationRepository);

  @injectable
  FetchReservationDetailUseCase get fetchReservationDetailUseCase => FetchReservationDetailUseCase(reservationRepository);

  @injectable
  CreateReservationUseCase get createReservationUseCase => CreateReservationUseCase(reservationRepository);

  @injectable
  UpdateReservationUseCase get updateReservationUseCase => UpdateReservationUseCase(reservationRepository);

  @injectable
  DeleteReservationUseCase get deleteReservationUseCase => DeleteReservationUseCase(reservationRepository);
}