package io.upmp.api.api;

import io.upmp.api.domain.MobilityUsers;
import io.upmp.api.service.MobilityUsersService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequiredArgsConstructor
public class MobilityUsersApiController {

    private final MobilityUsersService mobilityUsersService;

    @PostMapping("/api/mobilityUsers")
    public CreateMobilityUsersResponse saveMobilityUsers(@RequestBody @Valid MobilityUsers mobilityUsers) {
        Long id = mobilityUsersService.join(mobilityUsers);
        return new CreateMobilityUsersResponse(id);
    }

    @Data
    static class CreateMobilityUsersResponse {
        private Long id;

        public CreateMobilityUsersResponse(Long id) {
            this.id = id;
        }
    }


}
