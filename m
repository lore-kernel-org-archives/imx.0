Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55AB16F271
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737526856; cv=none; b=IrO4fBybcmUlA0g1ZnjFGaWJ5eouI1vfYhd1rPp7GtRXGE6xkgtAGvFmAD/B8T1mUpFok+1+636heN5P9TB1YfB/oa0SLBC6N7bG7QLjSl0YgbjL3CqGvXbEyky5n6NRu+xmA8P/0rFvC+nabwu4WIx8bSB1i9180gqfkMMrR+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737526856; c=relaxed/simple;
	bh=fx3kFBBj9OXLtrrl5gWfNBVFE3vjnHmiFu9nlQBZKp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rwiot6KOMA3/KtFFNWHHf1d6ynJmy1yl4zKrCYfYeqhydA9vDaOAaUfiFrUK93dhRtSuPUiMlsNhhbYx24E7M+HFL7qWCv/lyld4qBrHS9EK+yWYIq/x/geUovxPmyPonjbjdA/wbKCF51/g55vWiWVKvFtromKLWkx4VZEqab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=E5YVtvuD; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=t0DQRdK+ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="E5YVtvuD";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="t0DQRdK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737526853; x=1769062853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1JIdelAuih2HFL0bNBiryJqlPO4l3NH1L27ee0LJ7xw=;
  b=E5YVtvuDyv82vLLUOyddaqSPjljwSC8BHmFzODcO2FChjHxgGk4lLD1a
   5dAkdvPee6EaMpqryoBc61mlxkHwT6s+N/t3CyNNnwutWbOqMvR1b2KxJ
   SXFhsxFcbxIT4zwkooE/tCY6FSO1QKHz/sfI2NLlX0rMNVP33hR/e9AAV
   I+6iYQidDvfvP2pHAuAWbYlZttkVeEcjzM7ZYQ9W264MZBtExwUrIP/LH
   Z7qBNfs6+mqLuFKSREdkzxLpIFm/VlsXzBEuFdKTFm//uSezIeB4NPbYl
   XXyuKRAqZTuAekgTnaJzKOnmGrlfJ3oLeDxSYUC6t1Yatrfrx/6ySPNDk
   w==;
X-CSE-ConnectionGUID: krjMx7RsQgevLUCukYamLw==
X-CSE-MsgGUID: YVzpN4OsS9C32ZMS6XYsJg==
X-IronPort-AV: E=Sophos;i="6.13,224,1732575600"; 
   d="scan'208";a="41212453"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 22 Jan 2025 07:20:50 +0100
X-CheckPoint: {67908E42-3-C6D8D88D-F91F9E6B}
X-MAIL-CPID: 0E34C57D96A89EF21D9F0C286CF182F2_2
X-Control-Analysis: str=0001.0A682F20.67908E42.0053,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CDA0164481;
	Wed, 22 Jan 2025 07:20:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737526845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JIdelAuih2HFL0bNBiryJqlPO4l3NH1L27ee0LJ7xw=;
	b=t0DQRdK+ZlgASvsqou7A/6s1Ejx+q0pxyC9Jew8/peSkZxrMpHAtZwJkf6e7mxRTGxfWY9
	+HQXrx+Qf+//kXOctGqmEor51uvp1rwkghSpIgsQqlE5UPMwGkeXmaRKA3FgV/Ub1bU6ZX
	l3SQnvoDVbJmDiSfC5xYA0ZsFx6GbMrVc4d2rLGJTSzOgIQH7CmLOIXhOCe51jbTFn1JJj
	j+tL1walKBLasKAqCYJC+CcajIo8pZZGTjl5K41TQQQJCf0rDLJNSi0IFKNDG11Bks7SvI
	YIxG1zQ4EOTzOgtAj6jMEwpXZvPgoT30iPs/IuRK+uu9U5lNa2MTiwOEJ4fJvA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Joy Zou <joy.zou@nxp.com>
Cc: "joao.goncalves@toradex.com" <joao.goncalves@toradex.com>, "marex@denx.de" <marex@denx.de>, "hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>, "hiago.franco@toradex.com" <hiago.franco@toradex.com>, Peng Fan <peng.fan@nxp.com>, "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>, "m.othacehe@gmail.com" <m.othacehe@gmail.com>, "mwalle@kernel.org" <mwalle@kernel.org>, "Max.Merchel@ew.tq-group.com" <Max.Merchel@ew.tq-group.com>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead
 .org>, Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: freescale: Add i.MX91 dtsi support
Date: Wed, 22 Jan 2025 07:20:39 +0100
Message-ID: <2026092.PYKUYFuaPT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <AS4PR04MB9386E5D011F3559A19E05941E1E12@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com> <1945264.tdWV9SEqCh@steina-w> <AS4PR04MB9386E5D011F3559A19E05941E1E12@AS4PR04MB9386.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3

