Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34161F1519
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 23:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742859750; cv=none; b=u21mDZEdJZKebrs1MioJz3CL8oCspFF4Se4R7iU+Bbn4Q6OoFL4RIaWlFzC+0ru1OVnDREHdsOgiFs1S/o2lgBqv57caRBSjEGPc1QwooN4Y+axvTdSOBtpfL0MFd2ujz3ry6xiPa0+OWxgT9q3mcbysntVlII8xn0GEzJJNoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742859750; c=relaxed/simple;
	bh=gHqNINmUE6Sh+aEqT7SFhVmRGu+NDrLTfw0qqUc99wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4+SlExTqWRTnSsLpqlYq+UJmS+9uop6fFY7Ktzz1eA0hyCY1ku274PTg2Z00tCQWojK0Dgl2DBrnpfP6Sn80MhtzF9sJ4VUAJDXAntp5H4EcLLuPa4bm6tdAalyBs4T1kyUkKCJ2/yP3y0amjZoQCOebs5sfTMO3O/lC2ETcbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=MKi1+MqQ; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MKi1+MqQ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDF9A102901EC;
	Tue, 25 Mar 2025 00:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742859746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lXtYPxkN0FShPNZtCQz09+v2tB5oa8aca5wSl7XB7nE=;
	b=MKi1+MqQFGvKBQMv6rvYCVscT5Ea/EVGZFWhhy+Cp9DphxbDIhFMtF7OfAAL85Xn6l9Hd5
	dilTPqOCoXPD5niqb4Xj31uho+3FA4d6gjuW/SuuWav4VAKd6q8QamMGkcX3yABgY47zaB
	QDnI1j+Iy2HB4WN9Ke3v1KhvkSLsooFC/7v9YGFkCFjQafKqc7v14bw9oMSudt0+Aru4QB
	A/PmqqM29sMX7HKnjS8SQjWeVprVD7+Plhdt59GKzSBKsYD7CqEfn9ucuqKHJAGTkFuYzs
	9CqjfTrzI3iQz6tlko+FREK/DGAD3QWMTiCk2AyzrUNg3QOiShLw8XAkNwPO6A==
Message-ID: <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
Date: Tue, 25 Mar 2025 00:37:59 +0100
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
Is it correct to assume , that if I remove all reset_control_assert() 
calls (and keep only the _deassert() calls), the slow resume problem 
should go away too ?
