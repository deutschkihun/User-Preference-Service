package io.upmp.api.service;

import io.upmp.api.domain.MobilityPreferences;
import io.upmp.api.domain.MobilityUsers;
import io.upmp.api.repository.MobilityPreferencesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class MobilityPreferencesService {

    private final MobilityPreferencesRepository mobilityPreferencesRepository;

    @Transactional
    public Long join(MobilityPreferences mobilityPreferences) {
        mobilityPreferencesRepository.save(mobilityPreferences);
        return mobilityPreferences.getId();
    }
}
