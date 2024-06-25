import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:craftman/features/home/data/models/artisan_model.dart';
import 'package:craftman/features/home/data/remote_repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/popilar_service_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  List searchedList = [];

  searchCategories(String find, List originalList) {
    emit(HomeLoading());
    searchedList = originalList
        .where((element) => element.toLowerCase().contains(find.toLowerCase()))
        .toList();
    log(searchedList.length.toString());
    emit(Searched());
  }

  List<CategorieModel> category = [];
  List<CategorieModel> homeCategory = [];
  getCategories() async {
    emit(HomeLoading());
    try {
      final response = await homeRepo.getCategories();
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        category.clear();
        homeCategory.clear();
        for (var cat in body['data']) {
          category.add(CategorieModel.fromJson(cat));
        }

        if (category.length > 5) {
          for (int i = 0; i < 5; i++) {
            homeCategory.add(category[i]);
          }
        } else {
          for (int i = 0; i < category.length; i++) {
            homeCategory.add(category[i]);
          }
        }
        log(category.length.toString());
        emit(FetchedCategoryState());
        log(body.toString());
      } else {
        log(response.body);
        emit(const HomeerrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      emit(const HomeerrorState(error: 'error'));
      log(e.toString());
    }
  }

  List<ArtisansModel> artisans = [];
  String selectedCategory = '';
  getArtisans({required int id, required String category}) async {
    emit(HomeLoading());
    selectedCategory = category;
    try {
      final response = await homeRepo.getSubCategories(id: id);
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        artisans.clear();
        for (var art in body['data']) {
          artisans.add(ArtisansModel.fromJson(art));
        }
        emit(FetchedArtisan());
        log(body.toString());
      } else {
        log(response.body);
        emit(const HomeerrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      emit(const HomeerrorState(error: 'error'));
      log(e.toString());
    }
  }

  ArtisansModel selectedArtisan = ArtisansModel();
  selectArtisan({ArtisansModel? artisan}) {
    emit(HomeLoading());
    selectedArtisan = artisan!;
    emit(HomeLoaded());
  }

  bookArtisan() async {
    emit(HomeLoading());
    try {
      final response =
          await homeRepo.bookArtisan(id: selectedArtisan.artisanId);
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(BookedArtisan());
      } else {
        log(response.body.toString());
        emit(const HomeerrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      emit(const HomeerrorState(error: 'error'));
      log("meeedd$e");
    }
  }

  getNotification() async {
    emit(HomeLoading());
    try {
      final response = await homeRepo.fetchNotification();
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(HomeLoaded());
        log(body.toString());
      } else {
        log(response.body);
        emit(const HomeerrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      emit(const HomeerrorState(error: 'error'));
      log(e.toString());
    }
  }

  List<PopularServiceModel> popularServices = [];
  getPopularService() async {
    emit(HomeLoading());
    try {
      final response = await homeRepo.getPopularService();
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(HomeLoaded());
        popularServices.clear();
        for (var serve in body["data"]) {
          popularServices.add(PopularServiceModel.fromJson(serve));
        }
        log(body.toString());
        emit(FetchedServiceState());
      } else {
        log(response.body);
        emit(const HomeerrorState(error: 'error'));
        Fluttertoast.showToast(msg: body['message']);
      }
    } catch (e) {
      emit(const HomeerrorState(error: 'error'));
      log(e.toString());
    }
  }
}
