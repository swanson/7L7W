def wordSize(s: List[String]):Int = {
  (0 /: s) {(sum, value) => sum + value.size}
}

val strings = List("one", "two", "three")
println(wordSize(strings))
println("------")

trait Censor {
  val wordList = Map("shit" -> "shizz",
    "fuck" -> "frick",
    "hell" -> "The Firey Gates of Hades",
    "damn" -> "drats")

  def display(s: String):String = {
    s.split("\\s+")
    .map(word => wordList.get(word.toLowerCase()) getOrElse word)
    .mkString(" ")
  }
}

class Television(val station:String) {
  println("Tonight on " + station + ": ")
}

var pbs = new Television("PBS") with Censor;
println(pbs.display("It's Downton Abbey!"))
println(pbs.display("fuck this shit"))
println(pbs.display("damn this show is stupid as hell"))