Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161DE272904
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767253; cv=none; b=SIHM4PMbjnksH1cWtCfnW2S7nkKxNh+r3eAXeGeBOmyPuesGBC0sgdWiyFZ8YAW4vXGbAkzm0fJBOeWvVTSEk+fyNpXsoJBjIet0QnCDWskcIrDOyjQtKOVaVV4xChOlRVcdi+SdQ+xM0Re6zXRLiFpwhOJ7B4IjNsKX9tIqIDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767253; c=relaxed/simple;
	bh=39z+E4PPVM1efwupG9Mf9KyEkQkdzCvRmmxkXn2IotI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOMdpRUGS0R/E9/NwAEjBPgzC1ZCYlZhCRgwLweIUJcO3LSjqfRPQsOpB47q/rS2ByqHOTkTub+veD+l+ejvEwc8st8iy9mAYo22CyiBCCbLZNqjt+xj+liq0QMABmt7RX2vznKGsWcu3LS2gQlG+n5UddmWQox13uvQbhcKkZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=FwveDW+W; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="FwveDW+W"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED201102901CC;
	Fri, 28 Feb 2025 19:27:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UtwTjTpw0Vr5sz6bdwu5/AqqBhdI7OSOUmgECWI+xPM=;
	b=FwveDW+W0Zn4acPWayV/4P1UVN2P1khcGzVmkJVhGS101XEfdWPoOyh8+AG7WIaKam633t
	uDzHhOiDp0imrWhBZMmUREAaLwQdPgPKem8CyvX2T1ZrRDRe1Mh6UsbhOpxE7oH0udlcGc
	IIVEaPn8mfY+5hQHRP7W0n+D3mOSzEocFwefXjspugKDwozTtccc8HXC+FfAY5lxhPEmEw
	MTz7HZz5M7QuqPn20F3ZKC60ni935e0zwSsB3X1fyqFQFFaZUsTJAElVz15dHQATRW/48P
	IIyfxRvvG/LYHhzcD3AEZDxSs/4Onu5JlLRMjcv1dU5uTYt6gWvzKDdvxgC7dA==
Message-ID: <4a27b6bf-aca8-4f29-9561-609a42eb81a0@denx.de>
Date: Fri, 28 Feb 2025 18:43:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
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
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de> <2153305.bB369e8A3T@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2153305.bB369e8A3T@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/28/25 11:36 AM, Alexander Stein wrote:
> Hi Marek,

Hi,

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
>> +	};
> 
> Is this an internal voltage?

I think so.

>> +
>> +	gpu_opp_table: opp_table {
> 
> Node-Names use dash instead of underscore.

Fixed, thanks.

[...]

>> @@ -1846,6 +1877,37 @@ netc_emdio: mdio@0,0 {
>>   			};
>>   		};
>>   
>> +		gpu_blk_ctrl: reset-controller@4d810000 {
>> +			compatible = "fsl,imx95-gpu-blk-ctrl";
>> +			reg = <0x0 0x4d810000 0x0 0xc>;
> 
> Mh, GPU_BLK_CTRL is /just a bit) more than the GPU reset. Does it make sense
> to make this an gpu-reset-only node, located at 0x4d810008?

The block controller itself is larger, it spans 3 or 4 registers, so 
this should describe the entire block controller here.

>> +			#reset-cells = <1>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>> +			assigned-clock-rates = <133333333>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> +			status = "disabled";
>> +		};
>> +
>> +		gpu: gpu@4d900000 {
>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>> +			reg = <0 0x4d900000 0 0x480000>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
> 
> There is also IMX95_CLK_GPUAPB. Is this only required for the rese control above?

I think I have to describe those clock here too, possibly as 'coregroup' 
clock ?

>> +			clock-names = "core";
>> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "gpu", "job", "mmu";
> 
> DT bindings say this order: job, mmu, gpu
Yes, currently it is sorted by IRQ number, fixed.
