enum EndPoint {
    GET_ANSWER("answer"),
    GET_QUESTIONS("questions"),
    GET_SURVEY_DATA("survey_data"),
    GIFT_IS_AVAILABLE("is_available_gift"),
    GET_GIFT("get_available_gift");

    const EndPoint(this.endpointText);

    final String endpointText;
    
}

abstract class API {
  
  static const String URL = "https://us-central1-mei-survey.cloudfunctions.net";


  static String getURL(int survey_id, EndPoint endPoint)
  {
    return "$URL/${endPoint.endpointText}/?survey_id=$survey_id";
  }

  
}

