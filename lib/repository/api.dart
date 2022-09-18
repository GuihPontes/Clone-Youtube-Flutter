import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:youtube/models/video_model.dart';

const chave = "AIzaSyAXd5rOZ_UqqidvXg9hMxTQ3-epgb1hOL4";

const url_base = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    var url = Uri.parse(url_base +
        'search?part=snippet&type=video&order=date&key=AIzaSyAXd5rOZ_UqqidvXg9hMxTQ3-epgb1hOL4&q=' +
        pesquisa);

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.converterJson(map);
      }).toList();

      return videos;

      //print("Resultado: " + videos.toString() );

      /*
      for( var video in dadosJson["items"] ){
        print("Resultado: " + video.toString() );
      }*/
      //print("resultado: " + dadosJson["items"].toString() );

    } else {}

    return pesquisar(pesquisa);
  }
}
