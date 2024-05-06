Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E02158D99
	for <imx@lists.linux.dev>; Mon,  6 May 2024 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715021746; cv=none; b=i3AkPV3o/pLK+lclK1zdij0TLiV9clOlsbEqRkzyDLbF4fyy0TMJvNbulLrNfhJkXvWf/ZK16F3jHJVCSeSaWQgiRMsXD+QR+BlwHQFwDjXMslvnlF9SYXPqr2/YGcvtUxam22Th2ca/W0PHOK4VlaGh2Pa5HeJ93lD9Yx03uWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715021746; c=relaxed/simple;
	bh=bZDiZMGu0jBtjwsda2PcNCz+ZVppj4NJDGPoMGORpxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUtPu2DzwEzyDVjyQged2lIhHdR82yPhy85yOyQ1luST+Fxut4XWRZjnVUCu9TGonzWrRco1SFJ+sQ5eVJfytcXcml5dQZg5DRUSW9GjDmcBKfT12/F7Tlgx4qfuLSFwNE03cNX3BWqxBeJ3ENOQZwhgd99eZJjTIaRsNG7MeoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AGhAKqJ3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AGhAKqJ3"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1370B114D;
	Mon,  6 May 2024 20:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715021740;
	bh=bZDiZMGu0jBtjwsda2PcNCz+ZVppj4NJDGPoMGORpxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGhAKqJ3rNcKJ3ySqDlXLDV2PZMylOpUjrwj/IGvTgFgAzMmfOHRfE5kl1or3ELGn
	 X5nbSS/kKXXVTfPneSYuE2Eicwwd8PA2drq+yXYA/gFWUGpridR8JtUnBEYUfbBH7u
	 Y2ztuBtd+pwe+8q336SrmePUFncKH8JXwn67rgG8=
Date: Mon, 6 May 2024 21:55:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
Message-ID: <20240506185534.GC26689@pendragon.ideasonboard.com>
References: <20240416141914.9375-1-marex@denx.de>
 <3311352.aeNJFYEL58@steina-w>
 <20240503134557.GC13904@pendragon.ideasonboard.com>
 <5784573.DvuYhMxLoT@steina-w>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5784573.DvuYhMxLoT@steina-w>

On Mon, May 06, 2024 at 08:19:57AM +0200, Alexander Stein wrote:
> Am Freitag, 3. Mai 2024, 15:45:57 CEST schrieb Laurent Pinchart:
> > On Fri, May 03, 2024 at 02:58:19PM +0200, Alexander Stein wrote:
> > > Am Mittwoch, 17. April 2024, 11:12:04 CEST schrieb Alexander Stein:
> > > > Am Dienstag, 16. April 2024, 16:19:10 CEST schrieb Marek Vasut:
> > > > > Configure both CSI2 assigned-clock-rates the same way.
> > > > > There does not seem to be any reason for keeping the
> > > > > two CSI2 pixel clock set to different frequencies.
> > > > > 
> > > > > This also reduces first CSI2 clock from overdrive mode
> > > > > frequency which is 500 MHz down below the regular mode
> > > > > frequency of 400 MHz.
> > > > > 
> > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > 
> > > > Apparently there is no difference when using imx415 (3840x2160) sensor.
> > > 
> > > Just for the records: While this change does not affect imx415 (3840x2160)
> > > processing, reducing clock-frequency as well (v3) imx415 does not work.
> > > So I assume that for this image size a higher than default frequency is
> > > required.
> > 
> > For the time being I expect sensor overlays to override the default
> > clock setup.
> 
> Yep, that's what I did in the end.
> 
> > Ideally the clock frequencies should be configured
> > automatically at runtime by the CSI-2 RX driver.
> 
> Ideally, yes. In this case it depends on whether it is MIPI-CSI 1 in normal
> or overdrive mode, if it is MIPI-CSI 2 or if both cameras a run
> simultaneously. I wonder if it really worth to add that much infrastructure
> for a use case which is essentially fixed setup.

There could be platforms where two cameras are connected, and the user
would want to operate them either concurrently at lower resolutions (and
speed), or separately at higher resolutions.

> > > > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > 
> > > > > ---
> > > > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Cc: Paul Elder <paul.elder@ideasonboard.com>
> > > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > > Cc: Rob Herring <robh@kernel.org>
> > > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > > Cc: devicetree@vger.kernel.org
> > > > > Cc: imx@lists.linux.dev
> > > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > > ---
> > > > > V2: Align both clock to 266 MHz and update commit message
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > index 1bb96e96639f2..7883f5c056f4e 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > @@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
> > > > >  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
> > > > >  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
> > > > >  							 <&clk IMX8MP_CLK_24M>;
> > > > > -				assigned-clock-rates = <500000000>;
> > > > > +				assigned-clock-rates = <266000000>;
> > > > >  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > > > >  				status = "disabled";
> > > > >  

-- 
Regards,

Laurent Pinchart
