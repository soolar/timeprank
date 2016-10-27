script "Procedural Time Prank Generator";
notify "soolar the second";
since r17283;

string [string] [string] bucketsRaw;
file_to_map("timeprank_wordbuckets.txt", bucketsRaw);
foreach m in $monsters[]
  bucketsRaw["character"][m.to_string()] = "";
foreach f in $familiars[]
  bucketsRaw["character"][f.to_string()] = "";
foreach t in $thralls[]
  bucketsRaw["character"][t.to_string()] = "";
foreach it in $items[]
  bucketsRaw["noun"][it.to_string()] = "plural=ITEMPLURAL"; // handled procedurally because ;
foreach loc in $locations[]
  bucketsRaw["place"][loc.to_string()] = ""; // TODO: Maybe use some location metadata

string [string] [string] [string] propertyBucket;
string [string] [string] [int] wordBuckets;

void AddToSubBuckets(string bucket, string word, string [int] properties,
                     int i, string subbucket, int weight)
{
  if(i == properties.count())
  {
    for x from 1 to weight
      wordBuckets[bucket][subbucket][wordBuckets[bucket][subbucket].count()] = word;
  }
  else
  {
    string [int] propsplit = properties[i].split_string("\\s*=\\s*");

    // weight is a meta-property that says to add this word to the subbuckets multiple times
    if(propsplit[0] == "weight")
    {
      if(propsplit.count() != 2)
      {
        print("Weight without value is invalid, see " + bucket + ": " + word);
        return;
      }
      AddToSubBuckets(bucket, word, properties, i + 1, subbucket, propsplit[1].to_int());
      return;
    }

    AddToSubBuckets(bucket, word, properties, i + 1, subbucket, weight);
    if(subbucket != "")
      subbucket += ",";
    subbucket += propsplit[0];
    AddToSubBuckets(bucket, word, properties, i + 1, subbucket, weight);
  }
}

foreach bucket, word, properties in bucketsRaw
{
  string [int] splitprops = properties.to_lower_case().split_string("\\s*;\\s*");
  sort splitprops by value;
  foreach i,prop in splitprops
  {
    string [int] splitprop = prop.split_string("\\s*=\\s*");
    string propname = splitprop[0];

    string propval = "true";
    if(splitprop.count() != 1)
      propval = splitprop[1];
    propertyBucket[bucket][word][propname] = propval;
  }
  AddToSubBuckets(bucket, word, splitprops, 0, "", 1);
}

//foreach buck,sub in wordBuckets
//  print(buck + "[" + sub + "].count() = " + wordBuckets[buck][sub].count());

string BucketGetDescriptor(string descriptor)
{
  matcher m = create_matcher("([^@:]+)(@([^:]+))?(:(.+))?", descriptor);
  if(!m.find())
    return "Faulty bucket request [" + descriptor + "]";
  string bucketNameProvided = m.group(1);
  string bucketName = bucketNameProvided.to_lower_case();
  string allreqs = m.group(3).to_lower_case();
  if(allreqs != "" && m.group(5) != "")
    allreqs += ",";
  string transform = m.group(5).to_lower_case();
  allreqs += transform;
  string [int] reqprops = allreqs.split_string(",");
  sort reqprops by value;
  string subbucket = "";
  foreach i,prop in reqprops
  {
    if(subbucket != "")
      subbucket += ",";
    subbucket += prop;
  }
  int entries = wordBuckets[bucketName][subbucket].count();
  if(entries == 0)
  {
    print("Empty bucket #{" + bucketNameProvided + "}");
    return "<[EMPTY BUCKET " + bucketNameProvided + "(" + subbucket + ")]>";
  }

  string res = wordBuckets[bucketName][subbucket][0];
  if(entries == 1)
    print("Singular bucket #{" + bucketName + "}");
  else
    res = wordBuckets[bucketName][subbucket][random(entries)];

  if(transform != "")
  {
    string propval = propertyBucket[bucketName][res][transform];
    if(propval != "")
    {
      if(propval.char_at(0) == "+")
        res += propval.substring(1);
      else if(propval == "ITEMPLURAL")
        res = res.to_item().plural.to_string();
      else
        res = propval;
    }
  }

  if(bucketName != bucketNameProvided)
  {
    // Only supported cases atm are capitalize the whole thing to caps lock the entire replacement
    // and capitalizing part of it to capitalize the first letter
    if(bucketName.to_upper_case() == bucketNameProvided)
      res = res.to_upper_case();
    else
      res = res.substring(0,1).to_upper_case() + res.substring(1);
  }

  return res;
}

string BucketGet(string fulldescriptor)
{
  string res = "";
  foreach i,desc in fulldescriptor.split_string("\\+")
  {
    if(res != "")
      res += " ";
    res += BucketGetDescriptor(desc);
  }
  return res;
}

string ParseBuckets(string s)
{
  string [int] saved;
  buffer res;
  boolean anySubstitutions = false;
  matcher m = create_matcher("([^#]*)#\\{((\\d+)=)?([^\\}]+)\\}([^#]*)", s);
  while(m.find())
  {
    anySubstitutions = true;
    res.append(m.group(1)); // prefix
    string buckname = m.group(4);
    int instance = 0;
    if(m.group(3) != "")
      instance = m.group(3).to_int();
    string toAdd = "";
    matcher justInstance = create_matcher("^\\d+$", buckname);
    if(justInstance.find())
      instance = buckname.to_int();
    else
      toAdd = ParseBuckets(BucketGet(buckname));
    if(instance != 0)
    {
      if(saved[instance] != "")
        toAdd = saved[instance];
      else
        saved[instance] = toAdd;
    }
    res.append(toAdd);
    res.append(m.group(5)); // suffix
  }

  if(anySubstitutions)
    return res.to_string();
  else
    return s;
}

string swapletter = "";

string randstr(boolean [string] options)
{
  int i = random(options.count());
  foreach str in options
  {
    if(i == 0)
      return str;
    i -= 1;
  }
  return "??? how did this happen ???";
}

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
    if(rnad < 4)
    {
      switch(c.to_lower_case())
      {
        case "a": case "e": case "i": case "o": case "u":
          c = randstr($strings[a,e,i,o,u,A,E,I,O,U]);
          break;
        case "c": case "k": case "x":
          c = randstr($strings[c,k,x,C,K,X]);
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
    if(rnad < 4 && swapletter == "")
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

string GenerateMessage()
{
  return ParseBuckets(BucketGet("message"));
}

void TimePrank(string playerName, boolean misspell)
{
  string msg = GenerateMessage();
  if(misspell)
    msg = mAKSpeldBaD(msg);
  print(msg);
  if(playerName != "?")
    cli_execute("timespinner prank " + playerName + " msg=" + msg);
}

void main(string playerName)
{
  TimePrank(playerName, true);
}

