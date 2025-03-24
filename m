Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E9266F09
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 19:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742843359; cv=none; b=QPoF4euyExRWUfoUFk1Hhv7I2h8EWZfrPnJPZGE4wVBbBbtcav+PkxHAJvP+tOhr3XracqQzHPQm2tBKTtoF9zAJUgzA8g1RiwUCO0NMg8aclkVBeTS+QIz7aNMpibJpMK8c02i7zJgwmrLzKPIw5lf1GxcXj6y8rOWEE9BzBhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742843359; c=relaxed/simple;
	bh=tMdbtZjxK5Hp6vpTGbR0eVJuD/+caqSIXla2BtJsgQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5MSf3tInv/q0nY7U8rO2OVZrA0AvkqnqIVhtYtxRISbP7Pfjg6WMI/cCCUXkKzZUJPxHBaHw3JSG8Sy1Idrl8yuTq8D+HmfeTtDShxPgs7J9P5lOaFVBaHynz1lE7NEwQSY13GMDYLl8s6wCEJHskTzNbDBP8oxMrBTN2iUyG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=EIVD1Puc; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="EIVD1Puc"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CA52102E64C5;
	Mon, 24 Mar 2025 20:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742843348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=luE9KNFBY2yc7R/r8kECD9v8u+QS5s1DIkupBbe0SSw=;
	b=EIVD1Puce9GrbbyT1REgTbYEiv/mzMu+ZRfY5ES/3/fMYFUQXKfknvvd1b5InJ9Eu6037N
	MlWSub3tdlXkUWWZLL9Ww86CskVGBYSTFXBLSe1OXl6bzdiTcQFBc9ryum/GelslPY4Kse
	qY7kNLYjJ0fN5NTayPBDktZKK2ue7mko3nk2nHIFYzYY5FK4BOin0JMko/LQVGjKW0VUfD
	uR4Mv3JRJLu+mS40KfEJTCn8t7CRLTN+zB8YIEoMqcWR7Li++KbCeLsBiEv2X6UyktIx1I
	pjoqE0y8H6y+qr/Z96/asN+t3K3T12cXKvs0DmYSgDpx027o+j00SAI1Rl65Jw==
Message-ID: <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
Date: Mon, 24 Mar 2025 20:05:15 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250324094333.7afb17a1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/24/25 9:43 AM, Boris Brezillon wrote:

[...]

>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>>   
>>   	panthor_devfreq_suspend(ptdev);
>>   
>> +	reset_control_assert(ptdev->resets);
> 
> Hm, that might be the cause of the fast reset issue (which is a fast
> resume more than a fast reset BTW): if you re-assert the reset line on
> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> up in a state where it needs a slow reset (all data sections reset to
> their initial state). Can you try to move the reset_control_[de]assert
> to the unplug/init functions?
The reset on the MX95 is not really a reset, it is clear-only 
set-never-again bit which goes only one way, the "unreset" way, so I 
don't think this has any impact. Also, I commented this out already and 
it made no difference. I will give the second part of our suggestion a 
try in the next few days though, and also try the updated downstream 
firmware blobs (sigh).
