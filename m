Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C094C6C
	for <imx@lists.linux.dev>; Wed, 22 Apr 2026 19:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886892; cv=none; b=OOdsnyLzt/4VvsyWBujN6W4tIQnD2r0tsVReO8El6noIMzUw40VB80zfmpRAYWLsYpVvXBx55sq39KO9T9oxkwsroaaIixHNcfXAaL+F7sOH1t/WTyXjCicrzjAp3OB2/vp3+Vfb5+acFIPJP47W0eFcPjYmI97wObU/2/Sr648=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886892; c=relaxed/simple;
	bh=1jDHS3//SVF2/A/vC8oT6/lwq+kdzpM3dPjKRF+cWNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FML70OZ1778+tlOUWI1d+rx8i7XlgUbcqlxyjPCyXod+/z1Ibkr0M1ITvYnxECWZN/x7ZV7USkOOXDATF/7bLkVVDjqx6iV9sVH3EfSG66vR9DIc12cHzVNlBr/vg8m04kk8gUeBMF55ZjwmIqIXVxQYzNkNZyc6qEKqDyOsDRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lN7nZl4t; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lN7nZl4t"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba51e69988aso752007666b.0
        for <imx@lists.linux.dev>; Wed, 22 Apr 2026 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776886889; x=1777491689; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8JHz3Efp15Ndyc9pOP3Ax7qZyPD4IXnQM3cK5pq58E=;
        b=lN7nZl4thECjK61giiXT+LbCoQIQ0RjKZBfoaDs6Ymzj7o6J4raMn2SCNvUdE1caVi
         WjLN2L/xC07FeU9Uvc6Zsbj6ghw/B0E4dk7LMVsUKOW8EeniwUiqXODqa49bsotqVKH4
         TVFcHaFxe1frCDHTSHvwHRK4tyb5WtPDQy1/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886889; x=1777491689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A8JHz3Efp15Ndyc9pOP3Ax7qZyPD4IXnQM3cK5pq58E=;
        b=Z/PMg0As2lzamvVRNvpE3iWIoPGTBnefAkBRkteayHQtoJdoSai1IZxw7TrCBDe62G
         Jx8Xs4bHepzS2RxEOQgZKufgtd84MVhGEaRQn1xj59FOh8ou/b+EtvBVjV3gZAQQsgVc
         TsfM8yP7m4RQ5JiHgk7pIP7ijXtR7TfL+/OKBMhK+rCAAa9o6GK90vIEtz1k2MJesMNp
         XcFAOcP+qJzVONE+ExvLClqlgD2kZrTtakRsSoMlT/n54f4pLkVEju12fw0sf5Q5oP3f
         +9dcd5nTelED79y76e06pfp1iPVMz53TlTtcEChfhy2rV+EwWpOrDaFBBNzYhsLrBrl9
         GRhg==
X-Forwarded-Encrypted: i=1; AFNElJ84HOddtFm35ZvP02PkfLWaGYmQQccZfZMfIz0EeMSaWylTWjM6OG2x0P6rwpGKD05WyD0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyX++oHWrsPQG/q9K+uF73p+lUuwZQ4myCzJ86S/ydrPnMgjtiU
	++FYfcmB5hzS9nAIIPogj4pLW+OYLcLSoDnbUFsvWTALcOnChlFuzm7azyjy6V0VpNvmMGCeA5R
	l2K0PQp9N
X-Gm-Gg: AeBDies3GZr1/otuAsHFjAbI7ov+eRX2SLFHM2gyGndzcsmFM53yRxAAeStt+lCCY2a
	VaAuoSQE/IBbeEe4iguqvnWAkrex73McKPYuctJapZRE3EjjC4uvdK8MB0lrJKr5I+fRarBeHCQ
	b1GVv3VJigJGXpsm1iUaCVSYveJELDdQ1Jhow9Cus9OzNXSv7HuQ+745VUzb3/n8w4XBF0Hb1LB
	Cf0jCTPObrqdQT2DXx7URTDcZ6eKX15U2UVu/6rXyOcuCMuBACB8PxZYpDM1WEs9QRhkzSv6OuU
	jxo1zAB9lDJCaVxRS7ACCq2wpHBo/j2wVX5kO5jyFNqM21RIbG3dTPmZHQMgl6+y1QURAXes4GX
	ZC3hWtTbNmK6s4sNvZJvOdISmlyMuNSDOmHSOqhlYOCR3HkNQrJ1izABx51x0W/Y+FuzBArOD+2
	c6CsfSKLnJC7PA7lHGDxZVjLg7ezWu1aNXlrrwfXpIMgx4SIDFLHhANH4RhX507lX7f61yVxcXN
	o/vlwEJKjA=
X-Received: by 2002:a17:907:7248:b0:ba8:2e6f:a436 with SMTP id a640c23a62f3a-ba82e6fa4cfmr724876366b.31.1776886889157;
        Wed, 22 Apr 2026 12:41:29 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4512113a3sm599568966b.4.2026.04.22.12.41.28
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 12:41:29 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so8347182a12.2
        for <imx@lists.linux.dev>; Wed, 22 Apr 2026 12:41:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9STiBs0EI+bC4zqrrBCLdtxjRnZdEOVMf5zYp74OCLlajQS/cMDqz7EdZVM5InUiby8R0=@lists.linux.dev
X-Received: by 2002:a05:600c:4714:b0:48a:5574:3a5b with SMTP id
 5b1f17b1804b1-48a55743d05mr122645615e9.27.1776886533988; Wed, 22 Apr 2026
 12:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-3-herve.codina@bootlin.com> <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
 <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com> <aekg_IELc65BFrWp@ashevche-desk.local>
In-Reply-To: <aekg_IELc65BFrWp@ashevche-desk.local>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Apr 2026 12:35:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
X-Gm-Features: AQROBzBA2DSdR2HBaIYSKp4MrG-iWYSiPDxUw6OYCOPyJYNxN20LzPXgyZNheJI
Message-ID: <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Herve Codina <herve.codina@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 22, 2026 at 12:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Apr 22, 2026 at 11:51:36AM -0700, Doug Anderson wrote:
> > On Wed, Apr 22, 2026 at 10:44=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.com>=
 wrote:
>
> ...
>
> > > > +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
> > >
> > > After commit f72e77c33e4b5657 ("device property: Make modifications
> > > of fwnode "flags" thread safe"), this must be changed to:
> > >
> > >     if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
> > >
> > > With this change my DT overlays are working again.
> > >
> > > I guess keeping the FWNODE_FLAG_* names, but changing their values
> > > from bit masks to bit numbers was probably not such a good idea,
> > > as it fails to catch missing conversions...
> >
> > Crud, I should have thought about that. :( Do you think it's worth it
> > to do a rename at this point to catch future problems?
>
> You can try locally with allyesconfig / allmodconfig and see the outcome.
> If there are missed cases, and their amount reasonably low, I won't bothe=
r
> in this case.

I believe I caught all of them at the time of my CL, but the problem
is in-flight stuff, right? I think the problem Geert is pointing out
isn't something I missed in my original patch but rather an
interaction between my patch and this in-flight patch.

> But for the future it's kinda rule of thumb to rename when
> semantics changed.

Noted. I've certainly done that before, but I didn't think about it in
this case.

-Doug
