Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7823BD17
	for <imx@lists.linux.dev>; Thu,  4 Sep 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999762; cv=none; b=NI8FG6w1bA+MMW2tuPhoeOw7CBCLeeMEjVeFaL99UK7A/e2uewgQMNEXQrG3mHFyabFHNFuIlBp3hbQmCjUO3xwZCLZknH5hcWzQ6hsrE+AE+A15rhC8KJ6PVvnZsMqAzeHYI4JFej5m35uEAOhk9kqoY4CHhxtSLCvDuIkHF/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999762; c=relaxed/simple;
	bh=WizmZd8J48tTTfOsGP3pA1/nJkvGE/Paw8ds7VGnbVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vzt+sz3Gt+/5PpczZrl8PZ6jh7xWrBCj3b3d66n7eGM5L6CHtzFzL0mipYYFO6ISeL4V45JQ16kOE3Lx8yA8Uhd7FBbZykd0WqGyu68gjT2H35FqKvUhM5cV59lDRrjA+4gwMeXeQeS1+52xTh1rMdRaSw4XNW5Eu1Jo+E1fdvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YyyUUybU; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YyyUUybU"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cHk0r5nppz9tNF;
	Thu,  4 Sep 2025 17:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756999756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YMf+k/Bsp9owswsYg5LCXeOuKmxxash92C94JmMNFU=;
	b=YyyUUybUO9ZToCy1ozjYe7nM6hGgPqUd8qbdtc2cOc6VU3Qq5i6fb0BTkmf2GxT8dlZaxc
	5yhGTaCCc2iVy8WhS+2hBtGOQVuNExftXz+0f4+w7aO40ncNqj/BRG37Xq4FWIQF4zS2M2
	RTAwGslv5Xx0+EYkB/htXz0gxV5vh9izbIJwrLAFWDtSyojX4GMDusoXHYCLgFT2EKN2k8
	lgeeI+RLgCdnR+l3KN9lSzu+sUJ2ki5H42Ck9Bzh8vKqIXpwOHeK3yUv/MJPwYVAuAFBLS
	V9xV6M8cW5xMvzIOW+wa8hymS1Rol8hK3HHTiq62NtIkBn5nsVHgX5MUr9UBvg==
Message-ID: <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
Date: Thu, 4 Sep 2025 17:29:11 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org,
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
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
 <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
 <20250325153507.61d82e39@collabora.com>
 <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
 <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904172019.58e5f589@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 92bfdf50c7c1f6425f0
X-MBO-RS-META: fgg6a1e587wkiek1uhzomehqkz1go8k6

On 9/4/25 5:20 PM, Boris Brezillon wrote:
> On Thu, 4 Sep 2025 16:54:38 +0200
> Marek Vasut <marek.vasut@mailbox.org> wrote:
> 
>> On 9/4/25 4:04 PM, Boris Brezillon wrote:
>>
>> Hello Boris,
>>
>>>>>> I suspect the extra soft reset I did before "un-halted" the GPU and
>>>>>> allowed it to proceed.
>>>>>
>>>>> Hm, not quite. I mean, you still need to explicitly boot the MCU after
>>>>> a reset, which is what the write to MCU_CONTROL [1] does. What the
>>>>> soft-reset does though, is reset all GPU blocks, including the MCU.
>>>>> This means the MCU starts from a fresh state when you reach [1].
>>>>
>>>> I have a feeling the write to MCU_CONTROL does nothing in my case.
>>>
>>> I believe it does, otherwise you wouldn't be able to kick the MCU
>>> and get things working until the first runtime suspend happens. I gut
>>> feeling is that there's something fishy in the FW or SoC integration
>>> that causes the FW HALT request to put the MCU/GPU in a bad state
>>> preventing further MCU_CONTROL(AUTO_START) from functioning correctly
>>> after that point.
>>
>> I wonder who at NXP could chime in ... Peng, do you know ?
>>
>>>> Is there some way to probe the MCU state before/after setting GLB_HALT,
>>>> and also before/after the MCU_CONTROL write, using
>>>> gpu_read()/gpu_write() register operations, to find out what is going on
>>>> with the MCU at each point ?
>>>
>>> Yes, there's an MCU_STATUS register [1].
>> Is that the only register I can use , or is there something more
>> detailed ? This register only returns values 0..3 which is not very
>> informative.
> 
> Not that I'm aware.

Hmmmmm ... is there any way we can progress with the MX95 upstreaming 
with full reset , as a hardware implementation workaround in the driver, 
or some such ?
