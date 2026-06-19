Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA03BA237;
	Fri, 19 Jun 2026 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884807; cv=none; b=FNSyVSRAOIIhRTLPhmkXc78nstOnyIg9gO6DyfeSe005eNyWKnEYhJycpAS0IPI5smO/c0ZBjObE+N4QqjPgX9bf1x6FN1hNIcNuZLE3Tf6Cs6KC4uDx8ywDGW0sB8vo9ch1meoXH7aE8yFNuXb4QcT5+HTXLFBsRpoRprh821E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884807; c=relaxed/simple;
	bh=3bvRyUfTMExxv5DLEmw6jn5KBqMdikwwjNES8hO9eg0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YAkXkDOlX6UIsQzRjHerui1RrZ7/SHJptmzfjttzYe7MHKIJ26fcbJ/rplYShM46/o/14dh5xW4bfBkSdTncMSWdlJziqZdVXTigYidU/9mmWemS3WQ9/C302ogyBonAV+i9KWdHotUvNIGMekXbBeTQtUsPrJWHpKAhYGnpIrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKPXQHR4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKPXQHR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73E41F00A3A;
	Fri, 19 Jun 2026 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884804;
	bh=SMOlTZVJ6a2FTmurycOTxIMqLtBP/9e+JEycA9WJdmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LKPXQHR4DCKG2ulfggGb0kMeujZnclcYR6+w1tOopy8RtQlK6qeajFvZm2z58EBYi
	 LOpKckZ/MvIHfzuG23l118Fe/yfHq3MfTkWGOw6GbU/ODOiSZ3vbsraAcZV5JyEPo+
	 YTQOi1r/lgwAkyCzLP0nb5rAtruBC1d9g5hj5BNWsDMlaqpQ1hoXRi1IHFuC1zyDtE
	 mFrMr/RWGAD/0Zdg+HNW/q3AbybcsdUcSSYx4r5x6xcMEvBQXhTgu/cIzPMS5t1gPo
	 Di7irIhqJTwQgfH3/xmNshV7OqzvUjN35lFntpeSjtqlqGc9vgUd0OWcWhAB+8Pirm
	 Pw0DmALOJ6sNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/11] ARM: mach-lpc: Remove NOMMU platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-8-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
 <20260619-dts_cleanup_arm_mcore-v1-8-0101795a2662@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 16:00:02 +0000
Message-Id: <20260619160003.C73E41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Incorrect removal of an active MMU platform (LPC32xx) under the fa=
lse premise of removing NOMMU platforms.
- [High] Incomplete Kconfig cleanup leaves dangling dependencies across the=
 kernel, violating Kconfig subsystem rules.

Pre-existing issues:
- [High] Forcing the fallback stub for `lpc32xx_return_iram()` exposes a NU=
LL pointer dereference and a zero-sized DMA allocation bug in `lpc_eth.c`.
--

commit 19639a4680fe193e3e1ece890c77d5f80c446705
Author: Frank Li <Frank.Li@nxp.com>

ARM: mach-lpc: Remove NOMMU platform support

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

Remove the obsolete support to reduce maintenance burden and simplify the
NXP/Freescale platform code.

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 9187240a02db5..fe67d41f4a107 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig

[ ... ]

> @@ -401,8 +401,6 @@ source "arch/arm/mach-ixp4xx/Kconfig"
> =20
>  source "arch/arm/mach-keystone/Kconfig"
> =20
> -source "arch/arm/mach-lpc32xx/Kconfig"
> -

[Severity: High]
Does this removal leave dangling dependencies in other subsystems?

For example, drivers/net/ethernet/nxp/Kconfig has:
    depends on ARCH_LPC32XX || COMPILE_TEST

And arch/arm/Kconfig.debug has:
    depends on ARCH_LPC32XX

Since this patch deletes ARCH_LPC18XX and ARCH_LPC32XX but doesn't clean
up the references to them, will these become dead code that violate Kconfig
subsystem rules?

>  source "arch/arm/mach-mediatek/Kconfig"
> =20
>  source "arch/arm/mach-meson/Kconfig"

[ ... ]

> diff --git a/arch/arm/mach-lpc32xx/Kconfig b/arch/arm/mach-lpc32xx/Kconfig
> deleted file mode 100644
> index 138599545c24c..0000000000000
> --- a/arch/arm/mach-lpc32xx/Kconfig
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -
> -config ARCH_LPC32XX
> -	bool "NXP LPC32XX"
> -	depends on ARCH_MULTI_V5
> -	depends on CPU_LITTLE_ENDIAN
> -	select ARM_AMBA
> -	select CLKSRC_LPC32XX
> -	select CPU_ARM926T

[Severity: High]
Is LPC32XX actually a NOMMU platform?

Looking at the definition being removed here, it selects CPU_ARM926T and
depends on ARCH_MULTI_V5.

Since ARM926EJ-S features an MMU and runs standard Linux, does removing this
under the premise of removing NOMMU platforms accidentally delete an active,
MMU-equipped SoC?

[ ... ]

> diff --git a/arch/arm/mach-lpc32xx/common.c b/arch/arm/mach-lpc32xx/commo=
n.c
> deleted file mode 100644
> index 304ea61a07160..0000000000000
> --- a/arch/arm/mach-lpc32xx/common.c
> +++ /dev/null

[ ... ]

> -static u32 iram_size;
> -u32 lpc32xx_return_iram(void __iomem **mapbase, dma_addr_t *dmaaddr)
> -{

[Severity: High]
This is a pre-existing issue, but does removing ARCH_LPC32XX permanently
expose a bug in the lpc32xx_return_iram() fallback stub?

When the platform is removed, include/linux/soc/nxp/lpc32xx-misc.h
forces the use of the dummy implementation:

    static inline u32 lpc32xx_return_iram(void __iomem **mapbase,
                                          dma_addr_t *dmaaddr)
    {
        *mapbase =3D NULL;
        *dmaaddr =3D 0;
        return 0;
    }

This unconditionally dereferences the pointer arguments.

In drivers/net/ethernet/nxp/lpc_eth.c:lpc_eth_drv_remove(), the driver
passes NULL for these arguments:

    if (!use_iram_for_net(&pldat->pdev->dev) ||
        pldat->dma_buff_size > lpc32xx_return_iram(NULL, NULL))

Will forcing the fallback stub cause a NULL pointer dereference here?

Additionally, since the stub returns 0, lpc_eth_drv_probe() sets the
buffer size to 0:

    if (pldat->dma_buff_size >
        lpc32xx_return_iram(&pldat->dma_buff_base_v, &dma_handle)) {
            pldat->dma_buff_base_v =3D NULL;
            pldat->dma_buff_size =3D 0;

Could this result in a zero-sized DMA allocation being used as an array
for descriptors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-dts_cleanu=
p_arm_mcore-v1-0-0101795a2662@nxp.com?part=3D8
