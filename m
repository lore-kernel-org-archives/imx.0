Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F22D320D
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882246; cv=none; b=peo/BS0yXjC5soUKPQ9jnledoEG3V9k+5pgJZDNrgo2o2bepvxBP4OGx0wmd4vWp3cBm7YPUAn9nA65bxpvHTsnYlXmkEP57jo07KInxUa5Iz8OzYAleIEGpie6foRXORTn/X5YZJnsC0FHiG4/SIadXq0Oqq/rvFonW470bS/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882246; c=relaxed/simple;
	bh=8ONcE8oQ6Ovxim91GXFYg9iUHoLisltD7bWCaIaZE7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTQGcgyRn4WmWkqP64GtskoXvTsZcexZhvPOUFWU5qz3r2xOG006FMDagfOFNqmxxi+clPItbJMuKjYVhW59yWq22NrdKhgMZXYD4kkXOeTiAWGVNg8nK47AMWvorFnHcz8z701ZAuPaRpY31V44LS7H4uxICp6BMafsXKftvVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1Lsu+BQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1Lsu+BQ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-af66f444488so494854266b.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753882243; x=1754487043; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi9l6TBdgjaQnQAqpjO6D0pjlwGQDGt3b3+CN6Y3/yI=;
        b=e1Lsu+BQ09e4GGf21qfUNXX8B4bS2xLtzsEmVnbvmyyOJtXa0qUxOAEotDNjLpWkZY
         k6HtTrf9VDVQkNjgJJH0wVqIxL7tY7kW0hQseGWhZjcKnXbGDZDwrY7UnRWrQuKKLvnD
         YiAWXu688JveAHIMwyWKX8E4gY9fmxQQWJxzf4vAncQHLcYwu4wuO1+vAn/Kit1iP6gc
         lVL7IpztZua32xkwvCtgrUcx+rRNUnUTMVL1aPvkxtgpvjEk6YkGWT8gllPDAkpWTbgn
         b3/4KkFlGlHdCtXQSdPat6bM7CqXKJYtbr9F0riU4UI+ActlMKJ67ba55DDe6/80tg/B
         JxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753882243; x=1754487043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qi9l6TBdgjaQnQAqpjO6D0pjlwGQDGt3b3+CN6Y3/yI=;
        b=RlUpk1zQb4qB6HORmiiCFGW4uPtrYjGlZmJEkDGiLyRsrZkyLPaUA6oCHMaXKDK+7f
         s362jptbUGeT5ZoidEgF3OKg1ZunlRuRmgo2CgDTbyRsSV6OcLoAhWtX49RHhbrYH1TQ
         CUMgqpsy4IRUL0ZPCNDYhVQG+hg38QLrkQ6oWHLkhD+PLC0il2KdF2+BeaUPhzkZ/6/9
         dfmGFVtreGiSy7PwPhhrlLa/jJ4n5ddltldPoUHODaIJZC+vshqpVmm+6Nl+rRoFt2ZY
         X1NCWOgS853f3ayW+x+eslQDoEbtmvbTfLmZXdmKQtiAX/w6AcE7Mflx7SMd+g+fbW/g
         A7bg==
X-Forwarded-Encrypted: i=1; AJvYcCVOar1E50CAIOXjBIx0Gol3OiJYE2yx+hwAz79X0i3UuyMl26rT5GPz0Yptvx8WREn1Sxw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPCepei23IQZERqN+SSVhEz2i/rQH+2XCt8Q+eH+swG1ipODyz
	LBEtfgQvi5ekT9zt4/UclzEJCZQZDEvHV6O9Wvyu3lFHnmYFru/n583Gh4U3qG506GLAWChEHN4
	PKcgBEGBlevbgmw3pChGf41dNljNOwUg=
X-Gm-Gg: ASbGnctCdDaWmq5ub+ZiBMiyJACWWcEKNzd7gbpItD3mp28zzx7QlrmCWLrI4zHFkiD
	Qznj8cPWsnjQ1QtDy0aGgKLFPtYhY2pcT9N6NUGBbitys0lfs5FrIdDr/Y9CC56XPdnFA3rjpCt
	w2QAKqY9wIeBk/DkFpPt0eaZSnIhRXX6panUip1PVBPOoGgXo3eISZVDM+Eil9v98tzGPhrh2N/
	j6mz5wpUqz62DAlqw2I
X-Google-Smtp-Source: AGHT+IE7FH6m4Dj0jSn6Xv2SOxyVdUI56jx+oEPv/YLtr96ycR8jtmVTuCl5DRsdQyIzWn8vHcnXCm+w9rLeyqQEmTc=
X-Received: by 2002:a17:907:dab:b0:ae3:60fb:1b3b with SMTP id
 a640c23a62f3a-af8fda93d6emr386293566b.58.1753882242487; Wed, 30 Jul 2025
 06:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
 <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com> <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
In-Reply-To: <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Jul 2025 15:30:04 +0200
X-Gm-Features: Ac12FXyFKinLiyKOfaCHk8Jvp-MCK0UJT4pw-WeZSCiJVFAceB4TVkbq9UOtwlo
Message-ID: <CAHp75Vd_5HVwzuiV17XKkzpEvzd8dzPDRRx5w-VqZnjuCz6m6A@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

On Wed, Jul 30, 2025 at 2:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >
> > > > >  struct pinfunction {
> > > > >         const char *name;
> > > > >         const char * const *groups;
> > > > >         size_t ngroups;
> > > > > +       unsigned long flags;
> > > >
> > > > Not sure we need this. If the function is GPIO, pin control already
> > > > knows about this. The pin muxing has gpio request / release callbac=
ks
> > > > that change the state. Why do we need an additional flag(s)?
> > >
> > > I'm not following, how does the pin controller know that the function
> > > is GPIO exactly, other than by the bit set in this field?
> >
> > AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> > of this information.
>
> No, that's not at all what this series does... gpio_owner is the
> consumer label of a pin used by the GPIOLIB framework. The flag I'm
> introducing it telling the pinctrl core - before GPIOLIB is ever
> involved - that *this pin can be requested as a GPIO by GPIOLIB*.

The certain pin control driver may even not know about this. But even
though the proposed change is an overkill. If it indeed needs to be
done, the solution of valid_mask approach sounds to me much better. It
will be a single bitmask per pin control to tell this.

> It's
> the other way around - without knowing this, for strict pinmuxers,
> GPIOLIB would never be able to request this pin if it was muxed to a
> function (even if the function is called "GPIO").

I need to read the series again, but I truly believe we don't need
this new field in the struct pinfunction.



--=20
With Best Regards,
Andy Shevchenko
