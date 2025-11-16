Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC872C17A3
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763295717; cv=none; b=jg0ThZB8ijTLoo5bnE9F8J81UVfTnU4xzBqv9H/3FUj5D6mLqJBv46/vNU6peAEyRl/5EwiVIhWgaTiXx7GxWB+B8wsTSHhGS1C6TNe38il+4w7Spqs8bRWN5iJtkIBc2vhW6jua9igZuvqQO6y60JMyf1QUFaHEHQ/D8C+eSz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763295717; c=relaxed/simple;
	bh=1cLquhH65JzfLpgnxTzIzOT+49biTP7PD3iQcNve5iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuzN/bMOlh/pNkRVDOuRU3TKKm7bakrdRb+sJnm/dItOvDv9x0etzodjbcS1PpXJxJ6ZOXkhr5oMBvrYGbNReIxvmUau67qMEX1qvGzb3Ozut9EVHTtXUHT4dASMgrl1hks36bp5YHdy45WTqyef7nYXJuyxFIeAHTM6Y6pZAeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=R5MLfLFN; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="R5MLfLFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=kNW9yPvfa/OhtLEXuIIfofqtoj6rCxgnTJJKlGU6kjg=;
	b=R5MLfLFNkagzbrOgQ/NYPkwh/zPPi+ubMxzJRVvX1yodJ1sL4JADl7W+HZ0GLJ
	TEOFiOBFgSX/FsUiIrUGTd6BZZfK6c1BZU67zka7J3TcoeMBtNQFVEO9/z3RPJUt
	qp92xrqBT0erQuFQn6s5qd5RkZYGSBKYu4nF9f5cT6y2A=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXXyeqwRlpCI87AQ--.8095S3;
	Sun, 16 Nov 2025 20:21:01 +0800 (CST)
Date: Sun, 16 Nov 2025 20:20:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aRnBqgzeotfrdNmy@dragon>
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
 <20251102160927.45157-2-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102160927.45157-2-marek.vasut@mailbox.org>
X-CM-TRANSID:Mc8vCgAXXyeqwRlpCI87AQ--.8095S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1UGFW8KF43Ww1xZF1rCrg_yoWrJryDpr
	WDCw45Cr4kXr1Ik3WagFW0ka4fuw4kCFyUur1DG3yjyry2qryIqFnIkrnaga4UXF1UGa1U
	trnFqryI9wnxu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9iSdUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNw48oWkZwa5RngAA30

On Sun, Nov 02, 2025 at 05:09:07PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in i.MX95 is the G310, describe this
> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.

The commit log seems need an update for the regulator part?

Shawn

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jiyu Yang (OSS) <jiyu.yang@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xianzhong Li <xianzhong.li@nxp.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Drop regulator-{always,boot}-on from fixed-gpu-reg regulator
>     - Keep the GPU and GPUMIX always enabled
>     - Switch from fsl, to nxp, vendor prefix
>     - Fix opp_table to opp-table
>     - Describe IMX95_CLK_GPUAPB as coregroup clock
>     - Sort interrupts by their names to match bindings
> V3: - Drop perf power domain
>     - Drop reset block controller
> V4: - Add RB from Frank
>     - Drop the now optional GPU regulator
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 37 ++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index a91e1724ab1a4..e45014d50abef 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -250,6 +250,28 @@ dummy: clock-dummy {
>  		clock-output-names = "dummy";
>  	};
>  
> +	gpu_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-hz-real = /bits/ 64 <500000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-hz-real = /bits/ 64 <800000000>;
> +			opp-microvolt = <920000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-hz-real = /bits/ 64 <1000000000>;
> +			opp-microvolt = <920000>;
> +		};
> +	};
> +
>  	clk_ext1: clock-ext1 {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> @@ -2139,6 +2161,21 @@ netc_emdio: mdio@0,0 {
>  			};
>  		};
>  
> +		gpu: gpu@4d900000 {
> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
> +			reg = <0 0x4d900000 0 0x480000>;
> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
> +			clock-names = "core", "coregroup";
> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "job", "mmu", "gpu";
> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
> +			#cooling-cells = <2>;
> +			dynamic-power-coefficient = <1013>;
> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
> -- 
> 2.51.0
> 

