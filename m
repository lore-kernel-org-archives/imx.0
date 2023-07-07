Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6CE1847
	for <imx@lists.linux.dev>; Fri,  7 Jul 2023 05:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688708072; x=1720244072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+rD/hewzM2PrvRZh93DLP5SxI8Y+Nxb+YvSesx2inws=;
  b=QofNVpAl26sIvU+lUigch7Q+nMZY6neSNlvZGQdqhtNNJ46uM2JLHr5w
   jHTwcxp37SuK+N8KwkKnIHJQBgQCveeFUfUBe1H/Sn7ZgS2xw7jtO9XXP
   rEDwpPAfhahJ9PV55LuEoVZ7jYtccwr9tcYfLETHRa+1JRD5r0irrUWLE
   KpRpaUB/zpLvbYrlYYRP8gQsOeCp4euHUvH2fv577bsddkPZwDmzzxMME
   ++kjMGgSGf4wOvr02nScZJ+2KyaL3LKbmA6tpLAC6caMOu04twcnjxXkt
   pFBYyxYtbCTdx45E29FssW45pBc/0gqjhz47k6tW/YEY/lon9XeZ1pOgs
   w==;
X-IronPort-AV: E=Sophos;i="6.01,187,1684792800"; 
   d="scan'208";a="31803225"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Jul 2023 07:34:24 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DFB9C280084;
	Fri,  7 Jul 2023 07:34:23 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Robin Murphy <robin.murphy@arm.com>, Frank Li <Frank.li@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, suzuki.poulose@arm.com, coresight@lists.linaro.org, imx@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>, Adam Ford <aford173@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: remove arm, primecell-periphid at etm nodes
Date: Fri, 07 Jul 2023 07:34:23 +0200
Message-ID: <24260662.6Emhk5qWAg@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZKbSC8LBjLuo3ygD@lizhi-Precision-Tower-5810>
References: <20230705205954.4159781-1-Frank.Li@nxp.com> <49ef52b7-0269-898c-7cc2-096f2f1037fc@arm.com> <ZKbSC8LBjLuo3ygD@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Frank,

Am Donnerstag, 6. Juli 2023, 16:39:07 CEST schrieb Frank Li:
> On Thu, Jul 06, 2023 at 12:06:19PM +0100, Robin Murphy wrote:
> > > > Am Mittwoch, 5. Juli 2023, 22:59:53 CEST schrieb Frank Li:
> > > > > The reg size of etm nodes is incorrectly set to 64k instead of 4k.
> > > > > This
> > > > > leads to a crash when calling amba_read_periphid().  After correc=
ted
> > > > > reg
> > > > > size, amba_read_periphid() retrieve the correct periphid.
> > > > > arm,primecell-periphid were removed from the etm nodes.
> > > >=20
> > > > So this means the reference manual is wrong here? It clearly states
> > > > the size is 64kiB. Reference Manual i.MX8MP Rev 1. 06/2021
> > > > On a side note: Is imx8mq affected by this as well? The DAP memory
> > > > table lists similar sizes in the RM .
> > >=20
> > > Note that the 64K MMIO space per device is really an alignment thing.
> > > It's a recommendation from ARM to allow individual device MMIO regions
> > > to be mapped on kernels with 64K page size. Most of the time the real
> > > MMIO space occupied by the device is actually much smaller than 64K.
> >=20
> > Indeed, it's quite common for TRM memory maps to be written in terms of
> > the
> > interconnect configuration, i.e. from the point of view of the
> > interconnect
> > itself, that whole range of address space is assigned to that periphera=
l,
> > and it may even be true that the entire range is routed to the port whe=
re
> > that peripheral is connected. However what's of more interest for DT is
> > how
> > much of that range the peripheral itself actually decodes.
>=20
> Yes, there are not problem by mapping bigger space in most case.
>=20
> amba bus's periphal use close to end of region to show device's identical
> information.

Ah, thanks for the explanation. This make things more clear.
But on the other is it sensible to assume the memory resource size to fit t=
he=20
IP address space? It appears to me the size is fixed to 4kiB anyway. Would =
it=20
make more sense to read the values from the address "base + 4K - x" instead=
 of=20
"base + size - x"?

Best regards,
Alexander

> In drivers/amba/bus.c,
>=20
> amba_read_periphid()
> {
> 	...
> 	size =3D resource_size(&dev->res);
> 	...
> 	for (pid =3D 0, i =3D 0; i < 4; i++)
> 		pid |=3D (readl(tmp + size - 0x20 + 4 * i) & 255) << (i *=20
8);
> }
>=20
> So the range in DTS for arm,primecell should be actual IP address space.
>=20
> > Robin.
> >=20
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


