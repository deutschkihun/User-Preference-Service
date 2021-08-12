package io.upmp.api.service;

import io.upmp.api.domain.MobilityUsers;
import io.upmp.api.repository.MobilityUsersRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;
import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class MemberServiceTest {

    @Autowired MobilityUsersService mobilityUsersService;
    @Autowired MobilityUsersRepository mobilityUsersRepository;

    @Test
    @Rollback(false)
    public void Join() throws Exception {

        MobilityUsers mobilityUsers = new MobilityUsers();
        mobilityUsers.setEmail("deutschkihun@gmail123.com");
        mobilityUsers.setGender("female");
        Long savedId = mobilityUsersService.join(mobilityUsers);

        assertEquals(mobilityUsers,mobilityUsersRepository.findOne(savedId));
    }

    /*@Test
    public void Duplication() throws Exception {
        MobilityUsers mobilityUsers1 = new MobilityUsers();
        MobilityUsers mobilityUsers2 = new MobilityUsers();
        mobilityUsers1.setEmail("deutschkihun@gmail.com");
        mobilityUsers2.setEmail("deutschkihun@gmail.com");
        mobilityUsers1.setGender("female");
        mobilityUsersService.join(mobilityUsers1);

        try {
            mobilityUsersService.join(mobilityUsers2);
        } catch (IllegalArgumentException e){
            return;
        }
        //then
        fail("already there");
    }*/

}
