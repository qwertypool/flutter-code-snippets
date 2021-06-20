import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;


void uploadImage1(File _image) async {

    // open a byteStream
    var stream = new http.ByteStream(_image.openRead());
    // get file length
    var length = await _image.length();

    // string to uri
    var uri = Uri.parse("enter here upload URL");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // if you need more parameters to parse, add those like this. i added "user_id". here this "user_id" is a key of the API request
    request.fields["user_id"] = "text";

    // multipart that takes file.. here this "image_file" is a key of the API request
    var multipartFile = new http.MultipartFile('image_file', stream, length, filename: basename(_image.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send request to upload image
    await request.send().then((response) async {
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

    }).catchError((e) {
      print(e);
    });
  }
