Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3449048D885
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045762; cv=pass; b=nSrky1LTAt/I91Oh/VjsH/LY1eCXLu+eGQ5XiyWGWq4Ybq3mtlQl1izB1+MO4DxjhhPCXNnh1Knaslnjw93bYhGFkHK2sVxllB2vmX15Jp1WL50lAiuaHDyjsMQ5Gp1wYgaHoHpaCps5j3diZXRl1Fdw3lu/7xqPrJWxqQIxfoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045762; c=relaxed/simple;
	bh=OK0YfBX92H6A0Epu2Kw2rNUmQkQOp+XxcafXxrqgWXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jL1rM3q2YuAfcWA3kYk1iWaVXnSeIZ1gGD/u9IigjvpTlbTecxRoKiLd3gtTRpMX9IZ8LGm9iHIkMF3PUeIqfvX4Jhzz4GKHljqJQ3+YMp85bdlxpw0Qtt9UMTMwgthEpJ1y19ug5SXS7uToXKsB7QYOBow719ZN9s9aN/xdEX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuEVlDOz; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuEVlDOz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369ef6so9782315e9.1
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 06:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789045758; cv=none;
        d=google.com; s=arc-20260327;
        b=l3rhD3sQptQYf7FTNbijLpJLT8+3ZbBBBoq1gNqzDSMS0mMvDqC9S6KIvYj6c2Yl+w
         D7FL2TwMdtYw5Lu+gNJwKiZCpV5tz6dRqvfz3zhEXSnOaCsXqryD8TjWAIsxmALBNYlN
         H+JsFf3vPHVIaz/w5wIlJOuobglvKeMm+sWb8SxLNWPAQgwLf/SY9jQJATy/BFduuBtf
         0H9Z0+TfF4qnimmhYfNpxfGcDE+bs2f+nKnryupIK1YNuvdscIdeaKGmKPqK7A9rRVwD
         pkAgJ2J3y3qMY7RcZFEQgQZVxjiMGEgmEgKmSftDBGzzPtcDQF583F7ctHh0rCJ4nVJY
         UpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        fh=hZ/UhhlngwDNQL95P/SMYrrXKkPNwEp0V199AhwvfAw=;
        b=h/hlFpWY1YL7wszHScko2erhDJC+oOM18pYqPoyUf0vvNJNuMehUVym7X3zeH3KnVl
         ObI/S3A9jU0kxBNR0LVa4dDSUY4eI3lY8yi/ChheABwd/QRss2hKXZSrM2cWkGkH+qDI
         dH+1HqaAoe5US0urnsoDvxfGk2NN33/c1YOnER8N4EzRudh2hDXD1/WvAQ6mCVNz1ar6
         dgbaRbkgwm9tNBZZYNtpyhBeutKj7z7J7vyPbPNAmqTH/jjOQsCCPoSkYd/rwk5tSHeH
         d0VVs5MwV7kUBzB2vnqIVKptE0HV8WeOS0zNOXpJFdcdsITO+ihwvJY3zh+FoCPpKFOH
         4iTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045758; x=1789650558; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=fuEVlDOzOIUY8HEogkQ5APy6bBFPFQaA7GXhQj7b4O3Lxio7aKsVIPKZY244E8nr0L
         ZsRllxMoSonjTt7fPArCohppMbtXZIXUFu+uAxizkPMmbVmk/d2JplU3gdMGejUX7F9g
         NS9+NiYWwBO0noxnlxZYahC7xGIEFAwoIfecUCRd8VTDO/wK7eAA/sCinPDBzcjPX2vm
         qDR6M0ae4APGcU1Si4FiP1r+sNc41TtskjL4FGs121CyPCCiQLXS377pmIERcvg7G2Pm
         Cjjf4e10nyN+q591lIdsATICCMdA6R2uPnHv581W0TklhgOQXScOM8ZGXoc2LJ3AWb6y
         rHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045758; x=1789650558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=BasZekZ1Bxa54RFHtHVHjQorKVctO17gLDGmuCMzsiX3nZXvV9FXSiDgGdFAo7Yqjq
         sK0ure7J1D0EJsqgQcri/+myKgBYNOjMqWpWxYagWi0nowzwt6Dj8GVAljnxmHLI9Ccs
         pWXgwrID8mWDdQ/2JuMW+YmkEUiiCGnow3nxiNPYrwF7YjN24RKuqvdmT+6pACTKFRTf
         leX15R+lgiCH2xCbsx9Dc2m6BQJVHjPocuyDq7BQaN1ePlFDjORa0eBbSO7HMvR6eplc
         FRB4tGWHk8WOR7L0SpvCbgLwzcMn1Yd46/JMzLgj9yAaTF44WzGMTC8IbqUSzXMkLi5e
         1ucg==
