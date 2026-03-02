Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7783230F934
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442646; cv=pass; b=jL8F6Rj5ogLDkVIzLiYcrwRNkToFXkySTW2PfZMNQyG8cKKO28vArsKHhakZ34sXDn53zinzsQvwIiw2J3bNqSvTPFLPlH8jw0aZ4HRdSyelkwWDagihxekGHTWMr1SlEEtyEWwLNVHYFO2lndVUA1QSgHSZDO46Hwh3mjlQwCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442646; c=relaxed/simple;
	bh=fiekTzta8FUtdjWmFwchlMc1/hwvvAsJRm4WsZfyc4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6GkRtTuChQchzGO0gPEAB+lZ2eLRDG5mj7H8kUYw+ltd7k8qbeItGpNA14QXMymCXnJBIySvQdvxRqpGKVe66dMat2A/MCLtJ7xFUKtqju05xOih37ZbRXxwlBG+uhadVyVv6jdcSL+p71VdZUO2nLBItaPX3SE0WgGSu6TUPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=N62a0+nI; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="N62a0+nI"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=QcbWatSyM5oJiH06wT/NbGgAxv1T51q/29A9brK2e6w=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772442627;
 b=Adf+kUEXH7PKj5PmLxEM1Q8f9IYonZmoco1DUxuQZCVAaaLBaZC5WZrGtQicJtxwDfBb8PpM
 DEeroW8jlqOnEbl/ZKiJjR+SW5rShKfgcwefld/tMxO/i1dtEd/NiqiCqPxmaK+9H68DQoddKd0
 nJljeNOhVAhNk69YOINsQYYqZUQcVRgJEVK9Ds0PA3FTrk2s7/hNkxNr3uLI/vSIQGourLHOvm2
 v8cmmxbQYF+xugPUClvTIR07zXrJe7AFNxr1b2kpBWFHZ3bV6U9nIffyVLpZbnjVXp8cOjsaTW9
 OO/Q6Wi+IzgO7lV21ghGE/3v4tu9rMEt0hzlABW96BxnQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772442627;
 b=Yc8yDwONA6ZDBZolRZ+oYnEua/LOp47FXDB4P2z3AAnLfYkm+vzbfN33ihU6RXqpIydloRXk
 /X6+3LMqmd7sppdATzmSk9xfOHNGA2yhgSMrIc+VsX+e7Q214fHCA/2ifDbDdlyOcWcrB2Gk1dF
 TS+mLHfd+9vR81zNDYlHK4PlKmA0PYk8U95z/2X3xBJakrQLaltIoZ8GOJWtjinY2vJ7EbaJfPe
 el0BWUh6pKblpbKj30K05GgVHbZU9T4rurb1MY5+yuHB2O6dqm4NWuBLrSz5/gPABxLfCCRSMfR
 Japyew4eelbDKxs18qYVkRZ7hZJu4JgtE0PeL7YGr5VrA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Mon, 02 Mar 2026 10:10:27 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5373D220490;
	Mon,  2 Mar 2026 10:10:16 +0100 (CET)
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
Date: Mon, 02 Mar 2026 10:10:16 +0100
Message-ID: <5972322.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <PAXPR04MB8510765552BAC289BD5466DB8870A@PAXPR04MB8510.eurprd04.prod.outlook.com>
References:
 <20251119102557.1041881-1-wei.fang@nxp.com> <7825188.GXAFRqVoOG@steina-w>
 <PAXPR04MB8510765552BAC289BD5466DB8870A@PAXPR04MB8510.eurprd04.prod.outlook.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fPY6x0V46z3ybLB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4664428a919562c3da657dd102324f35
