class notificationClass{
  int id;

  static final Map<int, String> map = {

    1 : "5 min",
    2 : "10 min",
    3 : "15 min",
    4 : "20 min",
    5 : "25 min",
    6 : "30 min",
    7 : "35 min",
    8 : "40 min",
    9 : "45 min",
    10 : "50 min",
    11 : "55 min",
    12 : "60 min",
  };
  String get idString {
    return (map.containsKey(id) ? map[id] : "unknown");
  }
  notificationClass(this.id);
  String toString() {
    return ("$id $idString");
  }

  static List<notificationClass> get list {
    return (map.keys.map((num) {
      return (notificationClass(num));
    })).toList();
  }

}