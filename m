Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF732571A8
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912841; cv=none; b=BNaRz3a0CIWLFVaedPCMLIz+PvfUg7k9FU8CnndcLchsnmQJHOpoCjLw3vt2gJ7zk+4gDCbp4REVxSk7MqEyF2Kn4AyJS7urdo+rxWhNLT1PEmxREnDt9y8RHOdAkdA6jNTXYk2BEuLCO2S6ANYT48gxQ9fOomz3acA5CNHHNIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912841; c=relaxed/simple;
	bh=nRN0nqYk9AtXXMsvoeIAVR6EXPBnbjzAbo1SODQz034=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FhOYLM8VvIJZR+z7iy0/RUoXxRg8crCNR5/db8OSkqpehvFkLMfrUuZbth1FkGNToCVpI0+thbmk5Qo/iigJ3TYNSUqGBX1lffVmAHWkS8+5W844utkwdpOEv95SiIJDDyRqwdLuf9oYBgr7/43bhkxzjFw11oPpWbkVOoqHJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=h8mxzJOU; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="h8mxzJOU"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB247102EBA49;
	Tue, 25 Mar 2025 15:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742912836; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=mVgBuvwlTjig0oSmPB6BQKFdvM38TG/M7XXOVQoAWGo=;
	b=h8mxzJOUJNe4zDuFBuk4WSVlR1MP4YPHN94AvvdVP8/HeTviSAij+0yoyOlAiTqC1PZd+1
	DYMXeaNmqBrD+Bofx4bbFOjfLiKkkqMUY8aM/crN9XyBiZN+62LmcRvDdajK5zDPDU80vT
	L8fgD0eajwg4l66xHAyIK3DR413TwDeMZXixGQfXruUpaVUAyNQXrmtV3u71JnmUJYeTZ4
	W/61WRvMhOHEgeXsoo4BeeFl2gAmduhB/eSKxZr/7q9nokMBqVaYnBrqSiZUBCCQ6zN4+8
	nxA3IJEAz5BcZ1wu42KB2Ls7BFnRB2PO2iZ43hjimhge5T2UbRgWYsIhcETcIA==
Message-ID: <7233d56f-d07d-46c3-9954-57eb583a36ac@denx.de>
Date: Tue, 25 Mar 2025 15:27:11 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
 <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/25/25 3:12 PM, Philipp Zabel wrote:
> On Mo, 2025-03-24 at 20:05 +0100, Marek Vasut wrote:
>> On 3/24/25 9:43 AM, Boris Brezillon wrote:
>>
>> [...]
>>
>>>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>>>>    
>>>>    	panthor_devfreq_suspend(ptdev);
>>>>    
>>>> +	reset_control_assert(ptdev->resets);
>>>
>>> Hm, that might be the cause of the fast reset issue (which is a fast
>>> resume more than a fast reset BTW): if you re-assert the reset line on
>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
>>> up in a state where it needs a slow reset (all data sections reset to
>>> their initial state). Can you try to move the reset_control_[de]assert
>>> to the unplug/init functions?
>> The reset on the MX95 is not really a reset, it is clear-only
>> set-never-again bit which goes only one way, the "unreset" way, so I
>> don't think this has any impact.
> 
> This sounds like the bit is initially set to 1 (reset asserted) and can
> be cleared by writing 0 (once, to deassert the reset). But in the
> reset-simple patch it looks to be the other way around (active_low =
> true)?
> 
> If the reset control can't be asserted again on this hardware, it would
> be better to have custom driver that doesn't implement the .assert()
> callback at all.
Maybe the reset-simple driver can be extended with some mode of 
operation like this instead , to make it skip assert once deasserted , 
for specific reset controllers ?
