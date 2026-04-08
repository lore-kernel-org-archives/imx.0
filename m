Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAD63D092A
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656632; cv=none; b=Bez7TF9YJDubFCTwX60seu9Q7P6N+fz7G/pUOdpY2sSd7Bo/AAFbNBU64WRnVgFQtCiSduoImuOZIhiLDktw64TouKCk82F6/pC+LYJYL3y7CkqkkUs0P83MDn2sXTYFNWQjINIefbmqBfbv0VpWiMVPlJHpgtnAwSRdijEGqGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656632; c=relaxed/simple;
	bh=DtgfAHIcG2yL3Uyz3ksmN6rTp9I1YSd/gQUgwKu2M3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKAWJUxKdlcQ4IyGYz39O01HlHaUpZ444Q2kE0LK0O8Dq/R1rJGIyQGMnxmMOBueNhYUPQeyDAoU8ulDGXN6Nag1gQgz4msGEWvb1uQPuUHtTs8660EOGX6Ny7TlwE7gPE8YcGUkv206jsGtk3KvFYsXJd9+ZzGlKkIU9+dct68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mAJcX59u; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mAJcX59u"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92C3A35B7
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 06:57:04 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2329C3F641
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775656630; bh=DtgfAHIcG2yL3Uyz3ksmN6rTp9I1YSd/gQUgwKu2M3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mAJcX59u4W/aqXW81HzGoXP5XtHA0vgrsdBMXqfi74RCpflq8Oo47Mse73hAwiHnr
	 t2WhOQ+L9TochES0+8Up1YiKcNSTe5M0h5QwXrIEyjfUTmADS+Q5smD1Vrrem5Q633
	 MWq9JcvX+OqmA22yY6AwyvnGs+HKOWbHhjeZJKbk=
Date: Wed, 8 Apr 2026 14:56:47 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Guangliu Ding <guangliu.ding@nxp.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: imx952: Describe Mali G310 GPU
Message-ID: <adZeny_sRg7t_A3j@e142607>
References: <20260407-master-v3-1-5a05cea0c521@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407-master-v3-1-5a05cea0c521@nxp.com>

On Tue, Apr 07, 2026 at 11:15:03AM +0800, Guangliu Ding wrote:
> Support Mali G310 GPU on i.MX952 board. Describe this GPU in the DT.
> Include dummy GPU voltage regulator and OPP tables.
> 
> A hardware GPU auto clock‑gating mechanism has been introduced,
> enabling GPUMIX to automatically manage the GPU clock. This improves
> overall response time.
> 
> Signed-off-by: Guangliu Ding <guangliu.ding@nxp.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> This series enable Mali G310 GPU support on i.MX952 boards, the same GPU
> IP as the instance on i.MX95 boards.
> ---
> Changes in v3:
> - Follow the order of interrupts/interrupt-names in arm,mali-valhall-csf.yaml.
> - Drop dt-bindings change in arm,mali-valhall-csf.yaml.
> - Replace "nxp,imx952-mali" with "nxp,imx95-mali" in compatible.
> - Link to v2: https://patch.msgid.link/20260401-master-v2-0-20d3fbcd19d6@nxp.com
> 
> Changes in v2:
> - Improve patch description, adding more GPU information.
> - Remove Reviewed-by tag.
> - Link to v1: https://patch.msgid.link/20260331-master-v1-0-65c8e318d462@nxp.com
> ---
>  arch/arm64/boot/dts/freescale/imx952.dtsi | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
> index 91fe4916ac04..ced09e7a1dc5 100644
> --- a/arch/arm64/boot/dts/freescale/imx952.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
> @@ -318,6 +318,28 @@ usbphynop2: usbphynop2 {
>  		clock-names = "main_clk";
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
>  	soc {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -1262,5 +1284,19 @@ usbmisc2: usbmisc@4c200200 {
>  			reg = <0x0 0x4c200200 0x0 0x200>,
>  			      <0x0 0x4c010014 0x0 0x4>;
>  		};
> +
> +		gpu: gpu@4d900000 {
> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
> +			reg = <0 0x4d900000 0 0x480000>;
> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "job", "mmu", "gpu";
> +			clocks = <&scmi_clk IMX952_CLK_GPU>;
> +			clock-names = "core";
> +			power-domains = <&scmi_devpd IMX952_PD_GPU>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +			dynamic-power-coefficient = <1013>;
> +		};
>  	};
>  };
> 
> ---
> base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
> change-id: 20260331-master-7ec7ff0fe1b2
> 
> Best regards,
> --  
> Guangliu Ding <guangliu.ding@nxp.com>
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
