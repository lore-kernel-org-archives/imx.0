Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B2556511C;
	Tue,  8 Sep 2026 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882228; cv=none; b=JukJI5co/LDLDQi/1d7iadg/C7SbqBPiJyVe6jRkEMhh7SskYmjhNudmqe9IcHT+ea/lmpLkzU9hgOl5m9ISHWXemEtdIx96ZSIx6qdFClsFJEV9F8OZ1TBRWM4hYBBFOiyC1Wwa9GO/tTohxHuwr9KP1TBT4f98q6M778FKsRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882228; c=relaxed/simple;
	bh=Yik3sgBUbcM+9gXHeTKVLy3wic2xdXyxBtetF+LCHHc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Afu0M016YkyGPqP7uoRi5KJrCoxkMrj3HcD+vjH87FwyAnbyPo1GSWetCu5us5VhuRBN0NhonAcZUyBawq/iHNTIB45bXDh95eDKghBajlk9hS13Rs8k8Q3pU0K9tAcHvgDe8MvawtTohsbzicfPRjYTQWVVbR9JiagK3WW5uF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+NGArXf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+NGArXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA0D1F00A3A;
	Tue,  8 Sep 2026 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882227;
	bh=+/RDf6vKew4POfHlIOlnzcZyGfA5duHYRFyv9V0Wbi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+NGArXfh1vxGgWqnUxZSCzaRtm4GWpRmBUE5ro0jOCj/GbYhT25k6uP+Gtkzxlaw
	 BiHldsBUtK4aalprXFI/X8qJzNQxCRnRxrbDViucXcj+je8wnEI0Gi0cY9B662iiWE
	 8tz2NbKpZ3swbp5yVff5AvkyvOHck1GNTSMeYREUah16aBb5LjhVnnWmj28wz8Fqm/
	 ovcYuHfSVMerumeIUEU93CHlSy3fb9bqnCSEUmmRSTShjozpU+k0WmTfahGqMD9g0+
	 D39eIchty8CM5ssnlxx438odv89XrrLNc6++RCgHgtkjCeaIKJEDmc2R+1kDi3chcN
	 1i0OBHSVPdMnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/13] ARM: stm32: remove stm32f4/f7/h7 MCU support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260908152808.3928630-11-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-11-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 15:43:46 +0000
Message-Id: <20260908154346.CDA0D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete removal of STM32 MCU platform leaves orphaned drivers=
 and dangling Kconfig references
- [Low] Grammatical typo in documentation update
--

commit b3d9699b653730bdc87f076ae9ec5792bb7764a3
Author: Arnd Bergmann <arnd@arndb.de>

    ARM: stm32: remove stm32f4/f7/h7 MCU support
   =20
    The stm32 platform started out as a Cortex-M based microcontoller
    platform in 2007, with a few of the older products gaining Linux kernel
    support in 2016. These days, the only relevant chips for Linux are the
    stm32mp1 (Cortex-A7) and stm32mp2 (Cortex-A35) product lines, with the
    microcontrollers running smaller RTOSs on new products.
   =20
    The microcontrollers were marked as deprecated in the linux-7.3LTS
    release, which will remain supported for a few more years and
    is expected to be sufficient for any of the remaining original users.
   =20
    Remove the MCU support now, leaving only the stm32mp SoCs in the platfo=
rm.

> diff --git a/Documentation/arch/arm/stm32/overview.rst b/Documentation/ar=
ch/arm/stm32/overview.rst
> index 85cfc84107983..b63aa875cb485 100644
> --- a/Documentation/arch/arm/stm32/overview.rst
> +++ b/Documentation/arch/arm/stm32/overview.rst
> @@ -5,15 +5,13 @@ STM32 ARM Linux Overview
>  Introduction
>  ------------
> =20
> -The STMicroelectronics STM32 family of Cortex-A microprocessors (MPUs) a=
nd
> -Cortex-M microcontrollers (MCUs) are supported by the 'STM32' platform of
> -ARM Linux.
> +The STMicroelectronics STM32 family of Cortex-A microprocessors (MPUs) is
> +supported by the 'STM32' platform of ARM Linux, support for the Cortex-M
> +based MCUs is has been removed.

[Severity: Low]
Is there a grammatical typo here? Should it be "has been removed" instead of
"is has been removed"?

[ ... ]

> diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
> index 4ac3384e397aa..6ca8507f94512 100644
> --- a/arch/arm/mach-stm32/Kconfig
> +++ b/arch/arm/mach-stm32/Kconfig
> @@ -1,17 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig ARCH_STM32
>  	bool "STMicroelectronics STM32 family"
> -	depends on ARM_SINGLE_ARMV7M || ARCH_MULTI_V7
> -	select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
> -	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
> -	select ARM_GIC if ARCH_MULTI_V7
> -	select ARM_PSCI if ARCH_MULTI_V7
> +	depends on ARCH_MULTI_V7
> +	select HAVE_ARM_ARCH_TIMER
> +	select ARM_GIC
> +	select ARM_PSCI
>  	select ARM_AMBA
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select CLKSRC_STM32
>  	select PINCTRL
>  	select RESET_CONTROLLER
> -	select STM32_EXTI if ARM_SINGLE_ARMV7M

[Severity: Medium]
This is a pre-existing issue, but does removing this selection of STM32_EXTI
permanently disable the irq-stm32-exti.c driver?

Looking at drivers/irqchip/Kconfig on line 485, STM32_EXTI is defined as an
invisible boolean config symbol. Without being selected here, the driver wi=
ll
never be built. Could the corresponding driver and Kconfig entry be removed=
 as
well?

>  	select STM32_FIREWALL
>  	help
>  	  Support for STMicroelectronics STM32MP1 processors using Cortex-A7
> @@ -20,32 +18,6 @@ menuconfig ARCH_STM32
> =20
>  if ARCH_STM32
> =20
> -if ARM_SINGLE_ARMV7M
> -
> -config MACH_STM32F429
> -	bool "STMicroelectronics STM32F429 (DEPRECATED)"
> -	default y
> -
> -config MACH_STM32F469
> -	bool "STMicroelectronics STM32F469 (DEPRECATED)"
> -	default y
> -
> -config MACH_STM32F746
> -	bool "STMicroelectronics STM32F746 (DEPRECATED)"
> -	default y
> -
> -config MACH_STM32F769
> -	bool "STMicroelectronics STM32F769 (DEPRECATED)"
> -	default y
> -
> -config MACH_STM32H743
> -	bool "STMicroelectronics STM32H743 (DEPRECATED)"
> -	default y

[Severity: Medium]
This isn't a bug introduced by this patch, but doesn't removing these MCU
and debug configs leave dangling references in other files?

For instance, in drivers/clk/Kconfig at line 442, COMMON_CLK_STM32F relies
on these now-undefined symbols:

    def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F=
746)

This silently disables the clock driver and leaves it as dead code. Similar=
ly,
drivers/pinctrl/stm32/Kconfig on line 14 uses MACH_STM32F429 in its visibil=
ity
condition for PINCTRL_STM32F429. In arch/arm/include/debug/stm32.S on line =
7,
the preprocessor directive checks for CONFIG_STM32F4_DEBUG_UART, which was
also removed in this patch.

Could these remaining orphaned drivers and dead references be cleaned up as
well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908152808.3928=
630-1-arnd@kernel.org?part=3D10
