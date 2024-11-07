
import 'package:examen/src/data/dataSource/service/ReservationService.dart';
import 'package:examen/src/domain/models/Reservation.dart';
import 'package:examen/src/domain/useCases/FetchReservationsUseCase.dart';
import 'package:examen/src/domain/utils/Resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ReservationEvent.dart';
import 'ReservationState.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final FetchReservationsUseCase fetchReservationsUseCase;
  final ReservationService reservationService;

  ReservationBloc(this.fetchReservationsUseCase, this.reservationService)
      : super(ReservationInitial()) {
    on<FetchReservations>(_onFetchReservations);
    on<DeleteReservationEvent>(_onDeleteReservation);
  }

  // Maneja el evento FetchReservations
  Future<void> _onFetchReservations(
      FetchReservations event, Emitter<ReservationState> emit) async {
    emit(ReservationLoading());
    final response = await fetchReservationsUseCase.call();

    if (response is Success<List<Reservation>>) {
      emit(ReservationLoaded(response.data));
    } else if (response is Error<List<Reservation>>) {
      emit(ReservationError(response.message));
    }
  }

  // Maneja el evento DeleteReservationEvent
  Future<void> _onDeleteReservation(
      DeleteReservationEvent event, Emitter<ReservationState> emit) async {
    emit(ReservationLoading());
    final response = await reservationService.deleteReservation(event.reservationId);

    if (response is Success<bool> && response.data == true) {
      // Si la eliminación fue exitosa, recargamos las reservas
      add(FetchReservations());
    } else if (response is Error<bool>) {
      final errorResponse = response as Error<bool>;
      emit(ReservationError(errorResponse.message));
    }
  }
}

