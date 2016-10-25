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
  return buckets[bucketName][random(buckets[bucketName].count())];
}

BucketSet("exclamation");
BucketAdd($strings[
  OMG, WOW, AMAZING, WHAT THE HECK, OM GOD, OH MY GOSH, I CAN'T BELIEVE IT, HOLY COW, WHAT ON EARTH,
  WHOA, DANG DUDE, GOLLY GEE WILLICKERS, GOODNESS GRACIOUS, JEEZO FLIP, WHAT IN TARNATION,
  GOSH DANG, OH NO, HEY, I AM COMPLETELY FLABBERGASTED, OMFG, LMAO, LOL, WTF, NO WAY, CHECK IT OUT,
]);
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
  sicknasty radicool off the handle, fantabulous, generous, dank, awesome, kawaii, sugoi,
]);

BucketSet("badjective"); // super not apologizing
BucketAdd($strings[
  mean, angry, dangerous, scary, sad, lame, boring, terrible, atrocious, awful, trashtacular, ugly,
  gross, pathetic, DERANGED, psychotic, cursed, lonely, pitiful, mad, disgusting, repulsive,
  triggered,
]);

BucketSet("adjective");
BucketAdd($strings[
  little, old, young, scared,
]);
foreach i,adj in buckets["gladjective"]
  BucketAdd(adj);
foreach i,adj in buckets["badjective"]
  BucketAdd(adj);
// in rare cases, this will go crazy. intended.
for i from 1 to 5
  BucketAdd("#{adjective} #{adjective}");

BucketSet("character");
BucketAdd($strings[
  girl, boy, lady, cat, hobo, dood, adventurer, CHARACTER, man, convict, dog, doggo, puppy, pupper,
  person, dragon, meme, memer, lad, spider, skeleton, weaboo, Jick, Riff, Hotstuff, CDMoyer, bird,
  elephant, capybara, mouse, rat, doctor, nurse, surgeon, bum, veterinarian, kitty, kitten,
  redditor, anon, website, pixie, fairy, chump, gamer, lawyer, banker, baker, tree, boss, manager,
  bureaucrat, PIC, VIP, rockstar, musician, artist, programmer, hero, champion, penguin mafioso,
  gnome, bugbear, knob goblin, hippy, frat orc, giant, neckbeard, neckbeard giant, witchess knight,
  knob goblin embezzler, rain king, naughty sorceress, Ed the UNDYING, sea monkee, mer-kin, mother,
  father, brother, sister, baby, child, Crimbuddha, Rudolphus of Crimborg, Uncle Crimbo, crimbot,
  warbear, hand turkey, mayfly swarm, lovebug, artistic goth kid, Intergnat, Boris, Jarlsberg,
  Sneaky Pete, your mom, Puck Man, Ms. Puck Man, Azazel, Swagger Jack, vampire, werewolf, ghost,
  zombie, ghoul, lich, clannie, diva, fish, duck, goose, slime, source agent, Monster Manuel,
  Lord Spookyraven, Lady Spookyraven, Izzy the Lizard, Duncan Disorderly, Stradella, Nash Crosby, 
  Olaf the Janitor, Grignr, Terri, Asiago, Edam, Blaine, Batfellow, The Jokester, hobo monkey,
  monkey, golden monkey, fist turkey, grim brother, grimstone golem, galloping grill, grim brother,
  machine elf, rockin' robin, pottery barn owl, owl, BRICKO chick, pair of stomping boots,
  steam-powered cheerleader, adventurous spelunker, rock lobster, reanimated reanimator, mosquito,
  jumpsuited hound dog, nanorhino, slimeling, nosy nose, gelatinous cubeling, El Vibrato megadrone,
  feral kobold, warbear drone, Xiblaxian holo-companion, exotic parrot, purse rat, mayonnaise wasp,
  apathetic lizardman, grouper groupie, reassembled blackbird, robogoose, ghost pickle on a stick,
  MagiMechTech MicroMechaMech, midget clownfish, lil' barrel mimic, smiling rat, cocoabo, tomb rat,
  star starfish, twitching space critter, animated macaroni duck, mutant fire ant, leprechaun,
]);
BucketAdd("Lefty, the Trainer");
BucketAdd("Shifty, the Thief Chief");
BucketAdd("Torg, the Trainer");
BucketAdd("Gunther, Lord of the Smackdown");
BucketAdd("Brie, the Trainer");
BucketAdd("Gorgonzola, the Chief Chef");
BucketAdd("Rodoric, the Staffcrafter");
BucketAdd("Shub-Jigguwatt, Elder God of Violence");
BucketAdd("Yog-Urt, Elder Goddess of Hatred");
BucketAdd("Gaia'ajh-dsli Ak'lwej");
BucketAdd("god of #{goodthing}");
BucketAdd("goddess of #{goodthing}");
BucketAdd("god of #{badthing}");
BucketAdd("goddess of #{badthing}");

