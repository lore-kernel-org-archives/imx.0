Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCACB3BB11D
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892277; cv=none; b=MtGa1j2uEGh5qEkaPqDi4qWITyrFKrc+1Sd/cYRzDMJV7kxxI/3mGQ3tsXiNkV7X6HCZbI+OjcqCJ+oyE1eqnlWDtrB5BDtxBKaFYupNEwuPJRp3IaPyiqtMC9/ZQ91gVoGZg5BM0C525KsRZYrYDQT3oomgAAmGnSXZzQzcwwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892277; c=relaxed/simple;
	bh=PCvNYXynXpWOqHwvwh/7LLqJn7yuofP3uCveQbXQPAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=chKl3TRWL63cgZe4NKqZvCP2L3YKO10Sbh70Gu4j4p4XcX83xzIsix2hrBBUpXZG5/wuHK2yOTdM9SmoFO0vIEv6lS/BDDV8j+ZExcgnCH6/dxb6rrzkJLXoVU5zmX3jIwuuHmDycHdsu4pBHig6sI7SZh2Ak8HxYs3yTA1ohYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgaIfYJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgaIfYJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900D81F00A3A;
	Wed,  1 Jul 2026 07:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892276;
	bh=CyBpYHBufiqyNoZX7YUHVaIfxCrRUyeBgNOvhhb7BEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cgaIfYJ9xymIqZlrX/9n7bJjYf9YQvi4nIOrW3d5svJM7pltoFMX3f/m+fjLtSOM3
	 HZg7W2fMNZmf6/O1EzhBRhB4WIFx73r39ht5+bKLLvow1qlZD9PnvR37HZO8w4B87b
	 JZK/Vns+sYpcygX+iqonfK6BvQxGLe2bJh35//SuvSo6u2Ikgpbu3sW1747lbN3Y5s
	 lTmUF7Tp6twubAdwu8N+uBimDDtyyCPFuAgH1mvfE9zfC5GV7krxKqRJvGpMeW4t78
	 Sc77I/2veE2ddeRCZAaALZWKt5pCrv3tblUWkB6bnzJXRenGplv2gLYQN+yLt6f/L2
	 2hEmTSf80yk0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 07/14] net: enetc: differentiate phylink
 capabilities for pseudo-MAC and standalone MAC
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260630072036.382761-8-wei.fang@oss.nxp.com>
References: <20260630072036.382761-1-wei.fang@oss.nxp.com>
 <20260630072036.382761-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 07:51:16 +0000
Message-Id: <20260701075116.900D81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect unconditional advertisement of 5G/10G MAC capabilities a=
nd 10GBASER/XGMII interface modes for older ENETC v1 hardware.
--

commit afb9f1b607c70d3a6a854e15aaa034f99fb49f5c
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: differentiate phylink capabilities for pseudo-MAC and standalon=
e MAC

The ENETC pseudo-MACs are proprietary internal links that do not implement
any standard MII interface, so restrict their supported PHY interface modes
to PHY_INTERFACE_MODE_INTERNAL only. This also expands the supported
interface modes and MAC capabilities for standalone ENETC.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> index 3597cb81a7ccb..adf79a99a8c81 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c

[ ... ]

> @@ -400,25 +400,40 @@ int enetc_phylink_create(struct enetc_ndev_priv *pr=
iv, struct device_node *node,
>  {
>  	struct enetc_pf *pf =3D enetc_si_priv(priv->si);
>  	struct phylink *phylink;
> +	unsigned long mac_caps;
>  	int err;
> =20
>  	pf->phylink_config.dev =3D &priv->ndev->dev;
>  	pf->phylink_config.type =3D PHYLINK_NETDEV;
> -	pf->phylink_config.mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> -		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
> =20
>  	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
>  		  pf->phylink_config.supported_interfaces);
> -	__set_bit(PHY_INTERFACE_MODE_SGMII,
> -		  pf->phylink_config.supported_interfaces);
> -	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> -		  pf->phylink_config.supported_interfaces);
> -	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> -		  pf->phylink_config.supported_interfaces);
> -	__set_bit(PHY_INTERFACE_MODE_USXGMII,
> -		  pf->phylink_config.supported_interfaces);
> -	phy_interface_set_rgmii(pf->phylink_config.supported_interfaces);
> =20
> +	mac_caps =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
> +	if (!enetc_is_pseudo_mac(priv->si)) {
> +		mac_caps |=3D MAC_10 | MAC_100 | MAC_1000FD | MAC_2500FD |
> +			    MAC_5000FD | MAC_10000FD;
> +
> +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> +			  pf->phylink_config.supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> +			  pf->phylink_config.supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> +			  pf->phylink_config.supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_USXGMII,
> +			  pf->phylink_config.supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_10GBASER,
> +			  pf->phylink_config.supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_XGMII,
> +			  pf->phylink_config.supported_interfaces);

[Severity: High]
Will this unconditionally enable 5G and 10G speeds for older ENETC v1
hardware?

If a 10G capable PHY is attached via USXGMII to an ENETC v1 port, it appears
the link will negotiate at 10Gbps instead of being capped at 2.5Gbps.

If that happens, enetc_sched_speed_set() doesn't seem to handle SPEED_5000 =
or
SPEED_10000:

drivers/net/ethernet/freescale/enetc/enetc_qos.c:enetc_sched_speed_set() {
	...
	switch (speed) {
	case SPEED_1000:
		pspeed =3D ENETC_PMR_PSPEED_1000M;
		break;
	case SPEED_2500:
		pspeed =3D ENETC_PMR_PSPEED_2500M;
		break;
	case SPEED_100:
		pspeed =3D ENETC_PMR_PSPEED_100M;
		break;
	case SPEED_10:
	default:
		pspeed =3D ENETC_PMR_PSPEED_10M;
	}
	...
}

This would cause it to fall through to 10 Mbps and break QoS scheduling.

Additionally, enetc_mac_config() doesn't appear to have support for
configuring the hardware for PHY_INTERFACE_MODE_10GBASER or
PHY_INTERFACE_MODE_XGMII which are now being advertised.

Should these new capabilities be restricted to newer hardware revisions?

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630072036.3827=
61-1-wei.fang@oss.nxp.com?part=3D7
