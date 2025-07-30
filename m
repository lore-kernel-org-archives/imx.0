Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A085298994
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880008; cv=none; b=W1lNr4k9FrUA9vr/7flipFHRQYsGanvq4PmeedsAEiTKmFC4mzAFo1A9nByV+bk5YHEZkqy5AqDbuqJhSKSIuJzC37sSPbVfcuHbpso7/dEudemj63TBLaSFEj72jMyK9wiDraTDBmcRfAW0MA6risKvxeUplYyfCEeKZEBpWk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880008; c=relaxed/simple;
	bh=yp7SViKG4Gt6cuPjj1Me5hhtNgyA0i/vd/UWUlXH6fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nk4r9c5zn7vcfwo618qn/E2kU94bbEaweKjiCZpBzTi8snYo+l4hie2o4arOQwZSH79lyHE+mscXquP8eV3BSFBoxvpK4mVqeLz/9kpe+e6r4nuy/lgc8VyqwSsUGGinpaSaZI5FUeR/EQ0JILQfoDxsJf1kP/AFR/3gUJfoDwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gs4sJ7gj; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gs4sJ7gj"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso1040315766b.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753880005; x=1754484805; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHuGd1o3geC90thSCnWisGLP32owTrOKYJC4wfO+xvA=;
        b=gs4sJ7gjf8HcZMWl22h0yL3GiEwRAxAP9VFKfWavQM8ZUU+KePS3tUhOiIknuuOqwy
         nhaLgmF90pHK8P8nQC/pT+G7jLSHyBWBwNhRMi5L3Hr443aKdvB6A/oZic2qqk6+6XDC
         L0JdqLzSV4r1xNAfyQj1OwviSi080V3JbTZlffXT53WyTR2SJGhQKdR3kxriXgmlqke0
         K98ahQ1aJuxXJL3si0RIQ6NMtbKD02nYA/ELPphGjRdudIS9VId0oh8ClYHsaLZIZ6rA
         lKzRg92MI4P/RkbIda+ZnOymIANRFh5Uj5KKuemQx51Gf53FNzw/1NvVtXqXC2GcBXVy
         +drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880005; x=1754484805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHuGd1o3geC90thSCnWisGLP32owTrOKYJC4wfO+xvA=;
        b=DtVP+UzP3pjxMx1Rmlh93vUyEVN2CWwavC7MKDv1ZLcxBAlAlC2Fjso4PfhqrvRxJj
         TqqDT+oYa6V5hnHMd6vGJ7wjcHuszbQEyMHVWDmGBNfoWLqrvF/V57waye+iKo/teSQu
         /DuRJBfN0X1Co1lXp3U//IyPNIp5bl0kwoi0zR/ZF384PVilt/7xlOVdcarup0sCgeI/
         mjwhr2KEArkW0/Xh9WM8F/cdwVib8pAccrfhDnXiGIRbccOOdiGoqvBVy5vGUMmN9eIT
         arpiVdUsbXpnR9FdL6HlZKniarWxK4qtY+TzPaBrPJsD9cfdVX219ncVSrlhOS9QSsde
         P/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDETy4wbU+zsCkI6xMw3TplZu2iRwLlHR/UUjye9HrTI/IiVnlQCeX9teHZ6AGHiz2B4c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzHsyizlW3U+NPyDcWZkLmk/WUN7nteFZwa+rNvpHkYjItk+gk
	16l+ghUZbxzEygkaawcMj9oxFi8wOZ/giovV0x8Uem20vD29+OeroO3FqZWPsGJmf9TPd7cpL66
	2onQLwE5qCco0SVASu0P8NxD1xj/4dEE=
X-Gm-Gg: ASbGncu2P2384hvAPBK2g4ct9p39LzL7QTSxovkfxHePAsSLOJbyjmgnWDuzxkJkBdV
	fz7phFUDHRYxfTQNRB7A/3TiI3v2m0IuRJOI+ekzWP7LfUKRsHWamBZiYDO48L+yzL2SvM80bCw
	9bXDDy+rEHUlfQZZhVv5GCgIfoODEEqGBpFD7urwlvb98PkFNrnxEYX+4CADN8cV9+bSbuywrO7
	3A2sOI9xA==
X-Google-Smtp-Source: AGHT+IExcFLcRiu5QtKTR/cGupB5CiCW+Pjw09y0EZqUm/lnXA4CrvfRLkkrfhzcJE8+pxyrQnSgTbf1NQKA1MoVcOw=
X-Received: by 2002:a17:907:60d0:b0:ae1:1a30:6682 with SMTP id
 a640c23a62f3a-af8fd739a45mr409970266b.18.1753880004488; Wed, 30 Jul 2025
 05:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com> <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
In-Reply-To: <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Jul 2025 14:52:47 +0200
X-Gm-Features: Ac12FXy6gmS688CUsaG6BseFKvaIP4Sk1EUtOxMURXryhfGHjEY11oJr_rDyuZs
Message-ID: <CAHp75Vc-kFPz9J5CQgrwb+5Wgzyxne4RVn5efEDwwATAHTxC+A@mail.gmail.com>
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

On Wed, Jul 30, 2025 at 2:49=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > >  struct pinfunction {
> > > >         const char *name;
> > > >         const char * const *groups;
> > > >         size_t ngroups;
> > > > +       unsigned long flags;
> > >
> > > Not sure we need this. If the function is GPIO, pin control already
> > > knows about this. The pin muxing has gpio request / release callbacks
> > > that change the state. Why do we need an additional flag(s)?
> >
> > I'm not following, how does the pin controller know that the function
> > is GPIO exactly, other than by the bit set in this field?
>
> AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> of this information.

To be clear, the pin control and muxing core knows about this, if the
certain pin control driver needs that information it can request this
from the core or do some other shortcuts (as it knows the state as
well in the HW). So, I do not see any need for this flag. But again,
maybe I'm missing the subtle corner case?


--=20
With Best Regards,
Andy Shevchenko
