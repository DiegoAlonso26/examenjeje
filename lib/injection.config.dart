// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:examen/src/data/dataSource/service/ReservationService.dart'
    as _i493;
import 'package:examen/src/di/AppModule.dart' as _i604;
import 'package:examen/src/domain/repositroy/ReservationRepository.dart'
    as _i498;
import 'package:examen/src/domain/useCases/UpdateReservationUseCase.dart'
    as _i294;
import 'package:examen/src/domain/useCases/CreateReservationUseCase.dart'
    as _i1001;
import 'package:examen/src/domain/useCases/DeleteReservationUseCase.dart'
    as _i443;
import 'package:examen/src/domain/useCases/FetchReservationDetailUseCase.dart'
    as _i1072;
import 'package:examen/src/domain/useCases/FetchReservationsUseCase.dart'
    as _i82;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i493.ReservationService>(() => appModule.reservationService);
    gh.factory<_i498.ReservationRepository>(
        () => appModule.reservationRepository);
    gh.factory<_i82.FetchReservationsUseCase>(
        () => appModule.fetchReservationsUseCase);
    gh.factory<_i1072.FetchReservationDetailUseCase>(
        () => appModule.fetchReservationDetailUseCase);
    gh.factory<_i1001.CreateReservationUseCase>(
        () => appModule.createReservationUseCase);
    gh.factory<_i294.UpdateReservationUseCase>(
        () => appModule.updateReservationUseCase);
    gh.factory<_i443.DeleteReservationUseCase>(
        () => appModule.deleteReservationUseCase);
    return this;
  }
}

class _$AppModule extends _i604.AppModule {}
