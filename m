Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FCA26D4F9
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869294; cv=none; b=OW9uNTLykppaqUpCMIRHSuGg1DEPv9Jv9l5gBNQYCIjbNTxYiIKQdhrNNVT+vzlHgweZb7sFMeJVzi651msoNoPJUy0rRQu5iEnENJo1QCBg0PLqgr8jj6HB3QSw4MkBB1ph1po8mNnwkY+mzhuTpscSByAhdaMw1EW6dIC/A2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869294; c=relaxed/simple;
	bh=hp7bAnlyWbMe0UagxjClRdoFhPBImgjJBDcHhbMOPBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGCWQn3bdYq4Rda/svzYftdh2yEPcgXmwM3fPSelXjBqFIY1oG8fn8GnEiZI4CTbQu422dtB7WTRhAF8KGh5ChlR7M1aRqja780JlcqTA+S+ctr1w6CkO5/9N7BVDmMddNWCMzL6IhsxzRzEJFMQkvuGz1TJFFjJC3xFam1UBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bl52SUzW; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bl52SUzW"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55b827aba01so321009e87.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753869290; x=1754474090; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=bl52SUzWiUMyN3I0ZwKAB51UZUrDMllDMKU+ZXOG+CLNmbfCFy+TsP2GMCpgtgj2qf
         DlYY5r0sZ7//+zKs5SK4PmRxHwm3QW3cDdtN5GvyZC8dUh8g+GKb+DnIqRTA2+WWbecq
         mdnoJyv5rNfqYSqFuKQO3qtc9ttyCRcSaGmlCh3MS63RKda68QzDw3QDpi4YOIyLRuGG
         kt659v5yZ8A2wmzcMXH1jKEqUTJ7sPRoIAv+Yqb6EUa9Hhnrzp8nPbn5PQh7mJwJKV6a
         8RUSOqY2m4W2gosKHCVidMnkHZdWXXx1BPcZIzyKeMRv3uUMgug0yY56+o0tXiZf0sT9
         kzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869290; x=1754474090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=GVEGZM4PUPO/h3fF6ClipKbWadZCDmjJkbAXw9PxaFXxHriBPk/S/YL6KPG1dWlQRe
         TM0MQfWfZiM5jjX/91TB24yNVtbMo4vq2QnEl0DL+sbI5pfhZDEAWQBaeM7HJWn9gvCU
         tu6O8zkDZnICFt6b8QJzGlLHq9x4svJC/txfFyJTh+0LyXv0gMAPgdU1oLY06Jx2Q1Tn
         5v2G5CM9jJT1PxFmRb/o/NyOm8FDvL4JuduKFc1nDskW9Dgc563f3NSehO0/C5u5Gb+q
         WGXseqbcY8z3zxgRQ0IGD7LbQLe4aolEpneOI4Mx4J/vBaITNqYs7nCQVf2SWWTuKfLR
         cjTA==
X-Forwarded-Encrypted: i=1; AJvYcCV7pZDUCph1rLXabE0Vec4GJOdl7cLU9ifGT2gJlFmvzJH5rdyb+pgah3X2b3giKnci5Lc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEUBpoY9n6CGiWEEmD0H0QINlTT+zDpxRH77dRvzFCYE2y2CcY
	Xdp8lrfdDN0+re7bRTYYRYK09VfJiH522tIxAWbUPBqBR2fANPgb0KPxjjwy1ge9mSMh8I3xVM7
	kTPJqK3uHhm2rFEviPJ5WM1r1hz9H1/t6qESM2quBWQ==
X-Gm-Gg: ASbGncvJSZmO1cxI9bzp0zTSrrEYfnFPr2+c8hUgOIn7bMQ1LrNqdvFISoOWi/EOcMF
	/je/fW6w0zDY/IQ3kWG/99QcLfim9DNEUUiCMXPrZUKfnaUyIEuNngkhely+RM2eWKVdv7zuHoP
	PSIZ1OyrQ68qM8pG/sLY2mfcntH8Jb5Cd6e9I71jiuFaJuKTodAezxys/voUdGjnu/tdsQbVXh0
	IDAPODW7tdyStQFZ9lkBf+VhdmjedQxN5rQBLk=
X-Google-Smtp-Source: AGHT+IFD0mC+adTu2tQIUqoYqi4YbEm6lb9KfHl4WlQUhUVwQ9owZPBnvnUOvhF+89ksRVwAv/r0YIR9B2aVVdKhoAo=
X-Received: by 2002:a05:6512:33c7:b0:554:e7f2:d76b with SMTP id
 2adb3069b0e04-55b7c0b0f66mr939851e87.56.1753869289592; Wed, 30 Jul 2025
 02:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org> <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
In-Reply-To: <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 11:54:38 +0200
X-Gm-Features: Ac12FXyouWksKyGI1Z-cYawOTPPQ3IbuMxJxWat2oIDr-ST0nxIlLBCifNIDusI
Message-ID: <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> >  struct pinfunction {
> >         const char *name;
> >         const char * const *groups;
> >         size_t ngroups;
> > +       unsigned long flags;
>
> Not sure we need this. If the function is GPIO, pin control already
> knows about this. The pin muxing has gpio request / release callbacks
> that change the state. Why do we need an additional flag(s)?
>

I'm not following, how does the pin controller know that the function
is GPIO exactly, other than by the bit set in this field?

Bartosz
