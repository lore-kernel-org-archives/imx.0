Received: from mx-relay92-hz2.antispameurope.com (mx-relay92-hz2.antispameurope.com [94.100.136.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954FA36EAB3
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.192
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632746; cv=pass; b=JPUjuQVVsXP/7U/rFz+YreOjWPEFCpGSAaIhB27q0RFdy1UbENibZoon1lVkbr9qHq1FHatqxHKS8Kthu3mHAzE3xNeH74oN161T3LSjHt0TRsioi7e1LmFTgRXe2BHHACnq4okpwYVFU7Poht1/G+vK7qs4eZ4DrNlJy96w6V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632746; c=relaxed/simple;
	bh=YjQvBPnz5w+n6o4jeKrsQnkPSb1XKtMdj2bYvjGkJfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acTXbOCdSl0WRJmSqrqd7ukPbSO5ZQ+iAt9A/sMocwhaH7comPbbVNkNJMESms+QweyjCpUDkGz5jaydmZhhiLofT6H8csgzmgYhc7/XBZ6cWFA5TtWURqkCcUhojCVcvc/vSjTPzSYe/yYclivCvSyo+K4426QZ0QuclNqnNHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GnAGG3Yh; arc=pass smtp.client-ip=94.100.136.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GnAGG3Yh"
ARC-Authentication-Results: i=1; mx-gate92-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=5DnBcRqn/2PHlj5yIxkWZa44u0ODIznnWZcL8KBuF3E=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772632708;
 b=f0IUhNgA3pzhH0BmVH7/4YbYW45/CKa0kCsUjGcQiBPO1Yhg3Ax6TPq9MYbG2rvY1sGpkARc
 JspotjK7kf2hqvpfKUZTvnOZ0g8mTALqcurITIwuMze3DlbFRt5KilwLbYzPaf2PZBjFPerbiTE
 vWh82nOU5qMcYuHOUim9mM6KNH/n8r8eOLZ2hau1nKMd2IXGMHZKSWomJ35nNPQYy9u6OnLfNVt
 gYnUe5q7Z54XJGVtsp22vO7poSWU5oJu5gs63OMQes0O1UkWGEvsnwWh2osrK9qlA86C8F/llu2
 b6fEJylYbLDPTbR0plgHcKCDK+AEX2Q8GV5XGMdD1yiDg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772632708;
 b=B3YDiOQm13QeurUqGIvT5l9Kh3IKmuysKtPl62tKQNzAc0dHo0VEyL1EART18Gw715wHx2Rn
 mNN0c4lT1e9D+kxjamYxVZ8lmNI7o+/TF135KQV6qzRwcGFqQS6goqE+g43swV8uDeIrIDrsqQ7
 b+xivT89KMvK2HdWUZpdy40AuuopfYhS54kGomcYdWk7+qOpIASb7K2tRFuQeMVH986uMqKMuhF
 pwAIcctxf6jRIK5EQf238qPEggJTV/VG9PPfL/JTYD2u7IeHU87XDOpmoLcZRBaqcw1KWHmbHcN
 9O3EnOXA6gC0A+t69nNGGsexhzN5a3B/7cbRbkO7k+0HA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay92-hz2.antispameurope.com;
 Wed, 04 Mar 2026 14:58:28 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1850C22074F;
	Wed,  4 Mar 2026 14:58:18 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Wei Fang <wei.fang@nxp.com>
Cc: aziz.sellami@nxp.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject:
 Re: [PATCH net] net: enetc: fix fallback PHY address handling and do not skip
 setting for addr 0
Date: Wed, 04 Mar 2026 14:58:18 +0100
Message-ID: <6437896.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260303103047.228005-1-wei.fang@nxp.com>
References: <20260303103047.228005-1-wei.fang@nxp.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay92-hz2.antispameurope.com with 4fQvQL6yj6z1R5Wq
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f8a0c59699ddcf4d7cbc1c4697f18c93
X-cloud-security:scantime:2.460
DKIM-Signature: a=rsa-sha256;
 bh=5DnBcRqn/2PHlj5yIxkWZa44u0ODIznnWZcL8KBuF3E=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772632708; v=1;
 b=GnAGG3Yh5woD5cRjO9lj3ONsAEmUuSyCBI7vnlDScbxN2zBjZU16m0smC+zeDCeoiGzijKHo
 5SpvF0xAvd6isznEaK359ED8+5wPlNoZ4E+PFrMnmEqnicfvpbN+SBaSCYGWohXpZM7UTJktWRT
 RBLM8tAGaXQRA6tVVX0mVZ45fnnfWOFO5W9UHgqj2m6vZDrDv4dgwtwMVETXmCPfFEhtaLzsp/r
 VVigpLL6oElzsbFboPdlHs5oI9u8VrsQapHft8dgjYDaGGOghtD6IdpvHFJHv7efBQOldq6EJ2Z
 LckOi089OCMB8cJ4FTuKivuIeD2eiB55q8HxdnoBNL+HA==

Am Dienstag, 3. M=E4rz 2026, 11:30:47 CET schrieb Wei Fang:
> The current netc_get_phy_addr() implementation falls back to PHY address
> 0 when the "mdio" node or any PHY child node is missing. On i.MX95, this
> causes failures when a real PHY is actually assigned address 0 and is
> managed through the EMDIO interface, the bit 0 of phy_mask becomes set,
> leading imx95_enetc_mdio_phyaddr_config() to return an error, and the
> netc_blk_ctrl driver probe subsequently fails. Fix this by returning
> -ENODEV when neither an "mdio" node nor any PHY node is present.
>=20
> Given that some platforms may use PHY address 0 (I suppose the PHY may
> not treat address 0 as a broadcast address or default response address).
> It is possible for some boards to connect multiple PHYs to a single
> ENETC MAC, for example:
>=20
>   - a SGMII PHY with a non-zero address (selected via DTS_A)
>   - a RGMII PHY with address 0 (selected via DTS_B)
>=20
> For the case where the ENETC port MDIO is used to manage the PHY, when
> switching from DTS_A to DTS_B via soft reboot, LaBCR[MDIO_PHYAD_PRTAD]
> must be updated to 0 because the NETCMIX block is not reset during soft
> reboot. However, the current driver explicitly skips configuring address
> 0, which leaves the hardware in an inconsistent state.
>=20
> Therefore, remove the special-case skip of PHY address 0 so that valid
> configurations using address 0 are properly supported.
>=20
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/all/7825188.GXAFRqVoOG@steina-w
> Fixes: 6633df05f3ad ("net: enetc: set the external PHY address in IERB fo=
r port MDIO usage")
> Fixes: 50bfd9c06f0f ("net: enetc: set external PHY address in IERB for i.=
MX94 ENETC")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Thanks,
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  .../ethernet/freescale/enetc/netc_blk_ctrl.c  | 24 ++++++++-----------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c b/drive=
rs/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> index 7fd39f895290..92a0f824dae7 100644
> --- a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> +++ b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
> @@ -333,11 +333,13 @@ static int netc_get_phy_addr(struct device_node *np)
> =20
>  	mdio_node =3D of_get_child_by_name(np, "mdio");
>  	if (!mdio_node)
> -		return 0;
> +		return -ENODEV;
> =20
>  	phy_node =3D of_get_next_child(mdio_node, NULL);
> -	if (!phy_node)
> +	if (!phy_node) {
> +		err =3D -ENODEV;
>  		goto of_put_mdio_node;
> +	}
> =20
>  	err =3D of_property_read_u32(phy_node, "reg", &addr);
>  	if (err)
> @@ -423,6 +425,9 @@ static int imx95_enetc_mdio_phyaddr_config(struct pla=
tform_device *pdev)
> =20
>  			addr =3D netc_get_phy_addr(gchild);
>  			if (addr < 0) {
> +				if (addr =3D=3D -ENODEV)
> +					continue;
> +
>  				dev_err(dev, "Failed to get PHY address\n");
>  				return addr;
>  			}
> @@ -433,12 +438,6 @@ static int imx95_enetc_mdio_phyaddr_config(struct pl=
atform_device *pdev)
>  				return -EINVAL;
>  			}
> =20
> -			/* The default value of LaBCR[MDIO_PHYAD_PRTAD ] is
> -			 * 0, so no need to set the register.
> -			 */
> -			if (!addr)
> -				continue;
> -
>  			switch (bus_devfn) {
>  			case IMX95_ENETC0_BUS_DEVFN:
>  				netc_reg_write(priv->ierb, IERB_LBCR(0),
> @@ -578,16 +577,13 @@ static int imx94_enetc_mdio_phyaddr_config(struct n=
etc_blk_ctrl *priv,
> =20
>  	addr =3D netc_get_phy_addr(np);
>  	if (addr < 0) {
> +		if (addr =3D=3D -ENODEV)
> +			return 0;
> +
>  		dev_err(dev, "Failed to get PHY address\n");
>  		return addr;
>  	}
> =20
> -	/* The default value of LaBCR[MDIO_PHYAD_PRTAD] is 0,
> -	 * so no need to set the register.
> -	 */
> -	if (!addr)
> -		return 0;
> -
>  	if (phy_mask & BIT(addr)) {
>  		dev_err(dev,
>  			"Find same PHY address in EMDIO and ENETC node\n");
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


