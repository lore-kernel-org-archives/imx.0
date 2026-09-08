Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781253A8AA;
	Tue,  8 Sep 2026 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882222; cv=none; b=ZVqcYN91NrlzfTQ9d3CP7mb9sPJmJFsgC6IWxG1uR57nYYJQj6JkeCVMvzoyYhf2uxBGxfAL8eXeyw1Cpo4yGIijhry2yglhweB5HMGWeK7F7rxs3OF12uPLtanxDT1PAl+7Sq12jhfvDcMyvfljKs40T5WUepPDt9O5tNmX85U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882222; c=relaxed/simple;
	bh=glkjpmHj3xpV7EHJEeyBiXWt5Kr9Xfv5KlSiO7Fsjv4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=edKJqJSGV3IYbTqppZG/qKoBvMY7aN8rIjSBj7FD310B3t/R0FXJVY3TGw5ZT+KcHjIDrEbHpc64hvHROzLpK4ScAytY25/UUD0me32Itvm4eH1wVYMMXcey+9oh77K7la4bFhsX9857w5AfTRttzIe8OpOTi5Y/m+Twpgp4R80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9RjJI0y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9RjJI0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AA61F00A3A;
	Tue,  8 Sep 2026 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882221;
	bh=TqwPFxJ6YRwLisLwpUYOzTbGLhRloBKBBmEZWlHMwhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m9RjJI0yP878OPuPnuF4kurzo1/fsh+O4nOpgVUwH5UYy+GVRuMqN5+MSD+qcDiJ6
	 ohnT2fMZ2fseS7LEhe47qFeyqxgudpodUXx2f1nugA/gqsbP431P+H3aOWYITXwGlv
	 x31jvKI3IjBMeVnt3n6O5k3unq6tgtbp2KlmC08bjBZn/hjGYBJ92GsYB1Mh3R6MDr
	 moDC4Hkxjs6hGQcPHa19P48EeXXlSEmSKzBuP8/Is7gkPjxCZN17IkTK3AWi9YBBVW
	 p/UwWLNCu3Mb5RIe6jm3FVFZqTfFvRqLdfuCytvk13w0naakDyU87R92PJWVedj3Ao
	 qv0fKcc2hq+fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-9-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 15:43:40 +0000
Message-Id: <20260908154340.F2AA61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Orphaned Kconfig dependencies on the removed `SOC_IMXRT` symbol le=
ave drivers silently disabled.
--

commit ecf588322c385f47ce74ce1a3a67ac11cf5204d7
Author: Arnd Bergmann <arnd@arndb.de>

ARM: imx: remove nommu support

This commit drops support for three Cortex-M based microcontrollers on the
i.MX platform (i.MX RT1050, Vybrid vf610 M4, and i.MX7D M4). It removes the
relevant device trees, configs, and Kconfig entries to simplify the
platform by assuming an MMU is present.

[ ... ]

> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 77704c6a70bad..cdc1b31fe5730 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
[ ... ]
> -config SOC_IMXRT
> -	bool "i.MXRT support (DEPRECATED)"
> -	depends on ARM_SINGLE_ARMV7M
> -	select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
> -	help
> -	  This enables support for Freescale i.MXRT Crossover processor.
> -
> -	  This platform is scheduled for removal in early 2027
> -

[Severity: High]
Does removing SOC_IMXRT leave Kconfig dependencies orphaned in other
subsystems?

There appear to be a few config symbols that still depend on SOC_IMXRT:

drivers/clk/imx/Kconfig:
config CLK_IMXRT1050
        depends on SOC_IMXRT || COMPILE_TEST

drivers/pinctrl/freescale/Kconfig:
config PINCTRL_IMXRT1050
        depends on SOC_IMXRT || COMPILE_TEST
        default SOC_IMXRT

drivers/pinctrl/freescale/Kconfig:
config PINCTRL_IMXRT1170
        depends on SOC_IMXRT || COMPILE_TEST

Since SOC_IMXRT is removed here, these drivers might be left silently
disabled on normal builds. Should these drivers and their Kconfig
entries also be removed?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908152808.3928=
630-1-arnd@kernel.org?part=3D8
