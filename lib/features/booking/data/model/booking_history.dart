class BookingHistoryModel {
  int? id;
  String? artisanName;
  String? status;
  String? referenceNumber;
  String? cost;
  String? date;
  String? time;

  BookingHistoryModel(
      {this.id,
      this.artisanName,
      this.status,
      this.referenceNumber,
      this.cost,
      this.date,
      this.time});

  BookingHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    artisanName = json['artisan_name'];
    status = json['status'];
    referenceNumber = json['reference_number'];
    cost = json['cost'];
    date = json['date'];
    time = json['time'];
  }
}
