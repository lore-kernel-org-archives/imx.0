Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB6C1DCB2D
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165226; cv=none; b=KxeCCExTN9Ry29TCfLyRgyONlhBkC3gbvgPddFE4HQkgUcfSO+5Cz+IXYzpHO3o67INZKxilB3bSKjRhekb2Hp7Eth6iYMmT6FvcxkBdcytxDKOtKF4bOU4yh0i2t09uO8StcW+RCKsUzKgQpiZI+9FV7Dpf14USnukHIJK4IOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165226; c=relaxed/simple;
	bh=fsp8qneg7EAXCiI3wz/g4oGtSSO9SRYlkFPlPIP3Jm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tMgmfqpJOgcW+jNkcMhmgKoD9ZLlSy6sfz37OztMNYs5AWJx0wFBl0JeipcdEr1crTwIPg2iUrcEWnLlYaGLSdPx1CvC5QOsFmMbYcKKjzy8wqdT9ejHwRQnHnxb+TcA8oyWAM2yYffkdmh4sPtzaFM4u0jmfmS88Yjn5uRg/3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=bwzLIR70; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Njq8yjQs reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="bwzLIR70";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Njq8yjQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729165221; x=1760701221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kJuzgQVggSFZDvndl8gdAWLVRotKHx86fblnh5fFmd0=;
  b=bwzLIR70pv9G4LbpktQHPOlOIbs2oUjKNxqYa7pORjzYrQ4+kjgQ1qX2
   6gVFnuM9oXzQthnq1RQHXOz6CyRwN/IMJZIqnAwak76oU+3JLEd/bYuQy
   xRaQikjRN9YeSww8hDHMtQl49BjJdRCTMSUqjTvnAW46xqS0GdVj+pnE9
   K2D9gs3EJ3UvINSLql8GymaD1Lo4UAfHCMwX1ktEegFsQ6KoRAVZ6p63G
   bbT/UUGOR6DBh7GRx4sQ/qDkkjQ4CRmAThBAWbShLY2il3IjTky0Luc0H
   kL+FeLrpuk9JU84LJxtcJx7XsxT18nRyJehmHowv0qU73AbpK9zU25kWN
   Q==;
X-CSE-ConnectionGUID: mMs4STnGQGKSUKQeXL98tQ==
X-CSE-MsgGUID: zdgezkh5QuO44LczNX/GRQ==
X-IronPort-AV: E=Sophos;i="6.11,210,1725314400"; 
   d="scan'208";a="39518762"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Oct 2024 13:40:13 +0200
X-CheckPoint: {6710F79D-1F-65F98A6A-FADAF7F3}
X-MAIL-CPID: 95AEEE99C7620A490EDDA5333648FD71_5
X-Control-Analysis: str=0001.0A682F25.6710F79D.00C9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C62D916A787;
	Thu, 17 Oct 2024 13:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729165209;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kJuzgQVggSFZDvndl8gdAWLVRotKHx86fblnh5fFmd0=;
	b=Njq8yjQscqnQppBZKWbdBYP0mmRqD6gNmkUf1KsNIpm4EWpUzQSOypBareewyf68w0i84D
	DQxBiTN+2aBBxIy6cikVVZshOvuWIIvpq9HT8rRYp18Fz5+PRzrVPuzxgCgFXD/KVZnhnm
	nQkn4ZThJ9Yc2dilD0vMYGfH6aA0rKg+qm2LMnjKDdR0+42aMqtUAj2d6Das8xxfDOpeps
	YO5rqOUV/HtIUwOVLtyervM83AGbeavCNS2bOQXNvwGrUr2Hx3narUYBLa0ff1e3+l0c5z
	AasvXn4OwCJmKhtF0/J+YgagCKE9iB1xvDPaGe/984/x5ajS0Q2vkB+Nq35iFA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Xu Yang <xu.yang_2@nxp.com>, robh@kernel.org, krzk+dt@kernel.org
