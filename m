Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6121F22FAD3
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 20:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587348; cv=none; b=W+wbeACROZQjPXF2g3kaNrUor4gaZ+E/5Hc1fMIMaSkL41G+OhthSBdmX3ugjBrCfrUzakVBb7atRGtpIJAohaE9oKmeh0U1XAoIQb21/b7cF25kHvSjK3756dpKUwuReMKASGPqd3NSaaNQm7vw0hLcDSVkkMr1CqEF3nT0nps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587348; c=relaxed/simple;
	bh=xC5LZYUCbr73IMc8LcHgCXF4sZ1DcNwEfB4KFqgjCJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAcgl9KGwidtc2yMW2xuCSmZRDwIAyFZDxucxfNR80zdusNq+UOqikjELiHUSHbcqq5q+bd110bYFAD67VUKD+kJFXrLUmM03A4qzTnB90QE4WA1sS6dgmMuqUe7Y4a1RZf2j3tjv0D709DTz63m9P0iD7NKGMnODVQ91jC0IPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=UAPj7u9D; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="UAPj7u9D"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 635FF101E8FE9;
	Fri, 21 Mar 2025 21:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=drWgqDtEwtRQ/AqNec+865/QoSBEzToGMlvzXdRpbRc=;
	b=UAPj7u9D99BzWdmrqugwwfMF1kOr649TjzIBIrq4luHu3EKIxBSYIlVak1XBT5eZi8IlIx
	WH8Lb6E04i0EDXTUyFMYBabrxds3rJoJtAgSWLBRbbFg1/qhgZztdq2LGVCXJBvbyq+wc3
	KCVQSBu2VkznmY8lFrQcOqkpiG86I7rhBwo/QO2z86gNO5Q+jqWpP+GH2Zkr1wAGUnmEu3
	S9rvJQSGNl/aRqgtlG67xsnIuhxEIt5cFLHpccdkvSHaWRMeymOyJtuNiE0rhWoJytV8Jo
	4GAR5ZO7/E7pOVsavK64sbJ4OFsnVYm/NtqDV/yWRBm3yMYvCUFpfBCvDKZ+QQ==
Message-ID: <12a0c285-8f1a-4014-9253-0129a3a6ba21@denx.de>
Date: Fri, 21 Mar 2025 21:00:43 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 <Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
 <fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
 <Z8Wb05rmGW0ORnJB@e110455-lin.cambridge.arm.com>
 <20250303133523.2c5153ed@collabora.com>
 <20250303134250.5ba726fc@collabora.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250303134250.5ba726fc@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/3/25 1:42 PM, Boris Brezillon wrote:

Hi,

>>> This looks like it has been part of a R50 release of the DDK, which is recent
>>> enough to consider it up-to-date. The issues you're seeing with fast resume are
>>> probably due to some integration issues or other quirks.
>>>
>>> Boris has the most recent experience with playing with fast resume, maybe
>>> he can share some tips on where to add messages in Panthor to try to debug
>>> your problem.
>>
>> If you end up with fast_reset=true, that means the FW claims it entered
>> a suspend state from which is can resume quickly (fast-reset), and in
>> that case, we're only supposed to power on the L2 block at resume time
>> AFAIK.
> 
> Can you try deasserting the reset lines at probe time and keeping them
> deasserted until the device is removed instead of re-asserting at
> suspend time? If that doesn't work, try doing the same with power
> domains.
I'm afraid either of this makes no difference, no.

I'll at least send a V2 now, so others can use the latest state of my work.
