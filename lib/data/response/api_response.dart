import 'package:mvvm_rest/data/response/status.dart';

class ApiResponse<T> {
  T? data;
  Status? status;
  String? message;

  ApiResponse(this.data, this.message);

  ApiResponse.loading(this.message) : status = Status.loading;

  ApiResponse.completed(this.message) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
