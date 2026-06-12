Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC24B369219
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 21:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300571; cv=pass; b=pCVHa58PVzO3BsPlWYZ9ZgcA6nPnOpeGQfI8Idcw35x1zfNETDguM3WOD4uh6j/qJhp2A4V735TPf0RnWKi8J4GFdp+JqGH1N+z3tPoXzsZFIcici1RNG5GtHwyNV5JX+YiFd9P0T6MKsxANWKkBUAmg7YWwLT4kcMxXpQsE4SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300571; c=relaxed/simple;
	bh=Y3EEbGOYPpMP5EWHBh2QepkaHZONirE7XdqpYFAxN3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oib/8ljexbANYrDqo+oZVcwdjJPfg+ZUuWhIrnVqXA64nW5Z+wopSwToy/4PNDVnZFRowHcdUFGeoAM4fDKWiVFXB+aSLyzKMmR0CnhD9iumGJNME8jqgnygWs76p18E1PhYCAHpa+QWkKbTP11GL61vhpr9tVvdBvsOnTyMOiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGL0dSwc; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGL0dSwc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0a5354da1so12703215ad.0
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 14:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781300570; cv=none;
        d=google.com; s=arc-20240605;
        b=eqKopgTgtroNVo3MZyAakJNhgiU3+4EOJxyUg7jn2ggubNqiWrrLhA9TXb+Uv8fX26
         HOey4lhNyBhNKyLfdjEKkxkV3xNwY1SqF67ttNfO3NucLbLw4hxaqdtsDgC7obekYhf2
         kK1qyBdwE/17py/PwMgg4bYEIBNikv/N5IRUV99GkcOurBlYUjXsL3G5NoDHswx2Py65
         xinQptlfrUnKE9M4Kw0Odv07GTzHYwVZfcNHHbL6qtAv21KnG6YJHjr30I53lMYb//i0
         Bq3naJR23iSVHKYQ3HlMKXjnQZaLKvzwIhOmBjub4Zl0Nozlzzss21sc17vocsZ49z8P
         S+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=;
        fh=cGYDswzsUMM9kRHuzr99RPT/nrEPd8HLjx/80mClxsM=;
        b=BaH1vNT4IG9GliITvQCnxGVTXVYRGDD5mPq5YgQg5bGHVPw/cihRb2LaC254oHarfu
         5cN4C3DDjlypVAmb1oksa3EcvHx0oojOqKBEWXfKKlzlkgUsbydI9uouxHJcG6G+OaAI
         sEEPV9JWqy05aoPhtulpKfMCzfITfaQAfRwU1WCePGZWpcVwu7RaZewkiOdfKQlSOfAz
         r/EGc9uNBKb9qYygE+9QxzXnhdVpZJbwjNec758roC16Axy6g1YAeDf44yHxUv2vQ3i2
         6nTWm4qxgk1AajP+P+DP2rA9qN5M/GRziYCzvsHfnKjFPNLQ6jd3Cma9gnwbbalb8GXT
         YcBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781300570; x=1781905370; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=;
        b=GGL0dSwcacKc5p+bfiF1N9C46sAqg3YCzzUpg5ItfryDVlju+qCRTbm9RknkEs0M6X
         ArQO6yk0xKcroZ82vI1IdsQirhfk/yRi4eLXW30myzZGaifQoyGq8jwrmtdGfbn/jnIJ
         KvZvBpWF9baP7cbzH8WWuDPW7ppo29LJlaqEUxrlZPT5Z5BQBVqGkIR7hjbuja0XlpxJ
         djDe/3VhRJHx1Z/IprGNW8kjN7NJdDvbBq6cR3rthOzHDW7ANmJ10ZdR4rG8s/ZR41za
         dr3w6UTniofFWiyQ8907+HKPPn2UKvPipuZzuMeomk6YpAjt6sjVvWHiEBWEUpxoKY9k
         9OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781300570; x=1781905370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vJ1NEAP1pi8XKUKeidNyFAtITrieBzkmoPXCAEf4CA=;
        b=hyNMwnxFEGtHiTqG88XO4uQloQxZqCAuGMr5eFrWgZBXYugZJcQO6gNjVYI4yRP5RA
         P13bWep1V13bSeFwlrpguwphD6HhP/MghOhgK3NZUzUySkilgR3uulHZnvLjq/Svtgrz
         JU4ZqK/IThl0WwBChlh7NR+GdFjR/CS1Se7OJCWJO+xsGWkbcXN8b/OzAM7NkPYlEKtZ
         G73Tgyx0TNgGnpFWbzyv3VGddxg/XoccSjM6P7gy3UAsloISf71MVnlhCcRvg9yZLupN
         wC2ovYl2eYUMN0kQVgNi8zXUw/D3iQYHgjyqukHUUkasKHaSQODPjErqY5UmF2k/bERH
         jf1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9bdt5cq7ZrQA+WIXLCDITYa2z2rDh2BHLYWiQHXCu4aOGwZ0yfWpKnTp8MU94LPmo9Ak4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGTrJGgJzi28smvyqa2SVrVnJ2QXm6qec9VVvTAJ4TJ2dbPwJ6
	H6ornndvsS5+T7ehE9qJMoDaTDB5h2n7w2qXFEpLc7sQIjGPLc3fT1D4gWLfX6Vt3oNncpzO5Lw
	86W5H6PcgUwH0B928+08Mr+Su7uwWXHv+0KvM
