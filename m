Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE3E2F28F1
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896123; cv=none; b=egZ9zhEhhPahZx4mbTUN0ytGflt/qqrD7XHEb905CabA0LYTKkzFCOqS7TgBoU/2zE5dQlyqKuyxBaBHAkSRTfhYXLANO2CFI8WDkhBU8OkrTQ3vMtrsiyLWIN/dMjshQ3O1AVoIbwB3nq7xIrU4eVgihaAqEOlqnFWApKWuk28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896123; c=relaxed/simple;
	bh=+DICLpeLEk5QfxI0uLHQeTK/2wiRnzmCNbLnrX8FqT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7S7xBEDBbiKqZ36e2aeAmeP3IWrfC2L8kEZOr8dqejHSRxSfjhTMN9xoEWH9YDvEmjbWMHD2ZqzAybqVNFWNTKs+jtgbw/qU46ntSSL0aCJB0p9zS/8BXCawmIhapIA5l77FKM/yed5xTKFEY2MfvExfHX88X/+y55jdud8rm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IbUEhZzi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IbUEhZzi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso4757208e87.3
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756896120; x=1757500920; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DICLpeLEk5QfxI0uLHQeTK/2wiRnzmCNbLnrX8FqT8=;
        b=IbUEhZziuaaLY6t7cxoWr2Iiv8seSpc9MdmViV94gCDwWHrCmbQyzNzGrKTM9cfK+A
         iay/w9kM66xPeBm1tJeSCekeK9Igy8MKh1paqcGiPrpd4eLJVYk5e5hiu0duKz+nZojQ
         rYL/0xXtaJr5rU62H6M5ss03XyGZ/CTpBist3FYIszgToAUE4l3bZof1mhqJyjxdsFQu
         AUHgaQk/W3RATp3osLms0oL+hGhawDV9WnOiZa2FsRfYmSRGZF2/jmM8qbGDF7qei7NP
         iS28fDlK2HnNeRYzgGWlK5y27R9afyV9IU3z6vjmdIOlpVGNSpjMo+TaLe87xSCCeWLg
         vPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896120; x=1757500920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DICLpeLEk5QfxI0uLHQeTK/2wiRnzmCNbLnrX8FqT8=;
        b=KkG9O5UJFiGFPGQnp+cpKfi99gbKPPejnftxn2A5jYxxH8c5goVQ4AW9WlRJIj+6dB
         92hYHVsZyp4PZ9PBr/nB671mGOIjpwMWuVnl53xwbdsmkP+HOFtk8qcc342i0IVrytGI
         h6Uj1UDRIGOvgobjqf9N49ZlF9CVqqO73Ltz84dit1Yr8xYjh4i3lj/mIp4vHyjAB9QV
         wrKNzBHjafWqSmfTF8CAvz7eUvlEbKeROz7ji7uOCRcnrRVx0vo5zUsQvtTcaw0cSq/t
         fkrgzOpOcv2NOfUQJV4wr4C+eAP97bXPDnQ+GQLPLaoJNUP8PGE9r1rQ+QB8vbVzSYyR
         C3UA==
X-Forwarded-Encrypted: i=1; AJvYcCUqTDJQ/lIJLFkkR7BkCizAn2gmP3AMqcbjrAxmSv1nd7l7zpIkTyXTccNPpLRIdwTfnJM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoHQSdejv68nrqglQuHy4VqYJ9XtZyP208cPK7ANkfuZidBEbM
	cOgSLKSD0IPPYWACI5rwULot0dfyQMcS1LarL1s9xze4wUpB3uC++81Lfe7uh0E7ea8HlznSTaq
	sFjvnrMuiA4QfICS79aYOmB64h9azIHEZT31iz9zDYw==
X-Gm-Gg: ASbGncuez3FapJq4z1CYP6ACqJGaN04nKAhFkiZe9TFu0DKSb8FcrzY4iQtvGJ2L8Of
	DVEX2ijyJyYE4e7bCHxRYVvbbZY9FB4QLb3k4fEpS7BOAkmpSMzQvRl25wH1eREygKg9QxDibPY
	uM7FB4gqPiukWYYKWyVGsyhw9drpcFTytbgsTYM2Z/5MNMpMYsyzBPuXxg6R6q4rTKOjkxsOszX
	9ahmisfOjnhshjJCGFDWTKZ9sXGVzVX0V9AN28=
X-Google-Smtp-Source: AGHT+IG+m7ivvcbSy5vEIztmUhS+t7hNv39lHZt0A7pC6ogTKWUtHExG+a5EtFY7oJjunqJek5PQQ93pvgc0Giy7D2Q=
X-Received: by 2002:a05:6512:2447:b0:55f:6adb:b847 with SMTP id
 2adb3069b0e04-55f708b1b9cmr3479644e87.13.1756896119817; Wed, 03 Sep 2025
 03:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com> <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com>
In-Reply-To: <aLgaoivmBUgoeO6B@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 12:41:48 +0200
X-Gm-Features: Ac12FXzqWEtt2S2TE9mSxpi98I-TDCIBZvSibEo9i2pyKL48Vs1B0BzDGCeR2o4
Message-ID: <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
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

On Wed, Sep 3, 2025 at 12:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 12:34:00PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 3, 2025 at 12:22=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@=
bgdev.pl> wrote:
> > > > > > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski=
 wrote:
>
> ...
>
> > > > > > > > The strict flag in struct pinmux_ops disallows the usage of=
 the same pin
> > > > > > > > as a GPIO and for another function. Without it, a rouge use=
r-space
> > > > > > > > process with enough privileges (or even a buggy driver) can=
 request a
> > > > > > > > used pin as GPIO and drive it, potentially confusing device=
s or even
> > > > > > > > crashing the system. Set it globally for all pinctrl-msm us=
ers.
> > > > > > >
> > > > > > > How does this keep (or allow) I=C2=B2C generic recovery mecha=
nism to work?
> > > >
> > > > Anyway, what is your point? I don't think it has any impact on this=
.
> > >
> > > If we have a group of pins that are marked as I=C2=B2C, and we want t=
o use recovery
> > > via GPIOs, would it be still possible to request as GPIO when control=
ler driver
> > > is in the strict mode?
> >
> > Yes, if you mark that function as a "GPIO" function in the pin
> > controller driver.
>
> How would it prevent from requesting from user space?
>

It wouldn't, we don't discriminate between user-space and in-kernel
GPIO users. A function either is a GPIO or isn't. Can you point me to
the driver you're thinking about or is this a purely speculative
question?

Bartosz
