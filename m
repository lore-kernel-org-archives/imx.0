Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3311827B34A
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755714574; cv=none; b=ERr8rwoM7MerPj8+pcO5V0++fcfiZA9W8npy8ngAbKdsA2+3IWR7gxpjz7roPkCzEZ5bp7VrO7QdYbF/g9N33Oonl4GOcRvxyGlhGTQ5R1vSVfkPPsmxRk3V2LsJXzCCwSJ3Ns5xQi6zgxxeWBThy+0fCglHLQ4FAoCaAno4RWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755714574; c=relaxed/simple;
	bh=nknvIm7qouE2F67cnbHIE1UPId2DhzpV9SfuOm3wm0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZix2JXYC2AyT9WEPZUpe8r9LpqM/1p5RVdPAxaQhHUSDW60QVAUCR40nVlZBWEa8Bm2N0MZikIhZ8eidRGRGsdnsbiRan3+iFXefGU0xkPYxM6pyQ/mWgHKrKE19mpmt0sLBemphRBu7/4+202fw0kLIPP8XQ2ywy/W1eYctLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LxCtZOlg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LxCtZOlg"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AC3FA24AB;
	Wed, 20 Aug 2025 20:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755714511;
	bh=nknvIm7qouE2F67cnbHIE1UPId2DhzpV9SfuOm3wm0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxCtZOlguIBb6tO4Jdxx9cqEy09BUrfn4pCtYJ/tpo3TdT62btrbz5JQVKq+DdA/H
	 KTZZDTHhj5MiypO+nmyr8Mq3MZHYu6dopZaWfXRThGoIvzPA+y/xK2hHsfTHJR316r
	 bspyR0SJ28MLF7Opfw6+wl14CSljjFTz/wtp5CqU=
Date: Wed, 20 Aug 2025 21:29:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx95: Fix JPEG encoder node assigned clock
Message-ID: <20250820182906.GI10308@pendragon.ideasonboard.com>
References: <20250820162747.209626-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820162747.209626-1-marek.vasut@mailbox.org>

Hi Marek,

Thank you for the patch.

On Wed, Aug 20, 2025 at 06:27:26PM +0200, Marek Vasut wrote:
> The assigned clock for JPEG encoder IP has to be IMX95_CLK_VPUBLK_JPEG_ENC
> and not IMX95_CLK_VPUBLK_JPEG_DEC (_ENC at the end, not _DEC). This is a
> simple copy-paste error, fix it.
> 
> Fixes: 153c039a7357 ("arm64: dts: imx95: add jpeg encode and decode nodes")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Looks like a straightforward fix.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 4ca6a7ea586ea..8296888bce594 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1843,7 +1843,7 @@ jpegenc: jpegenc@4c550000 {
>  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&scmi_clk IMX95_CLK_VPU>,
>  				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
> -			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
> +			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
>  			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
>  			power-domains = <&scmi_devpd IMX95_PD_VPU>;
>  		};

-- 
Regards,

Laurent Pinchart
