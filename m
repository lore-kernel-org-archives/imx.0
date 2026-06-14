Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040B5225416
	for <imx@lists.linux.dev>; Sun, 14 Jun 2026 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781427933; cv=none; b=RPCESFx+GY8OIeRphNhRF53nfBJhdmRTDchsJQDSrTq+Db5RmPjvkh/ElFXaoTSRt2rcJeNo52g+goXRyglgAr+d6SY/OnRlEy2rkflpp4bYOSbIDXHA2iRqGxLlrpF0AViWi1jLSfdtAUlQduCJiIvr8PUykK4Ev1jn4dRp0bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781427933; c=relaxed/simple;
	bh=UvZypzYjdF8HPZjxrmnf1ce5MwC1JzPuB4b+WHL/xzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=de6PY9VPw02DhvVnaGJL1wnHkfEDoHJD22Oi/wL1F9liLGTK5JDBp8x9K6vVtiE/fZUQ5vhjmYpXWsVZsxyD2XFzoo0QpHmUVNuyEZza3y+VzXCmHp1/KzqEWWiok//99FSckafhqBV3uXxycnJe/A9gMK68RTQlu5EbCYJ7j2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=O90dDmPE; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="O90dDmPE"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 4B9D81F901;
	Sun, 14 Jun 2026 11:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781427922;
	bh=/v5VF80W0q06Q/X7DAzHHFRKLij4fTOsjbSF2jdZOmY=; h=From:To:Subject;
	b=O90dDmPEi2f7Ysil7pJvKzoSYuwM9WtJ0QXHbgsiJvJl2kBmi5JgqiES9m812Z4ft
	 OC9ROQcUFCApMfQa9AJ/nQRa6WA+95QkmTEfvS+GIbePB9nzOjoiML/pvhpM64Z5Iu
	 8QVmED0xyQyP+9XO2lAtVVVMsCxq98E7wAjvJJVPpli8TbWE7cJwkJ5daJbuGih52h
	 xpNyeZ0l8j1/qpomjOTmSgBwnHBpXpijdqfK79U3CSzYuP2xFUH1STFeD7IUCjzRGv
	 7uAOJ+eIvn85VzawUSdXUo0bsgCeES7gY4jsdUPL1tZz3hubyVotiJ/xCHNLGIp6im
	 y2rS7shGw7U8Q==
Date: Sun, 14 Jun 2026 11:05:17 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michael.riesch@collabora.com,
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com, geert@linux-m68k.org,
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org
Subject: Re: [PATCH v3 8/8] arm64: dts: freescale: imx95: Add NXP neoisp
 device tree node
Message-ID: <20260614090517.GA7434@francesco-nb>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-9-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612132039.2089051-9-antoine.bouyer@nxp.com>

Hello Antoine,
thanks for your patch.

On Fri, Jun 12, 2026 at 03:20:39PM +0200, Antoine Bouyer wrote:
> Add neoisp device tree node to imx95.dtsi and enable it by default in
> 19x19 evk board.
> 
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>

...

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index d6c549c16047..5543a6cb1250 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1867,6 +1867,17 @@ pmu@49252000 {
>  			};
>  		};
>  
> +		neoisp0: isp@4ae00000 {
> +			compatible = "nxp,imx95-neoisp";
> +			reg = <0x0 0x4ae00000 0x0 0x8000>,
> +			      <0x0 0x4afe0000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk IMX95_CLK_CAMCM0>;
> +			clock-names = "camcm0";
> +			power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
> +			status = "disabled";
> +		};

Why the node is disabled?  If the node is wholly described in
imx95.dtsi, it should be enabled.

Francesco

