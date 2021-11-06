class QoutesModel {
  // Varaibles
  String qoutes;
// Constructor
  QoutesModel(this.qoutes);
  // Named_Constuctor
  QoutesModel.fromJson(Map<String, dynamic> json) {
    qoutes = json['quote'];
  }
}
