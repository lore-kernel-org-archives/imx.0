Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8FA26F2BD;
	Mon, 29 Dec 2025 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766996475; cv=none; b=oZNxyqLTiSlm9GOmO9wtu7I9KdNrg0qmt24c4t1cIEA6j0cE0Iycac9zd74UR/kPeqrpUMB+A7Ou7pFlZ9yet8OStwr7aQmLTC6xku6ArDPP3g/f1AD27xnUk4WOyQyALG/OEttQU2FQweKZ26LOLp1WmkWpTudkAikYewZiN9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766996475; c=relaxed/simple;
	bh=CupXRn6WjwVywyOpt0njYsg+oPXfAGdmmxZ+dvdVolM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXb8hCbbHsxZaPkTj6atFHAwFgBH6J8M1dbeDvvfNKU8M+fy1G2C3Zks63thm1qtYsle5v6OvqbYJ5dDkdOVoi++6Zxc9DXcfDkwJIxDGLbOiVFzUu9FkRJLnuCsOedDdcjawtOHcm1lrEkJOUBP/YWMZIWKEBVYZNfL99vFT48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SulfU2/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SulfU2/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E69C116B1;
	Mon, 29 Dec 2025 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766996473;
	bh=CupXRn6WjwVywyOpt0njYsg+oPXfAGdmmxZ+dvdVolM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SulfU2/rM2veTBZKTXjI3WpPloI6MIKFSV20tzySslnrXgDVyoUgEf6tGOIN776MU
	 npvDJRZyYaF/HQu0hME8dEJDxH63UdkaAWBffnvnAm5t3okxVsdJu60fz+w2oBO364
	 3wj5HyRRVYaFNaC323Sowzbk0Rb4r3JpPg2cIkLAxA0iP320PcLMM7NUd2DLhvSApu
	 iA2bT/4wN56mC4OJOeBH3SsSUCcuDEXlTWdkiyGB3A6QQZZi7FRXU9rh6Oh0kFcdf4
	 94X89cYoScmNoKZLE8qiQXkNL8SANDnRg4Hj5rNw9BKu/KoU3Yi9LTfbNaM8GU+r5/
	 Tzu0JWoFO16iw==
Date: Mon, 29 Dec 2025 16:21:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/5] arm64: dts: freescale: Add the GOcontroll
 Moduline IV
Message-ID: <aVI5875EkE3aGBqI@dragon>
References: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
 <20251117-mini_iv-v4-4-5aa63832f51a@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-mini_iv-v4-4-5aa63832f51a@gocontroll.com>

On Mon, Nov 17, 2025 at 04:01:29PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Moduline IV is a part of the wider GOcontroll Moduline ecosystem. These
> are embedded controllers that focus on modularity with their swappable IO
> modules.
> 
> Features:
> - up to 8 Moduline IO modules
> - 4 CAN busses
> - 1 LIN bus
> - 1 Ethernet
> - 4 RGB leds
> - optional Wi-Fi/Bluetooth
> - optional 4G/GPS
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 800 +++++++++++++++++++++
>  2 files changed, 802 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 525ef180481d..b2fef44e0a37 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -124,6 +124,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
>  imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
>  
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
> new file mode 100644
> index 000000000000..01df9d77fa51
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
> @@ -0,0 +1,800 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mm-tx8m-1610.dtsi"
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	chassis-type = "embedded";
> +	compatible = "gocontroll,moduline-iv-306-d", "karo,imx8mm-tx8m-1610", "fsl,imx8mm";
> +	hardware = "Moduline IV V3.06-D";
> +	model = "GOcontroll Moduline IV";
> +
> +	aliases {
> +		usb-host = &usbotg2;
> +		usbotg = &usbotg1;
> +		spi0 = &ecspi2; /* spidev number compatibility */
> +		spi1 = &ecspi3; /* spidev number compatibility */
> +		spi2 = &ecspi1; /* spidev number compatibility */

Can we order aliases alphabetically?

Shawn
