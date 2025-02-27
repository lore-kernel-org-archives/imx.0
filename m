Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EEB26E96B
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 20:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688830; cv=none; b=hXY8xxWUDDvgDk01z0IaxNGkjxdiT/20P1/suNdYKz0RPWBQ2ZsgdkMzRX52KuIoLvGkCzD4K1AFKp7g0NPf9PvUSH9pS2fiI8Q1s9sf+7K4EpHm3xe1dDkUMtVX89N1WLUYP0+BF6B02J7ZZqPvgrcO6+o1SBW6tO//HLcbjoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688830; c=relaxed/simple;
	bh=T1FgbVCuhwy5GTzYA6VUZY5Vqbz21sqADA33fa8RO+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WIC6VJbDVThyrFtJnED1qtIwfvaKAGWb7nXCSRxuINWeIJs6XmN9pntnYsbwXPZXth0ZRmdCvrRv7kgnygTheEZgLvNV8wAsAMiGMjRYSng3bQrxNhRQ+scTIiWHdCMbn3r726E3+ckwODjp4cG/qRy2q0l4qdcKdyLP6uBx/Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=YF9CFEjf; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="YF9CFEjf"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13D7910382F1A;
	Thu, 27 Feb 2025 21:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740688827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4C6upIGFa4XgnfpHiJyhy0wCYQaINcoL0tKBcZ5m38U=;
	b=YF9CFEjfZ0GpxPpqRJ6j5xaHMHPMjF1sd+yJPbXRk7QwKCt+htPCR9INIggWUbetdqYnxI
	jp9IfS3azj0kSTKEpSFBq39BOKenqAD/VeYiNpXA3lUVAfYNBRI+B1tJh6vlTyaf05fYIP
	1ethbF4yEYSJiOKCxtqxowbWBGzWmw8WAGF43opmSFFDdBonAt6r4wQ1tAJgcS79mi3Ij0
	TBCFHsUDYqUCAUxzmocgWHUo6ykI/0sQUmcVVWRYvU/7tgRzV/usYKXrcr+bn81RN79PuU
	N7KGp7fiQgL9tPyv3sPJwGioCj5O0Ff9LDsh2Hr/JFThXGHr6UbpkPm8jv0bbQ==
Message-ID: <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
Date: Thu, 27 Feb 2025 21:39:44 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Sebastian Reichel <sre@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Steven Price <steven.price@arm.com>, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
 <20250227201709.2diz57xv2tntw36q@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227201709.2diz57xv2tntw36q@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/27/25 9:17 PM, Marco Felsch wrote:

[...]

>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 06fe46e320738..2504a456d45c4 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>>   ATTRIBUTE_GROUPS(panthor);
>>   
>>   static const struct of_device_id dt_match[] = {
>> +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
> 			  ^
> 			 nxp?
> 
> Can we switch to nxp instead?
We can ... is that the current recommendation ?

Why not stick with fsl , is that deprecated now ?
