Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564064;
	b=CKpmfHN1GVQdsG1yntCyVXtXR/ndyfwviF19oNWqxxXBVIygdDI4IAtRc9GOePHvLeGD
	 CW9VO8sxLV0T26s19m8SwN2ZsIcWbYYUozvw5OrMw+YSe+9I+82/Uvv/7rZit70hAAA4M
	 UWHa9p2rC0B97sRlprJ0SNr7WsLYA+UQNEQdfDqqzNUOpLwkbUFpDZtCNdx3TG0MjGcfq
	 03QajeI7mpQEmIdhu36cnoy9qiq2uvTbtFzgdE0D6kNzQJjRXiZQA5dRDYQafghLFvN2Z
	 +18CgY0vZopX4eG5OacRxMNzZ7mzV/AdFeB8PcVcYBDrq1FUsVKwHZDf5yZwxuQrqoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564064;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9+GVdAhEdjXXRYid6fC6vP9aoR38b/YU/ofPiDVHR9k=;
	b=Q2tbflmdkUzWcSzY0KRuf4k7lMBhBDCpEVnbhT3HZcMja8WLPF2JCGSjwQklj8gHw6oP
	 BM4cq4qpL8vdbikmZBQAStAxmBoMRqNRKAn2bG7mivLdBFqwJWnRzuWbnuBhjY135iCTX
	 TIkC5FlfdCYf8Hjka8HdDKo0/nt2YSMmCgMEnxFOXPbVBAxBYd6VC9vUYT/n0lkbAzZtT
	 FG4KcTctNjS1WqpTnrVrdf2L1tYWNK1b2Qm6Wx+ArVAh69/ptyL2XAi9SUqOfuuVyPcv1
	 VeJ13+I4aZxoJJlLo+sKPperr4BG0bmAlPjYfistIoZZGcobSewhe5d06Jd3B4euHnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eblSQ/0R";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D1D606A324;
	Sun,  1 Nov 2026 20:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eblSQ/0R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C811F000C1;
	Sun,  1 Nov 2026 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793564063;
	bh=9+GVdAhEdjXXRYid6fC6vP9aoR38b/YU/ofPiDVHR9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eblSQ/0RnfqJ26jn8DnKY7mDF6JS2n/omh9sNB72OY5JAc50FukfX9njw8HUArGgn
	 Lyi676C8n96NaR1m7a1z3WiTGx+VofJp5Goj6cHg06qJLLAGB/uypoIud1Mm3iLm1L
	 H8DdEEjxla2GjkNe5k0RpPsjbIFAoCwFmJdi5FB3S0XKTkbpJ2/3zKdWJsvO8MmnSS
	 s8VlGuuyTbfwF36y6F3Xn8txndXxd9o2z38ZDpbzgwf/ky5uB9Mjlfhebq6PmR4jLD
	 IwlLxx+sFsIMKvRN3QIHLw1HEuvdNTdYElu0crtOxDXbGV2sgUXPlN5k78ffdJ9P67
	 HHkeykN/UmDnA==
Message-ID: <sashiko-outbox-192658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add driver for i.MX BBNSM GP register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Wahren" <wahrenst@gmx.net>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, lee@kernel.org
In-Reply-To: <20261101200140.141642-3-wahrenst@gmx.net>
References: <20261101200140.141642-1-wahrenst@gmx.net>
 <20261101200140.141642-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 20:14:23 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] nvmem: imx-bbnsm: missing MFD_SYSCON dependency in Kconfig
--

commit 72a81833b2595fcf0c62fe0c32408d53d3b1d63b
Author: Stefan Wahren <wahrenst@gmx.net>

nvmem: Add driver for i.MX BBNSM GP register

This commit adds an NVMEM provider driver to expose the general purpose
registers in the Battery-Backed Non-Secure Module (BBNSM) on i.MX9 SoCs.

> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index c36c2a4c2a0b7..8d492d05f1602 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -185,6 +185,18 @@ config NVMEM_BRCM_NVRAM
>  	  This driver provides support for Broadcom's NVRAM that can be accessed
>  	  using I/O mapping.
> =20
> +config NVMEM_IMX_BBNSM
> +	tristate "i.MX BBNSM general purpose register support"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on OF
> +	select REGMAP_MMIO

[Severity: Low]
Should NVMEM_IMX_BBNSM depend on or select MFD_SYSCON instead of selecting
REGMAP_MMIO?

In drivers/nvmem/imx-bbnsm.c, imx_bbnsm_probe() obtains its regmap via
syscon_node_to_regmap(parent) rather than calling any regmap-mmio API
directly:

	priv->regmap =3D syscon_node_to_regmap(parent);
	of_node_put(parent);
	if (IS_ERR(priv->regmap))
		return PTR_ERR(priv->regmap);

On arm64, ARCH_MXC does not select MFD_SYSCON (unlike 32-bit ARCH_MXC). When
CONFIG_MFD_SYSCON is disabled, syscon_node_to_regmap() in
include/linux/mfd/syscon.h falls back to its inline stub returning
ERR_PTR(-ENOTSUPP), causing imx_bbnsm_probe() to fail unconditionally at
runtime. MFD_SYSCON also already selects REGMAP_MMIO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101200140.1416=
42-1-wahrenst@gmx.net?part=3D2
