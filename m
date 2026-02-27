Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB192D94AC
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199732; cv=pass; b=F/swIgRyrWutB5dqJEG6Jq121inhznlVefCyV4MPP4ZjzoOzKguy1F9TSbKlIFnHr6mmECMR3dVxATao21t0O/PPrJRQPrCAzihImEMfyjThYoJ/la0mdHjExYg1wrkw038EOLKTLyHUDz9fqiRNN3YoTnG0DM3YcWEymDDfdS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199732; c=relaxed/simple;
	bh=jLVFCfmCwwDGYyE2TA37Jk9yg0QSrnQZYu/oVIAKa00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tqrt4pXUmbL/8xtbTTYKJo0sQtcP9xJITunT03iHrWo/eMCCRFKltF0MQuMuC37RWF4BRI8PKWW7YImDmJQziT+V4Uu82ZSTjBfpL9MOB2fduxlXKjYGNQsKoV9nqjYiW9NkhMTtEFMwWTeme7wov9EYEF3EhNaabeDfZrqbCyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=I4XvwU+T; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="I4XvwU+T"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=yd7VoGo5h85v/tCZbd5Wr9gZqrsgFKoh7cUl95XNvMI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772199711;
 b=pEsPckY2Zx+nrurpQSmhZeDbEw3Th/w28NLPyTp0xua5kO8+RfIS3bZYHS1J60KTn2o48+Pz
 1aFdYTuhs/b6oioqnw5tQc1WS5mWvMGpXACDYVF6pic050lqZ5O9LXE+r7b2dASIzNU6tWHEdfx
 0OyM9NUJcmJsHiqKRseoxs8iX6pMquFadPLR/28Vdr0aMnMa9RWbYnBweULjZniY59htzqYIAGM
 6g9ivc4q5nC2uYPBBIcmr9sfEYvAv55FXnvtRIGHIh2FyUBMTpybZZLlZskODZFLljDYJfr0y6S
 xuexzLnQ36mKnK3ruRuA9NkNzr+p5uQx3GSqYgbbhPivQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772199711;
 b=YW9Hllj4YvTmugmYSJGxq/Qb4CTx972IhR//SDUWekxZ2d/WG8r0R8qjCEZxzxpgiowoZmUN
 Onnaz7IgbecfCNe7rB2bt9hfd8aDM4rgQ4o+rCInYXovAAclql9yye8IrnytiMwjLGGs86zUkA3
 LqSWO89FxryVN5u131iqhdOl/8k77c76uC0UqakhCPQbYyfYMsA5fAMm+ZnTQblUmztaCWKglM7
 dJvZNRM/Hx25FiktOkpjnlFjyC2rAgwgY2G/gwu0JN0ctlCHmPIIIRTwDLyUuWkJKKI3NGtC5Zv
 kogXwe5+GriYDIIGcOVAUI3ndtQoexkBa9gkjVcE6N84A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Fri, 27 Feb 2026 14:41:51 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id E8E585A0F0A;
	Fri, 27 Feb 2026 14:41:40 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Wei Fang <wei.fang@nxp.com>
Cc: aziz.sellami@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3 net-next 1/3] net: enetc: set the external PHY address in IERB
 for port MDIO usage
Date: Fri, 27 Feb 2026 14:41:40 +0100
Message-ID: <7825188.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251119102557.1041881-2-wei.fang@nxp.com>
References:
 <20251119102557.1041881-1-wei.fang@nxp.com>
 <20251119102557.1041881-2-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fMqHT4hrrz1kNt46
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:06b01824bbfbcb4227c6efdf7863bdb3
X-cloud-security:scantime:1.786
DKIM-Signature: a=rsa-sha256;
 bh=yd7VoGo5h85v/tCZbd5Wr9gZqrsgFKoh7cUl95XNvMI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772199710; v=1;
 b=I4XvwU+TwZPpdnlAvgTXhuP3aeYm7o3JCmQ6Jy/NDksLNP1p6+Fn9+0IOSLtQEICFrMrULbO
 2Hao+rJxwg732kHFJxHqqX0k3OHVaVPXOZV5c7vDBKKVfBm1cp9Pb28XSXzMoMrj9fx6ljQIyd7
 QQI10oohYS2nZrwwq//OmTqlDDdOLppIrZXKwCeBb9Sg5+dgTFiYENw1pStpY+G7T1W67NxXMMm
 mXAIfUwIjJlihKbt7GYvzaytkrJOweKMO5TnDj/zQP5r+A5pYoN78mk4wKzYG2Eejvf4wybu9sv
 z/zWHodzcmkvSPiSCyMHugtAmcpufelvgCDitVjyS8I/A==

