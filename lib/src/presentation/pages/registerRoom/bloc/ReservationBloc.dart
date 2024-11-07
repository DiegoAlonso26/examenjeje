import 'package:bloc/bloc.dart';
import 'package:examen/src/domain/models/Reservation.dart';
import 'package:examen/src/data/dataSource/service/ReservationService.dart';
import 'package:examen/src/domain/utils/Resource.dart';
import 'ReservationEvent.dart';
import 'ReservationState.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final ReservationService reservationService;

  ReservationBloc(this.reservationService) : super(ReservationInitial()) {
    on<CreateReservationEvent>(_onCreateReservation);
    on<UpdateReservationEvent>(_onUpdateReservation);
    on<FetchReservations>(_onFetchReservations);
  }

  Future<void> _onCreateReservation(
      CreateReservationEvent event, Emitter<ReservationState> emit) async {
    emit(ReservationLoading());

    final response = await reservationService.createReservation(event.reservation);

    if (response is Success<Reservation>) {
      final reservationData = response.data;
      emit(ReservationSuccess(reservationData));
    } else if (response is Error<Reservation>) {
      final errorMessage = response.message;
      emit(ReservationFailure(errorMessage));
    }
  }

  Future<void> _onUpdateReservation(
      UpdateReservationEvent event, Emitter<ReservationState> emit) async {
    emit(ReservationLoading());

    final response = await reservationService.updateReservation(event.reservation.id!, event.reservation);

    if (response is Success<Reservation>) {
      final updatedReservation = response.data;
      emit(ReservationUpdatedSuccess(updatedReservation));
    } else if (response is Error<Reservation>) {
      final errorMessage = response.message;
      emit(ReservationFailure(errorMessage));
    }
  }

  Future<void> _onFetchReservations(
      FetchReservations event, Emitter<ReservationState> emit) async {
    emit(ReservationLoading());

    final response = await reservationService.fetchReservations();

    if (response is Success<List<Reservation>>) {
      emit(ReservationLoaded(response.data));
    } else if (response is Error<List<Reservation>>) {
      emit(ReservationFailure(response.message));
    }
  }
}
