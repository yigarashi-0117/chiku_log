import '/data/models/survey_model.dart';

class LocalDataModel {

  final String tenant_id;
  final String acquisition_date;
  final String amz_number;
  final String survey_id;
  final List<SurveyModel> survey_list;
  
  LocalDataModel({required this.tenant_id, required this.acquisition_date, required this.amz_number, required this.survey_id, required this.survey_list});

  factory LocalDataModel.fromJson(Map<String, dynamic> json) {
    return LocalDataModel(
      tenant_id: json['tenant_id'],
      acquisition_date: json['acquisition_date'],
      amz_number: json['amz_number'],
      survey_id: json['survey_id'],
      survey_list: json['survey_list'].map((survey) => SurveyModel.fromJson(survey)).toList(),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      
      'tenant_id': tenant_id,
      'acquisition_date': acquisition_date,
      'amz_number': amz_number,
      'survey_id': survey_id,
      'survey_list': survey_list.map((survey) => survey.toJson()).toList(),
    };
  }
}