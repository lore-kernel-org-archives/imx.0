Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AE1342CB0;
	Tue,  8 Sep 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883296; cv=none; b=Ljkdcn05JfKFnjQzuop1gRkmGoZBdihExITb3s9R3CG/Tzw5ZVWnN1OPliaE2ZdqCrJsmENm5I/2R9nkPrkgwfbxsoJZFeXHXEgb8mV/aQycKIrsGc0wccJMeH9BeoYPNu3wf3461OsF+FH++gFedeMs8vX6WmDbX/dUhn30v+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883296; c=relaxed/simple;
	bh=MtvMXmIIPDfU3gc4qRBGvTkQFNARWzG/nIwCXI9w63I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VQr4En8eQ786GBUrvwbDTj7gLqxP4taI/Tj7GS3l6IEP6vUqjLixtSLgA+PH2XnGbvwl7nvgaEP8Y1t8sceaAEVpPv4tbi+pxDJHnwrXOXoSxzb9plWylDgHGIq4KKKWc8omcohQUKn781Lze8bbL5DMJaxhVdAnc5KGZl3hzcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=airhXA5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="airhXA5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BD81F00A3A;
	Tue,  8 Sep 2026 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788883294;
	bh=41YW8BKs1FUNickQitJ9cG2hQjoGhACc9v6pbMt5AUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=airhXA5BZxJE8UqypJGn7pohqZaZTExs2ecpTPGm0b/Xu7jLVsttEFZn/a9+d/4TL
	 GJhtl+cXxyA4BYWWbrlcOdZDtUX9acbL2UL78DB9q0/nhBuKfBHDIiEgWutnR2y3aa
	 nhLsjYhnksGJjygRPNgEcl/7+FKo0XAWCENnurEc4CmLaKL91bvtynyS43NimrfTRz
	 00E5/s4Yw/Ce8Tg4dd8+wVWgc/mh7N/beB61T5Mm+pq8rhGt/kBcXXq30QeBNOl1ts
	 gUOEvzt74oGi7flwHGuJsB/XV01w2glrEnaJ57/qe3NWYfhtYMXT/RIMegXE7A3REr
	 hjw6UpP9pVjtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/13] ARM: remove legacy pxa board files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908152808.3928630-5-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-5-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 16:01:33 +0000
Message-Id: <20260908160134.A3BD81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Removed Kconfig symbols are still referenced in `depends on` sta=
tements of other subsystems, violating Kconfig dependency rules.
- [Low] Orphaned board-specific driver files and dead `#ifdef` blocks were =
left in the tree after their Kconfig options were removed.
- [Low] Dangling function declarations for removed platform data setters in=
 subsystem headers.
--

commit ef1288803408f45e1d5ad605b925ffe5c498323f
Author: Arnd Bergmann <arnd@arndb.de>

ARM: remove legacy pxa board files

This patch removes support for several legacy PXA board files, including
the Sharp SL series and Gumstix expansion boards. It deletes the associated
machine initialization code, defconfigs, and board-specific headers.

> diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
> index 2fb29b9ef7446..354e3dc177763 100644
> --- a/arch/arm/mach-pxa/Kconfig
> +++ b/arch/arm/mach-pxa/Kconfig
[ ... ]
> -config GUMSTIX_AM200EPD
> -	bool "Enable AM200EPD board support"
> -
> -config GUMSTIX_AM300EPD
> -	bool "Enable AM300EPD board support"
> -
> -endchoice
> -
> -config PXA_SHARPSL
> -	bool "SHARP Zaurus SL-5600, SL-C7xx and SL-Cxx00 Models (DEPRECATED)"

[Severity: Medium]
Since PXA_SHARPSL and related configs are removed here, does this leave
unmet dependencies in other subsystems?

For example, in drivers/pcmcia/Kconfig, PCMCIA_PXA2XX has:
    depends on ARM && ARCH_PXA && PCMCIA && PXA_SHARPSL

Similarly, LCD_CORGI in drivers/video/backlight/Kconfig and
SND_PXA2XX_SOC_SPITZ in sound/soc/pxa/Kconfig still depend on these
removed symbols, making them unreachable. Should these Kconfig entries
and makefile rules, like pxa2xx-obj-$(CONFIG_PXA_SHARPSL) in
drivers/pcmcia/Makefile, be removed as well?

[Severity: Low]
With the removal of these board configurations, are there orphaned drivers
and dead code blocks left in the tree?

For instance, drivers/pcmcia/pxa2xx_sharpsl.c,
drivers/video/backlight/corgi_lcd.c, and sound/soc/pxa/spitz.c appear
to be specific to the removed Sharp SL and Spitz boards. The sharpsl-nand
device probed in drivers/mtd/nand/raw/sharpsl.c is also no longer
registered.

Additionally, there are leftover ifdef blocks, such as
#ifdef CONFIG_GUMSTIX_AM200EPD in drivers/video/fbdev/core/fbmem.c
(inside register_framebuffer) and include/linux/fb.h, as well as
#ifdef CONFIG_SHARPSL_PM in drivers/hwmon/max1111.c (in max1111_read_channe=
l).

Could these drivers and dead ifdef blocks be cleaned up in a follow-up?

> -	select SHARP_PARAM
> -	select SHARP_SCOOP
[ ... ]
> diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
> index edad956a1483c..c2a2469a003a2 100644
> --- a/arch/arm/mach-pxa/devices.c
> +++ b/arch/arm/mach-pxa/devices.c
[ ... ]
> -void __init pxa_set_fb_info(struct device *parent, struct pxafb_mach_inf=
o *info)
> -{
> -	pxa_device_fb.dev.parent =3D parent;
> -	pxa_register_device(&pxa_device_fb, info);
> -}

[Severity: Low]
With the implementations of these platform data setters removed, should
their corresponding external declarations be cleaned up from the
subsystem headers to prevent dangling prototypes?

For example:
- pxa_set_fb_info() in include/linux/platform_data/video-pxafb.h
- pxa_set_ohci_info() in include/linux/platform_data/usb-ohci-pxa27x.h
- pxa_set_mci_info() in include/linux/platform_data/mmc-pxamci.h

> -
> -static struct resource pxa_resource_ffuart[] =3D {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908152808.3928=
630-1-arnd@kernel.org?part=3D4
