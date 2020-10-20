# distr

Prints a histogram of lines read via stdin, equivalent to `sort | uniq -c | sort -n`, but better.

## Example

Distribution of file extensions in `~/git`:

```bash
$ find ~/git/ -iname "*.*" | sed -E "s/.*\.([^ ]+)\$/\1/g" | distr
[...]
 2619 (  3.49%) map
 2633 (  3.50%) c
 2673 (  3.56%) d
 3063 (  4.08%) timestamp
 3958 (  5.27%) ts
 5418 (  7.21%) json
 6266 (  8.34%) o
 8245 ( 10.98%) jpg
15263 ( 20.32%) js
----- --------- ---
75123 (100.00%) total, 398 buckets
```

## Install

```
make install
```
