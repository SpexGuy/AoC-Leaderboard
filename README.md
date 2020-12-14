### Usage

```
leader [options]
 options:
   -sort [local|global|stars]
     Set the sort mode for players.
     local: points on the zig leaderboard
     global: points on the global leaderboard
     stars: total stars
   -d <day>
     List the top times for each star on the given day.
     Limited by -limit.
   -top
     List the top players.  Default is local.
     Limited by -limit
   -limit <limit>
     Only list the top <limit> players
   -p <name>
     List all times for the player with the given name.
     multiple players may be specified with -p
   -i <id>
     List all times for the player with the given id.
     multiple players may be specified with -p
   -allplayers
     List all times for all players
   -alldays
     List all days
   -help
     Print help and exit
```

### Example Output

```
> leader -top -sort local -limit 10 -d 13 -d 14 -p SpexGuy -p Nameless
Top Players:
     1: 28 stars, 3319 local,  0 global: SpexGuy (532547)
     2: 28 stars, 3239 local,  0 global: <missing> (66051)
     3: 28 stars, 3146 local,  0 global: void (605427)
     4: 28 stars, 3125 local,  0 global: Emily (211294)
     5: 26 stars, 3077 local,  0 global: Nameless (468779)
     6: 28 stars, 2932 local,  0 global: Gonzalo Diethelm (432826)
     7: 28 stars, 2898 local,  0 global: Andreas Karlsson (36942)
     8: 26 stars, 2898 local,  0 global: travisstaloch (362331)
     9: 26 stars, 2845 local,  0 global: Sendil Kumar N (203199)
    10: 28 stars, 2843 local,  0 global: Robin Voetter (703412)

SpexGuy (532547): 28 stars, 3319 local, 0 global
     1:  0:00:09:49,  0:00:11:29, 
     2:  0:00:13:24,  0:00:20:37,
     3:  0:00:09:16,  0:00:12:26,
     4:  0:00:10:49,  0:00:21:47,
     5:  0:00:04:13,  0:00:07:20,
     6:  0:00:07:01,  0:00:09:48,
     7:  0:00:34:30,  0:00:42:08,
     8:  0:00:08:39,  0:00:16:53,
     9:  0:00:05:05,  0:00:08:36,
    10:  0:00:08:52,  0:00:20:28, 
    11:  0:00:15:29,  0:00:29:29,
    12:  0:00:13:00,  0:00:23:16,
    13:  0:00:06:04,  0:00:45:57, 
    14:  0:00:17:24,  0:00:45:34,

Nameless (468779): 26 stars, 3077 local, 0 global
     1:  0:00:09:14,  0:00:11:01,
     2:  0:00:04:57,  0:00:06:49,
     3:  0:00:07:57,  0:00:09:32,
     4:  0:00:05:07,  0:00:21:48,
     5:  0:00:05:53,  0:00:15:59,
     6:  0:00:07:02,  0:00:10:08,
     7:  0:00:20:16,  0:00:25:29, 
     8:  0:00:06:26,  0:00:11:04,
     9:  0:00:06:18,  0:00:09:45,
    10:  0:00:13:15,  0:00:15:59,
    11:  0:00:18:19,  0:00:20:01,
    12:  0:00:13:26,  0:00:15:38,
    13:  0:00:09:48,  0:00:22:02,

Day 13 Star 1:
     1:  0:00:06:04 SpexGuy
     2:  0:00:09:34 void
     3:  0:00:09:48 Nameless
     4:  0:00:12:45 travisstaloch
     5:  0:00:14:18 Fabio Arnold
     6:  0:00:19:42 vrintle
     7:  0:00:19:54 Anthon van der Neut
     8:  0:00:20:48 jdknezek
     9:  0:00:25:25 Ryan Leavengood
    10:  0:00:26:21 Chris Ozeroff
Day 13 Star 2:
     1:  0:00:22:02 Nameless
     2:  0:00:31:31 <missing>
     3:  0:00:42:13 void
     4:  0:00:45:57 SpexGuy
     5:  0:01:03:44 travisstaloch
     6:  0:01:18:35 jdknezek
     7:  0:02:07:10 Fabio Arnold
     8:  0:02:10:00 vrintle
     9:  0:04:03:09 Gonzalo Diethelm
    10:  0:05:36:58 alexguirre

Day 14 Star 1:
     1:  0:00:11:42 Robin Voetter
     2:  0:00:17:24 SpexGuy
     3:  0:00:28:31 void
     4:  0:00:32:06 Emily
     5:  0:00:37:35 jdknezek
     6:  0:01:01:14 <missing>
     7:  0:01:11:58 Andreas Karlsson
     8:  0:01:14:38 <missing>
     9:  0:01:32:49 Chris Ozeroff
    10:  0:01:49:39 vrintle
    15: --:--:--:-- Nameless
Day 14 Star 2:
     1:  0:00:32:20 Robin Voetter
     2:  0:00:45:34 SpexGuy
     3:  0:00:57:43 Emily
     4:  0:01:10:09 jdknezek
     5:  0:01:27:47 <missing>
     6:  0:02:12:22 Andreas Karlsson
     7:  0:03:05:03 void
     8:  0:03:14:40 Gonzalo Diethelm
     9:  0:03:26:05 <missing>
    10: --:--:--:-- Nameless
```