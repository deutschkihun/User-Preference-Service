package io.upmp.api.api;

import io.upmp.api.domain.MobilityPreferences;
import io.upmp.api.service.MobilityPreferencesService;
import io.upmp.api.service.MobilityUsersService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequiredArgsConstructor
public class MobilityPreferencesApiController {

    private final MobilityPreferencesService mobilityPreferencesService;

   @PostMapping("/api/mobilityPreferences")
   public CreateMobilityPreferencesResponse saveMobilityPreferences(@RequestBody @Valid MobilityPreferences mobilityPreferences) {
       Long id = mobilityPreferencesService.join(mobilityPreferences);
       return new CreateMobilityPreferencesResponse(id);
   }
    @Data
    static class CreateMobilityPreferencesResponse {
        private Long id;

        public CreateMobilityPreferencesResponse(Long id) {
            this.id = id;
        }
    }

}
