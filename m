Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E0110A
	for <imx@lists.linux.dev>; Sun, 13 Aug 2023 03:32:24 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52256241c66so6710079a12.1
        for <imx@lists.linux.dev>; Sat, 12 Aug 2023 20:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691897543; x=1692502343;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NFrbKrXNxw6reUSTHItqNBO8/8/BWeTJJBWpsls5UZk=;
        b=FKRB4KpEq+IyOsE6Mjk7bksD+np7wrV9vYWFkiAEftjc6e1YRUtksQTK+hGt+tHX91
         NnA3K4tKKgV5Kw9wrzAg0qOohBG+Uv769z3JXzKD8064U8auuGwxmNLC37fK0LGs+S67
         NLpkZZIQft3J+QmQ6En5uuUaq3/Yq31RPLlJeBgbPY0M6myF0mpmjkdaobOQD5VG4ekz
         7N/VHuzhMpXQZSPIymaF9ynXzJTDtQszMyxSzGJCCFUkGAUV98vLLL49JczFn7uBUY+z
         9We96o4VznqJl0eeTQPzvTiTtjJjFrEBbvK5GMP+/PPCrfGFtQg9WJApOBBphuPMCYXD
         HF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691897543; x=1692502343;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFrbKrXNxw6reUSTHItqNBO8/8/BWeTJJBWpsls5UZk=;
        b=IRoyy+9+f//9lsKJO6H/3YAL9BIEoAd1Bt9GeJ7uGgYhqb5PhydDEPTF/bMgGThgVC
         9Jw6ZdebZGo1G8WENf2StBpeKMoV2aiupBpvPaGQGzx73Rh0v1kvqXrwT5Pmh8c23zai
         Gvn89zWOpiwUhLuzWdVwtlSE4qQzz3DinxsSGKl9aOMNUdZRDjHq5/pu40su07q5gS2r
         RGAycoMk02+lw5uOXE4Bsc01Wiv1TNXZ9W49tW/AcXIS3nMZJz8jBvAWEmOwPBpu0aIg
         js8om9JN5yzt9+iD4g0gsc5qm8NN4rXdvPvzuI7vGvGhb3YpICg3TfbKJj9EqJ3ppzG4
         XefA==
X-Gm-Message-State: AOJu0Ywf6nYYosoV3fZL7lVPphEIAOm3K1/6/sRXmjRUdQEZnPhd3Uo7
	PMWKfhlsoOEeYA6RSAR782EywJknVDvD8xzejYw=
X-Google-Smtp-Source: AGHT+IEQopq2K0xdZ4mtfmvLhD/jMAHuep44g8VXif6ruhNVG5AkrW/fHk7pVpopnwrtYJW3fap5yaZp7Cqo5UdRTcw=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:c683:0:b0:523:3e27:caa7 with SMTP id
 n3-20020aa7c683000000b005233e27caa7mr5365744edq.20.1691897542831; Sat, 12 Aug
 2023 20:32:22 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 12 Aug 2023 20:32:22 -0700
In-Reply-To: <CAC5d1W+=DxsHcGsPQ5NjKHbTWGgNnQuyQkj23imyz3dyMe6gYQ@mail.gmail.com>
References: <CAC5d1W+=DxsHcGsPQ5NjKHbTWGgNnQuyQkj23imyz3dyMe6gYQ@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Sat, 12 Aug 2023 20:32:22 -0700
Message-ID: <CAC5d1WLJHVz862XmJVZOgT0TsMLviF=dSK--JhaVWt8-YG=wRQ@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > > > Browser extension test thread for quick email replies.


> > > > Please Ignore.


> > > Testing quoting and email system.


Testing multiple select.
