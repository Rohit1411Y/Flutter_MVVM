import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../models/movieList_model.dart';
import '../res/app_url.dart';

class HomeRepository{
  BaseApiServices _apiServices = NetworkApiServices();
  Future<MovieListModel> fetchMoviesList() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response=MovieListModel.fromJson(response);
    }
    catch(e){
      throw e;
    }
  }
}