Am Mittwoch, 22. Januar 2025, 06:25:50 CET schrieb Joy Zou:
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: 2025=E5=B9=B41=E6=9C=8821=E6=97=A5 16:34
> > To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; catalin.marinas@arm.com;
> > will@kernel.org; kernel@pengutronix.de; festevam@gmail.com; Joy Zou
> > <joy.zou@nxp.com>
> > Cc: joao.goncalves@toradex.com; marex@denx.de;
> > hvilleneuve@dimonoff.com; hiago.franco@toradex.com; Peng Fan
> > <peng.fan@nxp.com>; frieder.schrempf@kontron.de; m.othacehe@gmail.com;
> > mwalle@kernel.org; Max.Merchel@ew.tq-group.com;
> > quic_bjorande@quicinc.com; geert+renesas@glider.be;
> > dmitry.baryshkov@linaro.org; neil.armstrong@linaro.org; arnd@arndb.de;
> > nfraprado@collabora.com; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; Jacky Bai <ping.bai@nxp.com>; Ye =
Li
> > <ye.li@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>; Frank Li
> > <frank.li@nxp.com>; Carlos Song <carlos.song@nxp.com>
> > Subject: [EXT] Re: [PATCH v4 2/5] arm64: dts: freescale: Add i.MX91 dtsi
> > support
> >=20
> > Am Dienstag, 21. Januar 2025, 08:40:14 CET schrieb Joy Zou:
> > > From: Pengfei Li <pengfei.li_1@nxp.com>
> > >
> > > The i.MX 91 family features an Arm Cortex-A55 running at up to 1.4GHz,
> > > support for modern LPDDR4 memory to enable platform longevity, along
> > > with a rich set of peripherals targeting medical, industrial and
> > > consumer IoT market segments.
> > >
> > > The design of the i.MX91 platform is very similar to i.MX93.
> > > The mainly difference between i.MX91 and i.MX93 is as follows:
> > > - i.MX91 removed some clocks and modified the names of some clocks.
> > > - i.MX91 only has one A core
> > > - i.MX91 has different pinmux
> > >
> > > Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> > > Signed-off-by: Joy Zou <joy.zou@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770
> > ++++++++++++++++++
> > >  arch/arm64/boot/dts/freescale/imx91.dtsi      |  70 ++
> > >  2 files changed, 840 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
> > >
> > > [snip]
> > > diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx91.dtsi
> > > new file mode 100644
> > > index 000000000000..67a5a487ab57
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> > > @@ -0,0 +1,70 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright 2024 NXP
> > > + */
> > > +
> > > +#include "imx91-pinfunc.h"
> > > +#include "imx93.dtsi"
> > > +
> > > +/delete-node/ &A55_1;
> > > +/delete-node/ &cm33;
> > > +/delete-node/ &mlmix;
> > > +/delete-node/ &mu1;
> > > +/delete-node/ &mu2;
> > > +
> > > +&clk {
> > > +     compatible =3D "fsl,imx91-ccm";
> > > +};
> > > +
> > > +&eqos {
> > > +     clocks =3D <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> > > +              <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> > > +              <&clk IMX91_CLK_ENET_TIMER>,
> > > +              <&clk IMX91_CLK_ENET1_QOS_TSN>,
> > > +              <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>;
> > > +     assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> > > +                       <&clk IMX91_CLK_ENET1_QOS_TSN>;
> > > +     assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > > +                              <&clk
> > IMX93_CLK_SYS_PLL_PFD0_DIV2>; };
> > > +
> > > +&fec {
> > > +     clocks =3D <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> > > +              <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> > > +              <&clk IMX91_CLK_ENET_TIMER>,
> > > +              <&clk IMX91_CLK_ENET2_REGULAR>,
> > > +              <&clk IMX93_CLK_DUMMY>;
> > > +     assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> > > +                       <&clk IMX91_CLK_ENET2_REGULAR>;
> > > +     assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > > +                              <&clk
> > IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> > > +     assigned-clock-rates =3D <100000000>, <250000000>; };
> > > +
> > > +&i3c1 {
> > > +     clocks =3D <&clk IMX93_CLK_BUS_AON>,
> > > +              <&clk IMX93_CLK_I3C1_GATE>,
> > > +              <&clk IMX93_CLK_DUMMY>; };
> > > +
> > > +&i3c2 {
> > > +     clocks =3D <&clk IMX93_CLK_BUS_WAKEUP>,
> > > +              <&clk IMX93_CLK_I3C2_GATE>,
> > > +              <&clk IMX93_CLK_DUMMY>; };
> > > +
> > > +&iomuxc {
> > > +     compatible =3D "fsl,imx91-iomuxc"; };
> > > +
> > > +&tmu {
> > > +     status =3D "disabled";
> > > +};
> > > +
> > > +&ddr_pmu {
> > > +     compatible =3D "fsl,imx91-ddr-pmu", "fsl,imx93-ddr-pmu"; };
> > > +
> > > +&map0 {
> > > +     cooling-device =3D <&A55_0 THERMAL_NO_LIMIT
> > THERMAL_NO_LIMIT>; };
> > >
> >=20
> > Somehow I don't like it that much. Instead of removing nodes from imx93=
=2Edtsi
> > wouldn't it make more sense to include from imx91.dtsi into imx93.dtsi =
and
> > _add_ nodes with are unique to i.MX93? Otherwise each add to imx93.dtsi
> > requires an remove in imx91.dtsi for this unique to i.MX93, e.g. NPU.
> >=20
> Thanks for your comments!
> The imx91 isn't the imx93 subset, so if the imx93.dtsi include the imx91.=
dtsi,
> the same problem will occur.=20
> If add common.dtsi for imx91 and imx93, then the imx93 and imx91 will inc=
lude=20
> the common.dtsi. What do you think of this approach?=20

Yes, it's not a 100% subset, number of CPUs and some clocks are different.
In general adding stuff in DT is easier than removing, especially
in DT overlays.
What you are removing or changing in imx91.dtsi would need to be added to
imx93.dtsi. A common .dtsi is also an option. I hope you can up with a
good name to not be associated with imx95.dtsi

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