X-Gm-Gg: Acq92OHGBySYEJMLjAzvQpuQiG7dUzRmJp1N/GEcBDOHSEOfl+TG2WXCgsZURVdxzyh
	7qknFAd3u+ms2WwdLUowP4xiPdTuOM2Vay0vv/x/y0RETfCjZpAzgQgWWfXsFKLAelPlHndzm64
	R8kmVLv7Sx2KRdRFgLIM/4iosHPsyZ7zr99upv0mUlD4f7LSaP7BBS/9VsjaGUsTWLDpvKa3LkN
	RaOiLvg/AAzBWamUGBluM2bVZf9y8XPwkLji3OQJDJNzeCgohKTHgsbpc1TdPFs5YQe2yTCZx0v
	dpWbJPHonsu9OyZPutFY0tkUFiJvBMVFNAUsE67ST9SmGg2HVkSuOENnvD3Ksc9gF/h6Llla
X-Received: by 2002:a17:903:2290:b0:2c1:88a1:9839 with SMTP id
 d9443c01a7336-2c3fb4ec546mr42132845ad.11.1781300570163; Fri, 12 Jun 2026
 14:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612132639.78086-1-phucduc.bui@gmail.com> <20260612132639.78086-12-phucduc.bui@gmail.com>
 <aiwgIjVqa4PeGjRQ@sirena.co.uk>
In-Reply-To: <aiwgIjVqa4PeGjRQ@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 13 Jun 2026 04:42:38 +0700
X-Gm-Features: AVVi8CcQ5wnxCnP2P6gAEQ2cG8ISmqVV88AetkLUV34w5sJRMS1FX2oxjLgXEA0
Message-ID: <CAABR9nFAaLgjUURzJjuH+vHwkExK2sq7Nu2jKC1Ge5+gLxFfiA@mail.gmail.com>
Subject: Re: [PATCH 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for the review.

>
> > -     dev_dbg(psc_dma->dev, "cold reset\n");
> > +     scoped_guard(mutex_lock, &psc_dma->mutex) {
> > +             dev_dbg(psc_dma->dev, "cold reset\n");
>
> mutex_lock not mutex?

Sorry for this oversight.

As mentioned in the cover letter, all files were compile-tested except
mpc5200_dma and mpc5200_psc_ac97.
I'll take a closer look next week and send a v2.

Best regards,
Phuc
