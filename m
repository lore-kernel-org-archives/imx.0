Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164CF29617F
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880033; cv=none; b=HaWjhAJv/gCfAW3s8Ovk+5BF70YnO13mXBYh6BaLbcoVzq+4BYRoFKYNuAg8SuxGex7m9tJr+zCnWfaTQT9KuNBLMXFhGK2Y3TFuHZNeRax0upeoEi9ixa2+cdaPNJUX82vqps9A74UNa3EO1LeDJDh5XxXbOUxc6Rvlp544gpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880033; c=relaxed/simple;
	bh=RNeM7UB4fAERU2LPOJtuWeYJSG/9TTk9Yot9abhDF6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeWWh7lYNl/0gUctfN5l4O+yQW7pHWrw6NDi45ovfAHb3hg4goN0xtZ2l5zfUTPt9zBaPfa/qJHEfVNTdGLbV8bLCHLxP/leJAcFCVWenkL6gudcGgXNhsdoVCX6QIdQIK2icXRcOh85qfiDg6ULgRYCXjOqDDpkG4Ty6KWm2sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cd5dfOgN; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cd5dfOgN"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3321296a8cfso9999351fa.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753880029; x=1754484829; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=cd5dfOgN1d7N18iIZHg060TKCIVNeJ7TmPJtru//JwnvokdDNz+pGPFFotqHzfSdc9
         YJe60ZmPdcP641nMYxnAzfdIbQngP31zx8ZMu3J+vgmNDIVwFMhRyI63WT/ij3Qphjpu
         QWaQumhXSTj4N36cMtnxpa1LBk2/3x/tyfKaFWFZ0ygzYRO7yBU6S9lu/evO8XCyZq2V
         LpJGMfEzP4aGELm82H+Kd+dzw/yoG8X7gEI/shSfB+WJEf5pk+HHhC+6iD0tRrVsm0Ge
         NGuNbsW6yMVyVw9DPb7kfifYcUb7ksOg6TSdL//buQVoEtVlg2RQoY1jCDH51jQsVLuW
         ctwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880029; x=1754484829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUTEvgPr5pDo52lKZf6mOXPWs0RWvEkRiwEoyLLTu3o=;
        b=NKGH3PvKttuwhkSb7t1joq8TD0PW/SkaHbh21Gy6uWnFKrVhqs1OUm2wU6SSR4UfJf
         yz0YxiEYESHOTvAQYJKx1+l3VXImme18PsAClDg6Sl3JHyHYWeX/HvNRG+BWWVhCx0OF
         3FYKvPYsL9w8ibd+rmrce+757bJY3POS/LbfQj1Bure6i/uY/ptP3S5nlq5Nu9FbM7vN
         xdgtTzNEh0euoUk3M2vJFPfCBBtMpbWq4JWrfms+7FgSj8pPuO5FWfGi82p1KIpItgA7
         e8a7/i71q/c8F2pS33+VBYRSOOxPlMoueuyK06HF/kSHWbmjTl/oREJbBUARzPNj20Gw
         AgvA==
X-Forwarded-Encrypted: i=1; AJvYcCU0CHscl/ep2faY34U/TJWnbwPdkFbFzWIPvKHVexsIIVDbKUV1qkLpp8DHre+Vz2Uzg8o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXhu0eaysWY+c6/ZUCcNwAy6/Fhszg5ToAl3ejP616/GpR9Cti
	FBp0gEYuN1aDZKQdhf3hRrt8sf4/jZzXdtWb1q6lqJgTinOfSgX2bxixPcvTs3KGDsg8FLu58Rq
	qjkZ8Qhp7QpceY6olrBRhVnnf8UYHUnaZ+uj9CHCxNA==
X-Gm-Gg: ASbGncv/9OecmlUqoFQF65z1wsyQvyqC8YMsO6mpD284aCIAgJWJtmNHb0UUehf0STq
	ImubfYIJvyE9KTaT7Ta81aZ50CdJV5tZyVpiTycePlrD4AmPjr5F02jRs2Hlfpck4QbD4KyTYja
	yhyjC7RfMhquq+LCyzYePJJWkKM3ur9j6oi2kopUP/Wq1I+UNYKBnXeKSZt/IEdDmYLqFPi+4l+
	O1qJmquuGefH7i4swNK1sjUWOzfHAU6T5zqzuE=
X-Google-Smtp-Source: AGHT+IGSuyPnAInz8gQT37fKK4pgrT4+RIAYI9IrKjK2MWPd45oP6K0zUhD/GSonCiRI3dzBbJ8n7cWJZ+qNt54xgoU=
X-Received: by 2002:a05:6512:ba1:b0:55b:83cf:b260 with SMTP id
 2adb3069b0e04-55b83cfb693mr305928e87.11.1753880028944; Wed, 30 Jul 2025
 05:53:48 -0700 (PDT)
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
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 14:53:37 +0200
X-Gm-Features: Ac12FXya2mYA_HSI46S7KktzTvTwdWuT-o4vBrrr3z0vtr46fp0gRnU_ZqynDBk
Message-ID: <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
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

On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
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
> > >
> >
> > I'm not following, how does the pin controller know that the function
> > is GPIO exactly, other than by the bit set in this field?
>
> AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> of this information.
>

No, that's not at all what this series does... gpio_owner is the
consumer label of a pin used by the GPIOLIB framework. The flag I'm
introducing it telling the pinctrl core - before GPIOLIB is ever
involved - that *this pin can be requested as a GPIO by GPIOLIB*. It's
the other way around - without knowing this, for strict pinmuxers,
GPIOLIB would never be able to request this pin if it was muxed to a
function (even if the function is called "GPIO").

Bart
