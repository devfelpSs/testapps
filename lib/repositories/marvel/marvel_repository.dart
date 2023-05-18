import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../model/characters_model.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';
import 'package:query/query.dart';




class MarvelRepository {
  Future<CharactersModel> getCharacters() async {
    await dotenv.load();
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publickey = dotenv.get("MARVELPUBLICKEY");
    var privatekey = dotenv.get("MARVELAPIKEY");
    var hash = _generateMD5(ts + privatekey + publickey);
    var query = "ts=$ts&apikey=$publickey&hash=$hash";
    var result = await dio.get("htttp://gateway.marvel.com/v1/public/characters?$query");
    var charactersModel = CharactersModel.fromJson(result.data);
    return charactersModel;
  }

  _generateMD5(String data){
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

}