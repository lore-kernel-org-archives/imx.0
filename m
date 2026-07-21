Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53863FFABF
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 02:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600012; cv=none; b=FMYfQI147+4qkytWD+XxWrHOe5RsdD1KqZMBpG0YAq8fX4ASmU2XjMzwOEEIvmeBzADPMUKYvHHqh/wffjzoz5PmR2DE2c9CsFsLeblkwM3M+5oqQMBxPJOPoOlx9GPiLOfHCOhDxfq03k7I5rdWAtg/ohWHGcgGAAR2dFt/bxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600012; c=relaxed/simple;
	bh=wkvOjStHBni8Vhh9lb2y8BqaOqXJ3YiUX2w2uWBRPDQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hCldY00SJnzCaycteh5jHrAv4en3nbVNUeh1Q8qWxf8YsatLLv9copz/APuKbg5Sukf9d/jiTG4NQBfJ5sNHAROYGp51/mvUfsOFThlD5vp1f6ettPNmXfaAz8Or+ZpoVYj+FgPx2B8z0essDsE1ycQWBUvfA3JpFoU2PkdS6Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDfiI3qo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDfiI3qo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5DD1F00A3A;
	Tue, 21 Jul 2026 02:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784600011;
	bh=krgnpYWKRF77547Owqtkt0upX06XFdz3apRXzzjD1x8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HDfiI3qomzy6KYb/CJYrDzcSLdS2qiChKdC1RhQq8+WgrSnNMyYOPY/z/k6pXXvBb
	 xHnwXiD7bm9l8oeTz6MAL/5D8aRMDlb9iCX44PWnzPLh2QUBMCJgMPkXAe/jl0Qd0c
	 w0NRCXmAcatiXDSh6W9qH5WTbOumDlqD1mCoiheyjnl1pbrgFZAVyuJ+t0FY/HFohB
	 Ml6p/V4VYwORZ2gnVTqSbQZz1W72+qYPIz6nsrip8RKA8JXrKP8Tw0Uo9fDsM4cLXd
	 SaXxd6v6qjVYVA8A7jh1cisgWucLAUk8pB1DvJdS1xutXH4bQP2gztM+Gsdl4COjrh
	 146ovcbyQfaBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 net-next 07/14] net: enetc: differentiate
 phylink capabilities for pseudo-MAC and standalone MAC
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260720014317.1059359-8-wei.fang@oss.nxp.com>
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 02:13:31 +0000
Message-Id: <20260721021331.6E5DD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The patch advertises `PHY_INTERFACE_MODE_10GBASER` as a supported =
interface to phylink despite the feature being incomplete and explicitly un=
supported.

Pre-existing issues:
- [High] The hardware configuration function `enetc4_mac_config()` does not=
 handle `PHY_INTERFACE_MODE_1000BASEX`, leading to runtime errors and an un=
configured MAC.
- [High] ENETC v4 fails to probe for any PCS-dependent PHY interface modes =
because `enetc4_pf_ops` lacks a `create_pcs` callback.
--

--- Patch [7]: [PATCH RESEND v4 net-next 07/14] net: enetc: differentiate p=
hylink capabilities for pseudo-MAC and standalone MAC ---
commit 87cae554b380c00e9f19136c8479811aa8887e05
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: differentiate phylink capabilities for pseudo-MAC and standalon=
e MAC

This patch restricts ENETC pseudo-MACs to PHY_INTERFACE_MODE_INTERNAL while
configuring standard full-duplex speeds. For standalone ENETC (v4), it upda=
tes
the interface modes to include 10GBASER (as preparation) and explicit duplex
capabilities.

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

[Severity: High]
This isn't a bug introduced by this patch, but does enetc4_mac_config() in=
=20
drivers/net/ethernet/freescale/enetc/enetc4_pf.c fail to handle=20
PHY_INTERFACE_MODE_1000BASEX?

If phylink configures the MAC for 1000BASEX, which is advertised as support=
ed,=20
it looks like it will fall through to the default case here and leave the M=
AC=20
unconfigured:

    default:
        dev_err(priv->dev, "Unsupported PHY mode:%d\n", phy_mode);
        return;

> -	case PHY_INTERFACE_MODE_XGMII:
>  	case PHY_INTERFACE_MODE_USXGMII:
>  		val |=3D IFMODE_XGMII;
>  		break;
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> index 3597cb81a7ccb..781b22198ca86 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
[ ... ]
> @@ -359,7 +359,8 @@ static bool enetc_port_has_pcs(struct enetc_pf *pf)
>  	return (pf->if_mode =3D=3D PHY_INTERFACE_MODE_SGMII ||
>  		pf->if_mode =3D=3D PHY_INTERFACE_MODE_1000BASEX ||
>  		pf->if_mode =3D=3D PHY_INTERFACE_MODE_2500BASEX ||
> -		pf->if_mode =3D=3D PHY_INTERFACE_MODE_USXGMII);
> +		pf->if_mode =3D=3D PHY_INTERFACE_MODE_USXGMII ||
> +		pf->if_mode =3D=3D PHY_INTERFACE_MODE_10GBASER);
>  }

[Severity: High]
This is a pre-existing issue, but does ENETC v4 fail to probe for any
PCS-dependent interface modes?

Since enetc_port_has_pcs() returns true for SGMII, 1000BASEX, 2500BASEX,=20
USXGMII, and now 10GBASER, enetc_imdio_create() will be called during probe=
.=20

However, enetc4_pf_ops in drivers/net/ethernet/freescale/enetc/enetc4_pf.c=
=20
lacks a .create_pcs callback. Won't this trigger the check in=20
enetc_imdio_create():

    if (!pf->ops->create_pcs) {
        dev_err(dev, "Creating PCS is not supported\n");
        return -EOPNOTSUPP;
    }

and cause the entire probe sequence to fail for these modes?

[ ... ]
> @@ -400,25 +401,42 @@ int enetc_phylink_create(struct enetc_ndev_priv *pr=
iv, struct device_node *node,
>  {
[ ... ]
> +		if (!is_enetc_rev1(priv->si)) {
> +			mac_caps |=3D MAC_5000FD | MAC_10000FD;
> +			__set_bit(PHY_INTERFACE_MODE_10GBASER,
> +				  pf->phylink_config.supported_interfaces);
> +		}

[Severity: High]
The commit message explicitly states that 10GBASE-R mode is not supported y=
et
and is added simply as preparation.=20

Will advertising an unsupported interface mode to phylink in=20
enetc_phylink_create() cause it to accept configurations for it, leading to=
 a=20
broken configuration state or a hard probe failure when it attempts to=20
configure the MAC and PCS?

> +
> +		phy_interface_set_rgmii(pf->phylink_config.supported_interfaces);
> +	} else {
> +		mac_caps |=3D MAC_10FD | MAC_100FD | MAC_1000FD | MAC_2500FD |
> +			    MAC_5000FD | MAC_10000FD | MAC_20000FD |
> +			    MAC_25000FD;
> +	}
> +
> +	pf->phylink_config.mac_capabilities =3D mac_caps;
>  	phylink =3D phylink_create(&pf->phylink_config, of_fwnode_handle(node),
>  				 pf->if_mode, ops);
>  	if (IS_ERR(phylink)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720014317.1059=
359-1-wei.fang@oss.nxp.com?part=3D7
