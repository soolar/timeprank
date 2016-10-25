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
  GOSH DANG, OH NO,
]);

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

BucketSet("?");
BucketAdd("?");
BucketAdd("?>");
BucketAdd("?/");
BucketAdd("/");
BucketAdd("?!!/1?!");


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
  gnome, bugbear, knob goblin, hippy, frat orc,
]);
BucketAdd("god of #{goodthing}");
BucketAdd("goddess of #{goodthing}");
BucketAdd("god of #{badthing}");
BucketAdd("goddess of #{badthing}");

BucketSet("badthing");
BucketAdd($strings[
  DANGER, fear, terror, sorrow, plague, disease, poverty, anger, violence, death, curses, tears,
  hurtly, downward spirals, horror, sadness, madladdity, pain, rage, dying, bad things, misfortune,
]);

BucketSet("gladverb"); // I understand that this is poorly punned, these are not adverbs
BucketAdd($strings[
  bless, bestow, gift, improve,
]);

BucketSet("gladverbed");
BucketAdd($strings[
  blessed, bestowed, gifted, improved,
]);

BucketSet("badverb");
BucketAdd($strings[
  kill, hurt, eat, destroy, splatter,
]);

BucketSet("badverbed");
BucketAdd($strings[
  killed, hurt, ate, destroyed, splattered,
]);

BucketSet("number");
BucketAdd($strings[
  11, 37, 42, 69, 1337, 2112, 31337,
]);

BucketSet("timeunit");
BucketAdd($strings[
  seconds, secs, minutes, mins, hours, days, months, years, decades, nanoseconds, microseconds,
  picoseconds, light-miles, light-feet, shakes, jiffies, microfortnights, dog years, Friedmans,
  microcenturies, nanocenturies, tatums,
]);

BucketSet("apology");
BucketAdd($strings[
  sorry, sry, my apologies, my sincerest condolences, I beg your forgiveness,
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
  if(rnad < 3)
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
      }
    }

    rnad = random(100);
    if(rnad < 6 && swapletter == "")
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

