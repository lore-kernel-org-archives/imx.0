Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4C23F58CC
	for <imx@lists.linux.dev>; Sun, 20 Sep 2026 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789903433; cv=none; b=BidSduw3b5y+XTMCVEiMeqypdTMg4GqRjmXT9LWVgMbNsnEFmdFRtxtihiClEQ8R5vjkGwCVGgZleGgcOQG5lCss176R1GEey8Phq6V2qQ/+6lneMpcWHqyO4AIqMF7PEeBdH+vDwZLOJUqXssBoZ2xBltQEGyOCEBiTtKTOkwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789903433; c=relaxed/simple;
	bh=WSc3+yvS9JOo9D3z/dB6wPmzDHMJHC0bGLZ/juFAuYs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UtONGYru89Fm8lnv1q7BTFI6j7mdEZpWs1DFGt33gyBfPT588006B7IL000l0aGp8FPJwkjePK2UARC5CdFp8K71lweTizNcySgG6siuHIPicXRxG7picFVdFIBs0dhcNHfusghsiIraPjIDVvvGzjsGsYzCZxEZdltR3HycOMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQzW4zNO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQzW4zNO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67771F000FF;
	Sun, 20 Sep 2026 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789903432;
	bh=yTChrhpeZ39+OM+x/SzyBKVkct9L7PNwz1loHtHe8i0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQzW4zNO8v/DJLquoxSJR+8PqnY3Gt7rEOIJB1eB3Q3kSzSh2hmLTwk+US2yEaYMU
	 E3isJUQpTnZCazk9F5cs11g2uQGoxMo0Tb0RkPdPpBipTurWk8q/p8+qGIjopNe/4c
	 W/PFRO3nybNVhQ5J/ot5P6+9H+HdiJayldAYkDrNhVUfaBxzvMDlR5X7+0fB8jQqmV
	 h9mHTa6UCLqHvKHpns/28hTgJsR4bXSY6ng231vJx5RnYaA41Rveduk4b1SahCfqJ6
	 bMFxL+hGeLZMfNwLpaCb1+1LIjVFDuhgmIdyM5xBwAwxYl62M2tmSdKMoU/JGtsmWH
	 7+fG1aCfYjJuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] nvmem: enable COMPILE_TEST for more drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: linux-amlogic@lists.infradead.org, ojeda@kernel.org, gary@garyguo.net, Frank.Li@kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260920111000.2404131-5-linkmauve@linkmauve.fr>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
 <20260920111000.2404131-5-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 11:23:51 +0000
Message-Id: <20260920112351.E67771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] kconfig: missing HAS_IOMEM dependency for MMIO nvmem drivers under =
COMPILE_TEST
--

commit 0ff6b9a5ebbc0d11589f22b1d652ffd1483b0718
Author: Link Mauve <linkmauve@linkmauve.fr>
nvmem: enable COMPILE_TEST for more drivers

This commit enables COMPILE_TEST for three nvmem drivers (NVMEM_S32G_OCOTP,
NVMEM_SUNXI_SID, and NVMEM_ZYNQMP) that previously depended strictly on the=
ir
target architectures. This allows the drivers to be built for coverage test=
ing
across different architectures.

> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index c36c2a4c2a0b7..d38097d6648bd 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -354,7 +354,7 @@ config NVMEM_NINTENDO_OTP
> =20
>  config NVMEM_S32G_OCOTP
>  	tristate "S32G SoC OCOTP support"
> -	depends on ARCH_S32
> +	depends on ARCH_S32 || COMPILE_TEST

[Severity: Low]
Does adding COMPILE_TEST here expose this driver to build errors on=20
architectures without HAS_IOMEM?

Because config NVMEM_S32G_OCOTP exposes MMIO operations, a user configuring
the kernel with COMPILE_TEST enabled on an architecture that does not select
HAS_IOMEM (such as User Mode Linux) will encounter linker errors. Adding a
dependency on HAS_IOMEM would prevent this build failure.

>  	help
>  	  This is a driver for the 'OCOTP' peripheral available on S32G
>  	  platforms.

[ ... ]

> @@ -518,7 +518,7 @@ config NVMEM_SUNPLUS_OCOTP
> =20
>  config NVMEM_SUNXI_SID
>  	tristate "Allwinner SoCs SID support"
> -	depends on ARCH_SUNXI
> +	depends on ARCH_SUNXI || COMPILE_TEST

[Severity: Low]
Can this cause an undefined reference to __ioread32_copy during the build?

The NVMEM_SUNXI_SID driver calls __ioread32_copy() in sunxi_sid.c. This
function is implemented in lib/iomap_copy.c, which is only compiled if
CONFIG_HAS_IOMEM is set. Compiling this driver under COMPILE_TEST on
architectures without HAS_IOMEM results in a linker error. Should this
config also depend on HAS_IOMEM?

>  	help
>  	  This is a driver for the 'security ID' available on various Allwinner
>  	  devices.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920111000.2404=
131-1-linkmauve@linkmauve.fr?part=3D4
