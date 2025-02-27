Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AAD26A1AD
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 20:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688828; cv=none; b=TKKE1D9hGBYnTjZpKPRR4ljAQZ/kowyb8QVc7vP2fUBjLBsSK8PVJ0fo2b54Sh6pinSN0cflJ4TxzuXKzwoJxPwajPZ/R+9AtSHyTwrCJqdJM4C8h/ER4sUN3sDPaXPFaURTGEGC3ldSqDoyexh/Qv+lCuPl4+J1jhsRWKnOZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688828; c=relaxed/simple;
	bh=Dhia7/gf5xG+c+QK6ZY8Q0ohJkji96YcamfKt3nSq4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRLLYUrmbz/cT07S9G3GBQLrIdoIdsCFqdic0vOre3Ijq+w4/tdVTydEX8wYo8caBPrfBSrzL/iNwDs86mV2Cd/0JLSowbFkpr+G3CQ+fAGAy7eKuRBIuvukd5LaCXY2RwN50PiXMScQbub2xvN67fYTuuVh3D9CdBnnEMcKre4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ODfjWdrg; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ODfjWdrg"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C72FD10382F1E;
	Thu, 27 Feb 2025 21:40:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740688824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U90M64wanQBRNx694B4RGMPnnsdcEJHHduiDNodL1WM=;
	b=ODfjWdrg/29QzHE2GphsPmlrRX9T153PAfrgZEC0s4SW0vaze/i4riJufy0qeFsizqr7gB
	A1irk/W+dypV3LCKQRbarT1b7qFr8mkZYkAJ3p0COwJurysVAH9XA56HLsUDYYL3262K+R
	LdtF+h/r6TqytM8Flz9iaB/4N9LLKWCxZBZG90OaHXCp7UMZPnG+j4Oq02iTf+hoOH7Hhg
	IdoPkSVFa4OUQJ9YKcBBP/mDR7NLVcti/DBAYKi/6u8YRpdvn6FnQRdNJ9Cs8vjkUVy9i0
	pKi/FL4yxqLP5LJTxYcx+oMuk92ZZ+dZLyIZGXaOSdnMOdeP990ydQ8KnAmapg==
Message-ID: <d41c9cf5-9ec4-4b9a-b281-653873fb8df0@denx.de>
Date: Thu, 27 Feb 2025 21:36:55 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de>
 <Z8CkSUry5puMu6Mx@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8CkSUry5puMu6Mx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/27/25 6:43 PM, Frank Li wrote:
[...]

>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 3af13173de4bd..36bad211e5558 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -249,6 +249,37 @@ dummy: clock-dummy {
>>   		clock-output-names = "dummy";
>>   	};
>>
>> +	gpu_fixed_reg: fixed-gpu-reg {
>> +		compatible = "regulator-fixed";
>> +		regulator-min-microvolt = <920000>;
>> +		regulator-max-microvolt = <920000>;
>> +		regulator-name = "vdd_gpu";
>> +		regulator-always-on;
>> +		regulator-boot-on;
> 
> Does really need regulator-boot-on and regulator-always-on ?

I don't think so, this is a development remnant, fixed, thanks.

[...]

>> +		gpu: gpu@4d900000 {
>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>> +			reg = <0 0x4d900000 0 0x480000>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
>> +			clock-names = "core";
>> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "gpu", "job", "mmu";
>> +			mali-supply = <&gpu_fixed_reg>;
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
>> +			power-domain-names = "mix", "perf";
>> +			resets = <&gpu_blk_ctrl 0>;
>> +			#cooling-cells = <2>;
>> +			dynamic-power-coefficient = <1013>;
>> +			status = "disabled";
> 
> GPU is internal module, which have not much dependence with other module
> such as pinmux. why not default status is "disabled". Supposed gpu driver
> will turn off clock and power if not used.
My thinking was that there are MX95 SoC with GPU fused off, hence it is 
better to keep the GPU disabled in DT by default. But I can also keep it 
enabled and the few boards which do not have MX95 SoC with GPU can 
explicitly disable it in board DT.

What do you think ?
