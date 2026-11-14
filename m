Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794669425;
	b=CAaYi4MfsK8Ocu5S2TE6zKAvoRsxKtG4ekBk+qu+CTIPx8hR/ifGgIuNmQrI8njbQz+i
	 xtRf1VftLYA13jWydOL59ca8EXwjZFKicC4fwOL8BwNk7CWmy5pfQHeCDaIK7OndAUSva
	 DAI+u1TBenGJYPcaCUuAd2hiJWbx7noHtXFhIg2ofZs12hDA2qAcnb0rMOOoOUlUlHKUM
	 DaFMxk7sGynLU6QOxR2CunB37uqUYwUg3bX1vqGWn7pFtYIlImIoX/j3YAnOzMx+vAneM
	 s3fwMv07apQiloxghUkxJWl2v4Rfd1T9yFxi5/mOgiOfKlypu5VJKfSp+6WaO59eeXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794669425;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ROn+QFQfaahrcYLRI+99q9IJfxuiNNOOc6dq7yEqlIk=;
	b=UCX4Z6L85YkPG3cwYIUpeQsk5D8cfxwL4ijJhhDjmyS7SoQEUmT7pz1Onz8UCcqqCzAi
	 Tm72w1HH1GLLdmOWfHAtNRLrUH5YLQsfhUJBhBOKVWmQbhEYuFGyvciXxLUVP9+RDEhQ3
	 teXeYSs0vxUDNWjFFs0HHJJSbF5yBucPvpAtLr9R54fIPUax4vmFPffjPA6G1nCApKF58
	 dXeoxTTv6EL29HEl0q3xxoNXEB1MIvQZWKOAQvNnCHWTEvaG1gmxa8GDi+OHttAseQBHQ
	 Esql1P8kmTgECCsKPhhVDVnB27yv/cuBLYUptLxMBbatBqceXSSOecM4Bg6QutfffrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iL4HI2CB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7D606A323;
	Sat, 14 Nov 2026 15:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iL4HI2CB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D751F000C4;
	Sat, 14 Nov 2026 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794669425;
	bh=ROn+QFQfaahrcYLRI+99q9IJfxuiNNOOc6dq7yEqlIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iL4HI2CBBI76QqbK97Kn56oQd2iN/e7pKNDl92HNvEoUW4SySuZWLJLNgG3YkOfc0
	 IrR+MKiWh/Q5NFZJ/iGZrGdG0H50A9A28iCzu/4tc48a3fPxqSnHoG2by8IXGS1B1l
	 9rongXcD/O8EJagNbVeZCagAMZjhiAaln7vWkx+4yUqx6lloyNPNuZlS1nqcnoYl5i
	 7On/KCH9dEKiFQWbbrRm/moNP/z1DvLldntgxlQ3mawvMi2KRGlw+WV3AnQqH4D7Yx
	 g1eH4G/vvwZ8AVaWUzVbBu/wM2m6nHBWVJfXkAs+G72NjwjijXr2NQB1GD5n3MEYM3
	 La+lWj0sSPgjA==
Message-ID: <sashiko-outbox-214685@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/6] net: enetc: Add pseudo-MAC support for
 ENETCv4 Ports via a fixed-link node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Manoil" <claudiu.manoil@nxp.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com>
References: <cover.1794581338.git.claudiu.manoil@nxp.com>
 <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:17:04 +0000
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
- [Medium] net: enetc: enetc_phylink_match_pseudo_mac_speed() returns
  >10G fixed-link
--

commit 15e36db0338302292004a6cbf3727d8f9d63565f
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: Add pseudo-MAC support for ENETCv4 Ports via a fixed-link node

This commit adds pseudo-MAC support for ENETCv4 ports lacking static DT
nodes by synthesizing a fixed-link DT subnode at probe time with the speed
derived from PCR[PSPEED].

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> index 8facc8bf8693a..b032b586f07b4 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> @@ -436,6 +436,43 @@ void enetc_mdiobus_destroy(struct enetc_pf *pf)
>  }
>  EXPORT_SYMBOL_GPL(enetc_mdiobus_destroy);
> =20
> +static struct {
> +	unsigned long mac_cap;
> +	int speed; /* descending order sorted  */
> +} enetc_phylink_pseudo_mac_caps[] =3D {
> +	{ MAC_25000FD,  SPEED_25000 },
> +	{ MAC_20000FD,  SPEED_20000 },
> +	{ MAC_10000FD,  SPEED_10000 },
> +	{ MAC_5000FD,   SPEED_5000  },
> +	{ MAC_2500FD,   SPEED_2500  },
> +	{ MAC_1000FD,   SPEED_1000  },
> +	{ MAC_100FD,    SPEED_100   },
> +	{ MAC_10FD,     SPEED_10    },
> +};
> +
> +static unsigned long enetc_phylink_get_pseudo_mac_caps(void)
> +{
> +	unsigned long mac_caps =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(enetc_phylink_pseudo_mac_caps); i++)
> +		mac_caps |=3D enetc_phylink_pseudo_mac_caps[i].mac_cap;
> +
> +	return mac_caps;
> +}
> +
> +int enetc_phylink_match_pseudo_mac_speed(int speed)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(enetc_phylink_pseudo_mac_caps); i++)
> +		if (enetc_phylink_pseudo_mac_caps[i].speed <=3D speed)
> +			return enetc_phylink_pseudo_mac_caps[i].speed;
> +
> +	return SPEED_UNKNOWN;
> +}
> +EXPORT_SYMBOL_GPL(enetc_phylink_match_pseudo_mac_speed);

[Severity: Medium]
Can phylink_parse_fixedlink() handle SPEED_20000 or SPEED_25000 when
enetc4_add_ppm_fixed_link() writes the result of
enetc_phylink_match_pseudo_mac_speed() into the fixed-link DT node?

When PCR[PSPEED] is configured for 20 Gbps or 25 Gbps at boot,
enetc_phylink_match_pseudo_mac_speed() returns 20000 or 25000, but
phylink_fill_fixedlink_supported() only populates linkmodes up to
10000baseT_Full:

drivers/net/phy/phylink.c:phylink_fill_fixedlink_supported() {
    ...
	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported);
	linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, supported);
	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, supported);
}

As a result, phy_caps_lookup() in phylink_parse_fixedlink() returns NULL,
triggering a phylink warning ("fixed link full duplex 20000Mbps not
recognised") and leaving pl->supported, pl->link_config.advertising, and
pl->link_config.lp_advertising with no speed linkmode bits set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794581338.gi=
t.claudiu.manoil@nxp.com?part=3D1
