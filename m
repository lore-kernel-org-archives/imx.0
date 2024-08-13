Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFE75661
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 01:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723514165; cv=none; b=USxJAX72X5ehDeLhWO5BfzvejAqKtwyFpBsF0Yt/Qz//o/VTOkhnoZ4G/IVG4YtjldYaWiEZB+Bnk64sLE/C6LNa0lQkU4oAky/L8MBnH0ItxVhCEH4ZcCipqLCrKTJogXmQBN/RZYNU2tgRLY784vo1F/Q/qWnUbIkc/gZTbw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723514165; c=relaxed/simple;
	bh=ZY1piJwxyQwGaYmk+nhyzHA5TU5Qb5QWc0VzM70zazA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKljy90t6SctpMg1j2jtJG3Hv6RfXvs3NcAa/Ylq2hzoLnm3ihIXe8i9ZHlv7sM1n+3uxtdxEoUs35i+grZHpqsD71CwJ7lNodf7tOUGGt08d/3s0qb2QG1HmLVmjM7EoUIUXhBXK1I78XPlPSfEOLkA6Y257EUmzvPhC7YpEWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bbcMG8/N; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bbcMG8/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VQdxyu97o3wcgiAN0cxydZpfAzOKGxlmmqutF9VntPc=;
	b=bbcMG8/NPSBOOuHrog7LAoE5jxUqSaj5TuqnR2jJBCva2fxrEQifQM2tSqVcYX
	YFjFthaZKdekzUi25MJIo91fW6TMqBxOUUKAv5usC1Tp7DXcHEfgFlqCDkYUzv6A
	usI3nsM9YRyf1aOhkjL/N8LGgjHNgy+0TpGq6ni8Eln50=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHL+0avbpmfGEXAg--.53764S3;
	Tue, 13 Aug 2024 09:55:39 +0800 (CST)
Date: Tue, 13 Aug 2024 09:55:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/14] arm64: dts: freescale: imx93-tqma9352: Add PMIC
 node
Message-ID: <Zrq9GSPJmXFQxL94@dragon>
References: <20240724125901.1391698-1-alexander.stein@ew.tq-group.com>
 <20240724125901.1391698-4-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724125901.1391698-4-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgDHL+0avbpmfGEXAg--.53764S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryrAr4xuw1Dtr4UZrW3trb_yoWrtryrpF
	98WwsrCrWFyFyxtw45W3W3KayYgr1Ykas7ur95JFWFyrW0y3ZrKrnFkF1rJ3WrJrn7Xr4Y
	yrWUury7KF12g3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jb5rcUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERU6ZWa6XtbbPQAAsp

On Wed, Jul 24, 2024 at 02:58:50PM +0200, Alexander Stein wrote:
> With driver support in place add the PMIC node and remove the
> fixed-regulators for rails provided by PMIC.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../boot/dts/freescale/imx93-tqma9352.dtsi    | 113 ++++++++++++++----
>  1 file changed, 92 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> index d07eca6526db..ddb4f452ba2d 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> @@ -25,20 +25,6 @@ linux,cma {
>  		};
>  	};
>  
> -	reg_v1v8: regulator-v1v8 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "V_1V8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -	};
> -
> -	reg_v3v3: regulator-v3v3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "V_3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -	};
> -
>  	/* SD2 RST# via PMIC SW_EN */
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
> @@ -47,14 +33,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		regulator-name = "VSD_3V3";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&reg_v3v3>;
> +		vin-supply = <&buck4>;
>  		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
>  };
>  
>  &adc1 {
> -	vref-supply = <&reg_v1v8>;
> +	vref-supply = <&buck5>;
>  };
>  
>  &flexspi1 {
> @@ -105,6 +91,91 @@ se97_som: temperature-sensor@1b {
>  		reg = <0x1b>;
>  	};
>  
> +	pca9451a: pmic@25 {
> +		compatible = "nxp,pca9451a";
> +		reg = <0x25>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pca9451>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		regulators {
> +			/* V_0V8_SOC - hw developer guide: 0.75 .. 0.9 */
> +			buck1: BUCK1 {
> +				regulator-name = "BUCK1";
> +				regulator-min-microvolt = <750000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			/* V_DDRQ - 1.1 LPDDR4 or 0.6 LPDDR4X */
> +			buck2: BUCK2 {
> +				regulator-name = "BUCK2";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			/* V_3V3 - EEPROM, RTC, ... */
> +			buck4: BUCK4{

Missing space before braces.

> +				regulator-name = "BUCK4";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* V_1V8 - SPI NOR, eMMC, RAM VDD1... */
> +			buck5: BUCK5{

Ditto

Shawn

> +				regulator-name = "BUCK5";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* V_1V1 - RAM VDD2*/
> +			buck6: BUCK6 {
> +				regulator-name = "BUCK6";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* V_1V8_BBSM, fix 1.8 */
> +			ldo1: LDO1 {
> +				regulator-name = "LDO1";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* V_0V8_ANA */
> +			ldo4: LDO4 {
> +				regulator-name = "LDO4";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* V_SD2 - 3.3/1.8V USDHC2 io Voltage */
> +			ldo5: LDO5 {
> +				regulator-name = "LDO5";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +
>  	pcf85063: rtc@51 {
>  		compatible = "nxp,pcf85063a";
>  		reg = <0x51>;
> @@ -116,28 +187,28 @@ eeprom0: eeprom@53 {
>  		reg = <0x53>;
>  		pagesize = <16>;
>  		read-only;
> -		vcc-supply = <&reg_v3v3>;
> +		vcc-supply = <&buck4>;
>  	};
>  
>  	eeprom1: eeprom@57 {
>  		compatible = "atmel,24c64";
>  		reg = <0x57>;
>  		pagesize = <32>;
> -		vcc-supply = <&reg_v3v3>;
> +		vcc-supply = <&buck4>;
>  	};
>  
>  	/* protectable identification memory (part of M24C64-D @57) */
>  	eeprom@5f {
>  		compatible = "atmel,24c64d-wl";
>  		reg = <0x5f>;
> -		vcc-supply = <&reg_v3v3>;
> +		vcc-supply = <&buck4>;
>  	};
>  
>  	imu@6a {
>  		compatible = "st,ism330dhcx";
>  		reg = <0x6a>;
> -		vdd-supply = <&reg_v3v3>;
> -		vddio-supply = <&reg_v3v3>;
> +		vdd-supply = <&buck4>;
> +		vddio-supply = <&buck4>;
>  	};
>  };
>  
> -- 
> 2.34.1
> 

