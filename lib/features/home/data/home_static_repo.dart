import 'package:flutter/material.dart';

class HomeStaticRepo {
  static List<ServicModel> services = [
    ServicModel(service: 'Painter'),
    ServicModel(service: 'Electrician'),
    ServicModel(service: 'Carpenter'),
    ServicModel(service: 'Plumber'),
    ServicModel(service: 'Tyler'),
    ServicModel(service: 'Satellite\nInstaller'),
    ServicModel(service: 'CCTV\nInstaller'),
    ServicModel(service: 'Air\nCondition'),
    ServicModel(service: 'Car\nMechanic'),
    ServicModel(service: 'House Agent'),
    ServicModel(service: 'Refrigerator\nRepair'),
    ServicModel(service: 'Solar\nInstaller'),
    ServicModel(service: 'Window\nBlind'),
    ServicModel(service: 'Generator\nRepair'),
    ServicModel(service: 'Wallpaper\nInstaller')
  ];
}

class ServicModel {
  String? service;
  IconData? serviceIcon;

  ServicModel({this.service, this.serviceIcon});
}
