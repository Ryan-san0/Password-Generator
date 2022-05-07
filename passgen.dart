import 'dart:io';
import 'dart:math';

void main() {
  int passtype;
  print("Password Type:\n [1] Weak\n [2] Medium\n [3] Strong\n [4] Others\n");
  print("Enter pasword type to generate:");
  passtype = int.parse(stdin.readLineSync());

  passwordGen pass = new passwordGen(passtype);
  pass.generate();
  pass.shuffleGen();
}

class passwordGen {
  int passtype, nums;

  String pass = "q";
  int upper, lower, num, spe;
  passwordGen(int newpasswordGen) {
    this.passtype = newpasswordGen;
  }

  void generate() {
    if (passtype == 1) {
      int n = 5;
      int count = (n / 3).toInt();
      int rem = (n.remainder(3));
      upper = count;
      lower = count;
      num = count;
      spe = rem;
      nums = n;
    }

    if (passtype == 2) {
      int n = 15;
      int count = (n / 3).toInt();
      int rem = (n.remainder(3));
      upper = count;
      lower = count;
      num = count;
      spe = rem;
      nums = n;
    }

    if (passtype == 3) {
      int n = 25;
      int count = (n / 3).toInt();
      int rem = (n.remainder(3));
      upper = count;
      lower = count;
      num = count;
      spe = rem;
      nums = n;
    }

    if (passtype == 4) {
      int n;
      print("Enter password length:");
      n = int.parse(stdin.readLineSync());
      int count = (n / 3).toInt();
      int rem = (n.remainder(3));
      upper = count;
      lower = count;
      num = count;
      spe = rem;
      nums = n;
    }
    var alp = [
      "q",
      "w",
      "e",
      "r",
      "t",
      "y",
      "u",
      "i",
      "o",
      "p",
      "a",
      "s",
      "d",
      "f",
      "g",
      "h",
      "j",
      "k",
      "l",
      "z",
      "x",
      "c",
      "v",
      "b",
      "n",
      "m"
    ];
    var numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
    var special = [
      "@",
      "#",
      "=",
      "+",
      "!",
      "£",
      "%",
      "&",
      "?",
      "[",
      "]",
      "(",
      ")",
      "{",
      "}"
    ];

    var ran = new Random();
    for (int i = 0; i < upper; i++) {
      pass = pass + alp[ran.nextInt(25)];
    }
    for (int i = 0; i < lower; i++) {
      pass = pass + (alp[ran.nextInt(25)]).toUpperCase();
    }
    for (int i = 0; i < num; i++) {
      pass = pass + numbers[ran.nextInt(9)];
    }
    for (int i = 0; i < spe; i++) {
      pass = pass + special[ran.nextInt(14)];
    }
    pass = pass.substring(1);
  }

  void shuffleGen() {
    String newpass = "q";
    var passlist = pass.split("");
    passlist.shuffle();
    for (int x = 0; x < nums; x++) {
      newpass = newpass + passlist[x];
    }
    pass = newpass;
    pass = pass.substring(1);
    print("Your Password: $pass");
  }
}