Cc: vkoul@kernel.org, kishon@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, peter.chen@kernel.org, herve.codina@bootlin.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v8 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Thu, 17 Oct 2024 13:40:06 +0200
Message-ID: <4386576.ejJDZkT8p0@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241017102811.oweshkoxavt2l4hi@hippo>
References: <20241015111018.2388913-1-xu.yang_2@nxp.com> <3252989.5fSG56mABF@steina-w> <20241017102811.oweshkoxavt2l4hi@hippo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Donnerstag, 17. Oktober 2024, 12:28:11 CEST schrieb Xu Yang:
> On Wed, Oct 16, 2024 at 01:03:53PM +0200, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Mittwoch, 16. Oktober 2024, 12:41:40 CEST schrieb Xu Yang:
> > > On Wed, Oct 16, 2024 at 10:53:50AM +0200, Alexander Stein wrote:
> > > > Hi,
> > > >=20
> > > > another thing I just noticed.
> > > >=20
> > > > Am Dienstag, 15. Oktober 2024, 13:10:17 CEST schrieb Xu Yang:
> > > > > Add usb3 phy and controller nodes for imx95.
> > > > >=20
> > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > >=20
> > > > > ---
> > > > > Changes in v2:
> > > > >  - no changes
> > > > > Changes in v3:
> > > > >  - no changes
> > > > > Changes in v4:
> > > > >  - reorder nodes
> > > > > Changes in v5:
> > > > >  - no changes
> > > > > Changes in v6:
> > > > >  - rebase to latest
> > > > > Changes in v7:
> > > > >  - no changes
> > > > > Changes in v8:
> > > > >  - no changes
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++=
++++++
> > > > >  1 file changed, 43 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm6=
4/boot/dts/freescale/imx95.dtsi
> > > > > index 03661e76550f..e3faa8462759 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > > > @@ -1473,6 +1473,49 @@ smmu: iommu@490d0000 {
> > > > >  			};
> > > > >  		};
> > > > > =20
> > > > > +		usb3: usb@4c010010 {
> > > > > +			compatible =3D "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> > > > > +			reg =3D <0x0 0x4c010010 0x0 0x04>,
> > > > > +			      <0x0 0x4c1f0000 0x0 0x20>;
> > > > > +			clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
> > > > > +				 <&scmi_clk IMX95_CLK_32K>;
> > > > > +			clock-names =3D "hsio", "suspend";
> > > > > +			interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +			#address-cells =3D <2>;
> > > > > +			#size-cells =3D <2>;
> > > > > +			ranges;
> > > > > +			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > > > +			dma-ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>;
> > > > > +			status =3D "disabled";
> > > > > +
> > > > > +			usb3_dwc3: usb@4c100000 {
> > > > > +				compatible =3D "snps,dwc3";
> > > > > +				reg =3D <0x0 0x4c100000 0x0 0x10000>;
> > > > > +				clocks =3D <&scmi_clk IMX95_CLK_HSIO>,
> > > > > +					 <&scmi_clk IMX95_CLK_24M>,
> > > > > +					 <&scmi_clk IMX95_CLK_32K>;
> > > > > +				clock-names =3D "bus_early", "ref", "suspend";
> > > > > +				interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +				phys =3D <&usb3_phy>, <&usb3_phy>;
> > > > > +				phy-names =3D "usb2-phy", "usb3-phy";
> > > > > +				snps,gfladj-refclk-lpm-sel-quirk;
> > > > > +				snps,parkmode-disable-ss-quirk;
> > > > > +				iommus =3D <&smmu 0xe>;
> > > > > +			};
> > > > > +		};
> > > > > +
> > > > > +		usb3_phy: phy@4c1f0040 {
> > > > > +			compatible =3D "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> > > > > +			reg =3D <0x0 0x4c1f0040 0x0 0x40>,
> > > > > +			      <0x0 0x4c1fc000 0x0 0x100>;
> > > > > +			clocks =3D <&scmi_clk IMX95_CLK_HSIO>;
> > > > > +			clock-names =3D "phy";
> > > > > +			#phy-cells =3D <0>;
> > > > > +			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > > > > +			orientation-switch;
> > > > > +			status =3D "disabled";
> > > >=20
> > > > I got these dtbs check warnings:
> > > >=20
> > > > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> > > >  phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
> > > >         'port' is a required property
> > > >         'ports' is a required property
> > > >         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8=
mq-usb-phy.yaml#
> > > > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:=20
> > > >  phy@4c1f0040: Unevaluated properties are not allowed ('orientation=
=2Dswitch' was unexpected)
> > > >         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8=
mq-usb-phy.yaml#
> > >=20
> > > Are you checking on usb tree? You need below two dt-binding patch.
> > >=20
> > >  - dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95
> > >  - dt-bindings: phy: imx8mq-usb: add compatible "fsl,imx95-usb-phy"
> >=20
> > Yes, these patches are already in linux-next. I'm on next-20241016.
> >=20
> > > >=20
> > > >=20
> > > > How am I supposed to specify a port when the usb3 is used in host m=
ode, thus
> > > > no USB Type-C connector and no 'port' OF-graph accordingly?
> > >=20
> > > Host-only mode with Type-A connector? No Typec-C connector?
> > > Sorry, I do not get your meaning.
> >=20
> > Yes, no Type-C connector. Actually not even a Type-A as there is an
> > on-board USB hub attached to this host.
>=20
> Understood. imx95 usb phy can work w/o typec. So I may need modify the
> dt-binding to be similar to the following format:
>=20
> If property "orientation-switch" exist and compatible contain "fsl,imx95-=
usb-phy",
> then refer to usb-switch.yaml.

What 'works' is adding an empty port node to the usb3_phy. But this feels l=
ike a workaround.

> However, I'm not sure how to do that now. Do you know?

DT guys, can you more input how to proceed?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


