Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228326AA94
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787927; cv=none; b=teMXRWdoHynAv4OGT84PnMhkku082PVreUfjjrQ2P6H5DW6q15goWEtfXJNfVAWS18l8FKDpALXYwHeZtl5ZVbwNm9q0uu/BXjFiq9rsh6JlA8NFvXDpDEr5gSM8xxBEj9OFT1mJ5H3Ko+3rSJGxSjuAXGbpe4ySwmeJzFM/Euw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787927; c=relaxed/simple;
	bh=moVqkNvoC/U4Kiv+fBtM+ZZcVvqGIdKeTYp5d2BfFYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAEWpdZivG5R1p3Z3QNL/Jc9JlOegMCs6BNEOIDV+sHk8xwz4TeC1tIc0Qm8eBK3yzWz7yWwtsRYbEOovoqFk//kfs8CC9JA80ZYcbnw0MY+YW2ZDbIhEoqAGXu/ZgpwiooNVWzgzKiQKynBoDVNaCrbzZbiPn23f2EfjiplKmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KDNJzVkG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KDNJzVkG"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57933d3e498so698595e87.3
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758787924; x=1759392724; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=;
        b=KDNJzVkGmRoJnvMwBFSrnR1qzJWqaidohApreMKo+WppckKBfFBGFk2NuCYu1AnXP/
         +/DuTrOXSEVJPJHA/V4+/YQiLNB7hcy+vmskSHCvp3cTGif03KfKt3VAPlxdS5LFCzve
         p3ySLX69BYVu09MMO/9ivg3raZAEYsSQILJ7Vh/Uv/e345FqA1NzJ4t01YCxU/90jM3k
         c/bvaPi5FFbcjOHwZZ219O+xMNFFt2vY6tXNfiaZBmz9QnKKpdtCxrJX8DDKwzuAEKxe
         4tdnN4HhhGbKCK69Jj3Rcp6ueyUYDUqQZqlLdtrNO7oOzml3XqxTBshhfdjiBtZPfigk
         S32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787924; x=1759392724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOUEu/+y60hAFjLRRexZAgc5r0XDC4GIpSh+/gdmcBM=;
        b=hoom8pxYSJQMN+AP6kyIp7JeYXNhmwGZ5SDMZywdPy9B5aOyCzE0SpnhVH3jEYeV51
         1EZ02rBjkJQ7ccmOHkEQT3zQ/kokvFBjiaLfauowCQpN2wt0/B6hzCh6xC7g9hn3cCco
         WT512eq4LIzEjfqK5+ltz7iGnH/iEY2fnGTyrh0LZkTQ9bvdu1OFxMgfm4mRAENx0myM
         2jKg4jo1qKj3YirPgX4zgyOoTkzdsfmwdt+o+Xs0urcLhQb6MuzH2J66L7enHAjaobUX
         XjfDTgupUXhp0pp+AzKlZrzl4y9fmyrgAujFvp8gnEdDUXbySOZSIVplMGCZ0GBXEAJd
         VQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZkSdAKdWap4/0j0fTsynu7jQ+1EpOcSEFgGWyAZ9DKLDQqNgnXleCJqEmeBGJ6PzjfYE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yww7lC5Rvhv+/0B7FmR15XesWw+dlu5/lgyVgPsyuvJ38tXftjX
	FfHpMRxa9tHHVGr+J7lzKvYwM2KwxFOKZaoel1O8GbbLQj5VNYebRT0YxCRD+71lhdp6BdM6M5x
	Bwimw2uJxEP2WDduhaAuLFFc0PZh+An3ziTfcIzBbWA==
X-Gm-Gg: ASbGncuZ4O7/CGyZZP6a1HiIsAbVgWBgmjxr1nUR33hgD2BgrfbFlHdq99JDpURkpvW
	Kh6j5jrdTm+lHg2bPiGWhxaDNK0O03nWnXwO5YrCGTRllyWgbJXdeR4eIpIeN1IjyUzVmhvo7sQ
	d5qB3/s1VIlmCqy1/XD/yRyqnFE5kujeQp6OYg1C3G1S6HeIIs0JcWocd3bzn48d/82A3bdr3MH
	2RNgLXJtCBybKtXey/ypy2IGPLd3tQDQDTAvA==
X-Google-Smtp-Source: AGHT+IGJf55i3bv2L8+gmNkmzkA9WiH37A1+UEGPjEgNIhsONYzUjkvXwduJeRWAHBQx5JD4yW8UWOq3aNBoELENYBs=
X-Received: by 2002:a05:6512:114a:b0:57e:6aef:3ffc with SMTP id
 2adb3069b0e04-582d073fab8mr832508e87.4.1758787923677; Thu, 25 Sep 2025
 01:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com> <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
In-Reply-To: <CAMuHMdXgoj+XuKhruEmMpjZignuM9fJLp8NJ0=ZLw8KdFKohsA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Sep 2025 10:11:52 +0200
X-Gm-Features: AS18NWBR36rLL1CtueiFc1sMJzM_SH_VKHScbJyKloWTmjZnMKzJiRko6sa-obs
Message-ID: <CAMRc=MeR3iH7cH4aLuN5T+y5FCFyzpR3BBc4chE7CPAy8Ug2gQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 10:03=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Thu, 25 Sept 2025 at 09:52, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The (typeof(foo)) construct is unusual in the kernel, use a more ty=
pical
> > > > syntax by explicitly spelling out the type.
> > >
> > > Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl=
:
> > > use more common syntax for compound literals") in pinctrl/for-next
> > >
> > > > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part=
4-v1-13-9f723dc3524a@linaro.org/
>
> This is the origin link to the patch (by you) that started the discussion=
.
>
> > >
> > > Looks like you (slightly) missed your target. The correct link is:
> > >
> > >     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com
>
> This is the link to the comment (by Andy) that questioned the construct.
>
> > >
> > > > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This is a link to the discussion with Andy as per Linus Torvalds'
> > recent request to use the Link: tag to point to actually useful
> > information rather than just the patch's origin. Linus Walleij doesn't
> > use b4 so the origin link you'd normally expect to be added
> > automatically is not there at all. That's probably what caused the
> > confusion.
>
> I know ;-)
>
> Given the "Suggested-by: Andy", shouldn't the link point to the email
> with the actual suggestion?
>

Ah, I didn't realize this is what you meant. I wanted to point to the
entire discussion and also this is already in Linus' tree so it's up
to him if he wants to change it.

Bartosz
