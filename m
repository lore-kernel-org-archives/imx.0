Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEDA559C81
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958494; cv=none; b=svJKxNlFydKLKY0ZMj3vr0SO7TC06cWHU3DXenqDvuMgUrHzNqTp2tc7YbBy0nCd7EvaIyo9hQpYMUlPFwczcblYHVJpxoICXpBv1e/PgSB0nnD8m7GW2z6/R0zAwTuGs6LLbGUrj9EXttLEPPdpRgNTNUvUM+gkqBre6q4+MwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958494; c=relaxed/simple;
	bh=jAH9WRQ0ggsOvsHdlKlkxoYUhZgdRnYF6+2XNgzh1NU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TW3xmKZdHgSYcbpH4BI7/asPGrN7/5xrTiAlL6jAFObj8Y8uUEJwMtOJdDUWl8owjByFKiRl9xoBumuS/qLpmvq4X4eZSRT4u5YEUsAxY2ytaEkzy2oCi05RlWLNlE2+PFholRtZ8YVdv0uKeXRcXQ0NIJrOGvJRJjckZSXmvk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pBXlcIme; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pBXlcIme"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0DD94E41372;
	Wed,  9 Sep 2026 12:54:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC88760448;
	Wed,  9 Sep 2026 12:54:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B09611C7AF7D;
	Wed,  9 Sep 2026 14:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788958485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jAH9WRQ0ggsOvsHdlKlkxoYUhZgdRnYF6+2XNgzh1NU=;
	b=pBXlcImemWNdneh0k1Hj1bg9DcpIx2uZGLw6KPAxLtiNBI2GNPFvvdAYeKNLB46Nt29ChS
	7LCgusQF9x2Ekjb4zSDxGZBUL2Jj8oUdPBhE2yFI7GtWt3vKV7gGXVE6jYhTaX4gyOWj4w
	yIYiVLSGoNRWEL+p0q+2aWVNhR1O/OQhR6kt2DoT3gas73BfLJjMuYOUyDlLSJt1zgXZ5U
	Ndz67fuFW6UK0Iv8f407aA9RfKgde8mwABubg6je9fsY6zVCMuEnkrBf+HGvomebcuAHIj
	SURtqMPp/Cy8qmP4OE8V1F0901A3D0YsFs69NnBTkUh3QG4F2ZShHXEPHPqrGw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij
 <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Kristoffer Ericson
 <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore
 <enelsonmoore@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo
 <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, "David
 Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre
 <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Alexander Clouter <alex@digriz.org.uk>, "Jeremy J. Peper"
 <jeremy@jeremypeper.com>, Damien Le Moal <dlemoal@kernel.org>, Niklas
 Cassel <cassel@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul
 <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel
 Lezcano <daniel.lezcano@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
 linux-ide@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 05/13] ARM: orion/dove/mv78xx0: remove all board files
In-Reply-To: <20260908152808.3928630-6-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-6-arnd@kernel.org>
Date: Wed, 09 Sep 2026 14:54:34 +0200
Message-ID: <87pkymmvp1.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The 'orion' platform is the predecessor to what linux now calls the
> 'mvebu' line of Marvell SoCs, and originally covered orion5x,
> mv78xx0, kirkwood, dove and a few others that do not have any
> upstream support at the moment.
>
> Only a few board files remain here, these are the ones left
> in 2022 board file purge because they had some level of support
> in Debian or OpenWRT, mostly for commercial NAS or router boxes.
> This distro support is now gone, and nobody has converted the
> board files to devicetree, though the orion5x and dove platforms
> also come with devicetree support for some other machines.
>

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory
--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
