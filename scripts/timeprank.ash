script "Procedural Time Prank Generator";
notify "soolar the second";
since r17283;

string [string] [int] buckets;
string currBucket;

void BucketSet(string bucketName)
{
  currBucket = bucketName;
}

void BucketAdd(string word)
{
  buckets[currBucket][buckets[currBucket].count()] = word;
}

void BucketAdd(boolean [string] words)
{
  foreach word in words
    BucketAdd(word);
}

string BucketGet(string bucketName)
{
  int entries = buckets[bucketName].count();
  if(entries == 0)
  {
    print("Empty bucket #{" + bucketName + "}");
    return "EMPTY BUCKET " + bucketName;
  }
  if(entries == 1)
  {
    print("Singular bucket #{" + bucketName + "}");
    return buckets[bucketName][0];
  }
  return buckets[bucketName][random(entries)];
}

BucketSet("exclamation");
BucketAdd($strings[
  OMG, WOW, AMAZING, WHAT THE HECK, OM GOD, OH MY GOSH, I CAN'T BELIEVE IT, HOLY COW, WHAT ON EARTH,
  WHOA, DANG DUDE, GOLLY GEE WILLICKERS, GOODNESS GRACIOUS, JEEZO FLIP, WHAT IN TARNATION,
  GOSH DANG, OH NO, HEY, I AM COMPLETELY FLABBERGASTED, OMFG, LMAO, LOL, WTF, NO WAY, CHECK IT OUT,
  OH MY GOODNESS GRACIOUS GOLLY GEE WILLICKERS, WHAT THE HECKING HECK, HOO BOY, WHAT THE HEY,
  NO WAY I DON'T BELIEVE IT AT ALL, THIS IS INCREDIBLE, NANI, <3~MOE~MOE~KYUN~<3, TODOKETE,
  CAN YOU BELIEVE THIS GUY, NOPE NOPE NOPE NOPE NOPE, RADICAL, THAT'S ENOUGH INTERNET FOR TODAY,
  IT'S THE NUTSHACK, GOSH, JEEZ, JEEZ LOUISE, JESUS TAP-DANCING CHRIST, GREAT GOOGLY MOOGLY,
  HOROSHO, SWEET MERCIFUL CRAP, FOR CRYIN' OUT LOUD, SWEET SASSY MOLASSY, NERTS, JIMINY CRICKET,
  OH MY HECK, ZARK OFF, MAMMA PAJAMA, HOLY GUACAMOLE, MOM'S SPAGHETTI, ISHYGDDT, CRIMINALITIES,
  OH BOY, DOODLEBUGS, WELL BUTTER MY BUNS, HOT CROSS BUNS, HOT DIGGITY DOG, DAGNABBIT,
  WELL TIE ME DOWN AND SPANK MY BOTTOM WITH A WET FISH, JUMPIN' CATFISH, CHEESE AND RICE,
  WELL SLAP ME SILLY AND CALL ME SUSAN, SWEET ZOMBIE JESUS, BY THE RINGS OF SATURN, YE GODS,
]);
BucketAdd("IS THIS LORE#{?}"); // asking the important questions
BucketAdd("Yay, Jick!"); // THE MOST IMPORTANT EXCLAMATION
BucketAdd("Yay, Jick!"); // SO IMPORTANT, I ADDED IT TWICE
BucketAdd("Yay, Jick!"); // HOLD ON, MAKE THAT THREE TIMES

BucketSet("!");
BucketAdd("!!!!11!");
BucketAdd("!111!1!!!!");
BucketAdd("!");
BucketAdd("!!@");
BucketAdd("!!!!!11");
BucketAdd("!!");
BucketAdd("!1");
BucketAdd(".!");
BucketAdd("?!!");
BucketAdd("!?!");
BucketAdd("#{!}#{!}"); // the possibility of this chaining is very much desired behavior

BucketSet("?");
BucketAdd("?");
BucketAdd("?>");
BucketAdd("?/");
BucketAdd("/");
BucketAdd("?!!/1?!");
BucketAdd("?????");
BucketAdd("????");
BucketAdd("?/??");
BucketAdd("?!??!?");
BucketAdd("???>");
BucketAdd("?///???");
BucketAdd("#{?}#{?}"); // it's astronomically unlikely that this will chain so much it breaks


BucketSet("gladjective"); // I'm not sorry
BucketAdd($strings[
  happy, hilarious, amazing, splendiforous, splendid, totally radical, gladiforous, fantastic,
  sicknasty radicool off the handle, fantabulous, generous, dank, awesome, kawaii, sugoi, adroit,
  clever, resourceful, arcadian, serene, comely, attractive, wonderful, efficacious, jocular,
  playful, luminous, munificent, lavish, propitious, auspicious, advantageous, benevolent,
  salubrious, healthful, healthy, excellent, sagacious, wise, discerning, moe,
]);

