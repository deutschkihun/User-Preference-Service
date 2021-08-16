package io.upmp.api.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="mobility_preferences")
@Getter
@Setter
public class MobilityPreferences {

    @Id @GeneratedValue
    //@Column(name = "mobility_preference_id")
    private Long id;


    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mobility_user_id")
    private MobilityUsers mobilityUsers;

    // dynamic preference profile
    private String environmentalFriendliness;
    private String lightRailTravel;
    private String travelCost;
    private String travelTime;
    private String transfer;
    private String privateTransportation;
    private String waitingTime;
    private String favoritePlace;
    private String livingStreet;
    private String preferredTransportation;
    private String roadInclination;
    private String roadSurface;
    private String sharingTransportation;

    // situational context

    private String capacityUtilization;
    private String weather;
    private String currentLocation;
    private String trafficCondition;



}
