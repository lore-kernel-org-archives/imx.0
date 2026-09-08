Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BB95650EF;
	Tue,  8 Sep 2026 15:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882117; cv=none; b=bIfjDbaD4CqUiD+Ok55kgCxvGf88cFXOEMb4Kbt/e/fZoEBCSvBP3QUGAadkOHb++iWXjI8m/w7wfGZor8pN83nNNN/kDopzDJwjdkv/VQliOAOq8zOWx/WTVHaO98CRiHtFmIqyNntv6EQUgS+1nXMzIRoqlDAOvWPwGjInCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882117; c=relaxed/simple;
	bh=dvEXrpz9+mP43mUOLnmseGtYCWlpD8MtFs4KKAO96P0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cF+ZRX3JXdNp9HCxAIfB9/GT84GDbW2Y3Cn0BmMk+LHATJjUwoQzImCx10NG8KeKRldcisFq2E53tHWhxZIkb3YU0UuHGjOCtrsdJ9Ax1J22g1SiftE1OQPAixra1fiq4F4c3vSewIlcjJWce8h8oQLfa1/n7WYJR/qP61qz1PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FDB1F00A3A;
	Tue,  8 Sep 2026 15:41:54 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/13] ARM: lpc18xx: remove entire platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260908152808.3928630-10-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-10-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 15:41:23 +0000
Message-Id: <20260908154154.50FDB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete platform removal leaves orphaned Kconfig references a=
nd dead driver code.
--

commit 4fd816877e2bb7047a8b9bdb89bde42225376a14
Author: Arnd Bergmann <arnd@arndb.de>

ARM: lpc18xx: remove entire platform

This commit removes the architecture support for the NXP LPC18xx and LPC43xx
microcontrollers since there are no known users running Linux on them. It
deletes the corresponding platform directory, device tree sources, and remo=
ves
the ARCH_LPC18XX Kconfig symbol.

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index da29afce309f6..13b38be3353a3 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -443,20 +443,6 @@ source "arch/arm/mach-zte/Kconfig"
> =20
>  source "arch/arm/mach-zynq/Kconfig"
> =20
> -# ARMv7-M architecture
> -config ARCH_LPC18XX
> -	bool "NXP LPC18xx/LPC43xx (DEPRECATED)"
> -	depends on ARM_SINGLE_ARMV7M
> -	select ARCH_HAS_RESET_CONTROLLER
> -	select ARM_AMBA
> -	select CLKSRC_LPC32XX
> -	select PINCTRL
> -	help
> -	  Support for NXP's LPC18xx Cortex-M3 and LPC43xx Cortex-M4
> -	  high performance microcontrollers.
> -
> -	  This platform is scheduled for removal in early 2027
> -

[Severity: Medium]
Does this removal leave several driver Kconfig entries and Makefiles with
unmet dependencies?

Removing ARCH_LPC18XX here without also cleaning up the corresponding driver
references causes Kconfig evaluation to check against a non-existent symbol.
For example, in drivers/gpio/Kconfig, GPIO_LPC18XX has:

    depends on ARCH_LPC18XX || COMPILE_TEST

Similar orphaned references to ARCH_LPC18XX are left behind in:
- drivers/clk/Kconfig (COMMON_CLK_NXP)
- drivers/i2c/busses/Kconfig (I2C_LPC2K)
- drivers/dma/Kconfig (LPC18XX_DMAMUX)
- drivers/iio/adc/Kconfig (LPC18XX_ADC)

Additionally, it seems platform-specific driver code is left behind as dead
code. For instance, drivers/clk/nxp/Makefile continues to gate builds on the
deleted config:

    obj-$(CONFIG_ARCH_LPC18XX)  +=3D clk-lpc18xx-cgu.o
    obj-$(CONFIG_ARCH_LPC18XX)  +=3D clk-lpc18xx-ccu.o

Should the associated drivers, such as drivers/pinctrl/pinctrl-lpc18xx.c, be
removed in this patch series as well to prevent unmaintained dead code from
lingering in the tree?

>  config ARCH_MPS2
>  	bool "ARM MPS2 platform (DEPRECATED)"
>  	depends on ARM_SINGLE_ARMV7M

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908152808.3928=
630-1-arnd@kernel.org?part=3D9
