import 'package:demo_cubit/dto/login_response_dto.dart';
import 'package:demo_cubit/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppState{
  final bool isUserLoggedIn;
  final bool isLoading;
  final LoginResponseDto? loginResponseDto;

  AppState({required this.isUserLoggedIn, this.loginResponseDto, required this.isLoading});
}

class AppCubit extends Cubit<AppState>{

  AppCubit() : super(AppState(isUserLoggedIn: false, isLoading: false));

// Para hacer el login contra backend
  void login(String username, String password) async {
    // emitir un evento para que la UI sepa que se esta haciendo login
      emit (AppState(isUserLoggedIn: false, isLoading: true));
      try {
      var loginResponseDto = await LoginService.login(username, password);
      // Si el login fue exitoso, se actualiza el estado del cubit
      emit(AppState(isUserLoggedIn: true, loginResponseDto: loginResponseDto, isLoading: false));
   
    } catch (e) {
      // Si lo anterior falla, se emite un evento de error
      emit(AppState(isUserLoggedIn: false, isLoading: false));
    }
  }
  // Para hacer el logout
  void logout() async {
    emit(AppState(isUserLoggedIn: false, isLoading: false));
  }
} 