X-Forwarded-Encrypted: i=1; AKwUvBwYK4YgXrf46rRtaEKJOZklSP2B+w1pk3lk9kWiXbDNR7z41o1eeEK4OU3TcenrM0XQPgU=@lists.linux.dev
X-Gm-Message-State: AFuF++n9cXl7xV/RosWH5/pDIJZTcqRtKW3OwIPZyfhGHQyS5E8C4DoQ
	5qh1XZqLlDCCjTnGYrIfK0HZuYcun+fMw76DwAQ75WUj+VizeYJ2Tpj6I0da2xDG0BSppZNEom1
	h8xzKYlB/zh4j8aMUeumnb3tw+jiX/Ec=
X-Gm-Gg: AYBFou3NO1C2CSwRPrZXhy3quFCSwvdzw/wXiGdg8ApaRNWmh74suHX5ko1/fODfcrA
	YLiGm0J2TGEoS849I0tG8GkxncJJbnGATnyroOyYz3jmJE3Cln9KD/H3klIJ79pQ4N5EziqZWOU
	a9JALzb7QYrkFsDYuG0CGETNtSH9TblAwWYyr7hAh80F7HUY423yBf8egEinocikiHa9I9HP7fm
	taNXJVXlrRzlJTNXHCPzLU2p7Rc+URYTKiV2BoEDBt0o/ztys8lE/6b1DaEx66+8GwwRfWrt/F1
	vKmtfZIQ7oZ0mVCdhO4Eb5O4KRBwsdyiindT0wCKfSfP6mHRGqyYHg+tvjr9BBDzvEjqUKcXV5j
	BlYPvsPGN/Q4B
X-Received: by 2002:a05:600c:6c07:b0:49d:1cc7:5ec3 with SMTP id
 5b1f17b1804b1-49d259138abmr111164355e9.9.1789045757952; Thu, 10 Sep 2026
 06:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
 <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
In-Reply-To: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Thu, 10 Sep 2026 09:08:41 -0400
X-Gm-Features: AcwNN1UEFdvIck3fXBUKab0LkOKuiFOwC71vVQo2jwIoxCjaBOCf3NRiYyhyIhY
Message-ID: <CAJFTR8RYajZ+Az9JvemMCApvUEGG3pDLq1KVkKyAsA6Luw-0BA@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Fabio Estevam <festevam@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 4:21=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> w=
rote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The i.MX platform has grown support for three separate product
> > lines using Cortex-M based microcontrollers over the years:
> >
> >  - i.MX RT1050, a high-end microcontroller
> >  - Vybrid vf610 suppors running Linux on either the Cortex-A5
> >    CPU or the Cortex-M4 MCU
> >  - i.MX7D similarly can run Linux on the Cortex-A7 or the
> >    Cortex-M4
> >
> > There are no known upstream users of any of those three,
There is both a u-boot and buildroot config for i.MX RT1050,
I also do basic regression testing on this platform. I understand the
need to depreciate no-MMU, but it's sad to see them go.

If it helps at all to remove i.MX RT1050 there are only 11 commits
adding it that are from Giulio Benetti and I.
For i.MX RT1170 only 3 commits by me which only got partially
added. See
Commit: fff65226b229 ("pinctrl: freescale: Add i.MXRT1170 pinctrl
driver support")

I also occasionally test the stm32f429-disco as I have one.

> > so
> > drop support and simplify the platform to assume that an MMU
> > is present.
> >
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Vladimir Zapolskiy <vz@mleia.com>
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
> >  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
> >  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
> >  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
> >  arch/arm/configs/imxrt_defconfig              |   35 -
> >  arch/arm/configs/vf610m4_defconfig            |   39 -
> >  arch/arm/mach-imx/Kconfig                     |   27 +-
> >  arch/arm/mach-imx/Makefile                    |    3 -
> >  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
> >  arch/arm/mach-imx/mach-imxrt.c                |   19 -
>
> The imxrt1050-evk dts is used in U-Boot.
>
> Adding Jesse and Giulio, who use this platform in U-Boot.

Thanks for the CC,
Jesse Taube