Hi,

sorry for the very late reply. I didn't get the chance to boot our
i.MX95 based board (TQMa95xxSA) in the meantime.

Am Mittwoch, 19. November 2025, 11:25:55 CET schrieb Wei Fang:
> The ENETC supports managing its own external PHY through its port MDIO
> functionality. To use this function, the PHY address needs be set in the
> corresponding LaBCR register in the Integrated Endpoint Register Block
> (IERB), which is used for pre-boot initialization of NETC PCIe functions.
> The port MDIO can only work properly when the PHY address accessed by the
> port MDIO matches the corresponding LaBCR[MDIO_PHYAD_PRTAD] value.
>=20
> Because the ENETC driver only registers the MDIO bus (port MDIO bus) when
> it detects an MDIO child node in its node, similarly, the netc-blk-ctrl
> driver only resolves the PHY address and sets it in the corresponding
> LaBCR when it detects an MDIO child node in the ENETC node.
>=20
> Co-developed-by: Aziz Sellami <aziz.sellami@nxp.com>
> Signed-off-by: Aziz Sellami <aziz.sellami@nxp.com>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../ethernet/freescale/enetc/netc_blk_ctrl.c  | 141 +++++++++++++++++-
>  1 file changed, 140 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c b/drive=
rs/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> index d7aee3c934d3..6dd54b0d9616 100644
> --- a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> +++ b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> @@ -67,6 +67,9 @@
>  #define IERB_EMDIOFAUXR			0x344
>  #define IERB_T0FAUXR			0x444
>  #define IERB_ETBCR(a)			(0x300c + 0x100 * (a))
> +#define IERB_LBCR(a)			(0x1010 + 0x40 * (a))
> +#define  LBCR_MDIO_PHYAD_PRTAD(addr)	(((addr) & 0x1f) << 8)
> +
>  #define IERB_EFAUXR(a)			(0x3044 + 0x100 * (a))
>  #define IERB_VFAUXR(a)			(0x4004 + 0x40 * (a))
>  #define FAUXR_LDID			GENMASK(3, 0)
> @@ -322,6 +325,142 @@ static int netc_unlock_ierb_with_warm_reset(struct =
netc_blk_ctrl *priv)
>  				 1000, 100000, true, priv->prb, PRB_NETCRR);
>  }
> =20
> +static int netc_get_phy_addr(struct device_node *np)
> +{
> +	struct device_node *mdio_node, *phy_node;
> +	u32 addr =3D 0;
> +	int err =3D 0;
> +
> +	mdio_node =3D of_get_child_by_name(np, "mdio");
> +	if (!mdio_node)
> +		return 0;

If there is no 'mdio' node below enetc_portX node, then 0 is returned...

> +
> +	phy_node =3D of_get_next_child(mdio_node, NULL);
> +	if (!phy_node)
> +		goto of_put_mdio_node;
> +
> +	err =3D of_property_read_u32(phy_node, "reg", &addr);
> +	if (err)
> +		goto of_put_phy_node;
> +
> +	if (addr >=3D PHY_MAX_ADDR)
> +		err =3D -EINVAL;
> +
> +of_put_phy_node:
> +	of_node_put(phy_node);
> +
> +of_put_mdio_node:
> +	of_node_put(mdio_node);
> +
> +	return err ? err : addr;
> +}
> +
> +static int netc_parse_emdio_phy_mask(struct device_node *np, u32 *phy_ma=
sk)
> +{
> +	u32 mask =3D 0;
> +
> +	for_each_child_of_node_scoped(np, child) {
> +		u32 addr;
> +		int err;
> +
> +		err =3D of_property_read_u32(child, "reg", &addr);
> +		if (err)
> +			return err;
> +
> +		if (addr >=3D PHY_MAX_ADDR)
> +			return -EINVAL;
> +
> +		mask |=3D BIT(addr);
> +	}
> +
> +	*phy_mask =3D mask;
> +
> +	return 0;
> +}
> +
> +static int netc_get_emdio_phy_mask(struct device_node *np, u32 *phy_mask)
> +{
> +	for_each_child_of_node_scoped(np, child) {
> +		for_each_child_of_node_scoped(child, gchild) {
> +			if (!of_device_is_compatible(gchild, "pci1131,ee00"))
> +				continue;
> +
> +			return netc_parse_emdio_phy_mask(gchild, phy_mask);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx95_enetc_mdio_phyaddr_config(struct platform_device *pdev)
> +{
> +	struct netc_blk_ctrl *priv =3D platform_get_drvdata(pdev);
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct device *dev =3D &pdev->dev;
> +	int bus_devfn, addr, err;
> +	u32 phy_mask =3D 0;
> +
> +	err =3D netc_get_emdio_phy_mask(np, &phy_mask);
> +	if (err) {
> +		dev_err(dev, "Failed to get PHY address mask\n");
> +		return err;
> +	}
> +
> +	/* Update the port EMDIO PHY address through parsing phy properties.
> +	 * This is needed when using the port EMDIO but it's harmless when
> +	 * using the central EMDIO. So apply it on all cases.
> +	 */
> +	for_each_child_of_node_scoped(np, child) {
> +		for_each_child_of_node_scoped(child, gchild) {
> +			if (!of_device_is_compatible(gchild, "pci1131,e101"))
> +				continue;
> +
> +			bus_devfn =3D netc_of_pci_get_bus_devfn(gchild);
> +			if (bus_devfn < 0) {
> +				dev_err(dev, "Failed to get BDF number\n");
> +				return bus_devfn;
> +			}
> +
> +			addr =3D netc_get_phy_addr(gchild);
> +			if (addr < 0) {
> +				dev_err(dev, "Failed to get PHY address\n");
> +				return addr;
> +			}
> +
> +			if (phy_mask & BIT(addr)) {

=2E.. which will break here if there is an Ethernet PHY using address 0 in =
'netc_emdio' node.
See arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi node ethernet-phy@0.

Best regards,
Alexander

> +				dev_err(dev,
> +					"Find same PHY address in EMDIO and ENETC node\n");
> +				return -EINVAL;
> +			}
> +
> +			/* The default value of LaBCR[MDIO_PHYAD_PRTAD ] is
> +			 * 0, so no need to set the register.
> +			 */
> +			if (!addr)
> +				continue;
> +
> +			switch (bus_devfn) {
> +			case IMX95_ENETC0_BUS_DEVFN:
> +				netc_reg_write(priv->ierb, IERB_LBCR(0),
> +					       LBCR_MDIO_PHYAD_PRTAD(addr));
> +				break;
> +			case IMX95_ENETC1_BUS_DEVFN:
> +				netc_reg_write(priv->ierb, IERB_LBCR(1),
> +					       LBCR_MDIO_PHYAD_PRTAD(addr));
> +				break;
> +			case IMX95_ENETC2_BUS_DEVFN:
> +				netc_reg_write(priv->ierb, IERB_LBCR(2),
> +					       LBCR_MDIO_PHYAD_PRTAD(addr));
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx95_ierb_init(struct platform_device *pdev)
>  {
>  	struct netc_blk_ctrl *priv =3D platform_get_drvdata(pdev);
> @@ -349,7 +488,7 @@ static int imx95_ierb_init(struct platform_device *pd=
ev)
>  	/* NETC TIMER */
>  	netc_reg_write(priv->ierb, IERB_T0FAUXR, 7);
> =20
> -	return 0;
> +	return imx95_enetc_mdio_phyaddr_config(pdev);
>  }
> =20
>  static int imx94_get_enetc_id(struct device_node *np)
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


