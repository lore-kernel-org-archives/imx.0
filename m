Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A3627602E
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 18:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767248; cv=none; b=QlGMf+J6C37dJ1LI/BxLFxHflJw1KklMsql3Q+pZ5TZFBpa858qnrwP7E7L5FwBdoPc+/XrdX/LBCFcP3eRAtyVOWYRdqoLzX21AuFIujF3G4WQVaQ4yVTHhV86504kcRJsq3Z8+n2iARkXaklKD+ILMYUL5B9/a+caylHQ84fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767248; c=relaxed/simple;
	bh=OtuZ+Q4s3XrEWzNHtIOckAWFcIg4uAHJL125DGwYR/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPJxGXa4IJxHykuiX+vAFVbztBVogXT2ev1yxZfDIdDPIu0llOl3WbZqLIJ0aKRlUseC3Xtw5VnbuLNxspLW+wMIPPcvNkeJZ/lVGwAMcwEZ7cDqa6sNnuU4A2dvEYiMeCuOIOTuIIjLEcNLy30lo30ZSTqoT1r8d/ri6X3j6U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Yn/pbPf6; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Yn/pbPf6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 930B3102901D5;
	Fri, 28 Feb 2025 19:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3P4A7H/pIr+jleCoPMgEMcaVPouLltqtMNXMLxu5kU=;
	b=Yn/pbPf6niThiIhbQzwSlsQAx5hB/NDoJGFpZc8wSLnfHNpC+RiGVUci9CMXSsvuTnP/4b
	OypJjEppUUe9/XDs46qsuXC6vOeQGkBU3OKi7cN64S8cxK6McaGK27YVyhWsDCuStpnP42
	YKk+4rxTVXPr5BFO9fiTTJPl+DAGSO9nWqObAjLE/WlAq7YmMR96lt+yL4AXmaSoigr+7J
	GCDgtrcTqzLnfPQIRzeAVPO/CLXhf4Kon6zJZMyKkP0QLVHgFqSPJXsrlvrqPvGH0WLwPc
	lGf0wS6F90jDptPiRZzu1ad7gsFFO9qTTAIATD2zRPKOlyhxgSt/u2WusQjrKg==
Message-ID: <980075f9-5ad2-430e-b139-7e9477bf415c@denx.de>
Date: Fri, 28 Feb 2025 18:26:43 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Florent Tomasin <florent.tomasin@arm.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
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
 <20250227170012.124768-9-marex@denx.de> <4658624.cEBGB3zze1@steina-w>
 <887a6d8d-9eab-44ed-9fd0-9197598231f4@arm.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <887a6d8d-9eab-44ed-9fd0-9197598231f4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/28/25 12:23 PM, Florent Tomasin wrote:

Hi,

>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>>> index 06fe46e320738..2504a456d45c4 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>>>   ATTRIBUTE_GROUPS(panthor);
>>>   
>>>   static const struct of_device_id dt_match[] = {
>>> +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
> No sure the comment about G310 is needed.
> 
>>>   	{ .compatible = "rockchip,rk3588-mali" },
>>>   	{ .compatible = "arm,mali-valhall-csf" },
>>>   	{}
>>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>>> index 0f07ef7d9aea7..2371ab8e50627 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>>> @@ -67,6 +67,7 @@ struct panthor_model {
>>>   }
>>>   
>>>   static const struct panthor_model gpu_models[] = {
>>> +	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */
> We can remove the comment about the SoC. This GPU model could be found
> in other vendor platforms.

Maybe it is a good idea to keep track of which GPU is in which SoC at 
least this way ?

>> Are you sure about 0, 0? With this I get
>>> [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 status 0x1
>>
>> Using GPU_MODEL(g310, 10, 4) I get:
>>> [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 status 0x1
> 
> I'd agree it should be GPU_MODEL(g310, 10, 4). Unless the GPU
> version has been changed by the vendor?
With the fix suggested by Alexander, I get the following output on boot, 
so I think 10/4 is OK ?

panthor 4d900000.gpu: [drm] clock rate = 1000000000
panthor 4d900000.gpu: EM: created perf domain
panthor 4d900000.gpu: [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 
status 0x1
panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1 
MMU:0x2830 AS:0xff
panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1 
tiler_present=0x1
panthor 4d900000.gpu: [drm] Firmware protected mode entry not be 
supported, ignoring
panthor 4d900000.gpu: [drm] Firmware git sha: 
8e5cfcfec20cc8aff8509d37e72babc935d34a3b
panthor 4d900000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0 
Instrumentation features 0x71
[drm] Initialized panthor 1.3.0 for 4d900000.gpu on minor 0
