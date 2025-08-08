// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../bloc/bonds_bloc.dart' as _i595;
import '../repositories/bonds_repositories.dart' as _i536;
import '../services/api_service.dart' as _i137;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i137.ApiService>(() => _i137.ApiService());
    gh.lazySingleton<_i536.BondsRepository>(
        () => _i536.BondsRepository(gh<_i137.ApiService>()));
    gh.factory<_i595.BondsBloc>(
        () => _i595.BondsBloc(gh<_i536.BondsRepository>()));
    return this;
  }
}
