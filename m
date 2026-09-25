Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5760530C15B
	for <imx@lists.linux.dev>; Fri, 25 Sep 2026 00:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296323; cv=none; b=gezvT7WhZPlEhRVxSYGKuWEVsyycN2Gzd7+Tybls+HW/OD1j16EuTXU43vOZeGH5F25af9f/LWdxgIU6vamOwPGjSBDU+kAc+g81FLH7xrkOcqfh+RtA09hwGC9GavrtiarA6rRV4fCAAYV3UUzYVwc4zSaoNJvJKjEuVnvBUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296323; c=relaxed/simple;
	bh=mZXu+vhxsaH+UjR9Yl6EatT2etoCICs4Ko62JB3IPhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=swswoozzPHne8Y7KLE9zkh6++08wu1c58UrXY+DiUdAdX+7k7X233FoBjfzmwIcbIFQDpP3DCMJ5Q4lRmMvwcAlE8eyacGE2kvz/w2jpLD9Jyfs6qTcIdqA1ava86COhFkY21IikIJlH8UcyMuQCSRlWEBIBx4zbbpoARZ63kDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dR2tHSPN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dR2tHSPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1741F000FF;
	Fri, 25 Sep 2026 00:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790296320;
	bh=kDOBC8kYIQ4zAOebmNyJqGypmjNhxguGj/bp01AdsGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dR2tHSPN2eNM7l73fLNbcJK1eRzpz6BKtoI6aQ0xe3W/0hzj5p6gcSasK1mvd0LyE
	 S4HN5lG2bLTCVKuJTqKIL/rfpnbd8F2PmM6L34Bc137ofl+CVx9URCbl8MRtxvO0HS
	 UVfdNb15L6giMdKAMmbLFoGJSCR6qXiPYaH0Bz10n16pnNjciQpi9NMkkkZgXVX9b/
	 saFKRZFV0wGKjnofW8wzyq7gdkWbS1vKziOytkwCA8sv9IsusJxZmF8xXmsixsIS4w
	 5QSD8A6ThvMQ0oDmzYJVdOQv8r70LulXrmd08HoyewxrMTkR1TucIWVyCY+Qv7h9B6
	 V8CsDvrsS7T9w==
From: sashiko-bot@kernel.org
Subject: Re: [net-next,PATCH v1] enetc: Increase eMDIO MDC rate to 1.2 MHz
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260924003132.580306-1-marex@nabladev.com>
References: <20260924003132.580306-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 00:31:59 +0000
Message-Id: <20260925003200.4F1741F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] enetc: MDIO clock overclocked beyond 2.5MHz on 400MHz platforms
- [Medium] enetc: incorrect MDIO divisor math for target 1.2MHz clock
--

commit ef3369dd3505cf8547f6092963680d7b7aec54e6
Author: Marek Vasut <marex@nabladev.com>

enetc: Increase eMDIO MDC rate to 1.2 MHz

This commit attempts to increase the eMDIO MDC clock rate to 1.2 MHz to
support PHYs that require at least a 1 MHz MDC clock, such as the NXP TJA11=
20.
It does this by modifying the globally hardcoded MDIO_CFG_CLKDIV value from
258 to 138.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c b/drivers/=
net/ethernet/freescale/enetc/enetc_mdio.c
> index 998aaa394e9c4..30ea91cea00e5 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> @@ -24,7 +24,7 @@
> =20
>  #define ENETC_EMDIO_CFG \
>  	(MDIO_CFG_HOLD(2) | \
> -	 MDIO_CFG_CLKDIV(258) | \
> +	 MDIO_CFG_CLKDIV(138) | \

[Severity: High]
Does this hardcoded divisor result in overclocking the MDIO bus beyond the
2.5 MHz IEEE 802.3 specification limit on platforms with higher base clock
frequencies?

For instance, on platforms like LS1028A where the ENETC system clock is 400
MHz (ENETC_CLK_400M), a divisor of 138 yields an MDC frequency of roughly
2.898 MHz (400 MHz / 138). Could this overclocking cause communication
failures or silent data corruption with standard 2.5 MHz PHYs?

[Severity: Medium]
Does this new divisor mathematically produce the 1.2 MHz clock rate claimed
by the patch?

The commit message states that the old divisor of 258 yields a 558 kHz MDC
rate on i.MX95, implying a base clock of ~144 MHz (558 kHz * 258). With a
~144 MHz base clock, a divisor of 138 yields an MDC rate of ~1.043 MHz
(144 MHz / 138), not 1.2 MHz.

To achieve the 1.2 MHz clock claimed in the commit, should the divisor be
set to 120 (144 MHz / 1.2 MHz =3D 120)? While 1.043 MHz satisfies the >=3D =
1 MHz
requirement for the TJA1120 PHY, it appears to be a mismatch with the commit
message's stated target.

>  	 MDIO_CFG_NEG)
> =20
>  #define MDIO_CTL_DEV_ADDR(x)	((x) & 0x1f)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924003132.5803=
06-1-marex@nabladev.com?part=3D1
