module QueryConverter
  def single_mood
    return 'jazz'           if mood == 'jazzy'
    return 'sad'            if mood == 'glum'
    return 'classical'      if mood == 'classy'
    return 'folk'           if mood == 'folksy'
    return 'summer'         if mood == 'sunny'
    return 'romance'        if mood == 'romantic'
    return 'sex%20sheets'   if mood == 'frisky'
    return mood
  end

  def single_cuisine
    return 'ital'             if cuisine == 'italian'
    return 'mexi'             if cuisine == 'mexican'
    return 'india%20desi'     if cuisine == 'indian'
    return 'america'          if cuisine == 'american'
    return 'japan'            if cuisine == 'japanese'
    return 'viet'             if cuisine == 'vietnamese'
    return 'greek%20dinner'   if cuisine == 'greek'
    return 'french%20dinner'  if cuisine == 'french'
    return cuisine
  end
end