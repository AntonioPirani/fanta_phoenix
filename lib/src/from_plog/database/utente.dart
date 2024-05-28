
class UtenteDB {
  String id;
  String email;
  String pw;
  String ricordami;

  UtenteDB({
    this.id,
    this.email,
    this.pw,
    this.ricordami,
  });

  factory UtenteDB.fromMap(Map<String, dynamic> json) => new UtenteDB(
        id: json["id"],
        email: json["email"],
        pw: json["pw"],
        ricordami: json["ricordami"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "pw": pw,
        "ricordami": ricordami,
      };
}