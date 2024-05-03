Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77E1153BCE
	for <imx@lists.linux.dev>; Fri,  3 May 2024 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743970; cv=none; b=G7alVlWMUui9my6LThIFxr+Up5hZixy0s3ewIHoeblK7ZdllxakD/Q0QfCDnwl6na5bCZXFaFK68P6h4y+NcWEQ2PzRHERW4pjMvrru7dhtzwRxJXQ6CWxlxg4rv4A0XYuxAeezARptKo6OHLNLxAUDR5yH0EQxI5ySuSCRJK4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743970; c=relaxed/simple;
	bh=P1392OE/D563sFcVxXWa6Sf/hW9rxpl/vL+Fg+RCMug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSZ2yuRbs6C5AP4cDUz17FqDC0RJB82jr3PnMumTQoSoZ4blrq6STxsUFno97gApPhjhDgKJOqY4oVuricZNWQXGFrUoJumv5naAUxZ6TcPKSzhdXyM3KJGwehKu6ZX2DmKqE9MkwtWzAcg940BKHbKHeGI2qnGXUY9SMJfazdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oa2frlkA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oa2frlkA"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E04E593;
	Fri,  3 May 2024 15:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714743907;
	bh=P1392OE/D563sFcVxXWa6Sf/hW9rxpl/vL+Fg+RCMug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oa2frlkA0Xy97uj0P9LJaPM9zXN0ypCbVdn3TA42ZaykQHHDQPl7CwohtUSF+RdZ8
	 PvQbnjLqpT9pC/LwCkj605hnQz6GSDK3oCEiv4PtYMX6JodxKmCOR9irbrZYBrP8Ch
	 rGQPt6xnOi+gUgJbiFCU0bTJM3OjslMrP+vj19R8=
Date: Fri, 3 May 2024 16:45:57 +0300
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
Message-ID: <20240503134557.GC13904@pendragon.ideasonboard.com>
References: <20240416141914.9375-1-marex@denx.de>
 <2327389.ElGaqSPkdT@steina-w>
 <3311352.aeNJFYEL58@steina-w>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3311352.aeNJFYEL58@steina-w>

On Fri, May 03, 2024 at 02:58:19PM +0200, Alexander Stein wrote:
> Am Mittwoch, 17. April 2024, 11:12:04 CEST schrieb Alexander Stein:
> > Am Dienstag, 16. April 2024, 16:19:10 CEST schrieb Marek Vasut:
> > > Configure both CSI2 assigned-clock-rates the same way.
> > > There does not seem to be any reason for keeping the
> > > two CSI2 pixel clock set to different frequencies.
> > > 
> > > This also reduces first CSI2 clock from overdrive mode
> > > frequency which is 500 MHz down below the regular mode
> > > frequency of 400 MHz.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > 
> > Apparently there is no difference when using imx415 (3840x2160) sensor.
> 
> Just for the records: While this change does not affect imx415 (3840x2160)
> processing, reducing clock-frequency as well (v3) imx415 does not work.
> So I assume that for this image size a higher than default frequency is
> required.

For the time being I expect sensor overlays to override the default
clock setup. Ideally the clock frequencies should be configured
automatically at runtime by the CSI-2 RX driver.

> > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > 
> > > ---
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Paul Elder <paul.elder@ideasonboard.com>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: imx@lists.linux.dev
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > > V2: Align both clock to 266 MHz and update commit message
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > index 1bb96e96639f2..7883f5c056f4e 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
> > >  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
> > >  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
> > >  							 <&clk IMX8MP_CLK_24M>;
> > > -				assigned-clock-rates = <500000000>;
> > > +				assigned-clock-rates = <266000000>;
> > >  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > >  				status = "disabled";
> > >  
> > > 

-- 
Regards,

Laurent Pinchart
