class Config{
  static const String apiBaseUrl = "https://jobs.github.com/";
  static const String positions = "positions";
  static const String all = "positions.json";
  static const String appLink= "https://play.google.com/store/apps/details?id=com.thealphamerc.flutter_github_connect";
  

  static String filerJob({position,int pageNo = 1,String description,String location}) {
    return "https://jobs.github.com/positions=$position?description=$description&location=$location";
  }
}