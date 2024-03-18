Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597C0E546
	for <imx@lists.linux.dev>; Mon, 18 Mar 2024 00:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710720340; cv=none; b=uM5UV3JPWy5LCx5pOnmurMAxFnD+66lOZ0s23T4QVjr99Gl6W7AlMceBXsSvRjLhLiiY/fYi+GHQlms1Wows2wGhNqvFXEmtSSCEBBSmpoEhc9sS01INUfXpjHD9/eyQhvSoxh9mdEuwUJwb1xlezDSxCdRzzkvKK9ZQHNXaCTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710720340; c=relaxed/simple;
	bh=MMMqqJ3gk8ghkXpGTKWiDbNxjxsttWcZW8tVQEnzeJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKMKzjJuCT8dfGCFpcqVvVdHPRpx6KffXxRrnl8l35lgkzDeFLNZ+gfN1vmHHRMptE/lV6F4h/dHBVmqjUi3MzguuyGVOxTxz5+sFo1mpmkfrGoSUAPGTmDauzalev6Q2ROxhBTlrhELj6s4h/uAetRBqjJ2jwJ6n+Nh8DMDem8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fQC3qGKU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fQC3qGKU"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E088BCC;
	Mon, 18 Mar 2024 01:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710720311;
	bh=MMMqqJ3gk8ghkXpGTKWiDbNxjxsttWcZW8tVQEnzeJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQC3qGKUCqVHPc5XA1TWgwWhHjNJT8gebDoduY25S8A2hV6K602BK5bQnKSLXB+WU
	 I1JvPpA5b5+pA3VNP+U1N8YOwXbtHWwmbBd3Ibo909mR1qCMTOAEnal9YNqj20svR+
	 8Kk2cv44N6Ud70derYbsUnc4EpU8R9JxcWGmcPpg=
Date: Mon, 18 Mar 2024 02:05:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: freescale: imx8mp-sb-ucm: Add DSI
 panel overlay
Message-ID: <20240318000533.GA30573@pendragon.ideasonboard.com>
References: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
 <20240317164850.32708-6-laurent.pinchart@ideasonboard.com>
 <20240317165647.GA646@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240317165647.GA646@pendragon.ideasonboard.com>

On Sun, Mar 17, 2024 at 06:56:47PM +0200, Laurent Pinchart wrote:
> On Sun, Mar 17, 2024 at 06:48:50PM +0200, Laurent Pinchart wrote:
> > The SB-UCM-iMX8MPLUS kit is shipped with an external DSI panel. Add a
> > corresponding DT overlay.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |  4 +
> >  .../imx8mp-sb-ucm-panel-kd050hdfia020.dtso    | 81 +++++++++++++++++++
> >  2 files changed, 85 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 02efa97fc464..d7432ce6a7bb 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -165,6 +165,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-sb-ucm.dtb
> > +
> > +imx8mp-sb-ucm-panel-kd050hdfia020-dtbs := imx8mp-sb-ucm.dtb imx8mp-sb-ucm-panel-kd050hdfia020-dtbo
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mp-sb-ucm-panel-kd050hdfia020-dtb

Replying to myself, fixing the typo here with s/-dtb$/.dtb/ helps :-)
I'll send a v3 after waiting some time for review comments.

> On a side note, is there a way to selectively compile this dtb ? Running
> 
> $ make dtbs
> 
> will compile them all, but
> 
> $ make freescale/imx8mp-sb-ucm-panel-kd050hdfia020-dtb
> 
> complains with
> 
> make[4]: *** No rule to make target 'arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtb'.  Stop.
> make[3]: *** [/home/laurent/src/iob/toradex/linux/scripts/Makefile.build:481: arch/arm64/boot/dts/freescale] Error 2
> make[2]: *** [/home/laurent/src/iob/toradex/linux/Makefile:1389: freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtb] Error 2
> 
> I would like to compile it selectively, as running
> 
> $ make dtbs CHECK_DTBS=1
> 
> makes it much more time consuming to run the dtb checks.
> 
> > +
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtso b/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtso
> > new file mode 100644
> > index 000000000000..fdad943c1554
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtso
> > @@ -0,0 +1,81 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2021 CompuLab
> > + *
> > + * Device tree overlay for KD050HDFIA020-C020A panel connector to Compulab
> > + * SB-UCM-iMX8PLUS.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +&dsi_backlight {
> > +	status = "okay";
> > +};
> > +
> > +&i2c5 {
> > +	status = "okay";
> > +
> > +	touch@5d {
> > +		compatible = "goodix,gt911";
> > +		reg = <0x5d>;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_dsi_touch>;
> > +
> > +		interrupt-parent = <&gpio4>;
> > +		interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +                irq-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
> > +		reset-gpios = <&pca9555 5 GPIO_ACTIVE_HIGH>;
> > +        };
> > +};
> > +
> > +&lcdif1 {
> > +	status = "okay";
> > +};
> > +
> > +&mipi_dsi {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	samsung,esc-clock-frequency = <20000000>;
> > +	status = "okay";
> > +
> > +	panel@0 {
> > +		compatible = "startek,kd050hdfia020", "ilitek,ili9881c";
> > +		reg = <0>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_dsi_panel>;
> > +
> > +		reset-gpio = <&pca9555 4 GPIO_ACTIVE_LOW>;
> > +		power-supply = <&reg_3v3_per>;
> > +
> > +		backlight = <&dsi_backlight>;
> > +
> > +		port {
> > +			panel_in: endpoint {
> > +				remote-endpoint = <&mipi_dsi_out>;
> > +				data-lanes = <1 2 3 4>;
> > +			};
> > +		};
> > +	};
> > +
> > +	ports {
> > +		port@1 {
> > +			reg = <1>;
> > +
> > +			mipi_dsi_out: endpoint {
> > +				remote-endpoint = <&panel_in>;
> > +				data-lanes = <1 2 3 4>;
> > +				lane-polarities = <0 0 0 0 0>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&pwm1 {
> > +	status = "okay";
> > +};

-- 
Regards,

Laurent Pinchart
