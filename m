Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A1F4949EF
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553067; cv=none; b=HiNOvbVBKaucaKPNjL4Vl7xi6Oko0k0OlyfAECx5BEZYwCrvEVXCjFnCR2QnWQ900nmbFfMXY6jgtjVgyTAQC0SNw1aIf+3sXDNPh3Y8J0fX5Bo6vGO9XgLSC+GwvI8Xskg24ELNFOi99Hyw8ZWfQjWgrEm6oAKb3fI8hYkBaio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553067; c=relaxed/simple;
	bh=+Sm/P01h0kFbiVviehOODArZCDJSwlqi41ntmhONvrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s58gJZkFtZZM1Nt7PRrHUYx9PA9ehZvsYBjWVltJIVUTwcp5pFxe2EP0Tncq5wK39x5Dt8g8jUuUCXr2bjmeFdINQrGOXwhI/nAvWTfEc5W3BIlfjjTUi4ubLQF3m2MEUPcKTPhGju6hv62OVNpsRDXjdajT1HsV0t+4utgxLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxS16-000579-GX; Tue, 03 Mar 2026 16:50:36 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxS11-003ZRH-2s;
	Tue, 03 Mar 2026 16:50:33 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxS13-0000000G7Cv-0QPS;
	Tue, 03 Mar 2026 16:50:33 +0100
Date: Tue, 3 Mar 2026 16:50:33 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 3/3] arm64: dts: imx93: Add parallel display output
 nodes
Message-ID: <5esgi6k7sji6nwmp7ch3xcajrc6xxc3yfxe2iqq6z6wuvznuts@ytchokq2uy5t>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-3-1b03733c8461@pengutronix.de>
 <tyqgkbmkmenkdqdptb3baeizmvsdoyfjnaudlpb4jnz4py7cpb@oy64pijka2yz>
 <aacCBGRAd6JbktHU@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aacCBGRAd6JbktHU@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-03-03, Frank Li wrote:
> On Tue, Mar 03, 2026 at 11:42:08AM +0100, Marco Felsch wrote:
> > Hi Frank,
> >
> > On 26-03-03, Marco Felsch wrote:
> > > Add required OF nodes to support the i.MX93 parallel output (DPI) path.
> > >
> > > On the i.MX93 a single LCDIF is connected to three bridges: DPI, LVDS
> > > LDB and the MIPI-DSI whereas the i.MX91 support only the DPI bridge.
> > >
> > > Map endpoint@0 as DPI bridge output since the i.MX93 TRM (Figure 485.
> > > MEDIAMIX block diagram) doesn't mention any port-number <-> bridge
> > > combination.
> > >
> > > Set the MEDIA-AXI and MEDIA-APB clocks to the overdrive (OD) values
> > > since the i.MX93 and i.MX91 use the overdrive (OD) clk settings per
> > > default.
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> >
> > Please ignore this particular patch since you already applied this one.
> 
> You can skip these when you post new version. post delta if need update,
> I can squash to previous patch as need.
> 
> >
> > Next time we should align the apply with the rest of the patch series if
> > dt-bindings and driver behaviors are involved. In such case the final
> > integration patch should be merged at the end and not at the beginning
> > :)
> 
> You request apply at :)
> https://lore.kernel.org/all/fl2br7rtcjrjj2uqxva7ai3xbvjwrrbbl2ruaoqolrccr2rd5p@z33qfx7dpavf/

I meant the whole series :) Although I'm unaware which maintainer is
taken which part. Sorry for causing troubles on your site. However if
you would try to apply this on your tree, git would have told you that
nothing needs to be applied because this patch is untouched.

Regards,
  Marco

> 
> Frank
> >
> > Thanks,
> >   Marco
> >
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 54 ++++++++++++++++++++++
> > >  arch/arm64/boot/dts/freescale/imx93.dtsi           | 12 +++++
> > >  2 files changed, 66 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> > > index 7958cef353766a430df5e626ff2403dc05a974b1..5a8813df6bc993d559fb0b20fc742a106bfe6315 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> > > @@ -1122,8 +1122,62 @@ media_blk_ctrl: system-controller@4ac10000 {
> > >  				 <&clk IMX93_CLK_MIPI_DSI_GATE>;
> > >  			clock-names = "apb", "axi", "nic", "disp", "cam",
> > >  				      "pxp", "lcdif", "isi", "csi", "dsi";
> > > +			assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
> > > +					  <&clk IMX93_CLK_MEDIA_APB>,
> > > +					  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
> > > +			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
> > > +						 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > > +						 <&clk IMX93_CLK_VIDEO_PLL>;
> > > +			assigned-clock-rates = <400000000>, <133333333>;
> > >  			#power-domain-cells = <1>;
> > >  			status = "disabled";
> > > +
> > > +			dpi_bridge: dpi-bridge {
> > > +				compatible = "nxp,imx93-pdfc";
> > > +				status = "disabled";
> > > +
> > > +				ports {
> > > +					#address-cells = <1>;
> > > +					#size-cells = <0>;
> > > +
> > > +					port@0 {
> > > +						reg = <0>;
> > > +
> > > +						dpi_from_lcdif: endpoint {
> > > +							remote-endpoint = <&lcdif_to_dpi>;
> > > +						};
> > > +					};
> > > +
> > > +					port@1 {
> > > +						reg = <1>;
> > > +
> > > +						dpi_to_panel: endpoint {
> > > +						};
> > > +					};
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		lcdif: display-controller@4ae30000 {
> > > +			compatible = "fsl,imx93-lcdif";
> > > +			reg = <0x4ae30000 0x23c>;
> > > +			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&clk IMX93_CLK_MEDIA_DISP_PIX>,
> > > +				 <&clk IMX93_CLK_LCDIF_GATE>,
> > > +				 <&clk IMX93_CLK_MEDIA_AXI>;
> > > +			clock-names = "pix", "axi", "disp_axi";
> > > +			power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_LCDIF>;
> > > +			status = "disabled";
> > > +
> > > +			port {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				lcdif_to_dpi: endpoint@0 {
> > > +					reg = <0>;
> > > +					remote-endpoint = <&dpi_from_lcdif>;
> > > +				};
> > > +			};
> > >  		};
> > >
> > >  		usbotg1: usb@4c100000 {
> > > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > > index 7b27012dfcb564650882dc8c40e836e797b2fda1..5436b48b30e89eb1f939b398ce1bf105abe7e34b 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > > @@ -150,6 +150,18 @@ l3_cache: l3-cache {
> > >  	};
> > >  };
> > >
> > > +&lcdif {
> > > +	port {
> > > +		lcdif_to_ldb: endpoint@1 {
> > > +			reg = <1>;
> > > +		};
> > > +
> > > +		lcdif_to_dsi: endpoint@2 {
> > > +			reg = <2>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > >  &src {
> > >  	mlmix: power-domain@44461800 {
> > >  		compatible = "fsl,imx93-src-slice";
> > >
> > > --
> > > 2.47.3
> > >
> >
> > --
> > #gernperDu
> > #CallMeByMyFirstName
> >
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
