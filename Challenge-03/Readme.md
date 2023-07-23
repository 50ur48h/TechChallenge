# Challenge 03 - We have a nested object. We would like a function where you pass in the object and a key and get back the value.

  ```
    Example Inputs

    object = {“a”:{“b”:{“c”:”d”}}}
    key = a/b/c

    object = {“x”:{“y”:{“z”:”a”}}}
    key = x/y/z

    value = a
  ```
---

# Solution: 

To achieve the goal, I am using a PowerShell script to fetch the value from a nested hashtable.

Here is a PowerShell function that takes 2 inputs, first a nested ```hashtable object``` and second ```key object``` in form of a string and keys are separated by ```'/'```


    function GetValueFromNestedHastable(){
        param(
            [PSObject]
            [Parameter(Mandatory = $true)]
            $Hashtable,
    
            [String]
            [Parameter(Mandatory = $true)]
            $Key
        )
        $keys = $Key.Split('/')
        $Count = 0
        $Value = $Hashtable
    
        while($Count -le $keys.Count-1){
            $key = $keys[$Count]
            $Value = $Value[$key]
            $Count++
        }
        return $Value
    }


I have converted the original objects to PowerShell object, as every language have a different syntax for declaring variables.
---
  Input Object 1:

    $object = @{“a” = @{“b”= @{“c”=”d”}}}
    $key = "a/b/c"

    # passing these values to function
    GetValueFromNestedHastable -Hashtable $object -Key $key

  Output:
  
    d

---
 Input Object 2:

    $object = $object = @{“x”=@{“y”=@{“z”=”a”}}}
    $key = "x/y/z"

    # passing these values to function
    GetValueFromNestedHastable -Hashtable $object -Key $key

  Output:
  
    a

---

