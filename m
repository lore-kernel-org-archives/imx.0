Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433425;
	b=nmeYrZwZOoK/DxA8Pev/xJbPHgXLwYzYTSIMBV3eH1eJa07T2z7SyiRbmxUuNalXJtu2
	 ZcjOl/pCP7wDgCyEFZVMt7gRGcOdrMmREP4xsMB5v4NNWj6zyXxPyEK25ZaZ3Ai+co/sK
	 yRerxxI77iNl4R3h4G3wzPztI9SUgxX7WHP33N/j+oMy+wR/aI5Y5y31xu5Z8/VYCDNDD
	 LBJh1VT8Pvcx5MpcnjewuX5w3ymzjZnfNMliywq3uAeFeDZGbgEOCgn2mzUQ7Oe6zso3Q
	 OeIzVUDujFIpoojUuCiBVlZlwX4yHeUjTPi2LVaEu/bs2Hawubjgc7kNp23ckVXdxwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433425;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Msnfu3adxbqsk5MWiwy6ci22AXsq+C3wYgFZT8R2TnM=;
	b=zSBsY+iecYGE+s04/J68+f9k8pZ8uLV8MDsCtFushMWeXPe+BHnKI61fznxnqAE7+nec
	 4Rbfdor7dLNASq305r7M4p5JDyjFoPFjZLV8dnfKAjEuFLzrS7x9EpgHBG/mgPruMDxv5
	 h/dDefHBoGi/ip3sPkEQoIB3ABGx4S74Op1XVC7Ed2HbLVpKEKIVd7hrZYDn0Gr/N1neA
	 7otrblyeGtWbB2yRjY7bKno0dHjhFV1/1CI+T2i2QfnvmuMqdbigs4XYUzWlUaKML8jE3
	 8nsSYn6rXEyftN3xtaUwqLTZx6BIkIOVK9OMzZ21BgU72ftUKzccE70Vz4vsRbPTJvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpIlzrTy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4F606A31F;
	Mon, 23 Nov 2026 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpIlzrTy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360821F000C4;
	Mon, 23 Nov 2026 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795433424;
	bh=Msnfu3adxbqsk5MWiwy6ci22AXsq+C3wYgFZT8R2TnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IpIlzrTyocH3zJZgT/Ovshox7wL7NeSR09aLS6CYyAOUj4ALLhhIY9Z9h7VpYrleI
	 XqhXs/iTfRpprWhyNRshvM1emynllbrsPPwpKFQAijVhP2+Y6nznklo3nZ5/4g9KbS
	 NG5YrlQvNc5VHYE+zhASfMkAL0xhDs0oBlN9q1jVZcosIb9MyhMKv4QB0R41c5kjiO
	 rKQgm52UERovs5ooC9Iqj7lmnsHCR6g1RSbkJx+KM+YlaDkdPy6tCvdtTiL7SDwvpD
	 bfTXpBez9k+vJlX+8WmTjqyZnVSw3WfTDgzzYf5R6xVpDmU2YCpEUw0cvOpt/j50Oy
	 IMujczK8Arorw==
Message-ID: <sashiko-outbox-229141@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Enable I2C level shifter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Freimut Diener" <f.diener@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123-imx93-frdm-fixes-v2-1-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
 <20261123-imx93-frdm-fixes-v2-1-dd97c7fca4b1@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:30:23 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: freescale: missing Fixes trailer on I2C level
  shifter bug fix
--

commit 256ea15938a0c1f5220a1a6b6b0a240df9ba2817
Author: Freimut Diener <f.diener@pengutronix.de>

> arm64: dts: freescale: imx93-11x11-frdm-common: Enable I2C level shifter
>
> Without the PMIC's I2C level translator enabled, probing the GPIO
> expander fails with input/output error:
>
>        pca953x 0-0020: failed writing register: -5
>        pca953x 0-0020: probe with driver pca953x failed with error -5
>
> So enable it.
>
> The GPIO expander is connected to the level shifted I2C output of the PMI=
C.
>
> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Freimut Diener <f.diener@pengutronix.de>

[Severity: Low]
This fixes the pcal6408 GPIO expander probe failure on i.MX93 11x11 FRDM.
Should this include a Fixes tag for commit 1a7d97c2d386 ("arm64: dts:
imx93-11x11-frdm: enable additional devices"), which enabled the GPIO
expander, or commit eb2f28413e23 ("arm64: dts: freescale: add support for
NXP i.MX93 FRDM"), which introduced the pmic@25 node without
nxp,i2c-lt-enable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-imx93-frdm=
-fixes-v2-0-dd97c7fca4b1@pengutronix.de?part=3D1
