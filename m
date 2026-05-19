Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26A351C30;
	Tue, 19 May 2026 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189133; cv=none; b=ne1c+UlXfElNb6OTykAE136x9Xa4BFMy2Utow1fDTMNRrNBOvuYuiWHeaUxn3qSIXMz5BrhG7NZkrtYsAE/mBoAPeHokztvxsakxPEA7urdJCWa0sfb6XN5eZRITSkNv0lPuvJZ7vyIxJgtnKgaKAYqy+lVPQCTXrmsD8x0vC8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189133; c=relaxed/simple;
	bh=NL6pEr0lVE0Oz7Jb/DAMuCo4R+Mm/eFSUhMuWgkPAbo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RhkUZDu6QSW44yZfJSgtu9MYMI2IvwPv2FF2xqZMKXZ8XrpVIvcbn65co3x4v2mO7LdcnkcsdrkZg9UZslqvJ0/ED6y4KpEyOc6IhCVggF0sFIILM4EdUVbBMMbsdaxKAXDbB3jZZzgfd7pzgUHACOkJ17giKFzzhakqFPC1SvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URIZmETK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URIZmETK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AC6C2BCB3;
	Tue, 19 May 2026 11:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189133;
	bh=NL6pEr0lVE0Oz7Jb/DAMuCo4R+Mm/eFSUhMuWgkPAbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=URIZmETKsBQ5byM1ozAVlSsAG8aUFBpapNYQe3hyVXQdMo+yfRyktc3g6GM/Ix0Jb
	 bA4rRysax9+BYaAJlM/ybDihO55TO87uEXSffLKX7Fbdelif8h4C4xa0WQoRK35c9z
	 aZyJokmZ9DyW5PrCb/WOgzGPo+qmPpN7sHQ1cBo0XwGnMhrpKJQQgrWxkq8Z0fMpHH
	 ZZ+SMC3E16JMvX+JXCSe1umDxp4asrtBquapf9BQBIsFwIazWXV1KXvWXr63gPpXxp
	 HpKehiQpZXw+J9QkT1fGigyN384lf7VoMpa23iw0YQjcyixDIPzrfzkmtmLR4+xaCs
	 UBd0R5V9inZsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: freescale: add ULP watchdog nodes
 for i.MX platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: alice.guo@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519105517.3638614-3-alice.guo@oss.nxp.com>
References: <20260519105517.3638614-3-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:12:12 +0000
Message-Id: <20260519111212.C9AC6C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Invalid full-width semicolon used to terminate the `bootph-all` pro=
perty in `imx7ulp.dtsi`.
- [Low] Commit message prefix does not accurately reflect the changes.
--

commit bf6ac00d8852230a7eddc4b1f0a7d7bed4fb72cd
Author: Alice Guo <alice.guo@nxp.com>

arm64: dts: freescale: add ULP watchdog nodes for i.MX platforms

This commit adds ULP watchdog nodes to several i.MX device trees, bringing
in previously missing watchdog instances. All added nodes are disabled by
default and include the bootph-all property.

> arm64: dts: freescale: add ULP watchdog nodes for i.MX platforms

This isn't a bug, but the commit prefix specifically mentions arm64, while
the patch also modifies an arm 32-bit device tree in
arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi. Would it be better to split this
into separate patches for each architecture, or adjust the prefix?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/n=
xp/imx/imx7ulp.dtsi
> index 1355feda1aa72..892799e1fe852 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -325,6 +325,18 @@ smc1: clock-controller@40410000 {
[ ... ]
> +		wdog2: watchdog@40430000 {
> +			compatible =3D "fsl,imx7ulp-wdt";
> +			reg =3D <0x40430000 0x10000>;
> +			interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&pcc2 IMX7ULP_CLK_WDG2>;
> +			assigned-clocks =3D <&pcc2 IMX7ULP_CLK_WDG2>;
> +			assigned-clock-parents =3D <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
> +			timeout-sec =3D <40>;
> +			status =3D "disabled";
> +			bootph-all=EF=BC=9B
> +		};

Does this property definition end with a full-width Unicode semicolon rather
than a standard ASCII semicolon? It appears this might lead to a syntax err=
or
when the device tree compiler processes the file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519105517.3638=
614-1-alice.guo@oss.nxp.com?part=3D3
