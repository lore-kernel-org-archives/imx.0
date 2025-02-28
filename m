Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C426B971
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 18:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767244; cv=none; b=Q4Zk2v3Czc0O+jbIRvaVR6b+L38GtcN6TsxSem1D9ACP8geDGFCAPtKfFstc7S7o7t1u0zL8i049yZIVM2aKu0j51FLLDuQ14T7iqmcbA7h3fO1BAkSwYvUF8IMnONLM8zYBYvMlRiLGTJuHAahQOQymXFQh0jujTrXT/NIORK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767244; c=relaxed/simple;
	bh=7lFHiCCc49mUKV4qIXaheDGkpka/KCY36TWr3pGtl/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F47iyoFSea1/1Ov2L8zqmb5XvaphzRTUECCE2IWtT4J5BNaoT62vj55zqagL/KWTYbfXMdTDn/9nZYyAaNBKUIpLJcJ9D/X3ML5XIyysKteG5Fav/MZfiHM1gHKxqqXDgHYtV5ClJ/qpl5H9Pus+japlDOBEQnmxrXJkYgtd/70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=RKRgORqc; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="RKRgORqc"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C285C102901D4;
	Fri, 28 Feb 2025 19:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EyEPM5mrGTn5rrR73FFHMdEx08PtiRTDMuqHCB2nPVc=;
	b=RKRgORqcnqV3NSzwt7DVV5LwK/q/7kkOp1UUtaXPcHOdglNIfxmpVp6+KDJ9EXQXEJ90rK
	2/OKj5kWm9R/F9XHGSmr+3wQtufmCv+k3CUVsYS4wAStAfurjNvneFGI21v/YwF4cbWeKM
	sGRecKE06EFQFROt+lYKNJHUcX3T46u+cakOr8Ucnx6FS9pR4JmSENfjYMZT64aeW4P+r4
	iDNBSiG5iD0B9Ryvc0HxqaG8/VsmzHlP83i8dM8sbL+dFCWLhQSxHs7G0PfBV0Wj6bYb+x
	jo43dHzCVZR5WzZODLERiZTF5s7FIt3uIo+LdSmF8Dev8qMCLy/sDboa4dmkjg==
Message-ID: <aa571158-a7ab-4bee-a7a7-e7a729301d7d@denx.de>
Date: Fri, 28 Feb 2025 18:21:50 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
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
 <20250227170012.124768-9-marex@denx.de> <4658624.cEBGB3zze1@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4658624.cEBGB3zze1@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/28/25 11:21 AM, Alexander Stein wrote:

Hi,

>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index 0f07ef7d9aea7..2371ab8e50627 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -67,6 +67,7 @@ struct panthor_model {
>>   }
>>   
>>   static const struct panthor_model gpu_models[] = {
>> +	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */
> 
> Are you sure about 0, 0?

I am not.

> With this I get
>> [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 status 0x1
> 
> Using GPU_MODEL(g310, 10, 4) I get:
>> [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 status 0x1
> 
> Note the output is GPU_VER_MAJOR() but this table is for GPU_ARCH_MAJOR()
> (and the corresponding minor).
The major 0x0 minor 0x0 is where I took the 0,0 from. Lemme update this.
