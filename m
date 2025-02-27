Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3800C1A08B1
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677182; cv=none; b=kPmwXGdf02ab23waqs8Erp2bVq0Hhwe+lG10+GjsWAJhSD1bZWSZNybvr67IrpPziwoK3/1XN/Sk5pXKVJbnjqAKsMAgJ2+Xt01VKMhxvhOSGBSHHDUWF6EU7h9bLTvNqrTgW2jsvLGbHPsuGe5gpDjm1yj4ZDaBND2TD/njK5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677182; c=relaxed/simple;
	bh=pA1efuEN0AzTd8N8ixf25AtkDiqozVQ8k91M7cTiOIM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jyym+606A4s97yZ2GpcWn9mrlDVW12srbqh3hNAxpN4WcBKd9M6g476Pkh1KQQ+i0CkXiCT/aSFPE3S6fc1nUuBCiz7Q3XxP/q3j/Espeo7n5ellZMEXUKaTWb9qNPtQIJ88wHpBO/4IQEwT6Gg1e9MrMmbfE0+hfJ7MNnNdPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=I52RF/4R; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="I52RF/4R"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B722510382F24;
	Thu, 27 Feb 2025 18:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740677178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z4OqO0DlmHTyAuXAgYbGzIkXg36xy2WA6u8k/uPoPPA=;
	b=I52RF/4RmJii3MfN1/Z74h9+4oa9hwjgxOCPH+oHDZwj4E3b6qEDxXRqbxa3A2GutMSz8n
	e8pIozchEVC9K2kZKq13KKYtSmYYsXuA8t4yBFhQ+XfVYVJ/TZHobjR1HIis418UoIV8dQ
	iR7Lz9ep20PlsCmzbPxEZd5J0FzLQSHo5f4sF8whxei2m6WiAgUoH/eLFzfHD/mNuVstvs
	drAsgJd5vut8VFuOo0wAP663gFSltxq+xcAK2wOR/n7CoHaSmAHjFAUte5ljno2pvTp5op
	+AC4aFkDRUlXO1mPjEoMS5GWeBaQcbNtVOBzY5PAW4WRrItNNjkTN10FKmziwA==
Message-ID: <601055ff-6a19-4d89-b4ae-fb437d3f1670@denx.de>
Date: Thu, 27 Feb 2025 18:26:04 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
To: Boris Brezillon <boris.brezillon@collabora.com>
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
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-7-marex@denx.de>
 <20250227181748.3f99d67e@collabora.com>
Content-Language: en-US
In-Reply-To: <20250227181748.3f99d67e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/27/25 6:17 PM, Boris Brezillon wrote:

[...]

>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index 671049020afaa..0f07ef7d9aea7 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -470,11 +470,12 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
>>    */
>>   void panthor_gpu_suspend(struct panthor_device *ptdev)
>>   {
>> -	/* On a fast reset, simply power down the L2. */
>> -	if (!ptdev->reset.fast)
>> -		panthor_gpu_soft_reset(ptdev);
>> -	else
>> -		panthor_gpu_power_off(ptdev, L2, 1, 20000);
>> +	/*
>> +	 * Power off the L2 and soft reset the GPU, that makes
>> +	 * iMX95 Mali G310 resume without firmware boot timeout.
>> +	 */
>> +	panthor_gpu_power_off(ptdev, L2, 1, 20000);
>> +	panthor_gpu_soft_reset(ptdev);
> 
> Unfortunately, if you do that unconditionally we no longer have a
> fast-reset. Would be good to figure out why the fast-reset doesn't work
> on this platform.

I was hoping to get some hint on this one, I spent quite a while trying 
to narrow this down, finally got it down to this particular bit.

The NXP downstream vendor kernel vendor Mali driver does not seem to 
have anything interesting regarding the L2 power handling, but I might 
have missed it, the code is difficult to read.

Have you ever seen anything problematic in this specific L2 department ?

Do you have any hints how I can debug this further ?
