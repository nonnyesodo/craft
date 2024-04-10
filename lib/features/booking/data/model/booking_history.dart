class BookingHistoryModel {
  int? id;
  String? artisanName;
  int? artisanId;
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
      this.time,
      this.artisanId});

  BookingHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    artisanName = json['artisan_name'];
    status = json['status'];
    referenceNumber = json['reference_number'];
    cost = json['cost'];
    date = json['date'];
    time = json['time'];
    artisanId = json['artisan_id'];
  }
}
