Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6941EEA3C
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 20:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587344; cv=none; b=oO4BlQegNK09kAHHNR4lYlUF+Hk85Df4Vd6X/N8u3YypJLYACIsNlfh/jR8qoMAJc2g5/626fqu0gE+5SdKGFUMWxxrZk9PdQvRXV7XAKqC+uoDJAe12cTcT8s7nQ957zmYXY/zD2hFuZww/01z4UGpfnjSn1AFi5wHJhlO69Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587344; c=relaxed/simple;
	bh=0xvRK68PTf00PJTJUFec9iWQ8iI4xFUDFM8Pu1QP8AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EV7do5o9ExGzoueHH44X9zdqvovic/kL8Uw0f2zwoiyed6LirEmWzcus1H9Tgva3In935QobQXvmtyjw6JAno11I38nf5ImlkQiVqmV3404Tbgyncc6Vy3QmGHnLRVxFD2ZjtEQoWm7ajAKbACHFgjfDHczF2jj1Ro3kFkbHZT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=VMotOcUj; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="VMotOcUj"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AFC510206773;
	Fri, 21 Mar 2025 21:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=a14P7c9Bp63M0MikNJ0Fvj67ia2oHwxPak9QEd1B7t4=;
	b=VMotOcUjpl1dTWWEKwIByS8XW1DZznwH/22i39U16DkYz+o0LxVp22AjGOgnvAJdMC4zAi
	84RK7OrxFPOWowuQ9XaihDLTGw6uIWaxi5E/SRZSo2gVkblvdPtMBNQuf7rciyG00O9iTL
	/Nzd/6AT+a0w9H4xiyeh8cc1Un12OGqFeSDfKS5YMh/vcq57IYeiCESxTGKa9zPRaX1M6X
	MCd++V8xRc3pCSogyVZbD+k9i4NJJLhS55AxDnXL6LtVLdQ2WahxppQORHOra1Z7yDjiAE
	eX/XV5KSQIh/bxBnkezBsFXhq1EaJQMIczhpqN2bZKwh6DF/VZWALBTfeKWFng==
Message-ID: <6034b024-381c-4fed-9d97-ad7d5d293112@denx.de>
Date: Fri, 21 Mar 2025 20:37:58 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de> <2153305.bB369e8A3T@steina-w>
 <4a27b6bf-aca8-4f29-9561-609a42eb81a0@denx.de>
 <Z8XFCv6ku6mG1_x5@e110455-lin.cambridge.arm.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8XFCv6ku6mG1_x5@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/3/25 4:04 PM, Liviu Dudau wrote:

[...]

>>>> +			#reset-cells = <1>;
>>>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>>>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>>>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>>>> +			assigned-clock-rates = <133333333>;
>>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>> +		gpu: gpu@4d900000 {
>>>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>>>> +			reg = <0 0x4d900000 0 0x480000>;
>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
>>>
>>> There is also IMX95_CLK_GPUAPB. Is this only required for the rese control above?
>>
>> I think I have to describe those clock here too, possibly as 'coregroup'
>> clock ?
> 
> The 'coregroup' clock does indeed control the MMU and L2$ blocks as well as the AXI interface,
> so if that is indeed a separate external clock source it should be defined. Could it be why
> you're seeing issues with L2$ resume on the fast reset path?
Sorry for the delayed reply.

I did define these clock, they are enabled, but the L2 reset problem is 
still present .
