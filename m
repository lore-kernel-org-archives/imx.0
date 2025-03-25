Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D72571B1
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742913451; cv=none; b=gL18WE3vHOsCM2VcCTNUMxv0ckYJ/dGLebZqncWqkqoQUuzq4ErKB9xoQbu/yCjaTzKvZWeVvMjMelV4rhmYy1i6hNm6C10phfXfF9wGdqNlvN9QrsCV+vsVHaEWkxXCP6mNMrSK7EIGfSHL3SEGQURh/sTVBz63RUDRZmFjEJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742913451; c=relaxed/simple;
	bh=kwC2ynEylD9NEucK/H7rfkGlnWKV1STmUNU+8kNIIAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1iKS75MQiYZeXsWsWMJgZdAQkgn8pVScnQSYeuAL4bk3OCu5/Y3+6O6oPTkf2J8ybUcXmjP2Ph3Q4igPzkrztndWsgZ+sRL2k65B4yjrXn4HHzRLEefLZmR5uPzxZS4rUGqM6oMn2ZhmsZ15Vtu1RdZ6P7THKJ+O0zt9Eu9WCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=J9EvbRS7; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="J9EvbRS7"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8859102E64C4;
	Tue, 25 Mar 2025 15:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742913446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Gx78FzdSuoxvydX3OAmJrDm5VENfMIagJMouDlZNW7Q=;
	b=J9EvbRS7UMr+zUOmz1lpNCnS04jKWkny9gRjE9/DZxMR7SGO59p02E0PT6z3LTMHwA4W49
	54fLn2HkHZv+2PuokIiMXas2nul6iahBgtwliBB6NNTURWfCT6ZdLrinmjo6NVdUnQ+TZE
	A8v527EIgWxqby2cLTzJ8CY82tYT1MI6ATmsCG+QkU2ALC75a+WDhut8xjSQjx+TaPSn72
	wEoymXg6ih7DAvPIuykuQ3j1GglTo4PzyTQRtc7Hk6qUng0I5Gt64Xs+6yrWrP7ATGEGgS
	gsoB/9uCV9EvBYqa9ZF0Cg88EiAkeGlxzTezuncvwUt/6RLWGXPH1F25kuvFmg==
Message-ID: <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
Date: Tue, 25 Mar 2025 15:37:01 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
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
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
 <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
 <20250325153507.61d82e39@collabora.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250325153507.61d82e39@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/25/25 3:35 PM, Boris Brezillon wrote:
> On Tue, 25 Mar 2025 14:50:32 +0100
> Marek Vasut <marex@denx.de> wrote:
> 
>> On 3/25/25 8:43 AM, Boris Brezillon wrote:
>>> On Tue, 25 Mar 2025 00:37:59 +0100
>>> Marek Vasut <marex@denx.de> wrote:
>>>    
>>>> On 3/24/25 9:43 AM, Boris Brezillon wrote:
>>>>
>>>> [...]
>>>>   
>>>>>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>>>>>>     
>>>>>>     	panthor_devfreq_suspend(ptdev);
>>>>>>     
>>>>>> +	reset_control_assert(ptdev->resets);
>>>>>
>>>>> Hm, that might be the cause of the fast reset issue (which is a fast
>>>>> resume more than a fast reset BTW): if you re-assert the reset line on
>>>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
>>>>> up in a state where it needs a slow reset (all data sections reset to
>>>>> their initial state). Can you try to move the reset_control_[de]assert
>>>>> to the unplug/init functions?
>>>> Is it correct to assume , that if I remove all reset_control_assert()
>>>> calls (and keep only the _deassert() calls), the slow resume problem
>>>> should go away too ?
>>>
>>> Yeah, dropping the _assert()s should do the trick.
>> Hmmm, no, that does not help. I was hoping maybe NXP can chime in and
>> suggest something too ?
> 
> Can you try keep all the clks/regulators/power-domains/... on after
> init, and see if the fast resume works with that. If it does,
> re-introduce one resource at a time to find out which one causes the
> MCU to lose its state.

I already tried that too . I spent quite a while until I reached that L2 
workaround in fact.
