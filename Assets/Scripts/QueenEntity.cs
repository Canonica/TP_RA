using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QueenEntity : Entity
{
    public override void TurnBeginning()
    {
        base.TurnBeginning();

        attackPower = currentLife / maxLife * initAttack;
    }
}
