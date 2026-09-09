Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DBC41DE11
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 20:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985305; cv=pass; b=tnbufa1BGLagGnofRX+XzjTZn6FmXiUtnRNsY8fZSYDfeGDAK8XVwN8wFdxnnp3P/af6g/pakS259DSt+J8y72C+vHnxQR7YMRDRv7oE/EQeeQMhzQxg8D3+VVGUnfmF4jqJBkO+EaG63o3lTb3TXAA/AX3InYT5lCSNCv6uF4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985305; c=relaxed/simple;
	bh=0VHC4PV1n3kvmpJBB03kx86ZwKDGKzt09AXVkbRvG6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DI7AnFsqELRNxB/4dpno6rsX6bgpl9iXnxrpMQ7ajc1Pd7rjRbKXnMXftPGXqs/08Ip2BlYAhEP8sWR0HuzS/mwal608RlfQUZyaeQounajJSB7af5lGzY1xAqkX192HLgjGSq+jZqG1YGP2lw49y6yM5WjSJ2oeXdE3DdjYMLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELiVWHGi; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELiVWHGi"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a1981228f8so54785141fa.1
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 13:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985296; cv=none;
        d=google.com; s=arc-20260327;
        b=bOdR7Jgu1F+LAkUET6dgLDXsZo3PK0ZvMZm3u0E0RmqvW4kUkD9o5c8eLxIGtWdkVp
         4WAReADj98QtAJ7fwpB7fmCxl8TBiGjzZKgfOlV4ZUgUfqA2knN6aICT1WnwvXHyc1W5
         tvTzBxnLC7Z4oubi58HdBj7E4xpUCHPySqJncY+s9v8F1QV7p3e9kvwY3mk/i4c7husB
         wFUj3//rOpWQO1RFhreBfBcgDVK+JKE8S4sMCDIYCRoNNIZNWa0Dl+0f0aw6nYCuEbDB
         ugLfQ0LMCEuATGipBuCUc559I9Whke52yiR4u60AR4C5KiGkqYVhLRK6WbJsa+IQLkr8
         7VRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        fh=en/cNzhW0xDNlVsJmlMrrH04LcwKBFFT7gs41ncm15I=;
        b=BD59XTRJE3LdTHaG2aEDROnIYcPzo5FkQ7Wgq9eBlLN+r36cJ7xzb8AM2P10yEWGdN
         3jZhEcYvj9byxn+34AfYFpkoXdULcQgUqyUhsN348y6BQYtiTRWajJxjyUCwP5ozDiCz
         jMg0KooIjHUtw56gDa09O/GDe+BC7D31DHn0/IH6nAlurlulXGpezO6ud+yMynU0JIgh
         tjRpvbWSsTTq72xkWF8RQt/Dz/qtPVeb04+gB78ssVNrsCZrQ7rsm5Yi2bHdDcOXX9GK
         eR+HcUUs+jNrcoN/4vw6sJRKXDC01MllZ1VaCPz2bTaL7bvNmt9/HGna3XFtADXopA/G
         h+ew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985296; x=1789590096; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=ELiVWHGixDBTYlXABqv+A3K7GYuG8A8Fh7BwWZ7G+RIdm0ofQCDkVrilVHKPph2lCo
         9fgjJC5cxMYkYleXA5TYOpNbF8CYgQ1nN24pMUINxT2RmqN++gQFKHnPh31AjcowPfIF
         +bguZKlpqEo9i/m9+N+yvT35UFDyNUgDh7VAwZ2ThRwUQmjX6Dr2KvAw79Q8zxldZ/QW
         ClwfEEwlfLlo5wOG+yqYjjMU3CKgFEyCanNY8ZFFPAXqvNn0euRzkJNdO+iMzThGu1gT
         u5pzA/HedysIayUtSjCTv16ebvfPsrQHb2MMlVEX5nIUnfdvEArLH8d2ntExKpGDRpOb
         IaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985296; x=1789590096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=XnLNyeOP17ODFRPZLwSgAI/64sW6C2MZY+fPivlvUDK9JFE5o4/TdfgLmb9YcpG2oW
         lhAG5UX8dLI0eAMhpsrrrwdZKFgZ7igt7GAimVEWtijSDFeEaOe+gNCwbpyQF++++ZZB
         6qURcJCja5kOsNe1ufBEMrfUmHhqevRVcWp3MubBC9ij2eO8if7mkEVOf5//jOAuctkl
         PFPFh7vTuUGo7yQPskskp18gr+18XQQYiaGuMtHDEwE52H3lWPxpRYucPEgU6B7o4Rv0
         UIg3qQ5Uy1yivuog/rI8Fq1VeV3bWgPTZxsdiaB3Cpqt2DFK3WI23v4mcl0OmEnmf5E7
         tnfw==
