Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C135803BD;
	Tue,  8 Sep 2026 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883515; cv=none; b=nXOodb8m81gT3VpVKNsfAO4jVIvEUWn0XlBXclff++v7Jy3VSyhklolU+7eSIY1MVp+1Gm0OQw431uz8Fp6x0Guc1KUHINc/W+m1cQTbRODz0wnx/SFPe4Y4aXOyKHcNjBAZytQB3fpucrKM+n4ClybLroOgIdJyVjMHU+Bztzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883515; c=relaxed/simple;
	bh=hOuQgcoQcnlovGr/O/JRdONmYhgv1YnCgg8telRPpM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JSfr5tVg0fmJYniVyCt6Nab7Co0LbtEtfdCN4GkYV5FauUTo2GK5bwmnEybLrxSyWOCGbbtrVZFwBGEnWyS84CpNZHNo6i/8kMRQgbYkv9Q57gB2cJh3V92MEr4Kvt/ufb7zg7IRwj8N6j9IMrB/Z2c5oQuMg/w2nwH8F+boHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+2Fm7ww; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+2Fm7ww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE271F00A3D;
	Tue,  8 Sep 2026 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788883512;
	bh=u0GGnkpAZ2l2MiiOxDY+YdlOYsRlajV7Tx+Ols1QYfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z+2Fm7wwv7pftpRopJXHrpObwj0TP/3NmqLaelwYeo+eA4o0rA6wMaeTc7qy9Gq7b
	 QHa1OrKorzGWIuscuvHDw6lPkmXDJTiEIazepxtB3vrJJDa1UpN/P6fh4zmfOZgxIs
	 C8sO/wpBM3HaJDR1b/3h26B7XekxFkNm+wdhbIgyGR2wC1i19QQiu0jqyCTdO73ASw
	 IBDbUS25v6zVejLSFXRBa6S/S0vewj0T8hjobtRqRzTJMUyZe2witVYNi3XRAOUKrz
	 j1U6/wYcSY0stnD6d+sTsR5JsT/RvQT9onUA9SJpR0obA7MA2yJXDromjVJetKzYft
	 /bctKsJE9feeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/13] ARM: imx: remove i.MX31 SoC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260908152808.3928630-8-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-8-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 16:05:11 +0000
Message-Id: <20260908160512.0FE271F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removal of SOC_IMX31 leaves dangling references in Kconfig files=
 and orphaned code, violating Kconfig guidelines.
--

commit 9fd3329c9e9c5af4c9aa12b23d3a92bfd1566e55
Author: Arnd Bergmann <arnd@arndb.de>

ARM: imx: remove i.MX31 SoC support

This commit removes support for the Freescale i.MX31 SoC based on the
ARM1136r0 CPU core, which is causing extra maintenance effort. The device
trees, configuration files, and core mach-imx code for i.MX31 are deleted
while preserving support for the related i.MX35 SoC.

> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index e2fc890554631..52387fe2a0573 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -424,13 +424,6 @@ choice
>  		  Say Y here if you want kernel low-level debugging support
>  		  on i.MX28.
> =20
> -	config DEBUG_IMX31_UART
> -		bool "i.MX31 Debug UART"
> -		depends on SOC_IMX31
> -		help
> -		  Say Y here if you want kernel low-level debugging support
> -		  on i.MX31.
> -

[Severity: Medium]
Can the removal of CONFIG_DEBUG_IMX31_UART leave obsolete preprocessor bloc=
ks
in header files?

In arch/arm/include/debug/imx-uart.h, there is still a check for this
symbol:

#elif defined(CONFIG_DEBUG_IMX31_UART)
#define UART_PADDR      IMX_DEBUG_UART_BASE(IMX31)

Could this block now be dead code because the config symbol no longer exist=
s?

[ ... ]
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 3f0521c652cb0..77704c6a70bad 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -39,17 +39,6 @@ if ARCH_MULTI_V6
> =20
>  comment "ARM1136 platforms"
> =20
> -config SOC_IMX31
> -	bool "i.MX31 support (DEPRECATED)"
> -	depends on !SMP
> -	select CPU_ARM1136R0
> -	select MXC_AVIC
> -	help
> -	  This enables support for Freescale i.MX31 processor
> -
> -	  This SoC is scheduled for removal in early 2027,
> -	  since it uses the ARM1136r0 CPU revision.
> -

[Severity: Medium]
Could the removal of SOC_IMX31 orphan the hardware random number generator
driver?

In drivers/char/hw_random/Kconfig, HW_RANDOM_MXC_RNGA currently has:

config HW_RANDOM_MXC_RNGA
	tristate "Freescale i.MX RNGA Random Number Generator"
	depends on SOC_IMX31 || COMPILE_TEST

Since SOC_IMX31 is no longer defined, this driver can now only be selected
via COMPILE_TEST.

Is there also a risk of leaving dead code in the clock driver?

In drivers/clk/imx/Kconfig, CLK_IMX31 has:

config CLK_IMX31
	def_bool SOC_IMX31

Could this convert the driver code into uncompilable dead code since
SOC_IMX31 is removed?

[ ... ]
> diff --git a/arch/arm/mach-imx/mm-imx3.c b/arch/arm/mach-imx/mm-imx3.c
> index 9b0b014d7fe27..42e73518004ae 100644
> --- a/arch/arm/mach-imx/mm-imx3.c
> +++ b/arch/arm/mach-imx/mm-imx3.c
[ ... ]
> -void __init mx31_map_io(void)
> -{
> -	iotable_init(mx31_io_desc, ARRAY_SIZE(mx31_io_desc));
> -}
[ ... ]
> -void __init imx31_init_early(void)
> -{
> -	struct device_node *np;
> -
> -	mxc_set_cpu_type(MXC_CPU_MX31);
> -	arch_ioremap_caller =3D imx3_ioremap_caller;
> -	arm_pm_idle =3D imx31_idle;
> -	np =3D of_find_compatible_node(NULL, NULL, "fsl,imx31-ccm");
> -	mx3_ccm_base =3D of_iomap(np, 0);
> -	of_node_put(np);
> -	BUG_ON(!mx3_ccm_base);
> -}

[Severity: Medium]
Are there dangling declarations left behind in the subsystem headers?

In arch/arm/mach-imx/common.h, these declarations still exist:

void mx31_map_io(void);
void imx31_init_early(void);

Could these dead declarations be removed as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908152808.3928=
630-1-arnd@kernel.org?part=3D7
