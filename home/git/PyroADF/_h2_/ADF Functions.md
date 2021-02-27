# ADF Functions

## String Functions

| String function                                              | Task                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [concat](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#concat) | Combine two or more strings, and return the combined string. |
| [endsWith](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#endswith) | Check whether a string ends with the specified substring.    |
| [guid](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#guid) | Generate a globally unique identifier (GUID) as a string.    |
| [indexOf](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#indexof) | Return the starting position for a substring.                |
| [lastIndexOf](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#lastindexof) | Return the starting position for the last occurrence of a substring. |
| [replace](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#replace) | Replace a substring with the specified string, and return the updated string. |
| [split](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#split) | Return an array that contains substrings, separated by commas, from a larger string based on a specified delimiter character in the original string. |
| [startsWith](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#startswith) | Check whether a string starts with a specific substring.     |
| [substring](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#substring) | Return characters from a string, starting from the specified position. |
| [toLower](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#toLower) | Return a string in lowercase format.                         |
| [toUpper](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#toUpper) | Return a string in uppercase format.                         |
| [trim](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#trim) | Remove leading and trailing whitespace from a string, and return the updated string. |

## Collection functions

To work with collections, generally arrays, strings, and sometimes, dictionaries, you can use these collection functions.

| Collection function                                          | Task                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [contains](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#contains) | Check whether a collection has a specific item.              |
| [empty](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#empty) | Check whether a collection is empty.                         |
| [first](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#first) | Return the first item from a collection.                     |
| [intersection](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#intersection) | Return a collection that has *only* the common items across the specified collections. |
| [join](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#join) | Return a string that has *all* the items from an array, separated by the specified character. |
| [last](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#last) | Return the last item from a collection.                      |
| [length](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#length) | Return the number of items in a string or array.             |
| [skip](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#skip) | Remove items from the front of a collection, and return *all the other* items. |
| [take](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#take) | Return items from the front of a collection.                 |
| [union](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#union) | Return a collection that has *all* the items from the specified collections. |

## Logical functions

These functions are useful inside conditions, they can be used to evaluate any type of logic.

| Logical comparison function                                  | Task                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [and](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#and) | Check whether all expressions are true.                      |
| [equals](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#equals) | Check whether both values are equivalent.                    |
| [greater](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#greater) | Check whether the first value is greater than the second value. |
| [greaterOrEquals](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#greaterOrEquals) | Check whether the first value is greater than or equal to the second value. |
| [if](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#if) | Check whether an expression is true or false. Based on the result, return a specified value. |
| [less](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#less) | Check whether the first value is less than the second value. |
| [lessOrEquals](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#lessOrEquals) | Check whether the first value is less than or equal to the second value. |
| [not](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#not) | Check whether an expression is false.                        |
| [or](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#or) | Check whether at least one expression is true.               |

## Conversion functions

These functions are used to convert between each of the native types in the language:

- string
- integer
- float
- boolean
- arrays
- dictionaries

| Conversion function                                          | Task                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [array](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#array) | Return an array from a single specified input. For multiple inputs, see [createArray](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#createArray). |
| [base64](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#base64) | Return the base64-encoded version for a string.              |
| [base64ToBinary](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#base64ToBinary) | Return the binary version for a base64-encoded string.       |
| [base64ToString](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#base64ToString) | Return the string version for a base64-encoded string.       |
| [binary](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#binary) | Return the binary version for an input value.                |
| [bool](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#bool) | Return the Boolean version for an input value.               |
| [coalesce](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#coalesce) | Return the first non-null value from one or more parameters. |
| [createArray](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#createArray) | Return an array from multiple inputs.                        |
| [dataUri](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#dataUri) | Return the data URI for an input value.                      |
| [dataUriToBinary](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#dataUriToBinary) | Return the binary version for a data URI.                    |
| [dataUriToString](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#dataUriToString) | Return the string version for a data URI.                    |
| [decodeBase64](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#decodeBase64) | Return the string version for a base64-encoded string.       |
| [decodeDataUri](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#decodeDataUri) | Return the binary version for a data URI.                    |
| [decodeUriComponent](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#decodeUriComponent) | Return a string that replaces escape characters with decoded versions. |
| [encodeUriComponent](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#encodeUriComponent) | Return a string that replaces URL-unsafe characters with escape characters. |
| [float](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#float) | Return a floating point number for an input value.           |
| [int](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#int) | Return the integer version for a string.                     |
| [json](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#json) | Return the JavaScript Object Notation (JSON) type value or object for a string or XML. |
| [string](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#string) | Return the string version for an input value.                |
| [uriComponent](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#uriComponent) | Return the URI-encoded version for an input value by replacing URL-unsafe characters with escape characters. |
| [uriComponentToBinary](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#uriComponentToBinary) | Return the binary version for a URI-encoded string.          |
| [uriComponentToString](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#uriComponentToString) | Return the string version for a URI-encoded string.          |
| [xml](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#xml) | Return the XML version for a string.                         |
| [xpath](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#xpath) | Check XML for nodes or values that match an XPath (XML Path Language) expression, and return the matching nodes or values. |

## Math functions

These functions can be used for either types of numbers: **integers** and **floats**.

| Math function                                                | Task                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [add](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#add) | Return the result from adding two numbers.                   |
| [div](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#div) | Return the result from dividing two numbers.                 |
| [max](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#max) | Return the highest value from a set of numbers or an array.  |
| [min](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#min) | Return the lowest value from a set of numbers or an array.   |
| [mod](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#mod) | Return the remainder from dividing two numbers.              |
| [mul](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#mul) | Return the product from multiplying two numbers.             |
| [rand](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#rand) | Return a random integer from a specified range.              |
| [range](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#range) | Return an integer array that starts from a specified integer. |
| [sub](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#sub) | Return the result from subtracting the second number from the first number. |

## Date functions

| Date or time function                                        | Task                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [addDays](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#addDays) | Add a number of days to a timestamp.                         |
| [addHours](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#addHours) | Add a number of hours to a timestamp.                        |
| [addMinutes](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#addMinutes) | Add a number of minutes to a timestamp.                      |
| [addSeconds](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#addSeconds) | Add a number of seconds to a timestamp.                      |
| [addToTime](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#addToTime) | Add a number of time units to a timestamp. See also [getFutureTime](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#getFutureTime). |
| [convertFromUtc](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#convertFromUtc) | Convert a timestamp from Universal Time Coordinated (UTC) to the target time zone. |
| [convertTimeZone](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#convertTimeZone) | Convert a timestamp from the source time zone to the target time zone. |
| [convertToUtc](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#convertToUtc) | Convert a timestamp from the source time zone to Universal Time Coordinated (UTC). |
| [dayOfMonth](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#dayOfMonth) | Return the day of the month component from a timestamp.      |
| [dayOfWeek](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#dayOfWeek) | Return the day of the week component from a timestamp.       |
| [dayOfYear](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#dayOfYear) | Return the day of the year component from a timestamp.       |
| [formatDateTime](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#formatDateTime) | Return the timestamp as a string in optional format.         |
| [getFutureTime](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#getFutureTime) | Return the current timestamp plus the specified time units. See also [addToTime](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#addToTime). |
| [getPastTime](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#getPastTime) | Return the current timestamp minus the specified time units. See also [subtractFromTime](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#subtractFromTime). |
| [startOfDay](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#startOfDay) | Return the start of the day for a timestamp.                 |
| [startOfHour](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#startOfHour) | Return the start of the hour for a timestamp.                |
| [startOfMonth](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#startOfMonth) | Return the start of the month for a timestamp.               |
| [subtractFromTime](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#subtractFromTime) | Subtract a number of time units from a timestamp. See also [getPastTime](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#getPastTime). |
| [ticks](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#ticks) | Return the `ticks` property value for a specified timestamp. |
| [utcNow](https://docs.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions#utcNow) | Return the current timestamp as a string.                    |