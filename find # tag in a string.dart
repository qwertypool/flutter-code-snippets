void main() {
String strWithNum = """
Hubble is hiring!

Hubble is looking for a Community Manager to join their talented team.

💻 Community Manager
🌍 Remote
🕒 Contract, Full-Time, Part-Time

Apply now 👇cryptocurrencyjobs.co/customer-suppo... #blockchainjobs #cryptojobs
""";
  List a = strWithNum.split(' ');
  for(var x in a){
    if(x[0].startsWith(RegExp(r'#'))){
      print(x);
    }
  }
}