X-Forwarded-Encrypted: i=1; AKwUvByclBjyNqDWUf1EjumnOjQeyT3U2GBYfHRjFqsTnwRsEXhfkcedsZ10IWoAJzSxO0TEtxk=@lists.linux.dev
X-Gm-Message-State: AFuF++lj5bfwKQ+nCzGVi2aRLgTlIFz9C738POYefFZIfYk+iRFVlw8T
	XBdp7hdhKHvU41SR+MK15rjlpB82/w9CZK3eCOwczNw3+14dEuLIDFheGWmYICxDz7BrvnLPyoX
	vW3QteXjkA/E394f0VPgHzU59NGJtvDc=
X-Gm-Gg: AYBFou1c5PRuAZW+K3bctEP4qRtn87Pt2uAMkAYAMWfOK12wMGKeR5BZxjlcohcFqFK
	nM1pOYqYdcL+BOtyBin3Qb+EhiMMPO3/Juf67XhU0VdA3TxE1w8lw7jPQnWVnXiehGSoaXDkm6J
	GtRP+JB4m24X+OWaUM//tMuotzkT1v9/Ai8OKBmV/qDqsx4wY5AsEfGFDYKgDsFMwv4o8gSdlRM
	qy5N3fFAbMoXb8xLp0FO8GviQO8xiIpQKFtvFhXhWv4q9DhGkdcpYmFRM6jytblV9Bb83M7xWIy
	7fpvgnQ5DdV5JnnNhLT0jI+e3KAeFV6W9ejG0NE99hA6p3I8rtB2PhiYw+pTyHKRaTtksQQa0eC
	/wgSAkCLKHnx/P3AmTmAUgfMa9/VDuEZ7sEMlrbrvgnSV
X-Received: by 2002:a05:651c:b0f:b0:3a3:749e:31a4 with SMTP id
 38308e7fff4ca-3a58d92c643mr3500071fa.24.1788985296110; Wed, 09 Sep 2026
 13:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:21:24 -0300
X-Gm-Features: AcwNN1XhCWWR_p45edJ2cAUvnO6YnDwGtKUGW17Fe3LwHfhT5TU0cNccQ42bU4E
Message-ID: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
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

On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The i.MX platform has grown support for three separate product
> lines using Cortex-M based microcontrollers over the years:
>
>  - i.MX RT1050, a high-end microcontroller
>  - Vybrid vf610 suppors running Linux on either the Cortex-A5
>    CPU or the Cortex-M4 MCU
>  - i.MX7D similarly can run Linux on the Cortex-A7 or the
>    Cortex-M4
>
> There are no known upstream users of any of those three, so
> drop support and simplify the platform to assume that an MMU
> is present.
>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
>  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
>  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
>  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
>  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
>  arch/arm/configs/imxrt_defconfig              |   35 -
>  arch/arm/configs/vf610m4_defconfig            |   39 -
>  arch/arm/mach-imx/Kconfig                     |   27 +-
>  arch/arm/mach-imx/Makefile                    |    3 -
>  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
>  arch/arm/mach-imx/mach-imxrt.c                |   19 -

The imxrt1050-evk dts is used in U-Boot.

Adding Jesse and Giulio, who use this platform in U-Boot.
