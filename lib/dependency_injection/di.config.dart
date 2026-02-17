// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../src/data/api/api_manger.dart' as _i793;
import '../src/data/api/network_factory.dart' as _i13;
import '../src/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart'
    as _i841;
import '../src/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_impl.dart'
    as _i30;
import '../src/data/data_source/remote_data_source/consultants_remote_data_source/consultants_remote_data_source.dart'
    as _i699;
import '../src/data/data_source/remote_data_source/consultants_remote_data_source/consultants_remote_data_source_impl.dart'
    as _i677;
import '../src/data/repositories_impl/auth_repository_impl.dart' as _i267;
import '../src/data/repositories_impl/consultant_repository_impl.dart' as _i866;
import '../src/domain/repository/auth_repository.dart' as _i365;
import '../src/domain/repository/consultants_repository.dart' as _i373;
import '../src/domain/use_case/auth/register_with_email_and_password_account_use_case.dart'
    as _i1058;
import '../src/domain/use_case/get_all_consultants_use_case.dart' as _i801;
import '../src/domain/use_case/get_consultants_person_use_case.dart' as _i163;
import '../src/presentation/auth/login/view_model/login_cubit.dart' as _i78;
import '../src/presentation/auth/register/view_model/register_cubit.dart'
    as _i144;
import '../src/presentation/consultant_is_person_details/view_model/consultants_person_details_cubit.dart'
    as _i109;
import '../src/presentation/home/view_model/home_cubit.dart' as _i233;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioProvider = _$DioProvider();
    gh.factory<_i78.LoginCubit>(() => _i78.LoginCubit());
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i361.LogInterceptor>(() => dioProvider.providePretty());
    gh.factory<_i793.ApiManger>(() => _i793.ApiManger(gh<_i361.Dio>()));
    gh.factory<_i699.ConsultantsRemoteDataSource>(
      () => _i677.ConsultantsRemoteDataSourceImpl(gh<_i793.ApiManger>()),
    );
    gh.factory<_i841.AuthRemoteDataSource>(
      () => _i30.AuthRemoteDataSourceImpl(gh<_i793.ApiManger>()),
    );
    gh.factory<_i373.ConsultantsRepository>(
      () => _i866.ConsultantRepositoryImpl(
        gh<_i699.ConsultantsRemoteDataSource>(),
      ),
    );
    gh.factory<_i365.AuthRepository>(
      () => _i267.AuthRepositoryImpl(gh<_i841.AuthRemoteDataSource>()),
    );
    gh.factory<_i801.GetAllConsultantsUseCase>(
      () => _i801.GetAllConsultantsUseCase(gh<_i373.ConsultantsRepository>()),
    );
    gh.factory<_i163.GetConsultantsPersonUseCase>(
      () =>
          _i163.GetConsultantsPersonUseCase(gh<_i373.ConsultantsRepository>()),
    );
    gh.factory<_i1058.RegisterWithEmailAndPasswordAccountUseCase>(
      () => _i1058.RegisterWithEmailAndPasswordAccountUseCase(
        gh<_i365.AuthRepository>(),
      ),
    );
    gh.factory<_i109.ConsultantsPersonDetailCubit>(
      () => _i109.ConsultantsPersonDetailCubit(
        gh<_i163.GetConsultantsPersonUseCase>(),
      ),
    );
    gh.factory<_i233.HomeCubit>(
      () => _i233.HomeCubit(gh<_i801.GetAllConsultantsUseCase>()),
    );
    gh.factory<_i144.RegisterCubit>(
      () => _i144.RegisterCubit(
        gh<_i1058.RegisterWithEmailAndPasswordAccountUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioProvider extends _i13.DioProvider {}
