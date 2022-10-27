import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/data/response/api_response.dart';
import 'package:flutter_mvvm/repository/home_repository.dart';

import '../models/movieList_model.dart';

class HomeViewViewModel with ChangeNotifier {
  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<MovieListModel> response){
    moviesList = response;
    notifyListeners();
  }
  final _myRepo = HomeRepository();
  Future<void> fetchMoviesList() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value){
      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));

    });
  }


}