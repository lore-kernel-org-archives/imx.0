Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E40329F22
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 03:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757560560; cv=none; b=uh/lXoF2pFSbJuHEpRxAfdyyZuj18Xj3HqXJ7c4DCJPN9aM991xrpamm9++Al5RTXJyt4tuzZDWu2FETZ9wo5rUKy4HcTLR0ydgc1ksUaeDOghmgWt4azj7+43WHU1EyE7TGQBKIrZFc04xzYPY9vikxPw7UMITBvROYWY5hxrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757560560; c=relaxed/simple;
	bh=5RU9K0ZqeBi6mxA1bWf3vNZQjh8NMxKm1C9xcTnVl/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adXasIY40c0gu8LJ9tEaHuOiDu8tnEz4XrOd4DadAroj8R4wQEkresg9MUw5T7FMRcdqkxUGMIBcpX6CALtS/8XGFs7wn5nTfXCCI4mIw+h4d7aqO4McMbqoK4mdeKodrVicB2sLq2LvsdPFv3ogbJyTHuvYf+gNSVXRb9Wb7uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Iu2+ar6f; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Iu2+ar6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ixyFk/mPVbulQ4uqtT21qMKNSvDLRazah5rKk0kSLi4=;
	b=Iu2+ar6fQlNutZuCJkF+3sJZ2IgG3mhmq63+GEblQ0bld8heODl7TTuf66RQoB
	HCTuHMqeLq4UapcHboJSS/CJoGzyOFIlqOBW4FsvgIoWOcxsXzsCD683Ho7Lawyg
	6FIZIzzgLL5DvfGg4OOpWbx/6Ht5StLH5S/LMhtnHtRYw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnl8rVPsJoQ0FPBA--.49162S3;
	Thu, 11 Sep 2025 11:15:35 +0800 (CST)
Date: Thu, 11 Sep 2025 11:15:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add initial device tree
 for TQMa91xx/MBa91xxCA
Message-ID: <aMI-1QVqrQeG75y6@dragon>
References: <20250901100432.139163-1-alexander.stein@ew.tq-group.com>
 <20250901100432.139163-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901100432.139163-3-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgDnl8rVPsJoQ0FPBA--.49162S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFy5ZFy7CFW8AryxGrW3ZFb_yoW5ZF1Dp3
	WkCrZ5WrWfGFyxur9Iqw40gr98Jw4rJayDuryYgFW7KrZ5uryftwn8Krs3WryxXw4rX3yU
	WFn3ZrnxAF15WaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZ189UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwXFZWjCG0lVNgABs0

On Mon, Sep 01, 2025 at 12:04:30PM +0200, Alexander Stein wrote:
> This adds support for TQMa91xx module attached to MBa91xxCA board.
> TQMa91xx is a SOM series using i.MX91 SOC. The SOM features PMIC, RAM,
> e-MMC and some optional peripherals like SPI-NOR, RTC, EEPROM,
> gyroscope and secure element.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * TQMa91xx series includes both CA & LA variant (socket & LGA)
>   adjust commit message accordingly
> * Use JTAG pinctrl by GPIO controller
> * Rename DT node name 'imu' to 'accelerometer'
> 
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../freescale/imx91-tqma9131-mba91xxca.dts    | 739 ++++++++++++++++++
>  .../boot/dts/freescale/imx91-tqma9131.dtsi    | 295 +++++++
>  3 files changed, 1035 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 947de7f125caf..3a937232d6f29 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -338,6 +338,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>  
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
> new file mode 100644
> index 0000000000000..d9e471e00d760
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
> @@ -0,0 +1,739 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2022-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Markus Niebel
> + * Author: Alexander Stein
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "imx91-tqma9131.dtsi"
> +
> +/{
> +	model = "TQ-Systems i.MX91 TQMa91xxLA/TQMa91xxCA on MBa91xxCA starter kit";
> +	compatible = "tq,imx91-tqma9131-mba91xxca", "tq,imx91-tqma9131", "fsl,imx91";
> +	chassis-type = "embedded";
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	aliases {
> +		eeprom0 = &eeprom0;
> +		ethernet0 = &eqos;
> +		ethernet1 = &fec;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		gpio3 = &gpio4;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c3;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		rtc0 = &pcf85063;
> +		rtc1 = &bbnsm_rtc;
> +		serial0 = &lpuart1;
> +		serial1 = &lpuart2;

serial should go before rtc right?  I fixed it up and applied both
patches.

Shawn

