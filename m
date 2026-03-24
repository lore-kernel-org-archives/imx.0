Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E235BDC2
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345144; cv=none; b=LV2D5GmZkfvopTTAjyQHi9jjw9H+WZgxg0FF55AlDxjqDCsZH4CEawJOefxg4H9bxrXd7V6vfKjFOzSnSNAbcn2FgIHAbv6kpNlsVDPQwLmoeY7ujXFlGuDnLtiGPjkKTiKbxk6XDo6NDEXu4ZhlDjq280xiaTT5D4mGwxbq0U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345144; c=relaxed/simple;
	bh=TTPPThifz10UfsqhlGlvNt9t21lxMo7c1RkYUe/huN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOdQYaXlMytfM4cKFCgziQ5Xlssv3krpcstgzPkTpFPunmXvnW4GQzkCjEJtY2hKTJiGkecDBeowrMxcZ+08QU866BiU93r07heNW02OrxT+KfJob5Rhb6/D4Hu24qMCch5XC3rgFZyUp50NVOH7Myvpb/Mr15Zp/KXk8pFBm0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WrHhV/w8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WrHhV/w8"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B2858225;
	Tue, 24 Mar 2026 10:37:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774345054;
	bh=TTPPThifz10UfsqhlGlvNt9t21lxMo7c1RkYUe/huN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrHhV/w89ce/JGcufnnEc3O5NAb+LNDf+08Cx4axQNens7oJanQZOHtm31Pgym1dX
	 w3dPH5viujTqi6TLEDLKhSnodiE8mn8nv2WLT/yLl5L2H4cFcebENPimHq59kXBu6L
	 GaeHDI9MKZ3iR2nZU8450z6rUGQH4R+eE2KVHloQ=
Date: Tue, 24 Mar 2026 11:38:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Correct PAD settings
 for pmicirqgrp
Message-ID: <20260324093850.GA2351719@killaraus.ideasonboard.com>
References: <20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com>

Hi Peng,

Thank you for the patch.

On Tue, Mar 24, 2026 at 11:16:13AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
> there is interrupt storm for i.MX8MP DEBIX Model A. Per schematic, there
> is no on board PULL-UP resistors for GPIO1_IO03, so need to set PAD
> PUE and PU together to make pull up work properly.
> 
> Fixes: c86d350aae68e ("arm64: dts: Add device tree for the Debix Model A Board")
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Closes: https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.ideasonboard.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Frank, would you be able to handle this as a v7.0 regression fix ?

I think the same is needed for imx8mp-debix-som-a.dtsi, but I can't
confirm it as I don't have the schematics for the SoM, neither do I have
access to the board.

Dan, Kieran, Stefan, could one of you check if you get an interrupt
storm from the PMIC on v7.0 ?

> ---
>  arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> index 9422beee30b29c5a551b08476c80fbff96af3439..df7489587e48ed0c678f11291f6f2b77082ade95 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> @@ -440,7 +440,7 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA					0x400001c3
>  
>  	pinctrl_pmic: pmicirqgrp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x41
> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x000001c0
>  		>;
>  	};
>  
> 
> ---
> base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
> change-id: 20260324-imx8mp-dts-fix-512530fe4dcd

-- 
Regards,

Laurent Pinchart
