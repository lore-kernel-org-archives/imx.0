Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EDD18C933
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760478074; cv=none; b=FK+zwVnZm0amF/FkVcDZh4Nu7Y21g62O5tFZuQrO0Jr5iYocMjzL1jPNi8AjeSEgHwnBTmgI8Djy1KjUcM2wnP+eODVEI9DDVyfyW24s24k4D5qKCyv5/Fcx5MX49x18sEdg/PYwijgZ5X+L4HNNJtys1Wk9RHHWXhqu3KtXwbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760478074; c=relaxed/simple;
	bh=ytgv92hePW2tpEJc0veYD1rUKYJy+P7TDMd7EkgdzpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P74vvGHdj5bp24z4xu2srVhwNknK4GEMFgSp0lDeYJp6lj+g1Eo7Ok3x2msQSx5BPmMyotLbsueFYyVHxDMe9O5POycDfZzh7bsyy7cHiC2Kf3ASgCjYPzAr085fq936EuXhhpaYNb7Tv3blZe0AJxoJ354q2uT35vfIOyMwtxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oDxqF2ez; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oDxqF2ez"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmSMR2cX5z9sGX;
	Tue, 14 Oct 2025 23:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760478067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U61MB9VOfRt1hj0ITPF6ydM4MPZpZPPkRsvW+GJ1Gcg=;
	b=oDxqF2ezQEDRXUOLaKjBEiBY8hSFA2g6J3hJShxaP3bw1zSVuZukyAkiDTqMQNbyaof9tc
	66nmb4HF8qfjX7hwR8YWD19gvLkILD0j0wucY422JjJlAAl1Lbv/69h2DGu1BgUgpyLx7q
	PyC4BhIck6SfmBIQmsxsRZI4WTpCygNSMfqNG68UgIulJe9KPppp7Jz98xjH42YUo9n6tY
	T3NDrobVMzqEqsw0anHBYBMvbO71aRaNRUFBJvoeMzsIdJDE9giUm78si/zLZHG8TgwDbQ
	hMc7Jxfy4/nRhj+33zqHnZv6Ua1KN4/1OebsKhnFkxgyf4myy/AVQ6QyPSMv1A==
Message-ID: <da68db17-d1de-40eb-8598-b4957f4ba5c0@mailbox.org>
Date: Tue, 14 Oct 2025 23:41:03 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 21/39] drm/imx: dc: crtc: Do not check disabled CRTCs
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-22-marek.vasut@mailbox.org>
 <aO1J8QX5hJ/+CZut@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1J8QX5hJ/+CZut@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e8265c260b39673e666
X-MBO-RS-META: j7xyy7b5irpu47k37jk9r5thhebyfj8q

On 10/13/25 8:50 PM, Frank Li wrote:
> On Sat, Oct 11, 2025 at 06:51:36PM +0200, Marek Vasut wrote:
>> If the CRTC is disabled, do not check it, as the check will fail.
>> Skip over the disabled CRTC.
> 
> sorry, I have not understand what means.

It means that on inactive CRTC, the atomic check below will fail because 
there is no valid mode, and the check itself makes no sense.

>> @@ -156,6 +156,10 @@ dc_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>   	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>   	enum drm_mode_status status;
>>
>> +	/* If we are not active we don't care */
>> +	if (!new_crtc_state->active)
>> +		return 0;
>> +
>>   	status = dc_crtc_check_clock(dc_crtc, adj->clock);
>>   	if (status != MODE_OK)
>>   		return -EINVAL;

