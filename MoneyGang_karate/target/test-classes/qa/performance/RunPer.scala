package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerfTest extends Simulation {

  val protocol = karateProtocol()

// protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")


  val retrieveAddress = scenario("srv40262-retrieveAddress").exec(karateFeature("classpath:qa/performace/srv40262-1-0-retrieveAddress-per.feature"))

  setUp(
    creaProdcuto.inject(
        //atOnceUsers(1), //solo injecta 1 usuario
        //nothingFor(4 seconds), //no hace nada por los seg indicados
        //constantUsersPerSec(2) during (10 seconds) // injecta 2 usuarios por segundo por 10 seg
        //rampUsers(2) during (20 seconds) //injecta 2 usuarios en 20 seg
        rampUsersPerSec(2) to 10 during (20 seconds), //comienza con 2 usuarios hasta llegar a 10 por 20 seg
        //nothingFor(5 seconds),
        //constantUsersPerSec(1) during (5 seconds)
        ).protocols(protocol)
  )

}