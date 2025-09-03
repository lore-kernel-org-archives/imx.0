Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03A32E9EB8
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 10:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895655; cv=none; b=kEBwWiI8J2AFeQ2gHCUGUvXgcRnCdWUb6rqCIUcGagPW+UIpuqCS2lq9YFR4Q+SN0SGQWvqLCViL+JqA1lPF47cm0JSJ9f5naBiv9WcUx88RMdbb5hS1u2s/d4QT3V/apSHj7/ekKe27kSMk6pLO1wsdloyQ7t3DjbBStip5xxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895655; c=relaxed/simple;
	bh=AVAB3SPxcLA6cClsIyttHLnupSB+I6SCJnu7WODswL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L93Suj3KMePXhwbKJzbdTHPhBmrCg/01j9heYFALnQ4E00rWap0XbZHWmlSyNUmkTFIrIfQk6NUVDcwzhQJMXb2o52VV1hvrx9vYLRSGbp12nXnZvluBJjFyHUQTJZTtfZojyUW3fFwHG5fHzVQG8x6caY+iFxTZ2BDPZmrvfQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c1CsQKb6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c1CsQKb6"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336b908cbaaso45105091fa.1
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756895652; x=1757500452; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVAB3SPxcLA6cClsIyttHLnupSB+I6SCJnu7WODswL8=;
        b=c1CsQKb6OoAJdEGQfj+/ZXWxlBI1eg9l2M+dUD4jZdDzfDBGl1wk2tPq+mg2wPUXqM
         JO7Gen6/feBzMVO7Jtl28RtX5k+4mExeMk13k6lDZjqInaW8TNwuCyyhK6DecUR59reC
         zlrODSys3wPkWJs/dbEYRwwRzMvBx6rcBYmTg0PK03OMTmIrFmbyD7pvQjo8bZx/Cb0A
         0JI8M81FZoC8+rpnZL9Z1Y6vqE2V4WRj1dhEkiqmujTbfB9TTX/a+n/BcvhDMjnHIoBp
         9xsR/EU3TudkksJtXhRVImkmBR6fy++e7E+2mltqqMedeh8r9uRixkHh0wurhPHAiu56
         IDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756895652; x=1757500452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVAB3SPxcLA6cClsIyttHLnupSB+I6SCJnu7WODswL8=;
        b=iuWB7+NniZ33nOXbGdxmPcaL2WAIx7KFyZQfqC0bSeGs7cW0P0mrCZZRUseWpgciZ1
         FdAoiovb4rmBSw0o/5Q5YHBxauSyOlnRViCNZ37O1m9BXGbbuFiy9nJGh98Lnh9E6CeN
         20dmQyoGgRMB4jqwTHZDCYcbmKiPxKjUoaCW5MBeOKlwEDMM01qExDOrCmGyiPzkhfGc
         anYTBnV683IxkSvhdQHzS5MWQOA65UE0w46FeTq8Ktt4rYVGky7onSg7Jd61/mVeVusW
         /lL87uvDlyQW4KozEuVE8VyGmxhn2UodObH/d4KDRoRk9zomioUZec6bI52pFKNWIUID
         VDJw==
X-Forwarded-Encrypted: i=1; AJvYcCUxZkTgLATXfT4nkd89WZPsMqtR5xP0pw5uxNF4VFvZSxshisBlL52SFYhWuFkg3OXphxY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXb6mAdB9DJ43QStbPtTnspCIJ75ron6FScHdHjJcnF1YUp4xm
	PY3AyBi6tj9fx1Neqzr2XGq5DCtYUgcNedQvZz0cY8EkqflhVw1Jk4/nUQQnGREWeQ3xAi3awPE
	nhNzdH2b29Uuc6rp3RGc5tb4J5r7hSvUqCWajbeLP6w==
X-Gm-Gg: ASbGncvGubzcm4SO5Onu1VTFeVFZl/Eam858VhPmUwNuOGV3hX2ew0YLQBHkYe5IG0A
	AFukYkP+Aohz+KVl+iZpaNuuAvJbZAzliUzOUoIh9s01xsDlXtMNGqYgYZRhVwX8vsG4pxE1/T9
	DTUoC3cQYcc9Pfi76QZq2iuxPaZxCf0p5OwoS0QEIpWUO08nX6S2wfkVJSnbbGcHyMqE/Ymu6D3
	aKIyY2XomrkSSM1YtsTUuVGwiGRwRYQVGlnXBH2+mFSRtgkKg==
X-Google-Smtp-Source: AGHT+IGoaflavucoSX1WEgopzKKcdrinu9KA/FkcvAd1RueKhs+WVyWiixXNe2xfLOG4W6BWq8swdn67NOOrJeNUBug=
X-Received: by 2002:a05:651c:40d5:b0:336:8fa8:e03c with SMTP id
 38308e7fff4ca-336caf36f96mr24077381fa.31.1756895651781; Wed, 03 Sep 2025
 03:34:11 -0700 (PDT)
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
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com> <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
In-Reply-To: <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 12:34:00 +0200
X-Gm-Features: Ac12FXzivaaUXd08fTdsNp_v1t2v6QHg93m25vorvolXWMo4UMb6c0rxngkBDGg
Message-ID: <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
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

On Wed, Sep 3, 2025 at 12:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > > > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:
> > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wro=
te:
>
> ...
>
> > > > > > The strict flag in struct pinmux_ops disallows the usage of the=
 same pin
> > > > > > as a GPIO and for another function. Without it, a rouge user-sp=
ace
> > > > > > process with enough privileges (or even a buggy driver) can req=
uest a
> > > > > > used pin as GPIO and drive it, potentially confusing devices or=
 even
> > > > > > crashing the system. Set it globally for all pinctrl-msm users.
> > > > >
> > > > > How does this keep (or allow) I=C2=B2C generic recovery mechanism=
 to work?
> >
> > Anyway, what is your point? I don't think it has any impact on this.
>
> If we have a group of pins that are marked as I=C2=B2C, and we want to us=
e recovery
> via GPIOs, would it be still possible to request as GPIO when controller =
driver
> is in the strict mode?
>

Yes, if you mark that function as a "GPIO" function in the pin
controller driver.

Bartosz
