import 'package:examen/src/data/dataSource/service/ReservationService.dart';
import 'package:examen/src/domain/useCases/FetchReservationsUseCase.dart';
import 'package:examen/src/presentation/pages/listRoom/bloc/ReservationBloc.dart';
import 'package:examen/src/presentation/pages/listRoom/bloc/ReservationEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen/injection.dart'; // Importa el archivo de configuración de inyección

List<BlocProvider> blocProviders = [
  BlocProvider<ReservationBloc>(
    create: (context) => ReservationBloc(
      locator<FetchReservationsUseCase>(),
      locator<ReservationService>(),
    )..add(FetchReservations()), // Agregar el evento de carga de reservas
  ),
  // Otros BlocProviders si los necesitas
];
