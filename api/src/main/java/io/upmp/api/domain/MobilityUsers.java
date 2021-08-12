package io.upmp.api.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
public class MobilityUsers {

    @Id @GeneratedValue
    @Column(name = "mobility_user_id")
    private Long id;

    private String email;
    private String password;
    private String age;
    private String gender;
    private String subscription;
    private String paymentMethod;
    private String handicapped;

    @JsonIgnore
    @OneToOne(mappedBy = "mobilityUsers")
    private List<MobilityPreferences> orders = new ArrayList<>();

}
