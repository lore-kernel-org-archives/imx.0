Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A898166F16
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730461974; cv=none; b=QClpuWYLsKnKOgPauDkTn29tDzdu9McuAJ7y6v1kJAOAna1Dw6NOX49/ksT1ZsXKWubh50PGGSMqin3OvI+Gd9mBWBT/dDFb+8WJNzCX35orivGWBh3eiRj81iDA6I9UA7TI5Evc0QVAmNqXsuz2QUePHPDXayjBAtL71ij7mvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730461974; c=relaxed/simple;
	bh=s9zEschFheqpl3MVHG7AX/iz6sgGYdQcunUDorltRvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QO2UG3fWS9TdGdWJEk+U6z4extzpc3ynkoQCv5q3dhqwAS/k4URA0IBzPMImHh31UhXd703amBySYoOvxM27bh6/GqLsL1h0jHGQqVSOW1h7IroD5KlAL1eZWk6coxOJX80RrMB/sglsnW4I6vQKD+AXK81DCrK3zD8HNZgslnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Khd5Svqz; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Khd5Svqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YmSTqBtY8i0PV0/oOuK2+7GAOUhp/cEFMitg8aJfC1I=;
	b=Khd5SvqzK4rtnwdSVspx1OZJIDfgoHn0uXLi2VrZvWn1NQHe+VltzzSGFdGFwX
	KMTs+S9syWRr9k9cmpgf0VHlQQgQf9QmPe3t1VbtD7G0ejwSS2jQ5Tl50BhBYl5M
	5qIGCZx2vvT8H6OO4nQ/NEZknXoT9AT0Olnn0eMgU/MWo=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHn4XewCRn1RZrAQ--.14133S3;
	Fri, 01 Nov 2024 19:51:59 +0800 (CST)
Date: Fri, 1 Nov 2024 19:51:57 +0800
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
Message-ID: <ZyTA3WLJ36ZAQyDN@dragon>
References: <20241024102800.3481574-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024102800.3481574-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID:Ms8vCgDHn4XewCRn1RZrAQ--.14133S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWxGFW7JF4rCrWrZw4rAFb_yoW8Zr15pa
	4DGF1rWrs2vw40k3s0vF4Iqrn5t3yDXF129FWfW342kwsayFySgw1xKrsrW3Z0vr4kXw4I
	kF13Wr1fKrWYqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYc_fUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCweKZWcks1IjcgAAsQ

On Thu, Oct 24, 2024 at 12:27:56PM +0200, Dario Binacchi wrote:
> Add a simple-framebuffer node for U-Boot to further fill and activate.
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> index 7675583a6b67..3d670534a714 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> @@ -4,6 +4,34 @@
>   */
>  
>  / {
> +	chosen {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer-panel0 {
> +			compatible = "simple-framebuffer";
> +			clocks = <&clk IMX8MN_CLK_DISP_PIXEL_ROOT>, /* lcdif */
> +				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
> +				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>,
> +				 <&clk IMX8MN_VIDEO_PLL1>,
> +				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>, /* pgc_dispmix */
> +				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
> +				 <&clk IMX8MN_CLK_DISP_AXI>,
> +				 <&clk IMX8MN_CLK_DISP_APB>,
> +				 <&clk IMX8MN_SYS_PLL2_1000M>,
> +				 <&clk IMX8MN_SYS_PLL1_800M>,
> +				 <&clk IMX8MN_CLK_DSI_CORE>, /* mipi_disi */
> +				 <&clk IMX8MN_CLK_DSI_PHY_REF>;
> +

Unneeded newline.

I dropped it and applied the patch.

Shawn

> +			power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_LCDIF>,
> +					<&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_DSI>;
> +			dvdd-supply = <&reg_3v3_dvdd>;
> +			avdd-supply = <&reg_v3v3_avdd>;
> +			status = "disabled";
> +		};
> +	};
> +
>  	backlight: backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&pwm1 0 700000 0>;	/* 700000 ns = 1337Hz */
> -- 
> 2.43.0
> 

