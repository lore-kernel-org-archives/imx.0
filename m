Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30B03AAF70
	for <imx@lists.linux.dev>; Fri, 25 Sep 2026 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359593; cv=none; b=MliMMFDUXdtKczP4qm9pnva59JZxt5vO1DjZC1eNH/Ig4mjkePlWPaeGBnH1C/+qb32OxWBFPJ308ap7CbVocFqQLemkvLbZ1eaWaT43HcLCEDI1w8fsyy77J9eJV3OJvHckNLQ3vHGbLkN8TiigxuqOqpAlASEHmV9NAJ0tp40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359593; c=relaxed/simple;
	bh=Y/L61sWGjPg+MvteaLeIOYzgWgBq4TGUrIseBygRxEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rFkvjbqwLVEdQfsnKog78+Zr/iqtwNfJlKa8cFANgOzCeOU+hByCCfqGnnp6tQArDJCvmlobRTf8uHThGTmEvaipSImVBkabjnsaDH4Ans0Ke7xYBDvhkk636U9rLTGhk1RgrmbuGeRa1qfOOIlPMc6apQo2fLpAhVY9XTO4Vh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOwiosR+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOwiosR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EF21F000FF;
	Fri, 25 Sep 2026 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790359591;
	bh=M6k9XbBoO70odRmuehry5qLnBC8B3rQ9R1lT4geLtIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WOwiosR+RGgxy5tqLKGnCV9y27kmsShsiFXiyvhZmo1u3GXBfy8Ni5HrnWagKxRN9
	 fsOlEwtzpB9N2lp3WFtC5KsBGX2/djfBkJ/0avQ+mR5sd+utgILY8BHE//6F0Ud49H
	 T8OC9950SCJdRhnwlu/iANJWD/REWM8++LYbd9XPChvHUWZYbVd7ns0DHYq8Cwr1Do
	 Iadd2T3VgRY/64VT+AjcmD1jelXBpZI73ZYVTb1ayS/MKT75ya6enaLaT0h8PxGvhO
	 qQI1itx5yw89N6TbGUbOTGIUhfISM1NAqyaTxbl/1NKrKHI5v7X2UlWk61WxUjUBkF
	 /15pq4a9GT9qA==
From: sashiko-bot@kernel.org
Subject: Re: [net-next,PATCH v2] enetc: Increase eMDIO MDC rate to 2.5 MHz
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260924180607.60932-1-marex@nabladev.com>
References: <20260924180607.60932-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 18:06:30 +0000
Message-Id: <20260925180631.58EF21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] enetc: hardcoded MDIO clock divider change overclocks MDC on faste=
r platforms
--

commit f8edf987f57daf3802702cc91c7af187a4c08ef1
Author: Marek Vasut <marex@nabladev.com>

enetc: Increase eMDIO MDC rate to 2.5 MHz

This commit lowers the global MDIO clock divider from 258 to 66 to increase
the MDC rate to 2.5 MHz for the i.MX95 B0 platform.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c b/drivers/=
net/ethernet/freescale/enetc/enetc_mdio.c
> index 998aaa394e9c4..a90a04a47befd 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> @@ -24,7 +24,7 @@
> =20
>  #define ENETC_EMDIO_CFG \
>  	(MDIO_CFG_HOLD(2) | \
> -	 MDIO_CFG_CLKDIV(258) | \
> +	 MDIO_CFG_CLKDIV(66) | \
         ^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does hardcoding this lower divider overclock the MDC frequency on platforms
with a faster base clock?

The enetc_mdio.c driver is also used on other platforms like the LS1028A,
which typically run the ENETC system clock at a much faster rate (e.g.,
333 - 400 MHz).

Applying a divider of 66 on a 400 MHz clock yields an MDC frequency of
~6.06 MHz. This exceeds the IEEE 802.3 Clause 22 maximum MDC frequency of
2.5 MHz (400 ns minimum period).

Will this break MDIO communication with PHYs on these existing boards?
Should the driver dynamically calculate the divider based on the platform's
actual clock rate rather than hardcoding a value tailored only for the
i.MX95?

>  	 MDIO_CFG_NEG)
> =20
>  #define MDIO_CTL_DEV_ADDR(x)	((x) & 0x1f)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924180607.6093=
2-1-marex@nabladev.com?part=3D1
