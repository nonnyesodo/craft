import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());
  String enableAcctfield = '';

  selectAcctfieldToEnable({required String enablefield}) {
    emit(AccountLoadingState());
    enableAcctfield = enablefield;
    emit(AccountLoadedState());
  }
}
