Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3ED32AAA6
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 23:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764803294; cv=none; b=fiirxfHCtqIK2dMDYs2v3hE/pmevM20ke4zdUefVdlVMj+91n5OVPQyUkiFTsNnKO1zeDej4fdkatfbjfxxIhkjUhdNT1NySNPtdzLZIys2tPQFW+vCuHeUYH4Uwh9R87ezW8yjyblCZ0E9IFJrtiExiVXnfG8RimOpmQ6RCD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764803294; c=relaxed/simple;
	bh=upF/Hn3L02KtXJu/17/TGb4erZuExcZG+5oV4fNwX+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NftHsCVttCGW9BHPF7BhmEYakrLCoB1L8cCsGIGG4uZUqB8294Gm9XmAmxGjTj+IzAk82xF98esw/tao02Bq+5ZxqJBZCjd8uWMVxzC69mIEZVKbimgd3Dtqi9HJjs9VHcMCNIfROzHPUa0IC1lnDJTb8uooiUDHS6dm8kWTP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nbEGxyCO; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nbEGxyCO"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dMCwl2v9zz9t76;
	Thu,  4 Dec 2025 00:08:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764803287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhbIniuuQ8q9UC/1DMXWkUeaOYHzbOf3+bWM0K6h1U4=;
	b=nbEGxyCOb3HmOL4l2MsuEepS/Id3XB4doMq1lwF8cU+xf/nFSP0C4LYRzqxfLS+RPoBSos
	qsMuX8TjJULqq0KutPxWtRu40WNQZG3vVvYhMPJ9gD6/iLKTeHLsFqtTgkpQXiqIPKvGd/
	+11VZzVGyOBysEHOgqoyFFS9IHyzrN6vNqc2YRsTflkqP9KfhMkm8H8DHF/JOXkSeAANs1
	aS4g2PX3myIUdEwic9pECgnOTrxmMtBhVmT7WY7rO2XkJpL0wDldYKG2UtO0QtVj3hXPUd
	yvC8qbd/+v6JLOe85ePJiVxylyWWTfjiVC+hCm3jnGpGsoqD5bAeNjtrbTDN0A==
Message-ID: <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
Date: Wed, 3 Dec 2025 23:48:47 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aTACuRjC_Zpf8IOU@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: x987gmirsy6ignztfudnbw9cyynizgmp
X-MBO-RS-ID: fe6a6a95bcbf618ab1e

On 12/3/25 10:28 AM, Rain Yang wrote:

Hello Rain,

>>> Thanks for integrating this downstream patch.
>>
>> Which downstream patch do you refer to ?
>>
>>> Please note that CLK_GPUAPB and CLK_GPU are
>>> always-on, so the commit message should be amended accordingly.
>>
>> The GPU clock do not seem to be always-on, neither do the GPUAPB . It seems
>> the SM can turn those clock off perfectly well.
>>
>>> Additionally, the IMX95_CLK_GPUAPB handle shall be removed, as there is no valid OPP entry
>>> in the frequency table, this also helps minimize differences between downstream and upstream,
>>> reducing maintenance effort.
>>
>> Downstream kernel forks are not relevant to this discussion, upstream your
>> content and then you won't have to spend maintenance effort on downstream
>> stuff.
> 
> This patch [1] was the reference point.

Sigh ... I was not aware of that one.

Maybe next time, it would be good to upstream these changes directly ?

> For the Linux working environment,
> CLK_GPU and CLK_GPUAPB are always-on, while CLK_GPU_CGC can be gated off.
> 
> Regarding the IMX95_CLK_GPUAPB handle, my suggestion was based on the absence
> of its frequency in any OPP entry within the frequency table. Removing it
> could simplify the OPP handling logic and reduce unnecessary complexity.

If the clock can be disabled by SM, Linux has to make sure they are NOT 
disabled, so they must be described in DT, right ?

> [1] https://github.com/nxp-imx/linux-imx/commit/695f2bdc57b869ca5189313e4b5fa7eb5a12f622


-- 
Best regards,
Marek Vasut
