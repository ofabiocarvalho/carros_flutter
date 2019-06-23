class Response {
  final bool status;
  final String msg;
  String url;

  Response(this.status, this.msg);

  Response.fromJson(Map<String, dynamic> map):
        status = map["status"] == "OK",
        msg = map["msg"],
        url = map["url"];

  isOk(){
    return status ;
  }

}