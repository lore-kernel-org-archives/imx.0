Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C81F0995
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767241; cv=none; b=bK12dZ9vllVVUwZ9h/pTHaC2jYTmnUEvZrJ8t1/jJP7FUtOyXFQS4sjZbf+h5yXJ5hhC0vr/uBG7QIRD6Mb/x6+nZ9ZjBJMTU6fmQ1BeFI3B18fjT3O9skKXO+PF1wNh5j0yb5czKsZcDd76ldZsnjMhV8+lgS8CZBVpNhQCc5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767241; c=relaxed/simple;
	bh=P/bnKFj7gU1uIWYssQDkl4UMWeMynN2o1C3CqQYwepA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQ3H1VLFEhR9hIX+1ntkUVI4lXMIKE4nEDRG/BKZUED9ZNY2gh2BcMEIHHkUnfoqMKOfRH7VSsWoVqcPBhDGsAdz8SANP9sBZYx0jHRpF5YfbHhyzFVSq+rqxbxPNpkvv986ehDz38nrhLmTGvbKA6GW3MDOOQQzrBqYuGma/SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=hHUH7KlE; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="hHUH7KlE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EEB7102901D3;
	Fri, 28 Feb 2025 19:27:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAVrXe2GtKGRikrFQXrI3C0RLbOB/qh3ogtlygvqV5k=;
	b=hHUH7KlExzQk0RFqF9nLQOKxLHnZyylEJBy/0NtE5H2cuq4sBIEFE58S7fHoDYv4gD6zoT
	vcRiv237pxECFs0d98+OLi3wSCCb0COeC83JbjlUQuk4Siq9d0DmORSUkViqCNXBO+mz+b
	24atUBXttB8DKWO8W/znbv0uvrmNLHCfBSBv67Td87Vyi+DBBms690Q/sjiunVFRs/6zyA
	/uJ0iXkQVtM3LhPWq8hLERPFUQm9z1mJ/52BZYAhYvj+WNVpC6KItcrjCW2Ez2g8DuEVat
	qnTuTX2UPguLkzLjPW5f81j0HX5rcWOtqfMBVF2cJiOR/5yQB7uJA8pCW+XqYA==
Message-ID: <1a644a7b-c4b5-483a-9a05-fe326a6ce2b5@denx.de>
Date: Fri, 28 Feb 2025 18:20:45 +0100
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
 <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
 <20250228103358.tbcqyrtzzsgacxbm@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250228103358.tbcqyrtzzsgacxbm@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/28/25 11:33 AM, Marco Felsch wrote:
> On 25-02-27, Marek Vasut wrote:
>> On 2/27/25 9:17 PM, Marco Felsch wrote:
>>
>> [...]
>>
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>>>> index 06fe46e320738..2504a456d45c4 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>>> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>>>>    ATTRIBUTE_GROUPS(panthor);
>>>>    static const struct of_device_id dt_match[] = {
>>>> +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
>>> 			  ^
>>> 			 nxp?
>>>
>>> Can we switch to nxp instead?
>> We can ... is that the current recommendation ?
>>
>> Why not stick with fsl , is that deprecated now ?
> 
> Nope I don't think so but I do see patches adding 'nxp' as vendor
> (mostly external chips) and some with 'fsl' (mostly soc internal ip
> cores).
> 
> My hope was that at some point we could switch to 'nxp' only and make
> use of this vendor-prefix. Of course NXP should start with that switch
> but this seems not to happen :/
> 
> It's more a nit but maybe this triggers NXP to make use of the 'nxp'
> vendor-prefix as well once they upstream a new base dtsi.
OK, fixed.
