package io.upmp.api.repository;

import io.upmp.api.domain.MobilityPreferences;
import io.upmp.api.domain.MobilityUsers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;

@Repository
@RequiredArgsConstructor
public class MobilityPreferencesRepository {

    private final EntityManager em;

    public void save(MobilityPreferences mobilityPreferences) {
        em.persist(mobilityPreferences);
    }

    public MobilityPreferences findOne(Long id) {
        return em.find(MobilityPreferences.class, id);
    }

}
