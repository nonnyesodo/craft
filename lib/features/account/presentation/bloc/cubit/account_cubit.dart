import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:craftman/features/account/data/remote/acct_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AcctRepo acctRepo;
  AccountCubit(this.acctRepo) : super(AccountInitial());
  String enableAcctfield = '';

  selectAcctfieldToEnable({required String enablefield}) {
    emit(AccountLoadingState());
    enableAcctfield = enablefield;
    emit(AccountLoadedState());
  }

  updateUserProfile({String? mobile}) async {
    emit(AccountLoadingState());
    try {
      var response = await acctRepo.updateUserInfo(mobile: mobile);
      var body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(AccountLoadedState());
        log(body.toString());
        Fluttertoast.showToast(msg: body['message']);
      } else {
        emit(const AccountError(error: 'error'));
      }
    } catch (e) {
      log(e.toString());
      emit(const AccountError(error: 'error'));
    }
  }

  uploadPhoto({required img}) async {
    emit(AccountLoadingState());

    log('message');
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: img);

    log(image!.name.toString());
  }
}
