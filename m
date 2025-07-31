Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF02BDC27
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753954312; cv=none; b=n3m6DBkETklTvGnBoMFOjjGXKFvogeSfpjFJErVk4h5iiL6ku5SZU5t0XLdqvm4vRAiKlv7+aVNejbGULt24ONeB1DIGtZzcfIBAdSj3TyFAomNBwPzDhpvw3KHfmuP3j7hYg9XdVufqFjPWJGhauRevxFY+ISOTzWYBFxy5vc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753954312; c=relaxed/simple;
	bh=OvHjt7+5eG1TC9P6ACsCDFqrKQvDbxe4ukuHSJaxrP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWXfA8n17EIQQc7LfJS/rnKWcwuw8TmmP2AJfl3CskvuETIbPOrwNgiSVFwQ3y9FG0iWBc641sNkfl/2lyKeVGrodrlI7xYJlKRgVQWoWYQmNRL1Vq+IWrzDe74MAfovrYeT0WuezXgy00pP+URoxaYcMHPJo1qJnBE5JV40rn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uhPdT-0005sL-9v; Thu, 31 Jul 2025 11:31:39 +0200
Message-ID: <4043f877-fc29-4d81-b96a-83f6ef3fa926@pengutronix.de>
Date: Thu, 31 Jul 2025 11:31:38 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp-tqma8mpql: remove virtual 3.3V
 regulator
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Markus Niebel
 <Markus.Niebel@ew.tq-group.com>, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
References: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
 <20250731091655.2453107-2-alexander.stein@ew.tq-group.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250731091655.2453107-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Alexander,

On 7/31/25 11:16, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> BUCK4 rail supplies the 3.3V rail. Use the actual regulator
> instead of a virtual fixed regulator.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

jfyi, this may impact boot time as it delays eMMC probe until after the
PMIC on the slower I2C bus is registered. It would be cool if we could
annotate regulators as left-on by bootloader somehow to weaken
dependencies, but that's unrelated to your patch.

Cheers,
Ahmad

> ---
>  .../boot/dts/freescale/imx8mp-tqma8mpql.dtsi      | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
> index b48d5da147273..9716f24f7c6ed 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
> @@ -16,15 +16,6 @@ memory@40000000 {
>  		reg = <0x0 0x40000000 0 0x80000000>;
>  	};
>  
> -	/* identical to buck4_reg, but should never change */
> -	reg_vcc3v3: regulator-vcc3v3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VCC3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		regulator-always-on;
> -	};
> -
>  	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
>  		compatible = "regulator-gpio";
>  		pinctrl-names = "default";
> @@ -187,14 +178,14 @@ at24c02: eeprom@53 {
>  		read-only;
>  		reg = <0x53>;
>  		pagesize = <16>;
> -		vcc-supply = <&reg_vcc3v3>;
> +		vcc-supply = <&buck4_reg>;
>  	};
>  
>  	m24c64: eeprom@57 {
>  		compatible = "atmel,24c64";
>  		reg = <0x57>;
>  		pagesize = <32>;
> -		vcc-supply = <&reg_vcc3v3>;
> +		vcc-supply = <&buck4_reg>;
>  	};
>  };
>  
> @@ -211,7 +202,7 @@ &usdhc3 {
>  	non-removable;
>  	no-sd;
>  	no-sdio;
> -	vmmc-supply = <&reg_vcc3v3>;
> +	vmmc-supply = <&buck4_reg>;
>  	vqmmc-supply = <&buck5_reg>;
>  	status = "okay";
>  };

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

