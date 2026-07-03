Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F893016EE
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 03:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783049230; cv=none; b=H3DxaEPzmW8NBWJJq3COxO0FWIy8VoRhkRjxlFTv/KtjHM9ljJlDYU8Ik1ZkrzZ9lv0KurW3ZgROEGUHXxk0PVEFoe/yh6F8/lfdlYZjKuuKX3U9q/EKzweWll3RS4z9MFovYP3z5lDaF0SQxotKMyVvv+C+92cW1s7G4rRnkF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783049230; c=relaxed/simple;
	bh=1clCkGEjeq1s5UL/ipxfgLMbbOqeeE19QS72+FeTsh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZjiEbFPoIjxyw6I4PdMz6bYmZREW0kGtYWJ1SFPNhlk24kUluJXM/1veNhIcUuKagoKsLDEWjVh5V5ZfBfRiaPQAVoE6MybFk2aehlaJ5la1wVn5q+7z1mKX3M9V7jkkYWztz0wIGpz9UvgkzMCTkRdIvOR8awNd395jvLPwT+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUvs6CCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUvs6CCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558691F00A3D;
	Fri,  3 Jul 2026 03:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783049224;
	bh=Fz5DAP68C6ygImXV1sETlWVv5QAjcVm+uL69o2znDi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jUvs6CCWqY1vOAQvb2i0D95WqoIbGcXY0WMihkFSFd+5PAfRemFYsJvGq+MGO+aTm
	 8MGTdJmJjmip9UhzDwffDGga2QcCwPwR1rVZaWYWh3ERLNIfBKBw/M/ChJx5rc0jwE
	 85x8J/eeMceOm/kLsNa2H09CDRzL9vRtQy+YKPA62xerVGdc/gVu3vjP1i/JO8aTiu
	 JrvZ4K2S960N/OJ0uL3HnymvzJjW+nWr7/FwhvjaVndk8ELx2lDEpyEnAB3aMFAgFP
	 vUqT90SOX1+Bzyxdx5Say9HIQCje9fYD31fvOvixSXA7otKDyVlXz/3O5HNnW4DK3w
	 W0Wi01Wv4jKbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 07/14] net: enetc: differentiate phylink
 capabilities for pseudo-MAC and standalone MAC
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260702025714.456233-8-wei.fang@oss.nxp.com>
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 03:27:03 +0000
Message-Id: <20260703032704.558691F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding PHY_INTERFACE_MODE_XGMII to enetc_port_has_pcs() erroneousl=
y associates a parallel interface with an internal PCS, breaking XGMII prob=
e.
--

commit 0ce9c644ca0e73f4e3a24d681275147515f923ae
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: differentiate phylink capabilities for pseudo-MAC and standalon=
e MAC

This commit separates phylink capabilities for ENETC pseudo-MACs and
standalone MACs. It restricts pseudo-MACs to internal modes and expands
standalone MACs to support additional interfaces like 10GBASER and XGMII.

[ ... ]
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> index 3597cb81a7ccb..6ccf9b9090549 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
[ ... ]
> @@ -359,7 +359,9 @@ static bool enetc_port_has_pcs(struct enetc_pf *pf)
>  	return (pf->if_mode =3D=3D PHY_INTERFACE_MODE_SGMII ||
>  		pf->if_mode =3D=3D PHY_INTERFACE_MODE_1000BASEX ||
>  		pf->if_mode =3D=3D PHY_INTERFACE_MODE_2500BASEX ||
> -		pf->if_mode =3D=3D PHY_INTERFACE_MODE_USXGMII);
> +		pf->if_mode =3D=3D PHY_INTERFACE_MODE_USXGMII ||
> +		pf->if_mode =3D=3D PHY_INTERFACE_MODE_10GBASER ||
> +		pf->if_mode =3D=3D PHY_INTERFACE_MODE_XGMII);

[Severity: High]
Does adding XGMII here cause probe failures for ENETC v4 devices?

XGMII is a direct parallel MAC-to-PHY interface that fundamentally does not
use a PCS. If enetc_port_has_pcs() returns true for XGMII,=20
enetc_mdiobus_create() will attempt to create an internal PCS via=20
enetc_imdio_create().

Since the ENETC v4 .create_pcs callback is NULL, enetc_imdio_create() will
unconditionally fail and return -EOPNOTSUPP, preventing initialization when
configured with phy-mode =3D "xgmii".

Should PHY_INTERFACE_MODE_XGMII be excluded from this check so it can bypass
PCS initialization and allow phylink to configure the link based purely on
MAC capabilities?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702025714.4562=
33-1-wei.fang@oss.nxp.com?part=3D7
