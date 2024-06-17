import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:modul6/repository/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final _repo = AuthRepo();

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await _repo.login(email: email, password: password);
      emit(const LoginSuccess(msg: "Login berhasil"));
    } catch (e) {
      emit(LoginFailure(msg: e.toString()));
    }
  }
}
