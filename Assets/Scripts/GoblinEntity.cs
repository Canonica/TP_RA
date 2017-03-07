using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GoblinEntity : Entity
{
    public override void TurnBeginning()
    {
        base.TurnBeginning();

        esquiveChance -= 10;
    }
}
