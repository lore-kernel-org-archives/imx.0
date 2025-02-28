Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A751925BF
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 18:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767233; cv=none; b=HDLNDIlBtUAapGtc2e02Z5vUpQ9qi2vVHXkB42/sBpHyXOF0J2tmjZGNrbWrsc0SKdSV69Tk8qIvju1YvgpWbUWO9UgtkIpsa793vvPtba3RTezOwlXtyItsZkQ5HnHmXCPW+3la8J+ijPYFcr+z05P/RnONMvtmTSWJKZVb+ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767233; c=relaxed/simple;
	bh=mGU1vbpxxb5kcxznq+oaJCINMrDt8quxMBP9ql5bcYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apFTfxXRJ+wjlBwtrQzCe2wSlgnuAm5bsyYPNBRB8SS4hokIvubqJ7MhOtL9bMr/QsD9TRMWzzngHwIFZxZK+/1lUPZ8w59CFmvZhqfNnhekSL7aH3+3RV9cTgrdQXZBzsM7S1sQubZ9Dj7+4M8c64oARjp1xlvoihNXol3Y2Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=eyjUPMFJ; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="eyjUPMFJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7701102901CC;
	Fri, 28 Feb 2025 19:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9CdXt1sb9hF/qYyFIBouuUvILgc0/orYH3chQLK7vwg=;
	b=eyjUPMFJu4kjE7nYaUGe20Yi4pGLvofEGSGrl2a4zZ+qOpdwtlKK7OYWtHit0AQxK/HRqW
	ozBA5MxABrvrPpKBXm+/w+s0q/UK8o04Dw/AobKVUe02mD+QsLplvF1ZCLHpXNyaUaquyL
	SYIKM06o/qT+Y7e7dTZJjFYQjAmHKQA8ZisFc/LIlxKQrPqkZgMK+KAk6dFghkNmVTWZEa
	gwxChUGoL5Muj2rnO0cPohjYWeEc4l+vy6MwqnnRJb87FOTb+naAW52MZYqjv5ea99IkMG
	ir3tVFvuzA0EDKKuK/zM0G0Vjayrocw/hNCOGyGKJOSMm26UTbeZCCVQNuLLqw==
Message-ID: <39351f48-04be-4659-8b3b-9a4ef6030efd@denx.de>
Date: Fri, 28 Feb 2025 18:00:57 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/panthor: Implement support for multiple power
 domains
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
 <20250227170012.124768-6-marex@denx.de> <2848587.BEx9A2HvPv@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2848587.BEx9A2HvPv@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/28/25 11:10 AM, Alexander Stein wrote:

Hi,

>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 51ee9cae94504..4348b7e917b64 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -75,6 +75,58 @@ static int panthor_reset_init(struct panthor_device *ptdev)
>>   	return 0;
>>   }
>>   
>> +/* Generic power domain handling code, see drivers/gpu/drm/tiny/simpledrm.c */
>> +static void panthor_detach_genpd(void *res)
>> +{
>> +	struct panthor_device *ptdev = res;
>> +	int i;
>> +
>> +	if (ptdev->pwr_dom_count <= 1)
>> +		return;
>> +
>> +	for (i = ptdev->pwr_dom_count - 1; i >= 0; i--)
>> +		dev_pm_domain_detach(ptdev->pwr_dom_devs[i], true);
>> +}
>> +
>> +static int panthor_genpd_init(struct panthor_device *ptdev)
>> +{
>> +	struct device *dev = ptdev->base.dev;
>> +	int i, ret;
>> +
>> +	ptdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
>> +							  "#power-domain-cells");
>> +	/*
>> +	 * Single power-domain devices are handled by driver core nothing to do
>> +	 * here. The same for device nodes without "power-domains" property.
>> +	 */
>> +	if (ptdev->pwr_dom_count <= 1)
>> +		return 0;
>> +
>> +	if (ptdev->pwr_dom_count > ARRAY_SIZE(ptdev->pwr_dom_devs)) {
>> +		drm_warn(&ptdev->base, "Too many power domains (%d) for this device\n",
>> +			 ptdev->pwr_dom_count);
>> +		return -EINVAL;
>> +	}
>> +
>> +	for (i = 0; i < ptdev->pwr_dom_count; i++) {
>> +		ptdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
>> +		if (!IS_ERR(ptdev->pwr_dom_devs[i]))
>> +			continue;
>> +
>> +		ret = PTR_ERR(ptdev->pwr_dom_devs[i]);
>> +		if (ret != -EPROBE_DEFER) {
>> +			drm_warn(&ptdev->base, "pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
>> +			continue;
> 
> Is it a good idea to continue if a power-domain is missing? Any access might
> stuck completely. IMHO returning an error is more sensible.
> Also some dev_err_probe() should be added here.
Fixed both, thanks .