X-cloud-security:scantime:2.540
DKIM-Signature: a=rsa-sha256;
 bh=QcbWatSyM5oJiH06wT/NbGgAxv1T51q/29A9brK2e6w=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772442626; v=1;
 b=N62a0+nIYJ+ap5cYo8o8EW8XUZAMXBIuyZIMgJsU4w69TNTydKzFdjidHV3rhuNUbKNUN7S8
 ub3+JuH9qvODfGDdqlZKWBOhJm0pa1PKWRDEvIa2DsziWp7PK7PeBPjrFz8Zg+zMgJbkJ16ym+F
 04TVwBja97P2qBQdK3KEsiQ9EgKFD7p5bQ7+/gbzHJ8b3gNwNKIiBG4NtSqUbD8bClhyXLLGJ/l
 4e96z1NVO51Gkr7wuRvTgIo5RbF2N896fet7KZuAmFiHlnKmurPRu5d15nF8sL6juAW+bBPfXTM
 AJ3pFv84MixlcaENmULHotagmPIo2u0mytfZ4FfdtzTtg==

Hi,

Am Samstag, 28. Februar 2026, 04:52:01 CET schrieb Wei Fang:
> > > +static int imx95_enetc_mdio_phyaddr_config(struct platform_device
> > > +*pdev) {
> > > +	struct netc_blk_ctrl *priv =3D platform_get_drvdata(pdev);
> > > +	struct device_node *np =3D pdev->dev.of_node;
> > > +	struct device *dev =3D &pdev->dev;
> > > +	int bus_devfn, addr, err;
> > > +	u32 phy_mask =3D 0;
> > > +
> > > +	err =3D netc_get_emdio_phy_mask(np, &phy_mask);
> > > +	if (err) {
> > > +		dev_err(dev, "Failed to get PHY address mask\n");
> > > +		return err;
> > > +	}
> > > +
> > > +	/* Update the port EMDIO PHY address through parsing phy properties.
> > > +	 * This is needed when using the port EMDIO but it's harmless when
> > > +	 * using the central EMDIO. So apply it on all cases.
> > > +	 */
> > > +	for_each_child_of_node_scoped(np, child) {
> > > +		for_each_child_of_node_scoped(child, gchild) {
> > > +			if (!of_device_is_compatible(gchild, "pci1131,e101"))
> > > +				continue;
> > > +
> > > +			bus_devfn =3D netc_of_pci_get_bus_devfn(gchild);
> > > +			if (bus_devfn < 0) {
> > > +				dev_err(dev, "Failed to get BDF number\n");
> > > +				return bus_devfn;
> > > +			}
> > > +
> > > +			addr =3D netc_get_phy_addr(gchild);
> > > +			if (addr < 0) {
> > > +				dev_err(dev, "Failed to get PHY address\n");
> > > +				return addr;
> > > +			}
> > > +
> > > +			if (phy_mask & BIT(addr)) {
> >=20
> > ... which will break here if there is an Ethernet PHY using address 0 in
> > 'netc_emdio' node.
> > See arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi node
> > ethernet-phy@0.
>=20
> AFAIU, the PHY address 0 is a special address, below is the description of
> PHYAD from IEEE 802.3 Clause 22.
>=20
> A PHY that is connected to the station management entity via the
> mechanical interface defined in 22.6 shall always respond to transactions
> addressed to PHY Address zero <00000>. A station management entity
> that is attached to multiple PHYs must have prior knowledge of the=20
> appropriate PHY Address for each PHY.
>=20
> Therefore, for most PHYs, PHY address 0 is typically used as the broadcast
> address or default response address. In designs that control multiple PHYs
> via EMDIO, it is recommended to avoid setting a specific PHY to address 0
> to prevent bus conflicts.

I know about this special meaning, but there are hardware design which do n=
ot
take this into account.

> If the PHY on your board does not use PHY address 0 as the broadcast addr=
ess
> or the default response address, then we should check the PHY address fir=
st and
> then check the phy_mask in imx95_enetc_mdio_phyaddr_config(), just the sa=
me
> as imx94_enetc_mdio_phyaddr_config().

I'm not sure if this is the right fix. What about the case where phy_mask is
supposed to be 0, because there are no PHY subnodes of netc_emdio. Instead
the PHY with address is a subnode of the enet_portX is supposed to have
netc_get_phy_addr() return 0 because that's the actual address. But with
the current flow from imx94_enetc_mdio_phyaddr_config() and your suggestion
for i.MX95 case we erroneously skip that node.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


