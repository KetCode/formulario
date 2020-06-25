class FeedbackForm{

  String _name, _email, _mobileno, _func, _date;

  FeedbackForm(this._name, this._email, this._mobileno, this._func, this._date);

  String toParams() => "?name=$_name&email=$_email&mobileno=$_mobileno&func=$_func&date=$_date";

}