Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B42F1A9B2A
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740692072; cv=none; b=h/oQruD7l91zUCQ9kzM6PwKkbM1utQjDTM9bcYKI16o1DUUTe62tzcCGLOfww34TLPRkqag3RHKFEu7r+mA41uCB+1AJL+vDEV/+Iw+vSD/aesr3cIoSqIJTeOEv7kU+Hpd6SGO9pWBcv0pLPsaoVv44fIS9eoHeAUP+qb1MXEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740692072; c=relaxed/simple;
	bh=P3ACyaQHUzirRNHullK8FdIGPikRRL71HpgOmo4I/oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBUXSyI4I+IkPaafU0PlCbWyZegRVAYA19dt7rQ/3jxl9JCJVokVH2ojmI9Cus8azlOSxdo13yG8fulkgrotx8yTAV1hQY+tsMzmQNMVEOlG2rW/g/QpC9XWcZd2OEqxC8NNFoJmjqZf+W5bAFt662evm1YWBfrVSXYy499O8K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=IIX2xnYo; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="IIX2xnYo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1153510382D2E;
	Thu, 27 Feb 2025 22:34:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740692067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ei55hHQ021/CG2gC2SB779fvno3iOq9Gp5jc0y30Cw=;
	b=IIX2xnYocnR0usuE0QUIEzYItei0KwpmpeAEr6qiBKQ3jFlE33i2A4FK+m+JvfMD8Gh2xX
	7Pp+Udg0DydQYPPkhaKWu2yDeGZU4ccySMLCK+bCNw2YZv+HqCV0kROVqxvst5fzPUCpZ5
	TQNR4ohdJr9bpK+6FTsxA5HERBDIHeXl92kh8qV3fwHq1C8Z3+E+jleNfm90CeceWxH5+e
	QbHpz0MDqhsl4Ou2Mixv87hygr/yPYmbxTWZxhVcD/AIZ2HvDuGm/qGxFeXjfhsfxBmfs0
	PzFDkrfr7faeRuAxs4BVySc/tp9WUUdMuSHOpNtkzpG4Ty5irIXcqBmhQXRy6w==
Message-ID: <db903f36-e897-42ed-be46-f0b035303233@denx.de>
Date: Thu, 27 Feb 2025 22:34:20 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Frank Li <Frank.li@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
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
 <d41c9cf5-9ec4-4b9a-b281-653873fb8df0@denx.de>
 <Z8DY14NJYXjwKz7Z@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8DY14NJYXjwKz7Z@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/27/25 10:27 PM, Frank Li wrote:

[...]

>>>> +		gpu: gpu@4d900000 {
>>>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>>>> +			reg = <0 0x4d900000 0 0x480000>;
>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
>>>> +			clock-names = "core";
>>>> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			interrupt-names = "gpu", "job", "mmu";
>>>> +			mali-supply = <&gpu_fixed_reg>;
>>>> +			operating-points-v2 = <&gpu_opp_table>;
>>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
>>>> +			power-domain-names = "mix", "perf";
>>>> +			resets = <&gpu_blk_ctrl 0>;
>>>> +			#cooling-cells = <2>;
>>>> +			dynamic-power-coefficient = <1013>;
>>>> +			status = "disabled";
>>>
>>> GPU is internal module, which have not much dependence with other module
>>> such as pinmux. why not default status is "disabled". Supposed gpu driver
>>> will turn off clock and power if not used.
>> My thinking was that there are MX95 SoC with GPU fused off, hence it is
>> better to keep the GPU disabled in DT by default. But I can also keep it
>> enabled and the few boards which do not have MX95 SoC with GPU can
>> explicitly disable it in board DT.
>>
>> What do you think ?
> 
> GPU Fuse off should use access-control, see thread
> https://lore.kernel.org/imx/20250207120213.GD14860@localhost.localdomain/
Did that thread ever go anywhere ? It seems there is no real conclusion, 
is there ? +Cc Alex .
