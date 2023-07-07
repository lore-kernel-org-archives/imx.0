Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17C63C9
	for <imx@lists.linux.dev>; Fri,  7 Jul 2023 08:56:16 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1qHhG1-0005rV-WC; Fri, 07 Jul 2023 10:56:06 +0200
Message-ID: <6d1a6940f67eb2cd87817458d4ec9111b4fe7768.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: remove arm, primecell-periphid
 at etm nodes
From: Lucas Stach <l.stach@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Robin Murphy
	 <robin.murphy@arm.com>, Frank Li <Frank.li@nxp.com>
Cc: suzuki.poulose@arm.com, coresight@lists.linaro.org, imx@lists.linux.dev,
  Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Marek Vasut
 <marex@denx.de>, Peng Fan <peng.fan@nxp.com>, Adam Ford
 <aford173@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Fri, 07 Jul 2023 10:56:03 +0200
In-Reply-To: <24260662.6Emhk5qWAg@steina-w>
References: <20230705205954.4159781-1-Frank.Li@nxp.com>
	 <49ef52b7-0269-898c-7cc2-096f2f1037fc@arm.com>
	 <ZKbSC8LBjLuo3ygD@lizhi-Precision-Tower-5810>
	 <24260662.6Emhk5qWAg@steina-w>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Am Freitag, dem 07.07.2023 um 07:34 +0200 schrieb Alexander Stein:
> Hi Frank,
>=20
> Am Donnerstag, 6. Juli 2023, 16:39:07 CEST schrieb Frank Li:
> > On Thu, Jul 06, 2023 at 12:06:19PM +0100, Robin Murphy wrote:
> > > > > Am Mittwoch, 5. Juli 2023, 22:59:53 CEST schrieb Frank Li:
> > > > > > The reg size of etm nodes is incorrectly set to 64k instead of =
4k.
> > > > > > This
> > > > > > leads to a crash when calling amba_read_periphid().  After corr=
ected
> > > > > > reg
> > > > > > size, amba_read_periphid() retrieve the correct periphid.
> > > > > > arm,primecell-periphid were removed from the etm nodes.
> > > > >=20
> > > > > So this means the reference manual is wrong here? It clearly stat=
es
> > > > > the size is 64kiB. Reference Manual i.MX8MP Rev 1. 06/2021
> > > > > On a side note: Is imx8mq affected by this as well? The DAP memor=
y
> > > > > table lists similar sizes in the RM .
> > > >=20
> > > > Note that the 64K MMIO space per device is really an alignment thin=
g.
> > > > It's a recommendation from ARM to allow individual device MMIO regi=
ons
> > > > to be mapped on kernels with 64K page size. Most of the time the re=
al
> > > > MMIO space occupied by the device is actually much smaller than 64K=
.
> > >=20
> > > Indeed, it's quite common for TRM memory maps to be written in terms =
of
> > > the
> > > interconnect configuration, i.e. from the point of view of the
> > > interconnect
> > > itself, that whole range of address space is assigned to that periphe=
ral,
> > > and it may even be true that the entire range is routed to the port w=
here
> > > that peripheral is connected. However what's of more interest for DT =
is
> > > how
> > > much of that range the peripheral itself actually decodes.
> >=20
> > Yes, there are not problem by mapping bigger space in most case.
> >=20
> > amba bus's periphal use close to end of region to show device's identic=
al
> > information.
>=20
> Ah, thanks for the explanation. This make things more clear.
> But on the other is it sensible to assume the memory resource size to fit=
 the=20
> IP address space? It appears to me the size is fixed to 4kiB anyway. Woul=
d it=20
> make more sense to read the values from the address "base + 4K - x" inste=
ad of=20
> "base + size - x"?
>=20
Huh? Why would AMBA peripherals be fixed to 4K in MMIO size? The ID
detection by reading offsets at the end of the MMIO range is generic
AMBA bus behavior.

The DT should declare the real peripheral MMIO size. Declaring the
aligned size is not much of a problem on 64bit systems with huge
address spaces but it still wastes vmap space when remapping the MMIO
range. When the real peripheral decode size is known it should always
be preferred over the aligned size.

Regards,
Lucas

> Best regards,
> Alexander
>=20
> > In drivers/amba/bus.c,
> >=20
> > amba_read_periphid()
> > {
> > 	...
> > 	size =3D resource_size(&dev->res);
> > 	...
> > 	for (pid =3D 0, i =3D 0; i < 4; i++)
> > 		pid |=3D (readl(tmp + size - 0x20 + 4 * i) & 255) << (i *=20
> 8);
> > }
> >=20
> > So the range in DTS for arm,primecell should be actual IP address space=
.
> >=20
> > > Robin.
> > >=20
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20
>=20

