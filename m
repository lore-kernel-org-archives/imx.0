Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888235C6BE
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889262; cv=none; b=giPhCQtOG8QVaENIcQwzws6GFdR4d/6r4n1OLZf7suwwbwM3AvGEyzw3ObVNbXqunaIIGHYi09et68CX7kd2x6Y7WMSlUYXhx6EOPl6UwhRnixIS70wUzpRVTozVq5+y7zP9sKElFgITjksWii9qvIVgfeh8LQ00gTskf6d0UgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889262; c=relaxed/simple;
	bh=f4UIowynbF07Wy7Vh7mDdrS3+ucFbjTlgVg501LnxLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ybs5ecfX5NwF8eNIgUSNIX+VPmzZBFaXkoxNEeKE9vz+YCmOW+wjbwoL1nunc3VWyIUlwNJe4bCWc57+lwVx/7T1qH5l6djYZuDP5m0peObTSjagAFmqUmhAztUOU+XnNIjX/GYYei9NOsH2K1ryCCXWiIXNR4tbHsA1y3HzK44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SX2itkIs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SX2itkIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A771F01558
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889260;
	bh=f4UIowynbF07Wy7Vh7mDdrS3+ucFbjTlgVg501LnxLs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SX2itkIsKQ57+SWp1vh2Qp1dmNoHdR2qMWdigpU0ajr1rmtLto6m2nctH+wMiNUv0
	 IZaIgb4EVExrf4cNKzUTRF8N717Nb1fVQY/I2Dr6qBrXk1wagCwQ/dIBLVUwCYs34p
	 PNDS1RZnWR8Y/iY3IMn9b+u6+IwXszNyDCZNtE2XSM+XHPpps/2Z5KGHX+YwMdxJob
	 ojLz4S7ext5+OrhcOVnkd8fhikQbmFaeFKYtN5hUX/M+m2i22F/bSTRKFVZ3TRdmHZ
	 8Q1jHvoB29BS5zh63DOlbIDJ4EDITm2mATb/4FiFVsqBxOp1n81UJCnubuMTTVosDX
	 jcB2e3tY9aESw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b4ab0e4da6so4890047e87.3
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 10:41:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpiXewflTNUUDEb/90nTVdtkiA9j+JuSwVaGzOzYFWQbEa2q9UCaICMSYSx3t5bvl8OMI=@lists.linux.dev
X-Gm-Message-State: AFuF++ksmtWylkn2e/RJHmkx9a18SB0Cl23mICnZxQ2+pJOQv00aEEyP
	rRloelhiAoMzMPyWTQmGqw14BMNR7tD2DWbKUakL/DUtPKyTnxjzNfQQ6q3rNSeKzJnXFmm53/b
	LC97EC02ur0W97+zH2Cf0rXjBnb51DYM=
X-Received: by 2002:a05:6512:3ca9:b0:5b6:183c:5c87 with SMTP id
 2adb3069b0e04-5b6183c5e04mr5069176e87.37.1788889259016; Tue, 08 Sep 2026
 10:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-14-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-14-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 8 Sep 2026 19:40:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLndhdr2XYp2rYvngPMr4hkCtX3Xqv=bs76kuEK5MAq91Q@mail.gmail.com>
X-Gm-Features: AcwNN1Ujo9rjMuk24CQogLFJvH7ujiRz2lorQ7l9osv6uL8Ek2VIq58WljFfaCg
Message-ID: <CAD++jLndhdr2XYp2rYvngPMr4hkCtX3Xqv=bs76kuEK5MAq91Q@mail.gmail.com>
Subject: Re: [PATCH 13/13] ARM: axxia: remove entire platform
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
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
	Anders Berg <anders.berg@lsi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 5:30=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The initial Axxia port was contributed by LSI in 2014, but never complete=
d
> after the sale of the business unit to Intel, which kept supporting the
> bulk of the drivers in their own downstream BSP.
>
> The downstream work has also ended now, and there is no realistic chance
> that anyone would rewrite it all into an upstreamable port.
>
> Remove it now that the 7.3LTS release is out and can be used as the
> base for one more downstream rebase of the downstream patches if needed.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Cc: Anders Berg <anders.berg@lsi.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
