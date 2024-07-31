class jsonData {
  String? imc;
  String? classificacao;

  jsonData({this.imc, this.classificacao});

  jsonData.fromJson(Map<String, dynamic> json) {
    imc = json['imc'];
    classificacao = json['classificacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imc'] = this.imc;
    data['classificacao'] = this.classificacao;
    return data;
  }
}
