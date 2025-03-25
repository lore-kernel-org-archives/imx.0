Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7487D2566DB
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910732; cv=none; b=m3AFasQ2qc45aSgjKn3QY0NXu8ZqV8ainEb0ZyzLNdzvP4j1KXaYw0ZMxMfjW/9RFta8uz+VkWxpfnm85yDKdAKqmHENILSK135psrIRbi9/l011IQTO8LF8f967my/aHGll5fIo8xBXTdsxb+Myf/07BkQG+2zY2AF8552Mf7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910732; c=relaxed/simple;
	bh=1R1VK+T/436CbxUciSAXA3RyIxMtzJKemvJwu3t9UNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAM0z2Qnpm5yKKH0G2rT3M06opW3O5qCyOiHZlSIVmMVgPGOS1266arAjMkJfsOMon2wlbr/mFhhDAsy8d6jgGqMCz22I15hEKlOaEqYXzopDmHorTk1A/2JQ264WoGbiQFYTW3y4r0Q0TdyuSnOaxRH78sTpvMrPlGNpKXI1/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=MVEK8L5m; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MVEK8L5m"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C3A0102EBA49;
	Tue, 25 Mar 2025 14:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742910727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=27tDlS9I7w+QHFZ7F9553jcj4LUb3Qxba7/RAdMTtto=;
	b=MVEK8L5mQphFgbOHAcgIHBn/giW8wflKAJWs62f0xFcpzUrYLbX+LFoVPGQc15MCbKhTsO
	MZTNAFqxpO4JA7BSJiq4agmIMhRir9M7KWdGrTnRt+W64Ah3ipCE9CdgtbJvUbosb7ola4
	PwI3BUezAC7j6UeOmQ+i3UZfZeeMAX5XgHMmCi91PPJCy2ScevaKm3LEVAnMib3fx2Q3gk
	5lOCW3xUQGZcNEtECJry3nyLRmVwZ4Qigs3txjCPfdT8J+ihDGAvACQY9IEuW0MJuYV+Gj
	+l9TuvurOnP4pi4shJ4ujCgTxFbvmOOrjVN0g0sjTtO++Uo/M1BX+Wclwq/vgg==
Message-ID: <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
Date: Tue, 25 Mar 2025 14:50:32 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250325084349.344a0f11@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/25/25 8:43 AM, Boris Brezillon wrote:
> On Tue, 25 Mar 2025 00:37:59 +0100
> Marek Vasut <marex@denx.de> wrote:
> 
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
>> Is it correct to assume , that if I remove all reset_control_assert()
>> calls (and keep only the _deassert() calls), the slow resume problem
>> should go away too ?
> 
> Yeah, dropping the _assert()s should do the trick.
Hmmm, no, that does not help. I was hoping maybe NXP can chime in and 
suggest something too ?
