package wonderland.example.rsocket.rsocketexample;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.time.Duration;

@SpringBootApplication
@Controller
public class RsocketExampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(RsocketExampleApplication.class, args);
	}

	public record StreamResponse(long id, String content){}

	@MessageMapping("/stream")
	public Flux<StreamResponse> getStreamResponse() {
		return Flux.interval(Duration.ZERO, Duration.ofSeconds(1L))
				.map(aLong -> new StreamResponse(aLong, "some content"));
	}

	@MessageMapping("/channel")
	public Flux<StreamResponse> getChannel(Flux<String> names) {
		return names
				.map(name -> new StreamResponse(0, "hello %s".formatted(name)));
	}

	@MessageMapping("/request-response")
	public Mono<StreamResponse> getRequestResponse(Mono<String> nameMono) {
		return nameMono
				.map(name -> new StreamResponse(0, "hello %s".formatted(name)));
	}

	@MessageMapping("/fireAndForget")
	public Mono<Void> getFireAndForget(Mono<String> nameMono) {
		return nameMono
				.log()
				.then();
	}

}
