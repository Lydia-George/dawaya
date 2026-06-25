
import 'package:dawaya/data/models/pharmacy/pharmacy_model.dart';
import 'package:dio/dio.dart';

class PharmacyRepo {
  final Dio _dio = Dio();
  static const String baseUrl = 'https://DawayaFinalProject.pythonanywhere.com/api';
  
  Future<List<PharmacyModel>> getPharmacies() async{
    final response = await _dio.get('$baseUrl/pharmacies/');
    return (response.data as List).map((json) => PharmacyModel.fromJson(json)).toList();

    
  }
  
  
}