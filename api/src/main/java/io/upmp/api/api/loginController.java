package io.upmp.api.api;

import io.upmp.api.domain.MobilityUsers;
import io.upmp.api.repository.MobilityUsersRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class loginController {

    private final MobilityUsersRepository mobilityUsersRepository;

    //JSONObject obj = new JSONObject(json);

    @PostMapping("/api/login")
    public List<MobilityUsers> loginDataCheck(@RequestBody @Valid String requestBody) {
        System.out.println("hello " + requestBody); // requestBody compare
        List<MobilityUsers> mobilityUsers = mobilityUsersRepository.findByEmail("");
        return mobilityUsers;
    }


}
