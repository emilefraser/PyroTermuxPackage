# Expressions and Functions

## General 

JSON values in the definition can be literal or expressions that are evaluated at runtime.



```json
"name": "value"

"name": "@pipeline().parameters.password"
```







## Expressions

Expressions can appear anywhere in a JSON string value and always result in another JSON value.

f a JSON value is an expression, the body of the expression is extracted by removing the at-sign (@). **If a literal string is needed that starts with @, it must be escaped by using @@**

| JSON value        | Result                                               |
| ----------------- | ---------------------------------------------------- |
| "parameters"      | The characters 'parameters' are returned.            |
| "parameters\[1\]" | The characters 'parameters\[1\]' are returned.       |
| "@@"              | A 1 character string that contains '@' is returned.  |
| " @"              | A 2 character string that contains ' @' is returned. |



### String interpolation

Expressions can also appear inside strings, using a feature called *string interpolation* where expressions are wrapped in `@{ ... }`

```json
 "name" : "First Name: @{pipeline().parameters.firstName} Last Name: @{pipeline().parameters.lastName}"
```

`myNumber` as `42` and `myString` as `foo`

| JSON value                                                   | Result                                                       |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| "@pipeline().parameters.myString"                            | Returns `foo` as a string.                                   |
| "@{pipeline().parameters.myString}"                          | Returns `foo` as a string.                                   |
| "@pipeline().parameters.myNumber"                            | Returns `42` as a _number_.                                  |
| "@{pipeline().parameters.myNumber}"                          | Returns `42` as a _string_.                                  |
| "Answer is: @{pipeline().parameters.myNumber}"               | Returns the string `Answer is: 42`.                          |
| "@concat('Answer is: ', string(pipeline().parameters.myNumber))" | Returns the string `Answer is: 42`                           |
| "Answer is: @@{pipeline().parameters.myNumber}"              | Returns the string `Answer is: @{pipeline().parameters.myNumber}`. |

### Complex expressions 

The below example shows a complex example that references a deep sub-field of activity output.

To reference a pipeline parameter that evaluates to a sub-field, **use [] syntax instead of dot(.)** operator (as in case of subfield1 and subfield2)

```json
@activity('activityName').output.subfield1.subfield2[pipeline().parameters.subfield3].subfield4
```

### Dataset with a parameter

In this example the BlobDataset takes a parameter named **path**

```json
{
    "name": "BlobDataset",
    "properties": {
        "type": "AzureBlob",
        "typeProperties": {
            "folderPath": "@dataset().path"
        },
        "linkedServiceName": {
            "referenceName": "AzureStorageLinkedService",
            "type": "LinkedServiceReference"
        },
        "parameters": {
            "path": {
                "type": "String"
            }
        }
    }
}
```

### Pipeline with a parameter

In the following example, the pipeline takes **inputPath** and **outputPath** parameters. 

```json
{
    "name": "Adfv2QuickStartPipeline",
    "properties": {
        "activities": [
            {
                "name": "CopyFromBlobToBlob",
                "type": "Copy",
                "inputs": [
                    {
                        "referenceName": "BlobDataset",
                        "parameters": {
                            "path": "@pipeline().parameters.inputPath"
                        },
                        "type": "DatasetReference"
                    }
                ],
                "outputs": [
                    {
                        "referenceName": "BlobDataset",
                        "parameters": {
                            "path": "@pipeline().parameters.outputPath"
                        },
                        "type": "DatasetReference"
                    }
                ],
                "typeProperties": {
                    "source": {
                        "type": "BlobSource"
                    },
                    "sink": {
                        "type": "BlobSink"
                    }
                }
            }
        ],
        "parameters": {
            "inputPath": {
                "type": "String"
            },
            "outputPath": {
                "type": "String"
            }
        }
    }
}
```



## 





