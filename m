Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0795251120E
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858253; cv=none; b=gEzBBLwwtUZM8WsUF3A54eVZtv/nt+tWmzfJsCFhxIHfFDMWQJpMMD5KR8SjJWDE/9gTE03eLnul3nmpFxtJq9YtSfzJtMWBzMqgMAolqAWFfaZaI/3uNuTmxNj+Fw6qGAKsRUcS/l4CkHc2G2xxXixGhtrtxtmn4chl7N2Ey9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858253; c=relaxed/simple;
	bh=AEguJwHGoHfAigYwFm4Z58YJCMAcAJ15om+VyScJ5eM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AX/Q3CoAnr9hKMWO45s6sNZylWGCSBifIe0DW8/DGTPXqziZBuKJa6LHdceFaXjmGjrvbUoYdnYy/quekI+mmF29KOiCprVORXYyoOpDIBMz0RDolFtjN+WOEwzRlNHrc/GVYzIPXFlR0Pk2YazxmMW97pb78SAiChLB+v1pcXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0h589ZV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0h589ZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F241F00A3F;
	Tue,  8 Sep 2026 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788858247;
	bh=H/JIf1NQjIb4TKJ8HaRrI6/3Q6deTgypMKedqqV6Ryo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S0h589ZV4AEZ/CiNIf7DQhXV475vatv/xrvmCl5ggpO486l+4dhuZU6IIeBQuMP0I
	 hFA+oBn7YvExTPY4cZ/qeF1JWzo9X5vphAeo288ATXWZrj78LZ9A+E834N97+8pVSb
	 0nlsZWeMaBjhlPz5UuWBM+fg+nh5l7wrhs9yGANIa6PsBrsieQmmetK9+Ed7LFfZpS
	 SXqqgRHDcu0IV02ol/g6Nu5uJPiOJjROIAZyzexzr8WGurA6piJ89wLX/0/EVr8UXO
	 n9q/ZaLcpPYMqo4jvkQGIqGExduI5yb5CbKeXhccFEnu1cZd/Au7bY15UgSX1+2tHx
	 BiKwznyYr4y7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] phy: phy-snps-eusb2: fix FSEL_48_MHZ_VAL definition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, Frank.Li@kernel.org, olteanv@gmail.com, vkoul@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260908085953.3315953-1-xu.yang_2@oss.nxp.com>
References: <20260908085953.3315953-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:04:06 +0000
Message-Id: <20260908090406.A0F241F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing FIELD_PREP() for EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK cause=
s bits 11:8 to always evaluate to 0, breaking the 48MHz PLL configuration.
--

commit 8f10cea005e7c30e78e3855b1b3db039eba68023
Author: Xu Yang <xu.yang_2@nxp.com>

phy: phy-snps-eusb2: fix FSEL_48_MHZ_VAL definition
   =20
According to Synopsys eUSB2 PHY Databook, FSEL_48_MHZ_VAL should be 0x6
for supported 48 MHz reference clock.

> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index af4fa17ac6cbc..3cb18d6ebc1d2 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -21,7 +21,7 @@
>  #define FSEL_20_MHZ_VAL			(0x1)
>  #define FSEL_24_MHZ_VAL			(0x2)
>  #define FSEL_26_MHZ_VAL			(0x3)
> -#define FSEL_48_MHZ_VAL			(0x2)
> +#define FSEL_48_MHZ_VAL			(0x6)

[Severity: High]
This is a pre-existing issue, but does the missing FIELD_PREP() prevent the
48MHz configuration from working on Exynos devices?

When using the 48MHz reference clock, EXYNOS_DIV_11_8_48_MHZ_VAL is 0x1.=20
However, in exynos_eusb2_ref_clk_init(), the PLL config is written without=
=20
shifting:

drivers/phy/phy-snps-eusb2.c:exynos_eusb2_ref_clk_init() {
	snps_eusb2_hsphy_write_mask(phy->base, EXYNOS_USB_PHY_CFG_PLLCFG1,
				    EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK,
				    config->div_11_8_val);
}

Because snps_eusb2_hsphy_write_mask() applies the mask bitwise:

drivers/phy/phy-snps-eusb2.c:snps_eusb2_hsphy_write_mask() {
	reg &=3D ~mask;
	reg |=3D val & mask;
}

Since val is 0x1 and mask is EXYNOS_PHY_CFG_PLL_FB_DIV_11_8_MASK (0x0F00),
the bitwise AND evaluates to 0, leaving bits 11:8 zeroed.

Should FIELD_PREP() be used here to ensure the 48MHz configuration applies
properly?

> =20
>  #define EXYNOS_USB_PHY_CFG_PLLCFG0	(0x8)
>  #define PHY_CFG_PLL_FB_DIV_19_8_MASK	GENMASK(19, 8)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908085953.3315=
953-1-xu.yang_2@oss.nxp.com?part=3D1