BucketSet("sadjective"); // super not apologizing
BucketAdd($strings[
  mean, angry, dangerous, scary, sad, lame, boring, terrible, atrocious, awful, trashtacular, ugly,
  gross, pathetic, DERANGED, psychotic, cursed, lonely, pitiful, mad, disgusting, repulsive,
  triggered, baleful, deadly, foreboding, bellicose, quarrelsome, belligerent, boorish, crude,
  insensitive, calamitous, disastrous, caustic, corrosive, sarcastic, corpulent, obese, crapulous,
  defamatory, dowdy, shabby, shoddy, crappy, craptacular, feckless, weak, irresponsible, execrable,
  wretched, detestable, invidious, resentful, encious, obnoxious, jejune, dull, puerile, lachrymose,
  tearful, mordant, biting, incisive, pungent, sleazy, spooky, stinky, rank, nefarious, wicked,
  noxious, harmful, corrupting, obtuse, blunt, stupid, pernicious, injurious, petulant, rude,
  ill-mannered, impolite, banal, querulous, cranky, whiny, rebarbative, irritating, repellent,
  rhadamanthine, risible, laughable, hilarious (in a bad way), funny (but not the good kind),
  turgid, swollen, pompous, withering, devastating, destructive, powerless, pointless, pitiable,
]);

BucketSet("adjective");
BucketAdd($strings[
  little, old, young, scared, ordinary, normal, plain, moderately attractive, average, acceptable,
  passable, decent, reasonably intelligent, adequate, weird, bizarre, strange, abnormal, adamant,
  contumacious, didactic, dilatory, equanimous, endemic, fastidious, meticulous, picky, fecund,
  friable, fulsome, garrulous, wordy, talkative, guileless, naive, gustatory, impudent,
  contemptuous, insolent, insidious, subtle, limpid, simple, loquacious, artificial, judicious,
  mendacious, deceptive, pretentious, parsimonious, frugal, puckish, impish, quiescent, inactive,
  untroublesome, lazy, sclerotic, serpentine, spasmodic, excitable, taciturn, quiet, reticent,
  closemouthed, tenacious, persistent, cohesive, tremulous, nervous, trembling, timid, sensitive,
  ubiquitous, pervasive, inescapable, trenchant, sharp, distinct, uxorious, verdant, voluble, glib,
  voracious, ravenous, insatiable, wheedling, zealous, eager, devoted, dedicated, adventurous,
]);
foreach i,adj in buckets["gladjective"]
  BucketAdd(adj);
foreach i,adj in buckets["sadjective"]
  BucketAdd(adj);
// in rare cases, this will go crazy. intended.
for i from 1 to 5
  BucketAdd("#{adjective} #{adjective}");

BucketSet("character");
BucketAdd($strings[
  girl, boy, lady, cat, hobo, dood, adventurer, CHARACTER, man, convict, dog, doggo, puppy, pupper,
  person, dragon, meme, memer, lad, skeleton, weaboo, Jick, Riff, Hotstuff, CDMoyer, bird,
  elephant, capybara, mouse, rat, doctor, nurse, surgeon, bum, veterinarian, kitty, kitten,
  redditor, anon, website, pixie, fairy, chump, gamer, lawyer, banker, baker, tree, boss, manager,
  bureaucrat, PIC, VIP, rockstar, musician, artist, programmer, hero, champion,
  sea monkee, mer-kin, mother, father, brother, sister, baby, child, Crimbuddha, Uncle Crimbo,
  Rudolphus of Crimborg, crimbot, monkey, owl, mayfly swarm, lovebug, Boris, Jarlsberg,
  Sneaky Pete, your mom, Azazel, Swagger Jack, clannie, diva, fish, duck, goose, Monster Manuel,
  Lady Spookyraven, Izzy the Lizard, Duncan Disorderly, Stradella, Nash Crosby,
  Olaf the Janitor, Grignr, Terri, Asiago, Edam, Blaine, Batfellow,
]);
BucketAdd("Lefty, the Trainer");
BucketAdd("Shifty, the Thief Chief");
BucketAdd("Torg, the Trainer");
BucketAdd("Gunther, Lord of the Smackdown");
BucketAdd("Brie, the Trainer");
BucketAdd("Gorgonzola, the Chief Chef");
BucketAdd("Rodoric, the Staffcrafter");
BucketAdd("Gaia'ajh-dsli Ak'lwej");
BucketAdd("god of #{goodthing}");
BucketAdd("goddess of #{goodthing}");
BucketAdd("god of #{badthing}");
BucketAdd("goddess of #{badthing}");
// Let's just go ahead and add every familiar and monster in the game, why not
foreach m in $monsters[]
  BucketAdd(m.to_string());
