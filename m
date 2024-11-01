Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F188F86252
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462491; cv=none; b=es8Hol2XeacK5t1nxuAGBRXQf+L9oSQn7QWO8VPe2YiuCZ0I6ttdcJG2ZEo4b1khnO/onC/Cg+xvaSXkhb97XqDtFCzsmOxsipS0bMofKLiaagXzm0n6CKTTK6UZ4hgX9GAntOudRiIw4TcfE39IiMeI9KnE+2z+nl3h8If0BgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462491; c=relaxed/simple;
	bh=hXv3pueBj4R6PbE6PtWL344ONvBBrcJP+3HLnRmTSSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dd7aitkPEhKGhZD3ofbkckHC1aYI2Oypilz+Lt8Mc89iDzzB0yYdFBp2u0UXS5z/I69ybxfWOAefn/Tsq49o+XVG0BAflPV/p02Uv0M3fYRCBsvvHtQ+eI6cQ0w5ccf9m8Be0JaHpEsjcBLaIMfcYJ/3wmNUXMVqj/53TMM87aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VAqWeGe6; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VAqWeGe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=atkj4kmXGUrUUV2EHgMjf22ONdCtUS/VSDuo68tESV0=;
	b=VAqWeGe6wWCfF6zc7L4vTs3lxIzieh4GsT6ndyXBLs4JrKifUByOQly0yQxibI
	Tg7S581mnpW5OXqGeFuIxeFsOeFNghJXr70INFJ1Kl86yByeKt+NTSDHGo17K1HO
	Tc2RZ0DFDF+AGSlMjGp+LCrNw9+5J3tLZUgE7hHgDkmSM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3e7AFwyRnKxVjAQ--.13699S3;
	Fri, 01 Nov 2024 20:01:11 +0800 (CST)
Date: Fri, 1 Nov 2024 20:01:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer
Message-ID: <ZyTDBTxMl9oDkem7@dragon>
References: <20241024102800.3481574-1-dario.binacchi@amarulasolutions.com>
 <ZyTA3WLJ36ZAQyDN@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyTA3WLJ36ZAQyDN@dragon>
X-CM-TRANSID:M88vCgC3e7AFwyRnKxVjAQ--.13699S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4rZr48KF13KrW8WFyDKFg_yoW5JFW3pF
	yUCF18XrsYya10k3sIvFWxJr98t39rXr4xuFWxW347tw4fAFyjgw1xGrs7Wr10vr48Xw4I
	kF13Wr1fKryYqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzc_fUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB6KZWckrmUzrgAAsg

On Fri, Nov 01, 2024 at 07:51:57PM +0800, Shawn Guo wrote:
> On Thu, Oct 24, 2024 at 12:27:56PM +0200, Dario Binacchi wrote:
> > Add a simple-framebuffer node for U-Boot to further fill and activate.
> > 
> > Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > 
> > ---
> > 
> >  .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> > index 7675583a6b67..3d670534a714 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> > @@ -4,6 +4,34 @@
> >   */
> >  
> >  / {
> > +	chosen {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		framebuffer-panel0 {
> > +			compatible = "simple-framebuffer";
> > +			clocks = <&clk IMX8MN_CLK_DISP_PIXEL_ROOT>, /* lcdif */
> > +				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
> > +				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>,
> > +				 <&clk IMX8MN_VIDEO_PLL1>,
> > +				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>, /* pgc_dispmix */
> > +				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
> > +				 <&clk IMX8MN_CLK_DISP_AXI>,
> > +				 <&clk IMX8MN_CLK_DISP_APB>,
> > +				 <&clk IMX8MN_SYS_PLL2_1000M>,
> > +				 <&clk IMX8MN_SYS_PLL1_800M>,
> > +				 <&clk IMX8MN_CLK_DSI_CORE>, /* mipi_disi */
> > +				 <&clk IMX8MN_CLK_DSI_PHY_REF>;
> > +
> 
> Unneeded newline.
> 
> I dropped it and applied the patch.

I replied too quick.

arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi:10.3-10: Warning (ranges_format): /chosen:ranges: empty "ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi:10.3-10: Warning (ranges_format): /chosen:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi:10.3-10: Warning (ranges_format): /chosen:ranges: empty "ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi:10.3-10: Warning (ranges_format): /chosen:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)

Shawn

