Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2C93002DF
	for <imx@lists.linux.dev>; Thu,  4 Sep 2025 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997696; cv=none; b=t6F3KpdU3CmVIbbvRlExQiANbtp5PBMdf6Uu+zDY1jz4+cFaTZl7M0Sthw5cfI0Yqwu8wpt82w74JWiBkJj6iKVH6cjEcIpaM59phT6TiYAyKTf0oUjChr9HxKc1szxHq9YOCOk6ofncJ5QDvliGieCaIVe6zu3pIP6JDIZMM1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997696; c=relaxed/simple;
	bh=A0tdI/1UhgNH4DCr87afs9//xEHvrbeypVTIqLwV7HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qGqXb9YQL4P1JzwaGIF5FfiiA1wi1X7M0kt18vAog6nIxitj4lRX8llVHXyRHI6/ViK0OjcGXUcsJz/6hFTWnmIf8isrVdOArm0PwzsD3VPz8cGgIY+ONJLc5FLJssIw5Yir55JGi6zbenxVbw+fl+VHdiUWTtznW/f0trcG3pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dS8o7BL3; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dS8o7BL3"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cHjDz3FWNz9sZZ;
	Thu,  4 Sep 2025 16:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756997683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7/xT89VRoxrwQ0JjRMfdexoGV/szCvyMNhLAm5kJvo=;
	b=dS8o7BL3kNMLXteZvbaVNmebE192YJHpiG1f0n6N/iFe9hDbOT3arEQNITXZukWMDsgTSL
	0z5FaMijFHTnVCIirKjw/tY0tm23a7W3diqJQKuAEBXK5qqkXBIJXGvYILT3YRW/xuGMT9
	7xlEeNgCHLVVRDrVnYDWHxd2TSbmYX+qets+CCrPKkyU1+O78LKHcSjup/179xKhSvYhru
	Dg6jOiI/28TYyGNsG83rysZmK8Mky/i3P++bmGoaxVg5WxygFHSDW4s3JrxWjhtJ9iG1v4
	S8J4mynpBTHHi35cjxBVKNPODD1QDS+WKA6owP3V089toxOoeba/93Ea+g1s5A==
Message-ID: <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
Date: Thu, 4 Sep 2025 16:54:38 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Peng Fan <peng.fan@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904160445.1671f140@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 41491fbd7aa62595225
X-MBO-RS-META: 9cri59ifc448dxba9poz1bm6pht8k5af

On 9/4/25 4:04 PM, Boris Brezillon wrote:

Hello Boris,

>>>> I suspect the extra soft reset I did before "un-halted" the GPU and
>>>> allowed it to proceed.
>>>
>>> Hm, not quite. I mean, you still need to explicitly boot the MCU after
>>> a reset, which is what the write to MCU_CONTROL [1] does. What the
>>> soft-reset does though, is reset all GPU blocks, including the MCU.
>>> This means the MCU starts from a fresh state when you reach [1].
>>
>> I have a feeling the write to MCU_CONTROL does nothing in my case.
> 
> I believe it does, otherwise you wouldn't be able to kick the MCU
> and get things working until the first runtime suspend happens. I gut
> feeling is that there's something fishy in the FW or SoC integration
> that causes the FW HALT request to put the MCU/GPU in a bad state
> preventing further MCU_CONTROL(AUTO_START) from functioning correctly
> after that point.

I wonder who at NXP could chime in ... Peng, do you know ?

>> Is there some way to probe the MCU state before/after setting GLB_HALT,
>> and also before/after the MCU_CONTROL write, using
>> gpu_read()/gpu_write() register operations, to find out what is going on
>> with the MCU at each point ?
> 
> Yes, there's an MCU_STATUS register [1].
Is that the only register I can use , or is there something more 
detailed ? This register only returns values 0..3 which is not very 
informative.