foreach f in $familiars[]
  BucketAdd(f.to_string());
foreach t in $thralls[]
  BucketAdd(t.to_string());

BucketSet("goodthing");
BucketAdd($strings[
  joy, meme, happiness, bravery, family, wealth, tranquility, life, blessing, luck, comfort,
  synergy, good thing, fortune, bravery, pleasure, accomplishment, all things that are good,
  barrel, alchohol, booze, rum, vodka, whiskey, ninjas, pirates, robot, computer,
  muscle, beefiness, fortitude, muscleboundness, strengthliness, strongness, mysticality,
  enchantedness, magicalness, mysteriousness, wizardliness, moxie, cheek, chutzpah, roguishness,
  sarcasm, smarm, pulchritude, chain lightning, lightning, magic, lightning magic, // I like lightning ok leave me alone
  drunkenness, fullness, amazing rng, Spookloween, Spookloween name, Crimbo, optimality,
  gold star, silver moon, bronze button, leaderboard run, karma, royal tea, smithsness,
  turtle, pasta, sauce, accordions, dancing, snow, halation, determination, DETERMINATION,
]);

BucketSet("badthing");
BucketAdd($strings[
  DANGER, fear, terror, sorrow, plague, disease, poverty, anger, violence, death, curse, tear,
  hurtly, downward spiral, horror, sadness, madladdity, pain, rage, dying, bad thing, misfortune,
  overdrinking early on accident, misclick, accidental adventure, wasted turn, terrible rng,
  only being able to use the Copperhead route, getting the same pirate insult ten times in a row,
  black cat run, regret, fury, seal,
]);

BucketSet("thing");
foreach i,s in buckets["goodthing"]
  BucketAdd(s);
foreach i,s in buckets["badthing"]
  BucketAdd(s);
// Aside from all the goodthings and all the badthings, let's just go ahead and add every item
foreach it in $items[]
  BucketAdd(it.to_string());

BucketSet("gladverb"); // I understand that this is poorly punned, these are not adverbs
BucketAdd($strings[
  bless, bestow, gift, improve, adventure, grant, protect,
]);

BucketSet("gladverbed");
BucketAdd($strings[
  blessed, bestowed, gifted, improved, adventured, granted, protected,
]);

BucketSet("sadverb");
BucketAdd($strings[
  kill, hurt, eat, destroy, splatter, crush, maim, torture, wound, doom,
]);

BucketSet("sadverbed");
BucketAdd($strings[
  killed, hurt, ate, destroyed, splattered, crushed, maimed, tortured, wounded, doomed,
]);

BucketSet("verb");
foreach i,s in buckets["gladverb"]
  BucketAdd(s);
foreach i,s in buckets["sadverb"]
  BucketAdd(s);

BucketSet("verbed");
foreach i,s in buckets["gladverbed"]
  BucketAdd(s);
foreach i,s in buckets["sadverbed"]
  BucketAdd(s);

BucketSet("adverb"); // yes, this is for really reals adverbs
BucketAdd($strings[
  athletically, accidentally, afterwards, almost, always, angrily, annually, anxiously, awkwardly,
  badly, blindly, boastfully, boldly, bravely, briefly, brightly, busily, calmly, carefully,
  carelessly, cautiously, cheerfully, clearly, correctly, courageously, crossly, cruelly, daily,
  defiantly, deliberately, doubtfully, easily, elegantly, enormously, enthusiastically, equally,
  even, eventually, exactly, faithfully, far, fast, fatally, fiercely, fondly, foolishly,
  fortunately, frantically, gently, gladly, gracefully, greedily, happily, hastily, honestly, hourly,
  hungrily, innocently, inquisitively, irritably, joyously, justly, kindly, lazily, less, loosely,
  loudly, madly, merrily, monthly, more, mortally, mysteriously, nearly, neatly, nervously, never,
  noisily, not, obediently, obnoxiously, often, only, painfully, perfectly, politely, poorly,
  powerfully, promptly, punctually, quickly, quietly, rapidly, rarely, really, recklessly, regularly,
  reluctantly, repeatedly, rightfully, roughly, rudely, sadly, safely, seldom, selfishly, seriously,
  shakily, sharply, shrilly, shyly, silently, sleepily, slowly, smoothly, softly, solemnly,
  sometimes, soon, speedily, stealthily, sternly, successfully, suddenly, suspiciously, swiftly,
  tenderly, tensely, thoughtfully, tightly, tomorrow, too, truthfully, unexpectedly, very,
  victoriously, violently, vivaciously, warmly, weakly, wearily, well, wildly, yearly, yesterday,
]);

