package io.upmp.api.repository;

import io.upmp.api.domain.MobilityUsers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class MobilityUsersRepository {

    private final EntityManager em;

    public void save(MobilityUsers mobilityUsers) {
        em.persist(mobilityUsers);
    }

    public MobilityUsers findOne(Long id) {
        return em.find(MobilityUsers.class, id);
    }

    public List<MobilityUsers> findByEmail(String email) {
        return em.createQuery("select m from MobilityUsers m where m.email = :email", MobilityUsers.class)
                .setParameter("email",email)
                .getResultList();
    }
}
