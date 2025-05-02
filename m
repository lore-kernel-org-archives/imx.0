Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E822571D5
	for <imx@lists.linux.dev>; Fri,  2 May 2025 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204954; cv=none; b=SJPXF1w+yS+lfUJO8Ye6vGWraaAe7aXCna1rv+p1uaLlgy6l/92p6LiQGDVPu7IQVgqiiDKGSnHDOnY9YAUHbdKZgiy7LUa/2KNpiG1vGQqDf+yG5NFe8J/1BluR8DTLa4MdElncuT7tcUEfoX63a980nF2F4OIadJ3wf33aQqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204954; c=relaxed/simple;
	bh=vNqGUwYfp5kGOVOtzGXafZB7iPsvFgYgPqP2eNAkolw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huhRgfoOxEuRSJFBats6/jL+bVFHV0VPwspXfG6ybMA6JXr/saPztJh0loLiBEH/OH0B1WqDI0+Deev28O4HPdo1znDfsM/rqNmVrcV/2QHfF6FSUEBYSqEd1MPa8FWiEDJudXq4l684OXEPfMt2sVXlWavrW8XE38GvCYgi7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAtfk-0006vQ-DD; Fri, 02 May 2025 18:55:36 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAtfj-000mM7-2r;
	Fri, 02 May 2025 18:55:35 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAtfj-00Gai4-2R;
	Fri, 02 May 2025 18:55:35 +0200
Date: Fri, 2 May 2025 18:55:35 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paulk@sys-base.io, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, sebastian.fricke@collabora.com,
	ming.qian@nxp.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
Message-ID: <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-8-m.felsch@pengutronix.de>
 <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25-05-02, Adam Ford wrote:
> On Fri, May 2, 2025 at 10:10 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > The VPU_PLL clock must be set before the VPU_BUS clock which is derived
> > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index 97b09b647ec7..7f4bdefb3480 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> >                         clock-names = "g1", "g2", "vc8000e";
> > -                       assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
> > -                       assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> > +                       assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> > +                       assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> >                         assigned-clock-rates = <600000000>, <600000000>;
> 
> I think there was a move to make the default be overdrive [1]  and [2]
> and use a 'nominal' device tree for those who are not in overdrive
> mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> values here should be 800MHz and if we should add the nominal values
> of 600MHz to the imx8m-nominal.dtsi file.

You're right, Ahamd and Lucas did change this. I will adapt it later on.

Regards,
  Marco