BucketSet("number");
BucketAdd($strings[
  11, 37, 42, 69, 1337, 2112, 31337, 2, 5, a random multiple of 5, 3.1415926, a bajillion,
]);

BucketSet("timeunit");
BucketAdd($strings[
  second, sec, minute, min, hour, day, month, year, decade, nanosecond, microsecond, picosecond,
  light-mile, light-foot, shake, jiffy, microfortnight, dog year, Friedman, microcentury,
  nanocentury, tatum, adventure, turn, fight, combat, non-combat, semi-rare, ascension, moment,
  season, millisecond, rollover, week, fornight,
]);

BucketSet("timeunits");
BucketAdd($strings[
  seconds, secs, minutes, mins, hours, days, months, years, decades, nanoseconds, microseconds,
  picoseconds, light-miles, light-feet, shakes, jiffies, microfortnights, dog years, Friedmans,
  microcenturies, nanocenturies, tatums, adventures, turns, fights, combats, non-combats,
  semi-rares, ascensions, moments, seasons, milliseconds, rollovers, weeks, fortnights,
]);

BucketSet("place");
// some of these will make no sense, but that's totally fine!
foreach loc in $locations[]
  BucketAdd(loc.to_string());

BucketSet("apology");
BucketAdd($strings[
  sorry, sry, my apologies, my sincerest condolences, I beg your forgiveness, I apologize,
  I'm sorry, I hope you can forgive me, I'm not actually sorry,
]);

BucketSet("bodypart");
BucketAdd($strings[
  ankle, arm, arse, bung, calf, ear, elbow, eye, face, foot, forehead, giblets, groin, head, kidney,
  knee, leg, lower back, neck, nipple, shin, shoulder, skull, solar plexus, thigh, throat,
]);

BucketSet("vowel");
BucketAdd($strings[a, A, e, E, i, I, o, O, u, U]); // no y because I'm letterist

BucketSet("ckx");
BucketAdd($strings[c, C, k, K, x, X]);

BucketSet("messages");
BucketAdd("#{exclamation}#{!} Once there was #{adjective1} #{character1} and then #{adjective1} " +
  "#{character1} was #{sadverbed1} by #{adjective2} #{character2}#{!} FWD this time prank within " +
  "#{number} #{timeunits} or you will be #{sadverbed1} by #{adjective1} #{character1}#{!} " +
  "#{apology} for danger but I would be #{sadverbed1} by #{adjective1} #{character1} if I didn't " +
  "send this to someone, you understand right#{?}");
BucketAdd("#{exclamation} #{exclamation}#{!}#{!} If you forward this message within #{number1} " +
  "#{timeunits1}, the #{gladjective} #{gladjective} #{character} will #{gladverb} you with " +
  "#{gladjective} times for like, the rest of your #{gladjective} life#{?}#{!} But if you don't " +
  "forward it within #{number1} #{timeunits1}, the #{sadjective} #{sadjective} #{character} will " +
  "#{sadverb} you with #{sadjective} times for the entire rest of your whole  #{sadjective} life " +
  "instead. So forward this prank to #{number} #{adjective} adventurers ASAP#{!}");
BucketAdd("Born #{number} #{timeunits} too soon to explore #{place1}, born #{number} #{timeunits} " +
  "too late to explore #{place2}, born just in time to explore #{place3}#{!} #{exclamation}#{!} " +
  "#{place1} is so #{gladjective}, and #{place2} is so #{gladjective}, but #{place3} is totally " +
  "#{sadjective} and #{sadjective}#{!} I wish I could have explored #{place1} or #{place2} instead#{!}");
