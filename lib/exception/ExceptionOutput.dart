class ExceptionOutput {

  final String date;
  final int status;
  final String message;
  final String exception;

  ExceptionOutput(this.date, this.status, this.message, this.exception);

  factory ExceptionOutput.fromJson(Map<String, dynamic> json) {
    return ExceptionOutput(json['date'], json['status'], json['message'], json['exception']);
  }
}