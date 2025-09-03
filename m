Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E7127A12B
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901229; cv=none; b=r9zMTgcLxFaKQtg7cFR2ziYFAUhLsNaQBGXU9ym+Te0L7WAsQBGqJd2n7HMURw30HvR370/SW7X7g6/YeTfNAz5/DzumRVJo0WuP+dVxRhD8KlVzQh2njpejbYrTkeZxpFbdXQt5A0ExRTbbwlpGy0cSi4ASnFQyvhngZsjkwN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901229; c=relaxed/simple;
	bh=Eo9UJfvaYgRET1kqEn1jPWXs6VN26Af35fGJeuqNMfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxVGYR5P1q9Sudkd0HxyLT106EEgCKDeFD3y6F3jrKZz96tAfcHgufwMnelRqrMQd07Y+w1i685Awqbj8ri5Hv8JTIywg6LU382Wnebu6DMGa+REkkJ+WAtLezebtsqq8XtnZugO2Subw4DdDd0IoNqh1N0+VTrH3PUcOfWRH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BPp4UcUj; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BPp4UcUj"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f6bdcc195so767802e87.0
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756901226; x=1757506026; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo9UJfvaYgRET1kqEn1jPWXs6VN26Af35fGJeuqNMfk=;
        b=BPp4UcUjCnFENOwcLrfkrnWju8ElYD5kEJF7iTZHui0lcRHqGj1BT3s8eqQkYrjLkG
         vxsBfwrOxVLeJ7XGvL5d/oNwdmMS4SVBglBs4k27R7Y5w8bk/tAR8LBdy5lFNMaEVQ8W
         2htunFTiMJoCdNwXH9bkCbUaTx0E5jCHjgxiWc7iZXpKpFtl1pcC27x/zOWSZRcKhfG6
         +FJ54tR5rxM1snecNFrxpxNz8sdcT9ANiPnQtoRqniLfSwrPfDspET+ayN8SirZAJ703
         WTAlGGd5YTYVV5Z8zYVHlmsvJgK/R/FBKJITMp2TTLMzJeZk7brdQulldQi9z1U4ftoU
         i6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901226; x=1757506026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo9UJfvaYgRET1kqEn1jPWXs6VN26Af35fGJeuqNMfk=;
        b=E3IG9WdQUjQ1vfsWIxcohPWfTZNZmZdveNLWruS9jFqEYV94ZL/AKy8ui5HTdJgcnm
         yz73h5a9DyxhwZh9voBJyp/L34ZSt9fOtjH05dFUwsZnPpM44jmLJIWNFJ3BIYTgmv4w
         W6Icem6dbIKNq+jMsjQuZMTBB/CJKU16d+I0YcTANAtDVQi4lyJ5uHQ0S+hTZWcN7B08
         dgjIE1m/m+EX6LsIOdes7jEwA2SPh8g0M8Yrrzpaavr7CgiYNl8vQqHI11c1QT/1kWSw
         089mvvAg2KkJ6dhEhqF0vm6P3CuWUgBrS3OLU9wP7AdqMWwlCmZsPxNF6zfBYDeaGjHX
         WbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXToPxgn7vO8/Mio6SyX+I1T8RACQemoR1gXa5JciCjeAuLtv3zE0KmTQBSW4R0H/KHwUk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLtLZbQqzs1o45iom1gQb+fTNCy1GxEV4wDf+t0tY7u00FPepk
	nxPEwheVw8Ts5SrtKG7pxZ2k+KtkHqrH58CxnOuIGRQKnFaB4ESLgpCx7ve1KHagDuFS3I3SoaE
	ON+Y8n7tJolkuT+YGVRH/qNgw4Qllsqg/ifm0m+GqUQ==
X-Gm-Gg: ASbGnculOgVKE2qarGvBaLiYFs2HCZwY61Tz6NIcZvFfq0Syft7hVaMYVKaLlEieKku
	dDuk9rUDEsA/cgVYO54OqFDW+3rYYoVoqRyigzdNiUKol0TTtGaoRzj4as1x2PZbWdvxaKo6b2G
	lamqxS1ne2oesP0Cva9cWLcov6DXts9xQlmboacvsxuZBZv9cmUrRzuTTNZO+rJ4vtqsqxTESh7
	lOdqkrZqvgcIXQ7BZHsPyjL2j4CQoFhV6mO/B8=
X-Google-Smtp-Source: AGHT+IFCWFQpsNSj5HbtwgM9MCfjT0JGzQpT+8Q0JOxroU2mp8U3cFtE7ajM8EOI5676CpGuXoSnHTYyKyq5zkghPtU=
X-Received: by 2002:a05:6512:3ca9:b0:55f:6b08:e60 with SMTP id
 2adb3069b0e04-55f6f6aab17mr4829149e87.5.1756901225907; Wed, 03 Sep 2025
 05:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com> <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com> <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
 <aLgeDNLABpmkShIU@smile.fi.intel.com> <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
 <aLgrqZETNLmuMHhv@smile.fi.intel.com>
In-Reply-To: <aLgrqZETNLmuMHhv@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 14:06:54 +0200
X-Gm-Features: Ac12FXx1vWTkfbwcKCR1G15N9111AA5z_ZoC4xZjaCT4bFZgzZIJamSIU5gFH4o
Message-ID: <CAMRc=MeX58XKmxaY1jYCMdy6fQJf7HWMR8f=DQpeovE8APw=og@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 1:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> >
> > I don't see why this would stop these patches though, as they don't
> > break anything unless you decide to make your pin controller strict in
> > which situation you'd need to verify which functions can GPIOs anyway.
>
> It can't anyway, Linus already applied :-)
>

This would be the third time he did it so it's not like it's carved in ston=
e.

I see your point but I think we should cross that bridge when we get
there. Shouldn't be too hard, we already have an entry point:
gpiod_request_user() where we could set an additional flag marking the
descriptor as requested by user-space in which case, when we get to
the relevant pinctrl code, it could check this and refuse based on
whether the descriptor was requested from within the kernel or from
outside.

Bart
