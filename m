Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FC11DE8A0
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392221; cv=none; b=tioL50v0+8TaUPTXXC2YKLJL0hcAUFnQ+6WsQOIcsRk1aqwPEIUstPWeJt1m3K2F/caXpknH5kKIoxfd05Ihpxo3oQGpbm/ydiNe9070UmxZFieNvO/DYMXdzL3bPSd5Gyst72mr1QaHoX3BDMF4pYe4RpYB7QuSkNapP0ioJyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392221; c=relaxed/simple;
	bh=qmLxEKDLNogueTLZNiuzmnz1XyvexupPj0xM6tRfmA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N90SCXqM1Gi3wAU7jNBGxEOtn4/Z01MqhB4WA17mNjvZWDMRsMrsjVyoFs8gZnSgLfi4RBr0EzxxE5EFIHwqst/XHeuBYS9v5GGaG7S87XisBM0WbdKms2l3Oba6ww+5IoW1fD3Qfa4sg85gXdRz7Gb8EUyGsYqhB2nnf/OgIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Qh60MiDy; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Qh60MiDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7U9/B4NoPlMBsAdcdM/qGJCoyS0fXJyvhJt5BfV6Xaw=;
	b=Qh60MiDyPDh2HS6i/g3TE10KZ0M5jOUd9X5vq2vbx9/AbC5BeA+7zUm7Vbym14
	QibpnmxrQLDeNCPeMdeatRX0WdrXc0MWpapNg492QEkI3tV/81/ab9oEcjaYe23n
	+BeN5GEuzZ7nLUIJlCAT4VR7yjgpvBvlfYKtfATUj7pl0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3ba8HLAVnOFLfAQ--.20679S3;
	Tue, 08 Oct 2024 20:56:41 +0800 (CST)
Date: Tue, 8 Oct 2024 20:56:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 4/7] arm64: dts: freescale: imx95: add anamix
 temperature thermal zone and cooling node
Message-ID: <ZwUsBuvojW15l5Kz@dragon>
References: <20240903-imx95-dts-new-v2-0-8ed795d61358@nxp.com>
 <20240903-imx95-dts-new-v2-4-8ed795d61358@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903-imx95-dts-new-v2-4-8ed795d61358@nxp.com>
X-CM-TRANSID:Ms8vCgD3ba8HLAVnOFLfAQ--.20679S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW5GrW3tFWxAry5Aw4fXwb_yoW8Wr18p3
	4kAwn8Wr12gryxXa4agr4kGFs0yan5Ja1Uuw47WFy0kr43Z3s3Jr1Yyw1S9F18t398Kw4j
	9r1jqrn7C3W3AwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVVbkUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQdyZWcFDmJEQAAAsT

On Tue, Sep 03, 2024 at 03:17:49PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 has two on-chip temperature sensors, one is inside anamix block.
> This is to add the anamix temperature thermal zone and its cooling
> device.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 2cba7a889030..d031b9548aaf 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -372,6 +372,38 @@ map0 {
>  				};
>  			};
>  		};
> +
> +		ana-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <2000>;
> +			thermal-sensors = <&scmi_sensor 0>;

Have a newline between property list and child node.

Shawn

> +			trips {
> +				ana_alert: trip0 {
> +					temperature = <105000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				ana_crit0: trip1 {
> +					temperature = <125000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&ana_alert>;
> +					cooling-device =
> +						<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&A55_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&A55_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&A55_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&A55_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&A55_5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
>  	};
>  
>  	psci {
> 
> -- 
> 2.37.1
> 

