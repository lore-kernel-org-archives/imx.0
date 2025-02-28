Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A45026B971
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767251; cv=none; b=bRrjgQ5a2GxGIm87dApstAcJ36NO/+pdfu799zoFPl10TLVQwwzS5aAsPhBfYrRb8cFcfVou9wNTV4yRbY1BstMucW1IbKqkQSpG9J8NoomAJ0eeLKCRlCzd16v6J3Hy6wY6TlsjZU2pm+zkzIjNGTXB+UVkJ/DaMsx9R09GorY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767251; c=relaxed/simple;
	bh=n3z+Ajbx3YSIPCqatq11C2NU+71l/QFCYFd2JrCTTA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdPTduq6dteX3nctDtBWfhGX9X8d9sShHJLU2zu418M/SylOPZN1tYULXWioA2ZnLT1L5+E5c7IN4vq/19Ac0aHRbfWRIx1Ix+D4QeakktzmupIPeAUYpNwAL3Qx+S6mBcRnN9DMkuq8XC7HoClPep4g6jYB3w7aKCKRnxriQ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=MMAOQyq8; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MMAOQyq8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC5A8102901CB;
	Fri, 28 Feb 2025 19:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZS4nj+6CXdvnwv7q5KXp5Uz0YuvWKS25Z4+jZ2AtgM=;
	b=MMAOQyq8fDfYlgTpZqC/M+BGzgpy9ow1BJurDp10ybzZ0pWTxNGhGN3rhcaGG0+P7rjhit
	mDM7zuoPQRTg0KVG0DhAmQp7kRrYuhbq+XMiu/iJ2VYPyRysu/zG21jO/2q1URP/DayWDr
	TJrERFxmPTvwFlEM5fHjwvd+nZfq7j7BRbBSFEH3CkUu3oMopCHWUTVJhM/gGo33C+jlBs
	QIvO0o1lQRG5q1f5Gx0R9jbHy+Xpsm6ZPIOcTYY+mSjcCWphqBUnAb7D6L4HalOXZLTY7t
	elNTV2H+836UoG1zNCm6E1IMRT4k/FzSGlcRKKHtAifZja6oqOUsuTAjtiWOiA==
Message-ID: <52f42263-d40e-449a-80f5-145a87fdfdd1@denx.de>
Date: Fri, 28 Feb 2025 18:33:16 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Frank Li <Frank.li@nxp.com>
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
 <db903f36-e897-42ed-be46-f0b035303233@denx.de>
 <Z8DlYjq+87sjS9cU@lizhi-Precision-Tower-5810> <3332618.oiGErgHkdL@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3332618.oiGErgHkdL@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/28/25 11:39 AM, Alexander Stein wrote:
> Am Donnerstag, 27. Februar 2025, 23:21:22 CET schrieb Frank Li:
>> On Thu, Feb 27, 2025 at 10:34:20PM +0100, Marek Vasut wrote:
>>> On 2/27/25 10:27 PM, Frank Li wrote:
>>>
>>> [...]
>>>
>>>>>>> +		gpu: gpu@4d900000 {
>>>>>>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>>>>>>> +			reg = <0 0x4d900000 0 0x480000>;
>>>>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
>>>>>>> +			clock-names = "core";
>>>>>>> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
>>>>>>> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>>>>>>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>> +			interrupt-names = "gpu", "job", "mmu";
>>>>>>> +			mali-supply = <&gpu_fixed_reg>;
>>>>>>> +			operating-points-v2 = <&gpu_opp_table>;
>>>>>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
>>>>>>> +			power-domain-names = "mix", "perf";
>>>>>>> +			resets = <&gpu_blk_ctrl 0>;
>>>>>>> +			#cooling-cells = <2>;
>>>>>>> +			dynamic-power-coefficient = <1013>;
>>>>>>> +			status = "disabled";
>>>>>>
>>>>>> GPU is internal module, which have not much dependence with other module
>>>>>> such as pinmux. why not default status is "disabled". Supposed gpu driver
>>>>>> will turn off clock and power if not used.
>>>>> My thinking was that there are MX95 SoC with GPU fused off, hence it is
>>>>> better to keep the GPU disabled in DT by default. But I can also keep it
>>>>> enabled and the few boards which do not have MX95 SoC with GPU can
>>>>> explicitly disable it in board DT.
>>>>>
>>>>> What do you think ?
>>>>
>>>> GPU Fuse off should use access-control, see thread
>>>> https://lore.kernel.org/imx/20250207120213.GD14860@localhost.localdomain/
>>> Did that thread ever go anywhere ? It seems there is no real conclusion, is
>>> there ? +Cc Alex .
>>
>> The direction is use access-control to indicate fuse disable. Only
>> implement detail is under discussion.
> 
> Well, the discussion ended up to be more complicated for i.MX8M.

Aren't we missing the access controller in MX95 DT so far ?
And maybe some driver to match ?

> For i.MX95
> things are a bit easier, as fuses and clocks are controlled by System
> Manager (SM), accessed using SCMI. [1] is more important for imx95.
I think SCMI is replacing GPL code in kernel with stubs that call 
non-free firmware, which removes flexibility and makes long term (or 
any) maintenance much more complicated.