BucketAdd("It's #{adjective}, this feeling in my #{bodypart}. It's almost as though it came " +
  "fluttering down from #{place}. The #{adjective} color of this #{timeunit} fills me with " +
  "#{thing}. From the moment we #{verb}, the melody of my #{bodypart} has been ringing with " +
  "#{goodthing}. It can't be #{verbed1}, it won't be #{verbed1} -- #{exclamation}#{?} " +
  'Ring out#{!} Shall I name this #{sadjective1} #{badthing1} "#{thing1} #{thing2}"#{?} ' +
  "I can't wait for our #{thing3} to #{verb1}; it's frustrating, but it's a pure-#{bodypart1}ed " +
  "#{goodthing1} called #{goodthing2}. Even in this #{adjective1} fever, I can't #{verb2}. " +
  "I'll accept the #{goodthing3} to #{verb3} in; it's about to #{verb4}#{!} Without a #{thing}, " +
  "without a #{thing}, Our #{thing} changes silently. At the thought of the coming #{timeunit}, " +
  "my #{bodypart}beat quickens. When you feel #{sadjective}, I'll come running right away, " +
  "wanting to #{verb} you #{adverb}, Wherever you are, no matter where, I'll #{verb} high! " +
  "#{verb} up. Before I knew it, my #{adjective} #{thing} grew too #{adjective} to contain. " +
  "It's #{sadjective} to never do more than dream of it, I want you to be mine! " +
  "I don't want to be #{verbed} by your #{adjective} #{bodypart}. Accept all my #{thing} for you " +
  "as it is, #{exclamation}#{!} Ring out#{!} Shall I name this #{sadjective1} #{badthing1} " +
  '"#{thing1} #{thing2}"#{?} ' + "I can't wait for our #{thing3} to #{verb1}; it's frustrating, " +
  "but it's a pure-#{bodypart1}ed #{goodthing1} called #{goodthing2}. Even in this #{adjective1} " +
  "fever, I can't #{verb2}. I'll accept the #{goodthing3} to #{verb3} in; it's about to #{verb4}#{!}");

string swapletter = "";

void adCdhRatcer(buffer b, string c, boolean protect)
{
  // protect basically means only mess with the capitalization
  int rnad = random(100);
  if(rnad < 30)
   c = c.to_lower_case();
  else if(rnad < 60)
    c = c.to_upper_case();

  rnad = random(100);
  if(rnad < 2)
    adCdhRatcer(b, c, protect);

  if(!protect)
  {
    rnad = random(100);
    if(rnad < 5)
    {
      switch(c.to_lower_case())
      {
        case "a": case "e": case "i": case "o": case "u":
          c = BucketGet("vowel");
          break;
        case "c": case "k": case "x":
          c = BucketGet("ckx");
          break;
        case "s": // LISP IT
          if(c == "s")
          {
            adCdhRatcer(b, "t", protect);
            adCdhRatcer(b, "h", protect);
          }
          else
          {
            adCdhRatcer(b, "T", protect);
            adCdhRatcer(b, "H", protect);
          }
          return;
      }
    }

    rnad = random(100);
    if(rnad < 5 && swapletter == "")
    {
      swapletter = c;
      return;
    }
  }

  if(protect)
  {
    b.append(swapletter);
    swapletter = "";
  }
  b.append(c);
  b.append(swapletter);
  swapletter = "";
}

string mAKSpeldBaD(string s)
{
  buffer res;
  matcher m = create_matcher("(\\s*)(\\S+)(\\s*)", s);
  while(m.find())
  {
    res.append(m.group(1));
    string [int] letters = m.group(2).split_string("");
    foreach i,l in letters
    {
      if(i == 0 || i + 1 == letters.count())
        res.adCdhRatcer(l, true);
      else
        res.adCdhRatcer(l, false);
    }
    res.append(m.group(3));
  }

  return res;
}

string ParseBuckets(string s)
{
  string [string] [int] saved;
  buffer res;
  boolean anySubstitutions = false;
  matcher m = create_matcher("([^#]*)#\\{([^\\}\\d]+)(\\d+)?\\}([^#]*)", s);
  while(m.find())
  {
    anySubstitutions = true;
    res.append(m.group(1)); // prefix
    string buckname = m.group(2);
    int instance = 0;
    if(m.group(3) != "")
      instance = m.group(3).to_int();
    string toAdd = ParseBuckets(BucketGet(buckname));
    if(instance != 0)
    {
      if(saved[buckname][instance] != "")
        toAdd = saved[buckname][instance];
      else
        saved[buckname][instance] = toAdd;
    }
    res.append(toAdd);
    res.append(m.group(4)); // suffix
  }

  if(anySubstitutions)
    return res.to_string();
  else
    return s;
}

string ShittyChainMail()
{
  return ParseBuckets(BucketGet("messages"));
}

void TimePrank(string playerName)
{
  string msg = mAKSpeldBaD(ShittyChainMail());
  print(msg);
  if(playerName != "?")
    cli_execute("timespinner prank " + playerName + " msg=" + msg);
}

void main(string playerName)
{
  TimePrank(playerName);
}

