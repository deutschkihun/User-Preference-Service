package io.upmp.api.service;

import io.upmp.api.domain.MobilityUsers;
import io.upmp.api.repository.MobilityUsersRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class MobilityUsersService {

    private final MobilityUsersRepository mobilityUsersRepository;

    @Transactional
    public Long join(MobilityUsers mobilityUsers) {
        validateDuplicateMobilityUsers(mobilityUsers);
        mobilityUsersRepository.save(mobilityUsers);
        return mobilityUsers.getId();
    }

    public void validateDuplicateMobilityUsers(MobilityUsers mobilityUsers) {
        List<MobilityUsers> findMobilityUsers = mobilityUsersRepository.findByEmail(mobilityUsers.getEmail());
        if(!findMobilityUsers.isEmpty()) {
            throw new IllegalStateException("already exist");
        }
    }

    public MobilityUsers findOne(Long mobilityUsersId) {
        return mobilityUsersRepository.findOne(mobilityUsersId);
    }
}
