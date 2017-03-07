using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RPGCharacterEntity : Entity
{
    public override void TurnBeginning()
    {
        base.TurnBeginning();

        attackPower += 5;
        critChance += 5;
        critMultiplier += 1;
    }
}
