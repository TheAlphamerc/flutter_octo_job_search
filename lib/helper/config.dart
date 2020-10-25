class Config{
  static const String apiBaseUrl = "https://jobs.github.com/";
  static const String positions = "positions";
  static const String all = "positions.json";
  static const String appLink= "https://play.google.com/store/apps/details?id=com.thealphamerc.flutter_octo_job_search";
  

  static String filerJob({int pageNo = 1,String description,String location,bool isFullTime}) {
    return "positions.json?description=$description&location=$location&full_time=$isFullTime&page=$pageNo";
  }
}