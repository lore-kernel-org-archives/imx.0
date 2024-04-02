Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C138DE4
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712040890; cv=none; b=NxNeyRTXr0qidhKEJWnj0o8AQUb4R6Udli6xiMoW8c5L8jS3MZ11kX2Jc9bN4A9KlTVRQcNCmddlVXgp+0FO87z+qSsL9TIFdFf4J1iaIEmp2sb/oV3qbo9qXSDE/+iFFyBYkPPn1tGRw/lh3LmHNuThLqWNwQlOp80SGzEQHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712040890; c=relaxed/simple;
	bh=B1LaFRzKFzw+ftbj8etcHlcF0FOYXgI6gMiXVqZPYqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Prd/6AdAZbWxwPSHUaNcSnlAvOazD0F5Ko8L2mz2rlnN4HnSA8E8DTjICoJ6R7fiRu3KE2bAcvYR+Cz66UcyQE6FiWbgNuacAoKRH/Xv78+w2fcivMLOWCyi4S48s6TasHwMpEsSYwm86Rb9rWKZYbaQtl/ZD9KJSXEV+zyhqjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1rrY2e-0001pj-R5; Tue, 02 Apr 2024 08:54:44 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1rrY2d-009vjo-Up; Tue, 02 Apr 2024 08:54:43 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1rrY2d-00AiEJ-2e;
	Tue, 02 Apr 2024 08:54:43 +0200
Date: Tue, 2 Apr 2024 08:54:43 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: debix-a: Remove i2c2 from base .dts
Message-ID: <20240402065443.hpinj7oftcst6fwd@pengutronix.de>
References: <20240325225048.1159-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325225048.1159-1-laurent.pinchart@ideasonboard.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 24-03-26, Laurent Pinchart wrote:
> From: Jacopo Mondi <jacopo@jmondi.org>
> 
> The I2C2 bus is used for the CSI and DSI connectors only, no devices are
> connected to it on neither the Debix Model A nor its IO board. Remove
> the bus from the board's .dts and rely on display panel or camera sensor
> overlsy to enable it when necessary.

I would rather remove the status line instead of removing the whole node
since the bus is intented to be used for CSI and DSI and therefore the
muxing should be valid. This makes it easier for overlay authors since
they don't need to check the mux setup each time.

Regards,
  Marco


> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../boot/dts/freescale/imx8mp-debix-model-a.dts    | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> index 5ac77eaf23d5..26c303b7c7fa 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> @@ -210,13 +210,6 @@ ldo5: LDO5 {
>  	};
>  };
>  
> -&i2c2 {
> -	clock-frequency = <100000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_i2c2>;
> -	status = "okay";
> -};
> -
>  &i2c3 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default";
> @@ -392,13 +385,6 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA					0x400001c2
>  		>;
>  	};
>  
> -	pinctrl_i2c2: i2c2grp {
> -		fsl,pins = <
> -			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL					0x400001c2
> -			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA					0x400001c2
> -		>;
> -	};
> -
>  	pinctrl_i2c3: i2c3grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL					0x400001c2
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
> 
