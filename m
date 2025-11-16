Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F523372C
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763286621; cv=none; b=hEHs89ng+83TUM+Nd5fT6AOBj0Pn42076Mn2md9ZEX6aFqFjCZQcF0ApqGVauE1oB/A6KgHHc85CQYIXIRZy3Guns0VZZJILD+7bdTqmU5+5T75taSIskOD39AdqqSxDZjzcPiDNvx0IozjsiDe7ETOwD+7LV146KohSMIDSGwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763286621; c=relaxed/simple;
	bh=G7LtW3dL8esobnMzwJC+kd1MEndQRhIclgVhpATxhPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqDepz1Trri/FeqX4tR4JGHDwP+qpNVtNCL7mvYAoSSYJs/0rh/0E/7vaO9tSy1XBEgSSd+f52OG7DaUT87qw4wml+vBHUa55ZpoVuHXlyW4dZv7qzBGghcFdF3/xVYGKWv6vONYEggaU+bPyD9Rg/gzB1DRrDI57lzB41aLpao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=S1m1+eEg; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="S1m1+eEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=U4A5sC6vx4DwfGfQ1k1Mlreu32CFe9N+OnTRiJsS5XI=;
	b=S1m1+eEgNtV/MtOka1ZTSFj7g7N6dqQ0meJ2NODGU7I8LFnBtJ1kLw0iAt74W8
	NOsO3LJU8uYGjjF22TB8C4ANXw+uI9QYCnyy0nfugZ8pptDeOiU7z3XCfRRWbxhk
	isfbNf6LRjgm2gN8BtUZIZNfloKijhgq/50FxDL8PSMng=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHr4c1nhlpklwWAg--.8044S3;
	Sun, 16 Nov 2025 17:49:43 +0800 (CST)
Date: Sun, 16 Nov 2025 17:49:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8qxp-mek: Add sensors under i2c1 bus
Message-ID: <aRmeNSTudl1mBvsn@dragon>
References: <20251029-qxp_sensor-v1-0-e97ee1de96d8@nxp.com>
 <20251029-qxp_sensor-v1-2-e97ee1de96d8@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-qxp_sensor-v1-2-e97ee1de96d8@nxp.com>
X-CM-TRANSID:M88vCgDHr4c1nhlpklwWAg--.8044S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4ktrW5CrWxKF45Zr17GFg_yoW8XF4Dpr
	97Z393Wr1SvF12k34agFs5GFZ8Cw4rGFn09FnrJayFkrsruFyDt3W7Krnxuw48XF4xXw4S
	qF1vvr1jkrnxXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URGQDUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBhWu2kZnjh-mwAA3n

On Wed, Oct 29, 2025 at 03:27:19PM -0400, Frank Li wrote:
> Add sensors under i2c1 bus.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 32 +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index 7b033744554105de6dbc4366f21e3c90f1768deb..9a96018e6f0680ac503135726f4899aca121e7f6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -450,10 +450,36 @@ i2c@2 {
>  			#size-cells = <0>;
>  			reg = <2>;
>  
> +			accelerometer@1e {
> +				compatible = "nxp,fxos8700";
> +				reg = <0x1e>;
> +			};
> +
> +			gyroscope@21 {
> +				compatible = "nxp,fxas21002c";
> +				reg = <0x21>;
> +			};
> +
>  			pressure-sensor@60 {
>  				compatible = "fsl,mpl3115";
>  				reg = <0x60>;
>  			};
> +
> +			/* Ref SCH-54536 */
> +			pressure-sensor@77 {
> +				compatible = "meas,ms5611";
> +				reg = <0x77>;
> +			};
> +
> +			inertial-meter@68 {

Keep devices sorted in slave address.

Shawn

> +				compatible = "invensense,icm20602";
> +				reg = <0x68>;
> +			};
> +
> +			inertial-meter@69 {
> +				compatible = "invensense,iam20380";
> +				reg = <0x69>;
> +			};
>  		};
>  
>  		i2c@3 {
> @@ -483,6 +509,12 @@ light-sensor@44 {
>  				interrupt-parent = <&lsio_gpio1>;
>  				interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>  			};
> +
> +			/* Ref SCH-54536 */
> +			light-sensort@60 {
> +				compatible = "vishay,vcnl4035";
> +				reg = <0x60>;
> +			};
>  		};
>  	};
>  
> 
> -- 
> 2.34.1
> 

