Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801376;
	b=yS/AW9yx1SJfV6Hr20ZWqUbWu/ZH6uxj0Ltc++W9KTZulHWXGGVX2sB4CQWejjA7oZZk
	 ag8cNrLdLVoapbGrxycXbTTVYRUS4wDAhBIWf9FJX6/8r7RylheQ6AOs74xL0ny0+SLNL
	 wL3Z33uwRb3+CEnuQ5wjRmFLiJJIas/tovIkVnGlj/0+giuA7Rj59ChtbV2wl1iYxSTco
	 2jYNntZ6DTJUjonCrPcPkMAPtx73lYfvI+XL6GJw5g25Y8Owll2u/K6i0BNlE83r8n2Tl
	 EjRQjKAfPVkZA7pKhljU2d8aKu8UEpZTF6o68pnBSukWfzm9KI9PiECONZKO4SiNyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801376;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gRwCkUFdDx81Anhrc3DHgSdl+SIDn8+BVNO/7YeFIRM=;
	b=v8yPrD0OV+2iUiBTgs0LR9bCRVSburSGXNUzyIh9I78fL5+0Qvs/Bf/1cw5PmmLMjz6X
	 yF//odj/YCcSfJP5tS+YbzpBBVBbCcIKhBIdrIx4SYy+onnwaAUdQ40LoCJQ60iVD4OBn
	 0rqW1KoA1sCVrvFlOLa8MvREUvjfCjSXRmYF41/N1q4pf01asz6kuaC5wMK3mijiCaDMq
	 QhIdHA0ctq9jXww2sDHx8IOL6y9mvFa4lmMpy3gXkf+JfdSx1XcGYBjQ8MLv3FQiSPGp7
	 9OXSiPujRRz0AhZtvjrYbPIgnrrsCDtO243APlDpSK/qIT2Rk9hdubiO0YrsI7PbE5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgTV2nfY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4C2606A326;
	Wed,  4 Nov 2026 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgTV2nfY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5225B1F000C1;
	Wed,  4 Nov 2026 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801375;
	bh=gRwCkUFdDx81Anhrc3DHgSdl+SIDn8+BVNO/7YeFIRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EgTV2nfY3lXXbwuDJ8pvlIoNUB9qPdyBeXFU7TnAS1OICtYXVu0p4cNBRzA/KBVUp
	 vchL+zrHwPPVYTx1+CzkkLi9TlpV2VmsjGIw7e2MBaDuAFIpxtuTGv+GZTgU5lWp27
	 DLRb8uONynEs54T4reqmoVTUz19AIdPSZcOGfkSgHYkwek29mZCcAYN9cHJe82SiDp
	 74Vnf+NY5FbYdx+Hv+hvpcvkGs44UJLUMabiE25JUQ7sEAJ4JE0+H2wFyx0i7PNs+A
	 rYr0KNIEeh/lA5nuY+y0UAnwjKH5dcN6xHT/hA9MvC9U/k/x3vjeuz7EmIr1A0lA2g
	 1ZqQ5t0xg9F7Q==
Message-ID: <sashiko-outbox-197399@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/5] net: enetc: Add pseudo-MAC support for
 ENETCv4 Ports via a fixed-link node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Manoil" <claudiu.manoil@nxp.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <5a135fdb2f4de0ee90f4c7e691fff34ccab29354.1793712309.git.claudiu.manoil@nxp.com>
References: <cover.1793712309.git.claudiu.manoil@nxp.com>
 <5a135fdb2f4de0ee90f4c7e691fff34ccab29354.1793712309.git.claudiu.manoil@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:09:34 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] net: enetc: NXP_ENETC4 selects OF_DYNAMIC without depending on OF
- [Medium] net: enetc: enetc_phylink_match_pseudo_mac_speed() returns >10G =
fixed-link
--

commit 47b0c7dd1742d2d679a7876866a314bac673517d
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: Add pseudo-MAC support for ENETCv4 Ports via a fixed-link node

