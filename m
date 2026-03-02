Received: from mx-relay107-hz1.antispameurope.com (mx-relay107-hz1.antispameurope.com [94.100.132.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7EF32AABD
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449386; cv=pass; b=Q/JR9ovaIpCPLjrrkMDacQQp6iOFYpTmbbjKXzFJ9csJWzb8w1RlfLBTKBfnGvNyNbUfx8L7Gk8GBNfEjxdlJ5cQ2oIu1M51m7T30NYI89RpfDLAqdAOTaCQnQYLYtSIjYKAKoiI820d1+Ku7tWkkYXxQjqgLV8I3CLY/C3+Epc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449386; c=relaxed/simple;
	bh=MxiV6mapVloNChkU3ii/v4Yd/ZIgovMph1qmaLzZ1bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWQVfZIZcYqn04bndIuQntQmY7nHYfFeESiUdXOPD8xzfbhV5FZ0jea1OlKLSHyu6qe18BchIUcgrloPPd6rxBw4n04PztrwX2lHwAED6dH7sja8FH3CnfEmyX9YJC8ABaIHcJkGGtxqOwRUNTUiXY9C5OULFHzTwn37HUS24AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FHEmDihy; arc=pass smtp.client-ip=94.100.132.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FHEmDihy"
ARC-Authentication-Results: i=1; mx-gate107-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9ZxrUskpYeFswvDKCa4H56tpH9cNXMNrZmlNnULEJ4Q=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772449328;
 b=BnZ5GWDw9S25c0MQ31/JrOgEM6sL6QHRWuIh7GpplCh5Ks65zjsTaz3fVcQQK9cgn/0UYkbT
 guklBADLmoOvu2PwuuzGWEKjEOh4zA7a6fBojdpOIMrLtvYs8N4GwCr33ofXBFvXtn8CpYLstxZ
 BpDp5cV63k7vq2uq4WsQ/Q2D683UUqP8CMDvyplhnTXaSHWF0M23zEfRqAKAL4NLhfU7G0FPIMn
 0OaeFs5GsNGsiJ2L4nHtLhMy775+yKm0jFVHpQxSHCHAzKw6ikJIbL68Marcj6BvYhNYHdmoVQA
 Xav6BN/LFWNm4qnOH4j2oH9FCeLAJESObXGRogD+rQO3Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772449328;
 b=GG0F9rFzfu8kbQhILTaTWynpoUVab6bLerRmg9s8n8OHPQ0ovLuVIOTDsAQyXkmVUTj+ugYM
 Nh+jRPwl3kqfXPNqXrLqpI6eg8KJKTU0lbCR0Sv28iNnHTGxVFBjsrgzRgA3WIiBxuClFVu0gSi
 2RFkdp35lOA4iIpU1ypcB10MB5IBIe4CZ6qy1nMzo0SKXrHNbbP9Onsfji/+NzuZtPsjr7yhyzS
 Ydl/ZnzZdHBqatcEZDjSOtqifGowpqT+CHBoRFXPD85EHzoipcihrlN7oG7/h211Wk0ASLzX/Sy
 uItygv9Idj5lx7IOmH43bKLDJfgiop9f0I+qUQNDi+xZQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay107-hz1.antispameurope.com;
 Mon, 02 Mar 2026 12:02:08 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B5E77A416E0;
	Mon,  2 Mar 2026 12:01:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 Wei Fang <wei.fang@nxp.com>
Cc: Aziz Sellami <aziz.sellami@nxp.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 Re: [PATCH v3 net-next 1/3] net: enetc: set the external PHY address in IERB
 for port MDIO usage
Date: Mon, 02 Mar 2026 12:01:57 +0100
Message-ID: <2256661.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <PAXPR04MB85104CDE52FE824736E44ACB887EA@PAXPR04MB8510.eurprd04.prod.outlook.com>
References:
 <20251119102557.1041881-1-wei.fang@nxp.com> <5972322.DvuYhMxLoT@steina-w>
 <PAXPR04MB85104CDE52FE824736E44ACB887EA@PAXPR04MB8510.eurprd04.prod.outlook.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay107-hz1.antispameurope.com with 4fPbbp36hWztb6p
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0b20e9b68fb8ec71c1947e3bd310989b
X-cloud-security:scantime:1.650
DKIM-Signature: a=rsa-sha256;
 bh=9ZxrUskpYeFswvDKCa4H56tpH9cNXMNrZmlNnULEJ4Q=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772449327; v=1;
 b=FHEmDihyUuYcBwlqszwTlBi/JmXjLgiQqdPEy4pb/+8/puLGWgTvJ1ock4LZpz0hzjdqifsa
 i7vfg+RgpXiVTyqhMyIC5SgbJac36Z84tE6JUD1H6EL6fU5MlPgSIWZx1HOX+UJAiSQD274W3FG
 AaCul/5RndjqRgUVjanQfPy5kiEOnO1SjCL4ZmHax3tb6CqJvCNW27YRuDNmJR03XQXOb9RakSd
 ZoyO53+X5jCV5VuTtg5trBdF7KgwAXlxhR2Fzhbkzr9mxmXPo48lf1JJjEA7nl3v+THPfTcfHHn
 HrnBRklj73CHnEUNf+vlNTHOSkIEOiatY9vbCrjkObPGg==

Am Montag, 2. M=E4rz 2026, 10:24:14 CET schrieb Wei Fang:
> > Am Samstag, 28. Februar 2026, 04:52:01 CET schrieb Wei Fang:
> > > > > +static int imx95_enetc_mdio_phyaddr_config(struct platform_device
> > > > > +*pdev) {
> > > > > +	struct netc_blk_ctrl *priv =3D platform_get_drvdata(pdev);
> > > > > +	struct device_node *np =3D pdev->dev.of_node;
> > > > > +	struct device *dev =3D &pdev->dev;
> > > > > +	int bus_devfn, addr, err;
> > > > > +	u32 phy_mask =3D 0;
> > > > > +
> > > > > +	err =3D netc_get_emdio_phy_mask(np, &phy_mask);
> > > > > +	if (err) {
> > > > > +		dev_err(dev, "Failed to get PHY address mask\n");
> > > > > +		return err;
> > > > > +	}
> > > > > +
> > > > > +	/* Update the port EMDIO PHY address through parsing phy
> > properties.
> > > > > +	 * This is needed when using the port EMDIO but it's harmless w=
hen
> > > > > +	 * using the central EMDIO. So apply it on all cases.
> > > > > +	 */
> > > > > +	for_each_child_of_node_scoped(np, child) {
> > > > > +		for_each_child_of_node_scoped(child, gchild) {
> > > > > +			if (!of_device_is_compatible(gchild, "pci1131,e101"))
> > > > > +				continue;
> > > > > +
> > > > > +			bus_devfn =3D netc_of_pci_get_bus_devfn(gchild);
> > > > > +			if (bus_devfn < 0) {
> > > > > +				dev_err(dev, "Failed to get BDF number\n");
> > > > > +				return bus_devfn;
> > > > > +			}
> > > > > +
> > > > > +			addr =3D netc_get_phy_addr(gchild);
> > > > > +			if (addr < 0) {
> > > > > +				dev_err(dev, "Failed to get PHY address\n");
> > > > > +				return addr;
> > > > > +			}
> > > > > +
> > > > > +			if (phy_mask & BIT(addr)) {
> > > >
> > > > ... which will break here if there is an Ethernet PHY using address=
 0 in
> > > > 'netc_emdio' node.
> > > > See arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi node
> > > > ethernet-phy@0.
> > >
> > > AFAIU, the PHY address 0 is a special address, below is the descripti=
on of
> > > PHYAD from IEEE 802.3 Clause 22.
> > >
> > > A PHY that is connected to the station management entity via the
> > > mechanical interface defined in 22.6 shall always respond to transact=
ions
> > > addressed to PHY Address zero <00000>. A station management entity
> > > that is attached to multiple PHYs must have prior knowledge of the
> > > appropriate PHY Address for each PHY.
> > >
> > > Therefore, for most PHYs, PHY address 0 is typically used as the broa=
dcast
> > > address or default response address. In designs that control multiple=
 PHYs
> > > via EMDIO, it is recommended to avoid setting a specific PHY to addre=
ss 0
> > > to prevent bus conflicts.
> >=20
> > I know about this special meaning, but there are hardware design which =
do not
> > take this into account.
>=20
> This might cause potential issues, as all PHYs attached to the same MDIO =
bus will
> respond to the accesses to PHY address 0.

Is that really the case? So far we didn't have any problems with
PHYAD 0 and 3 on the same bus. I did a bit of research but couldn't find any
information backing that PHYAD 0 is actually a broadcast address. All I cou=
ld
find is the case with just a single PHY on a MDIO bus, defaulting to 0.

> Is this problem unfixable?

Right now our problem is that the software doesn't work any more.

> >=20
> > > If the PHY on your board does not use PHY address 0 as the broadcast =
address
> > > or the default response address, then we should check the PHY address=
 first
> > and
> > > then check the phy_mask in imx95_enetc_mdio_phyaddr_config(), just the
> > same
> > > as imx94_enetc_mdio_phyaddr_config().
> >=20
> > I'm not sure if this is the right fix. What about the case where phy_ma=
sk is
> > supposed to be 0, because there are no PHY subnodes of netc_emdio. Inst=
ead
> > the PHY with address is a subnode of the enet_portX is supposed to have
> > netc_get_phy_addr() return 0 because that's the actual address. But with
> > the current flow from imx94_enetc_mdio_phyaddr_config() and your sugges=
tion
> > for i.MX95 case we erroneously skip that node.
> >=20
>=20
> The hardware default value is 0, so no need to configure it. I can send a
> fix patch this week.

Okay, thanks.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


