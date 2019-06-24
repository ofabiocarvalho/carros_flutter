class Response {
  final bool status;
  final String msg;
  int id;
  String url;

  Response(this.status, this.msg);

  Response.fromJson(Map<String, dynamic> map):
        status = map["status"] == "OK",
        msg = map["msg"],
        id = map["id"] as int,
        url = map["url"];

  isOk(){
    return status ;
  }

}