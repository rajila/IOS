import Cocoa

func factorial (numero _numero:Int) -> Int
{
    if _numero == 0
    {
        return 1
    }else
    {
        return _numero*factorial(numero: _numero-1)
    }
}

print(factorial(numero: 5))
print(factorial(numero: 6))
