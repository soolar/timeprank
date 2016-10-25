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

string BucketGet(string bucketName)
{
  return buckets[bucketName][random(buckets[bucketName].count())];
}

BucketSet("exclamation");
BucketAdd("OMG");
BucketAdd("WOW");
BucketAdd("AMAZING");
BucketAdd("WHAT THE HECK");
BucketAdd("OM GOD");
BucketAdd("OH MY GOSH");
BucketAdd("I CAN'T BELIEVE IT");
BucketAdd("HOLY COW");
BucketAdd("WHAT ON EARTH");
BucketAdd("WHOA");
BucketAdd("DANG DUDE");
BucketAdd("GOLLY GEE WILLICKERS");
BucketAdd("GOODNESS GRACIOUS");
BucketAdd("JEEZO FLIP");
BucketAdd("WHAT IN TARNATION");
BucketAdd("GOSH DANG");
BucketAdd("OH NO");

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

BucketSet("adjective");
BucketAdd("DERANGED");
BucketAdd("little");
BucketAdd("old");
BucketAdd("young");
BucketAdd("sad");
BucketAdd("angry");
BucketAdd("happy");
BucketAdd("generous");
BucketAdd("dank");
BucketAdd("scared");
BucketAdd("lonely");
BucketAdd("pitiful");
BucketAdd("pathetic");
BucketAdd("awesome");
BucketAdd("mad");
BucketAdd("kawaii");
BucketAdd("sugoi");
BucketAdd("lame");
BucketAdd("disgusting");
BucketAdd("repulsive");
BucketAdd("triggered");
// in very rare cases, this will go crazy. intended.
BucketAdd("#{adjective} #{adjective}");
BucketAdd("#{adjective} #{adjective}");
BucketAdd("#{adjective} #{adjective}");
BucketAdd("#{adjective} #{adjective}");
BucketAdd("#{adjective} #{adjective}");

BucketSet("gladjective"); // I'm not sorry
BucketAdd("happy");
BucketAdd("hilarious");
BucketAdd("amazing");
BucketAdd("splendiforous"); // is that how you spell that? eh, whatever
BucketAdd("splendid");
BucketAdd("totally radical");
BucketAdd("sicknasty radicool off the handle"); // NOT. SORRY.
BucketAdd("gladiforous"); // also not sure that that's spelled right, not that it's a real word
BucketAdd("fantastic");
BucketAdd("fantabulous");

BucketSet("badjective"); // super not apologizing
BucketAdd("mean");
BucketAdd("angry");
BucketAdd("dangerous");
BucketAdd("scary");
BucketAdd("sad");
BucketAdd("lame");
BucketAdd("boring");
BucketAdd("terrible");
BucketAdd("atrocious");
BucketAdd("awful");
BucketAdd("trashtacular");
BucketAdd("ugly");
BucketAdd("gross");
BucketAdd("pathetic");

BucketSet("character");
BucketAdd("girl");
BucketAdd("boy");
BucketAdd("lady");
BucketAdd("cat");
BucketAdd("hobo");
BucketAdd("dood");
BucketAdd("adventurer");
BucketAdd("CHARACTER");
BucketAdd("man");
BucketAdd("convict");
BucketAdd("dog");
BucketAdd("doggo");
BucketAdd("pupper");
BucketAdd("person");
BucketAdd("dragon");
BucketAdd("meme");
BucketAdd("memer");
BucketAdd("lad");

BucketSet("badthing");
BucketAdd("DANGER");
BucketAdd("scary");
BucketAdd("frighten");
BucketAdd("TERROR");
BucketAdd("hurtly");

BucketSet("badstuff");
BucketAdd("kill");
BucketAdd("die");
BucketAdd("hurt");
BucketAdd("ate");
BucketAdd("splattered");
BucketAdd("kill with #{badthing}");

BucketSet("number");
BucketAdd("11");
BucketAdd("37");
BucketAdd("69");

BucketSet("timeunit");
BucketAdd("second");
BucketAdd("secs");
BucketAdd("minutes");
BucketAdd("mins");

BucketSet("apology");
BucketAdd("sorry");
BucketAdd("sry");
BucketAdd("my apologies");

BucketSet("vowel");
BucketAdd("a");
BucketAdd("A");
BucketAdd("e");
BucketAdd("E");
BucketAdd("i");
BucketAdd("I");
BucketAdd("o");
BucketAdd("O");
BucketAdd("u");
BucketAdd("U");
// no y because I'm letterist

BucketSet("ckx");
BucketAdd("c");
BucketAdd("C");
BucketAdd("k");
BucketAdd("K");
BucketAdd("x");
BucketAdd("X");

BucketSet("messages");
BucketAdd("#{exclamation}#{!} Once there was #{adjective1} #{character1} and then #{adjective1} " +
  "#{character1} was #{badstuff1} by #{adjective2} #{character2}#{!} FWD this time prank within " +
  "#{number} #{timeunit} or you will be #{badstuff1} by #{adjective1} #{character1}#{!} " +
  "#{apology} for danger but I would be #{badstuff1} by #{adjective1} #{character1} if I didn't " +
  "send this to someone you understand right#{?}");
BucketAdd("#{exclamation} #{exclamation}#{!}#{!} If you forward this message within #{number1} " +
  "#{timeunit1}, the #{gladjective} #{gladjective} #{character} will bless you with " +
  "#{gladjective} times for like, the rest of your #{gladjective} life#{?}#{!} But if you don't " +
  "forward it within #{number1} #{timeunit1}, the #{badjective} #{badjective} #{character} will " +
  "curse you with #{badjective} times for the entire rest of your whole  #{badjective} life " +
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