BucketSet("goodthing");
BucketAdd($strings[
  joy, memes, happiness, bravery, family, wealth, tranquility, life, blessings, luck, comfort,
  synergy, good things, fortune, bravery, pleasure, accomplishment, all things that are good,
  barrels, alchohol, booze, rum, vodka, whiskey, rum, ninjas, pirates, robots, computers,
  muscle, beefiness, fortitude, muscleboundness, strengthliness, strongness, mysticality,
  enchantedness, magicalness, mysteriousness, wizardliness, moxie, cheek, chutzpah, roguishness,
  sarcasm, smarm, pulchritude, chain lightning, lightning, magic, lightning magic, // I like lightning ok leave me alone
  drunkenness, fullness, amazing rng, Spookloween, Spookloween names, Crimbo, optimality,
  gold stars, silver moons, bronze buttons, leaderboard runs, karma, royal tea, smithsness,
  turtles, pasta, sauce, accordions, dancing,
]);

BucketSet("badthing");
BucketAdd($strings[
  DANGER, fear, terror, sorrow, plague, disease, poverty, anger, violence, death, curses, tears,
  hurtly, downward spirals, horror, sadness, madladdity, pain, rage, dying, bad things, misfortune,
  overdrinking early on accident, misclicking, accidental adventures, wasted turns, terrible rng,
  only being able to use the Copperhead route, getting the same pirate insult ten times in a row,
  black cat runs, regret, fury, seals,
]);

BucketSet("gladverb"); // I understand that this is poorly punned, these are not adverbs
BucketAdd($strings[
  bless, bestow, gift, improve, adventure, grant, protect,
]);

BucketSet("gladverbed");
BucketAdd($strings[
  blessed, bestowed, gifted, improved, adventured, granted, protected,
]);

BucketSet("badverb");
BucketAdd($strings[
  kill, hurt, eat, destroy, splatter, crush, maim, torture, wound, doom,
]);

BucketSet("badverbed");
BucketAdd($strings[
  killed, hurt, ate, destroyed, splattered, crushed, maimed, tortured, wounded, doomed,
]);

BucketSet("number");
BucketAdd($strings[
  11, 37, 42, 69, 1337, 2112, 31337, 2, 5, a random multiple of 5, 3.1415926, a bajillion,
]);

BucketSet("timeunit");
BucketAdd($strings[
  seconds, secs, minutes, mins, hours, days, months, years, decades, nanoseconds, microseconds,
  picoseconds, light-miles, light-feet, shakes, jiffies, microfortnights, dog years, Friedmans,
  microcenturies, nanocenturies, tatums, adventures, turns, fights, combats, non-combats,
]);

BucketSet("apology");
BucketAdd($strings[
  sorry, sry, my apologies, my sincerest condolences, I beg your forgiveness, I apologize,
  I'm sorry, I hope you can forgive me, I'm not actually sorry,
]);

BucketSet("vowel");
BucketAdd($strings[a, A, e, E, i, I, o, O, u, U]); // no y because I'm letterist

BucketSet("ckx");
BucketAdd($strings[c, C, k, K, x, X]);

BucketSet("messages");
BucketAdd("#{exclamation}#{!} Once there was #{adjective1} #{character1} and then #{adjective1} " +
  "#{character1} was #{badverbed1} by #{adjective2} #{character2}#{!} FWD this time prank within " +
  "#{number} #{timeunit} or you will be #{badverbed1} by #{adjective1} #{character1}#{!} " +
  "#{apology} for danger but I would be #{badverbed1} by #{adjective1} #{character1} if I didn't " +
  "send this to someone, you understand right#{?}");
BucketAdd("#{exclamation} #{exclamation}#{!}#{!} If you forward this message within #{number1} " +
  "#{timeunit1}, the #{gladjective} #{gladjective} #{character} will #{gladverb} you with " +
  "#{gladjective} times for like, the rest of your #{gladjective} life#{?}#{!} But if you don't " +
  "forward it within #{number1} #{timeunit1}, the #{badjective} #{badjective} #{character} will " +
  "#{badverb} you with #{badjective} times for the entire rest of your whole  #{badjective} life " +
  "instead. So forward this prank to #{number} #{adjective} adventurers ASAP#{!}");

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
  return mAKSpeldBaD(ParseBuckets(BucketGet("messages")));
}

void TimePrank(string playerName)
{
  string msg = ShittyChainMail();
  print(msg);
  if(playerName != "?")
    cli_execute("timespinner prank " + playerName + " msg=" + msg);
}

void main(string playerName)
{
  TimePrank(playerName);
}

