import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mnc_identifier_face/mnc_identifier_face.dart';
import 'package:mnc_identifier_face/model/liveness_detection_result_model.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'kyc_state.dart';

class KycCubit extends Cubit<KycState> {
  KycCubit() : super(KycInitial());

  List<File> allImages = [];
  selectArtisanImages() async {
    emit(KycLoadingState());
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      allImages.clear();
      for (var img in xfilePick) {
        log(img.path);
        allImages.add(File(img.path));
        log('message');
      }
      log(allImages.length.toString());
    }
    emit(KycLoadedState());
    // final List<XFile> medias = await picker.pickMultipleMedia();
  }

  File? id;
  selectArtisanId(img) async {
    emit(KycLoadingState());
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: img);
    if (pickedFile != null) {
      XFile xfilePick = pickedFile;
      id = File(xfilePick.path);
    }
    emit(KycLoadedState());
  }

  startDetection() async {
    emit(KycLoadingState());
    try {
      LivenessDetectionResult livenessResult =
          await MncIdentifierFace().startLivenessDetection();
      debugPrint("result is $livenessResult");
    } catch (e) {
      debugPrint('Something goes unexpected with error is $e');
    }
    emit(KycLoadedState());
  }
}
