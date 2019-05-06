#define SECOND_TICS 35.714285714285715

function int itof(int x) { return x << 16; }
function int ftoi(int x) { return x >> 16; }

function int abs(int x)
{
    if (x < 0) { return -x; }
    return x;
}

function int min(int x, int y)
{
    if (x < y) { return x; }
    return y;
}

function int max(int x, int y)
{
    if (x > y) { return x; }
    return y;
}

function int round(int toround)
{
    return ftoi(toround + 0.5);
}

function int ceil(int toround)
{
    return ftoi(toround + (1.0-1));
}

function int cond(int test, int trueRet, int falseRet)
{
    if (test) { return trueRet; }
    return falseRet;
}

function int magnitudeThree_f(int x, int y, int z)
{
    int len, ang;

    ang = VectorAngle(x, y);
    if (((ang + 0.125) % 0.5) > 0.25) { len = FixedDiv(y, sin(ang)); }
    else { len = FixedDiv(x, cos(ang)); }

    ang = VectorAngle(len, z);
    if (((ang + 0.125) % 0.5) > 0.25) { len = FixedDiv(z, sin(ang)); }
    else { len = FixedDiv(len, cos(ang)); }

    return len;
}

