Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B1C1872
	for <imx@lists.linux.dev>; Thu,  6 Jul 2023 08:24:00 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1qHKHH-0004UP-82; Thu, 06 Jul 2023 10:23:51 +0200
Message-ID: <0125c54fd1617f3f945bc3f4bbef5b914b701c24.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: remove arm, primecell-periphid
 at etm nodes
From: Lucas Stach <l.stach@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 suzuki.poulose@arm.com,  coresight@lists.linaro.org, imx@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Marek Vasut
 <marex@denx.de>, Peng Fan <peng.fan@nxp.com>, Adam Ford
 <aford173@gmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>,  Frank Li <Frank.Li@nxp.com>
Date: Thu, 06 Jul 2023 10:23:48 +0200
In-Reply-To: <9405224.NyiUUSuA9g@steina-w>
References: <20230705205954.4159781-1-Frank.Li@nxp.com>
	 <9405224.NyiUUSuA9g@steina-w>
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

Hi Alexander,

Am Donnerstag, dem 06.07.2023 um 07:06 +0200 schrieb Alexander Stein:
> Hi Frank,
>=20
> Am Mittwoch, 5. Juli 2023, 22:59:53 CEST schrieb Frank Li:
> > The reg size of etm nodes is incorrectly set to 64k instead of 4k. This
> > leads to a crash when calling amba_read_periphid().  After corrected re=
g
> > size, amba_read_periphid() retrieve the correct periphid.
> > arm,primecell-periphid were removed from the etm nodes.
>=20
> So this means the reference manual is wrong here? It clearly states the s=
ize=20
> is 64kiB. Reference Manual i.MX8MP Rev 1. 06/2021
> On a side note: Is imx8mq affected by this as well? The DAP memory table =
lists=20
> similar sizes in the RM .
>=20
Note that the 64K MMIO space per device is really an alignment thing.
It's a recommendation from ARM to allow individual device MMIO regions
to be mapped on kernels with 64K page size. Most of the time the real
MMIO space occupied by the device is actually much smaller than 64K.

Regards,
Lucas

> Best regards,
> Alexander
>=20
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> > cc406bb338fe..e0ca82ff6f15 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -306,8 +306,7 @@ soc: soc@0 {
> >=20
> >  		etm0: etm@28440000 {
> >  			compatible =3D "arm,coresight-etm4x",=20
> "arm,primecell";
> > -			reg =3D <0x28440000 0x10000>;
> > -			arm,primecell-periphid =3D <0xbb95d>;
> > +			reg =3D <0x28440000 0x1000>;
> >  			cpu =3D <&A53_0>;
> >  			clocks =3D <&clk IMX8MP_CLK_MAIN_AXI>;
> >  			clock-names =3D "apb_pclk";
> > @@ -323,8 +322,7 @@ etm0_out_port: endpoint {
> >=20
> >  		etm1: etm@28540000 {
> >  			compatible =3D "arm,coresight-etm4x",=20
> "arm,primecell";
> > -			reg =3D <0x28540000 0x10000>;
> > -			arm,primecell-periphid =3D <0xbb95d>;
> > +			reg =3D <0x28540000 0x1000>;
> >  			cpu =3D <&A53_1>;
> >  			clocks =3D <&clk IMX8MP_CLK_MAIN_AXI>;
> >  			clock-names =3D "apb_pclk";
> > @@ -340,8 +338,7 @@ etm1_out_port: endpoint {
> >=20
> >  		etm2: etm@28640000 {
> >  			compatible =3D "arm,coresight-etm4x",=20
> "arm,primecell";
> > -			reg =3D <0x28640000 0x10000>;
> > -			arm,primecell-periphid =3D <0xbb95d>;
> > +			reg =3D <0x28640000 0x1000>;
> >  			cpu =3D <&A53_2>;
> >  			clocks =3D <&clk IMX8MP_CLK_MAIN_AXI>;
> >  			clock-names =3D "apb_pclk";
> > @@ -357,8 +354,7 @@ etm2_out_port: endpoint {
> >=20
> >  		etm3: etm@28740000 {
> >  			compatible =3D "arm,coresight-etm4x",=20
> "arm,primecell";
> > -			reg =3D <0x28740000 0x10000>;
> > -			arm,primecell-periphid =3D <0xbb95d>;
> > +			reg =3D <0x28740000 0x1000>;
> >  			cpu =3D <&A53_3>;
> >  			clocks =3D <&clk IMX8MP_CLK_MAIN_AXI>;
> >  			clock-names =3D "apb_pclk";
>=20
>=20

