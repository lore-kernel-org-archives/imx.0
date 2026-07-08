Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D28E3FF893
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500511; cv=none; b=ofUq/DNfjAb0ETbSc+aTPF6EZ4Ynx4UvTdxIk7Nbu8yt7QetwThgvixZLGCWQ7Dsj2MECC2hTvqcijrbgVQGdFYoFo9AhC73rWqULFGUsMjMHCkpDGzhsnJKLWlf43V4rXPU7zG3X1wCU8l0p0QhH9fvKy2k2luoANz6w2TkFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500511; c=relaxed/simple;
	bh=QuHKRHaCqfMMz54R7qcZbKceoGuYYFq8Bi/glwofNKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YrnnnLPpCPqYg+A/3KyxeW0dDtcXxs1+JtcHl2cH14Ek4FaKHM+TtzOvY5oB9caC6snvDZUL9fp9xZ4YOGE//RzyUr1KU27bVevIjschkIsHAhUgZj84+2aaxZUw6Ye5/nRHZ9TJz1T7zTR9k6xggg6J1jYNQQYtA7KHStJcsL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I578PT+f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I578PT+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AE21F00A3A;
	Wed,  8 Jul 2026 08:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783500510;
	bh=6/n+W87Sa9fw1UbtpUKA20EjgoNDyRyRAAy8KbQ0b8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I578PT+fzTRsLXBTnZga8FScd1ZV1Ak7Fh17/haOosEl/uBRLb7OioSY99zsXcW5i
	 HUvzJSzkoWvD16POk7ARnc8R1hdAC2OjFkC17KC5SAwToa9Ww0ARD5X1tGbjp6SWJr
	 ajnP4zYPwy/zHhmfilKtmDK4ndUKGybHkfjGkZSMZYK5nTt69wc9ykpycPUJCso/aP
	 Twq0/l2ic8Mcz3kTBSH1f7Sz8lGF5b2sLSihG4L3RKdYLXhNZu+nQ51gEVRr8umfT/
	 bleaAHZ/+63lxnEiAcYc0fDPsSSbOdOWjCFi9qYRgDo42EjhNu+IYqGkzWfcdn3nFT
	 9944tcPIniGRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 07/14] net: enetc: differentiate phylink
 capabilities for pseudo-MAC and standalone MAC
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260707081834.710730-8-wei.fang@oss.nxp.com>
References: <20260707081834.710730-1-wei.fang@oss.nxp.com>
 <20260707081834.710730-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 08:48:29 +0000
Message-Id: <20260708084829.D6AE21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unhandled PHY_INTERFACE_MODE_1000BASEX in enetc4_mac_config() caus=
es MAC configuration failure.
--

--- Patch [7]: [PATCH v4 net-next 07/14] net: enetc: differentiate phylink =
capabilities for pseudo-MAC and standalone MAC ---
commit 77043a189039feeceb8a61d08f960e3ed8ff9d08
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: differentiate phylink capabilities for pseudo-MAC and standalon=
e MAC

The ENETC pseudo-MACs are proprietary internal links that do not
implement any standard MII interface, so restrict their supported PHY
interface modes to PHY_INTERFACE_MODE_INTERNAL only. For standalone
ENETC (v4), expand the supported interface modes to include 10GBASER.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index f24269a48c26b..75ee117e9b1df 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -602,7 +602,6 @@ static void enetc4_mac_config(struct enetc_pf *pf, un=
signed int mode,
>  		val |=3D IFMODE_SGMII;
>  		break;
>  	case PHY_INTERFACE_MODE_10GBASER:
> -	case PHY_INTERFACE_MODE_XGMII:
>  	case PHY_INTERFACE_MODE_USXGMII:
>  		val |=3D IFMODE_XGMII;
>  		break;

[Severity: High]
This isn't a bug introduced by this patch, but does enetc4_mac_config()
miss handling for PHY_INTERFACE_MODE_1000BASEX?

Since enetc_phylink_create() explicitly advertises support for
PHY_INTERFACE_MODE_1000BASEX, it appears that mode will fall through to
the default branch in this switch statement, printing an error and
aborting MAC configuration.

Could PHY_INTERFACE_MODE_1000BASEX be handled alongside
PHY_INTERFACE_MODE_SGMII and PHY_INTERFACE_MODE_2500BASEX?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707081834.7107=
30-1-wei.fang@oss.nxp.com?part=3D7