This commit adds pseudo-MAC support for ENETCv4 ports by synthesizing a
runtime fixed-link devicetree subnode via an of_changeset using the boot-ti=
me
speed read from the port PCR register.

> diff --git a/drivers/net/ethernet/freescale/enetc/Kconfig b/drivers/net/e=
thernet/freescale/enetc/Kconfig
> index f425f82a6213a..c51d07db2c869 100644
> --- a/drivers/net/ethernet/freescale/enetc/Kconfig
> +++ b/drivers/net/ethernet/freescale/enetc/Kconfig
> @@ -55,6 +55,7 @@ config NXP_ENETC4
>  	select NXP_NTMP
>  	select PHYLINK
>  	select DIMLIB
> +	select OF_DYNAMIC

[Severity: Medium]
As reported by kernel test robot on v2 [1], does selecting OF_DYNAMIC here
without depending on OF cause Kconfig unmet dependency warnings and link
failures when CONFIG_OF is disabled?

In drivers/of/Kconfig, OF_DYNAMIC (and OF_KOBJ, which it selects) is defined
inside the if OF block:

drivers/of/Kconfig:
if OF
...
config OF_DYNAMIC
	bool "Support for dynamic device trees" if OF_UNITTEST
	select OF_KOBJ

When building with CONFIG_OF=3Dn and CONFIG_NXP_ENETC4 enabled (for example,
under CONFIG_COMPILE_TEST=3Dy on x86_64), selecting OF_DYNAMIC forces
CONFIG_OF_DYNAMIC=3Dy while CONFIG_OF remains disabled.

Because CONFIG_OF_DYNAMIC=3Dy is set, include/linux/of.h exposes extern
declarations rather than inline stubs for the of_changeset_*() and
of_node_put() helpers, while drivers/Makefile only descends into drivers/of/
when CONFIG_OF is enabled. As a result, the calls to of_changeset_init(),
of_changeset_create_node(), of_changeset_add_prop_u32(),
of_changeset_add_prop_bool(), of_changeset_apply(), of_changeset_revert(),
of_changeset_destroy(), and of_node_put() in enetc4_add_ppm_fixed_link() and
enetc4_put_ppm_fixed_link() fail with undefined references at link time.

Should NXP_ENETC4 depend on OF, or only select OF_DYNAMIC if OF (with the
relevant calls or stubs guarded accordingly)?

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> index 8206884294a47..3ba46c3a7670b 100644
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
What happens in phylink_parse_fixedlink() when an ENETCv4 pseudo-MAC port h=
as
PCR[PSPEED] configured for 20000 or 25000 Mbps at boot?

In enetc4_link_init() -> enetc4_add_ppm_fixed_link(), the driver reads the
hardware speed via enetc4_get_pcr_speed(), maps it through
enetc_phylink_match_pseudo_mac_speed(), and writes the resulting speed
(SPEED_20000 or SPEED_25000) into the synthesized fixed-link node's speed
property before calling enetc_phylink_create() -> phylink_create().

However, in drivers/net/phy/phylink.c, phylink_parse_fixedlink() populates
pl->supported using phylink_fill_fixedlink_supported(), which only sets link
modes up to 10000baseT_Full:

drivers/net/phy/phylink.c:phylink_fill_fixedlink_supported() {
    linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, supported);
    linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, supported);
    linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, supported);
    linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, supported);
    linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, supported);
    linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, supported);
    linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, supported);
    linkmode_set_bit(ETHTOOL_LINK_MODE_5000baseT_Full_BIT, supported);
    linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT, supported);
}

Because pl->supported has no 20000 or 25000 Mbps link modes set,
phy_caps_lookup() in phylink_parse_fixedlink() returns NULL for SPEED_20000
and SPEED_25000, triggering:

    phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n", ...);

and leaving pl->supported, pl->link_config.advertising, and
pl->link_config.lp_advertising with no speed link modes set.

[1] https://lore.kernel.org/r/202610151650.UHqL0Sb7-lkp@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793712309.gi=
t.claudiu.manoil@nxp.com?part=3D1
