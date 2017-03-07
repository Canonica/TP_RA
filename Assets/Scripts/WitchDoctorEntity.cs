using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WitchDoctorEntity : Entity {

    public override void TurnBeginning()
    {
        base.TurnBeginning();

        critMultiplier *= 2;
    }
}
