import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

const _unset = Object();

abstract class LoginEvent {
  const LoginEvent();
}

class LoginTaxChanged extends LoginEvent {
  const LoginTaxChanged(this.value);
  final String value;
}

class LoginUserNameChanged extends LoginEvent {
  const LoginUserNameChanged(this.value);
  final String value;
}

class LoginPassWordChanged extends LoginEvent {
  const LoginPassWordChanged(this.value);
  final String value;
}

class LoginSubmitRequested extends LoginEvent {
  const LoginSubmitRequested();
}

class LoginSubmitErrorCleared extends LoginEvent {
  const LoginSubmitErrorCleared();
}

class LoginLogoutRequested extends LoginEvent {
  const LoginLogoutRequested();
}

class LoginState {
  final String tax;
  final String userName;
  final String passWord;
  final String? taxError;
  final String? nameError;
  final String? passWordError;
  final String? submitError;
  final bool isAuthenticated;

  const LoginState({
    required this.tax,
    required this.userName,
    required this.passWord,
    this.taxError,
    this.nameError,
    this.passWordError,
    this.submitError,
    this.isAuthenticated = false,
  });

  factory LoginState.fromBox(Box box) {
    return LoginState(
      tax: (box.get('tax', defaultValue: '') ?? '') as String,
      userName: (box.get('userName', defaultValue: '') ?? '') as String,
      passWord: (box.get('passWord', defaultValue: '') ?? '') as String,
      isAuthenticated: (box.get('loginBox', defaultValue: false) ?? false) as bool,
    );
  }

  LoginState copyWith({
    String? tax,
    String? userName,
    String? passWord,
    Object? taxError = _unset,
    Object? nameError = _unset,
    Object? passWordError = _unset,
    Object? submitError = _unset,
    bool? isAuthenticated,
  }) {
    return LoginState(
      tax: tax ?? this.tax,
      userName: userName ?? this.userName,
      passWord: passWord ?? this.passWord,
      taxError: identical(taxError, _unset) ? this.taxError : taxError as String?,
      nameError: identical(nameError, _unset) ? this.nameError : nameError as String?,
      passWordError:
          identical(passWordError, _unset) ? this.passWordError : passWordError as String?,
      submitError:
          identical(submitError, _unset) ? this.submitError : submitError as String?,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._box) : super(LoginState.fromBox(_box)) {
    on<LoginTaxChanged>((event, emit) {
      emit(
        state.copyWith(
          tax: event.value,
          taxError: null,
          submitError: null,
        ),
      );
    });

    on<LoginUserNameChanged>((event, emit) {
      emit(
        state.copyWith(
          userName: event.value,
          nameError: null,
          submitError: null,
        ),
      );
    });

    on<LoginPassWordChanged>((event, emit) {
      emit(
        state.copyWith(
          passWord: event.value,
          passWordError: null,
          submitError: null,
        ),
      );
    });

    on<LoginSubmitErrorCleared>((event, emit) {
      if (state.submitError != null) {
        emit(state.copyWith(submitError: null));
      }
    });

    on<LoginSubmitRequested>(_onSubmitRequested);
    on<LoginLogoutRequested>(_onLogoutRequested);
  }

  final Box _box;

  Future<void> _onSubmitRequested(
    LoginSubmitRequested event,
    Emitter<LoginState> emit,
  ) async {
    String? taxError;
    String? nameError;
    String? passWordError;

    if (state.tax.trim() != '11111') {
      taxError = 'can du 5 so ';
    }
    if (state.userName.isEmpty) {
      nameError = 'khong duoc trong';
    }
     if (state.userName != "demo") {
      nameError = 'sai ten tai khoan';
    }
    if (state.passWord.length < 6 || state.passWord.length > 50) {
      passWordError = ' 6< password < 50';
    }
     if (state.passWord != "123456") {
      passWordError = 'sai mat khau';
    }

    final isValid = taxError == null && nameError == null && passWordError == null;

    if (isValid) {
      await _box.put('loginBox', true);
      await _box.put('tax', state.tax);
      await _box.put('userName', state.userName);
      await _box.put('passWord', state.passWord);

      emit(
        state.copyWith(
          taxError: null,
          nameError: null,
          passWordError: null,
          submitError: null,
          isAuthenticated: true,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        taxError: taxError,
        nameError: nameError,
        passWordError: passWordError,
        submitError: 'Thong tin khong hop le',
        isAuthenticated: false,
      ),
    );
  }

  Future<void> _onLogoutRequested(
    LoginLogoutRequested event,
    Emitter<LoginState> emit,
  ) async {
    await _box.put('loginBox', false);

    emit(
      state.copyWith(
        submitError: null,
        taxError: null,
        nameError: null,
        passWordError: null,
        isAuthenticated: false,
      ),
    );
  }
}