Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D625F2472B8
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783161826; cv=none; b=axJDqpprMo/ImjsKqVkyHbwKCVB55TlE+KfV6WX51p6H5zh5YUOLEa/pz9wB8IXsvOiZ0dpAW9/a/rnKWihSZVFYUM8150apsvwPU4M99B5PwoQ/WmOIuj0v5nSlcJ9VxCE+Mxa4KlSDxsSVPrkt3GAkTlhVnDta5FKu3u4UlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783161826; c=relaxed/simple;
	bh=PE1Hl55CaiC7UmRKzFmwXCYPM2NAyj36BAyjXGbRJf4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LQvu/hZiXUL6tzO9RlhGA9rPDLHUpklBqAK1oK6fvW+l3oE5KU4HE4qtfCES5XzER0TN/8nBGymMOFtaK4R1CVrtqhjmLzQnaO0/KtJwsYm2Nc2e2pWGjZ3CjoYUiSzJqQNf+eeXHh1xUC6e7pOqfjkab6WMSwyPf5mS6u+k76Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ie9QuR28; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ie9QuR28"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B94F1F00A3A;
	Sat,  4 Jul 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783161825;
	bh=W/nJnRJ+xPIYLRcl4GCLGFlDdPpkkCFw5pZQGqf1qDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ie9QuR28SQyHFe7zhhS4VR0rxEokcESw3P/X9ZCyFlTKi9dCsh2sz7WhWSKEX6Qzl
	 T9z/FxXd6bLgTUKmvEbYy36Xouc97XEzU/l97UVNpTccaYKd6yc6vD2nqHtrsn00Pl
	 V+0U6+Rx5VP9D7wdHDarDqnDdN2J//tU/mxAueeQyLW2BPJAQWaZlvZ5ZZxNnz1+Jz
	 eYgrq80x6oxoKcQOg7vhO258bGfNT+bDCX7vgXemkOF7dRRdYJn3zPzQG45RIqtJXV
	 6UUuQG/is6DqJun06n7F7euPt3HsfCnED3guhv1unvdiYV8Us2NPWDP/18il2qDei9
	 siprco9g9pj0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 07/14] net: enetc: differentiate phylink
 capabilities for pseudo-MAC and standalone MAC
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260703101328.550714-8-wei.fang@oss.nxp.com>
References: <20260703101328.550714-1-wei.fang@oss.nxp.com>
 <20260703101328.550714-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 10:43:44 +0000
Message-Id: <20260704104345.5B94F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding PHY_INTERFACE_MODE_10GBASER to `enetc_port_has_pcs()` cause=
s ENETC v4 probe to fail because `.create_pcs` is not implemented.
--

commit 394f96d762ecbfe37dfe5cfd42c152159d4e5353
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: differentiate phylink capabilities for pseudo-MAC and standalon=
e MAC

This commit differentiates phylink capabilities between ENETC pseudo-MACs a=
nd
standalone MACs. It restricts pseudo-MACs to internal mode while configurin=
g a
wide range of speeds, and expands standalone ENETC (v4) to support 10GBASER
mode.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> index 3597cb81a7ccb..781b22198ca86 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> @@ -359,7 +359,8 @@ static bool enetc_port_has_pcs(struct enetc_pf *pf)
>  	return (pf->if_mode =3D=3D PHY_INTERFACE_MODE_SGMII ||
>  		pf->if_mode =3D=3D PHY_INTERFACE_MODE_1000BASEX ||
>  		pf->if_mode =3D=3D PHY_INTERFACE_MODE_2500BASEX ||
> -		pf->if_mode =3D=3D PHY_INTERFACE_MODE_USXGMII);
> +		pf->if_mode =3D=3D PHY_INTERFACE_MODE_USXGMII ||
> +		pf->if_mode =3D=3D PHY_INTERFACE_MODE_10GBASER);
>  }

[Severity: High]
Will adding PHY_INTERFACE_MODE_10GBASER here cause the ENETC v4 probe to fa=
il?

If enetc_port_has_pcs() returns true for 10gbase-r, enetc_mdiobus_create()
will call enetc_imdio_create(), which does this check:

enetc_imdio_create() {
    ...
	if (!pf->ops->create_pcs) {
		dev_err(dev, "Creating PCS is not supported\n");
		return -EOPNOTSUPP;
	}
    ...
}

Since enetc4_pf_ops doesn't appear to implement .create_pcs, will device
initialization now fail entirely with -EOPNOTSUPP when configured with
the newly supported 10GBASER mode?

> @@ -400,25 +401,42 @@ int enetc_phylink_create(struct enetc_ndev_priv *pr=
iv, struct device_node *node,
[ ... ]
> +		if (!is_enetc_rev1(priv->si)) {
> +			mac_caps |=3D MAC_5000FD | MAC_10000FD;
> +			__set_bit(PHY_INTERFACE_MODE_10GBASER,
> +				  pf->phylink_config.supported_interfaces);
> +		}
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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703101328.5507=
14-1-wei.fang@oss.nxp.com?part=3D7
