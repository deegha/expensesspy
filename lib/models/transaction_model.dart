class Txn {
  String description;
  String amount;
  String userid;
  String time;
  String category;

  Txn(
      {required this.description,
      required this.amount,
      required this.userid,
      required this.time,
      required this.category});

  setDescription(String desc) {
    description = desc;
  }

  setCategory(String cat) {
    category = cat;
  }

  setAmount(String amo) {
    amount = amo;
  }

  setUserId(String id) {
    userid = id;
  }

  setTime(String time) {
    time = time;
  }
}
