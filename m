Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2762DBF6E
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753886737; cv=none; b=czS1aPphnuGv5qHRs0Y/Er2Ui1rLK6QuEfKWUY75T7r9KAc+eRuwN75t2xfEfR2bpai0ikWJRO5FeSkufIAHWlTzFTxHZTS90XcL+FqLVD8QeY9/MAxQUPeTJbtf2I7SW2DyN0U1Opn3RJzigwNoIekLRwo7owgTgmVQ715LsXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753886737; c=relaxed/simple;
	bh=h6BIraPSPPKSk7SSDXt989v2WJKnWFnkSVC/oGpVfug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+aXt3B7nOQqoXZJuTCQgQPyM5oCHV0J4zJ3rMpW+sNMQkuQuW0j17KWNTdPtznAlEBTcQTw7C1gfe8G1JnqVuMii2sT4fjLjPQccjC1oF+onEbEhTk+i8VFJRx6Pi4vrQ2xr8f61z1eFGIUtuEFoHTd+WXn4ZPbD6x9RwUne/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VGmIa3F+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VGmIa3F+"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55b829c7f1aso612309e87.2
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753886733; x=1754491533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6AXuDDeUL1WpUxErghD7iQZDxn7tXl0MHZ3gm9RjBI=;
        b=VGmIa3F+obFSpkrJ9Fz4ZdLO8wMqSK+y4jbEFoxE2SSCEnvUQ+P7KM/cR2Q/di2d+R
         d3Ez5XCE/zdyaOg6e4EUO3JUv/SwuDl9XtJm8ANGjQabLP6FmTcQTproevzYtzzqVf96
         j1zSaobhdzFzcAQHdil0AAEqGLXEeBMm4CDQXTiqSEKQeGGNHDgixXHHZHBhrReSpaD2
         3BObJnf2jkk4zIkLfyIzNVdM1F/5/Uyelh7zskF98hu+UhHJxZyfWHJnm9UeQKO52VWc
         YnoJxMo3M8ZYjEhMFoe5LJswtq6xbLxXimtsd7OXVKpsQ++OUykyNcGBA4swWkqJi1xk
         vbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886733; x=1754491533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6AXuDDeUL1WpUxErghD7iQZDxn7tXl0MHZ3gm9RjBI=;
        b=TSHc4CoPiEU88S3sfj5Q9gc9B9mSvvh7jFyGtbZ+GYwJ0abjWBcwwVyDIrtgVPmrQI
         MsUIYpmp/KRhhdRpD68Jxkk4Otqxf0obtRz7tBZ+NnIBbTZR5ieAhzPjPsOQdg+E9wOe
         Dyme5jjLv9QMmbM5U0p9uFebrr20g+YYrSsIEX4h5CEfVok9gIcmGcKEFPXHaIslwHUE
         XRGzgwymLAfz34kT4yLpfmqhxM+1Ny1vqQ1Siww0F7r3tGE75HgL3WKlpEg43k0q2agQ
         GtBJbp//5Q833WCSEu5jYvIf/jOX6BXEFdxldfBr3xwn5gNWxZIus7OE+4YLWqFzpFJi
         hDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCIC0A6RIwjmeoSbNcvjTYFdmdZhk0tWNEVTsMDADsCKWgZgjJyMp7BfBhl424JvDVtAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxndGDfJdAEQPZowtj9WC/8XkkX4Qbyr3BNZjzuySF6y25XdmzS
	eevGOC2btk8ab/e4Yvikw5M7oGFHdXcXMTPh3yerP2pVfL9JIzfVRXlkXFBWRraNHnSLhMa0SC/
	6tTN3jj+7L8SanDg4iUwfFuFNPrNvkZUcjS8nLs0f1g==
X-Gm-Gg: ASbGncvY+W7XYAg8pFm3yLM/LnFba3aXkrntfRlSfXd0Jt4ueuL771Nhf2CvSIhVnj+
	LBmrnSh8wXl6QgJ5+dn3Jx0ULJem9WR0jGUjm1hY+udan06zn+sgCASufKASYMq19+n9tZ/vd9e
	zOdPfg+4UlKKDuE+HLqAH6WJiMgaEM0a/OFlYfTSG1xt6iTY2wF+chuKs6b6pI20tR/JXmHN/fi
	tJ1jGkq/v/3uQd/hbsIuNE4A98OXzwdl5gLgFE=
X-Google-Smtp-Source: AGHT+IG0Q6hH9i+UpqLftCvpSVBouzPpbLbuygIY2t4i0+nQyoHOVMz3gwtmG10RMLHn13yYgB8U2bSlEYWDzelEprk=
X-Received: by 2002:a05:6512:23a3:b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-55b7c027afamr1034186e87.15.1753886733212; Wed, 30 Jul 2025
 07:45:33 -0700 (PDT)
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
 <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
 <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com> <CAHp75Vd_5HVwzuiV17XKkzpEvzd8dzPDRRx5w-VqZnjuCz6m6A@mail.gmail.com>
In-Reply-To: <CAHp75Vd_5HVwzuiV17XKkzpEvzd8dzPDRRx5w-VqZnjuCz6m6A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 16:45:21 +0200
X-Gm-Features: Ac12FXyd8ePQ6VSvFuinf3meGy3NBROTyjzQV07xe8o_XLvEkxT-hmgEmHvLoEA
Message-ID: <CAMRc=McPvFzb7CSFSKOsQZD9ZPwtf+bCw+Ui=m6OoX0GxH9DtQ@mail.gmail.com>
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

On Wed, Jul 30, 2025 at 3:30=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 30, 2025 at 2:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:
> > > > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > >
> > > > > >  struct pinfunction {
> > > > > >         const char *name;
> > > > > >         const char * const *groups;
> > > > > >         size_t ngroups;
> > > > > > +       unsigned long flags;
> > > > >
> > > > > Not sure we need this. If the function is GPIO, pin control alrea=
dy
> > > > > knows about this. The pin muxing has gpio request / release callb=
acks
> > > > > that change the state. Why do we need an additional flag(s)?
> > > >
> > > > I'm not following, how does the pin controller know that the functi=
on
> > > > is GPIO exactly, other than by the bit set in this field?
> > >
> > > AFAICS the gpio_owner !=3D NULL means that. No need to have a duplica=
te
> > > of this information.
> >
> > No, that's not at all what this series does... gpio_owner is the
> > consumer label of a pin used by the GPIOLIB framework. The flag I'm
> > introducing it telling the pinctrl core - before GPIOLIB is ever
> > involved - that *this pin can be requested as a GPIO by GPIOLIB*.
>
> The certain pin control driver may even not know about this. But even
> though the proposed change is an overkill. If it indeed needs to be
> done, the solution of valid_mask approach sounds to me much better. It
> will be a single bitmask per pin control to tell this.
>
> > It's
> > the other way around - without knowing this, for strict pinmuxers,
> > GPIOLIB would never be able to request this pin if it was muxed to a
> > function (even if the function is called "GPIO").
>
> I need to read the series again, but I truly believe we don't need
> this new field in the struct pinfunction.
>

Without a code example, I can't tell what you're imagining but let me
give some more context: the flags field could only exist in the
qualcomm drivers but the problem will be the same on all existing
platforms so IMO it's better to centralize it right away. And if we're
already centralizing it, let's make it future proof by making it
possible to define more such flags if we need it. Since the GPIO
category is a function property, it only makes sense to put it in the
structure defining the function.

Bartosz
