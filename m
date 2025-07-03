Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BC92E6138
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544957; cv=none; b=jczSCv0gbKryhL37e/A78DOKmMXVIaC7byc/Q7nE9c3NSM5fYKOlaJEZgVKENdkq6dJwt0OLiQK7N7JwhiBVcjiYRb2Jfu+1cxzkgj81ghQ70Ys0aoLcSmQ25I79D6EPe6yz9fAP9QaNq+9/0Zt2k2A4bX8OA6MwGqyXoWkM0wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544957; c=relaxed/simple;
	bh=2cwzRrKV6+OHwZtckoHPQp05vX7Ld1fXm8HhqxeAgyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGgzwCXNzYzShZgOyb/4HIelrbPvHuswor3UjPhfe7OkecN6NKkte9LtSalw4Zw3BNTodhINXiCh3qoOwJ7bOZg6islai3850FEKeAU1I1fEfVtQgR7EwTB2VipWfTK2j0OB3HqMY+x2MAzew8gbFkdD69pqC/BxQl7yH5zLo8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uXIqt-0005tA-2D; Thu, 03 Jul 2025 14:15:43 +0200
Message-ID: <cb30270f-18a7-4fc6-8c12-05255b82c5cf@pengutronix.de>
Date: Thu, 3 Jul 2025 14:15:42 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64: dts: imx8mn: Configure DMA on UART2
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 aford@beaconembedded.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250703113810.73023-1-aford173@gmail.com>
 <20250703113810.73023-2-aford173@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20250703113810.73023-2-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 7/3/25 13:38, Adam Ford wrote:
> UART2 is often used as the console, so the DMA was likely left
> off on purpose, since it's recommended to not use the DMA on the
> console. Because, the driver checks to see if the UART is used for
> the console when determining if it should initialize DMA, it
> should be safe to enable DMA on UART2 for all users.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> V2:  Fix spelling errors in commit message
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> index 848ba5e46ee6..b98b3d0ddf25 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
> @@ -860,6 +860,8 @@ uart2: serial@30890000 {
>  					clocks = <&clk IMX8MN_CLK_UART2_ROOT>,
>  						 <&clk IMX8MN_CLK_UART2_ROOT>;
>  					clock-names = "ipg", "per";
> +					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
> +					dma-names = "rx", "tx";
>  					status = "disabled";
>  				};
>  			};

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

