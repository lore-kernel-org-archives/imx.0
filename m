Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A5A147C60
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713367840; cv=none; b=o0YJGExT3uq1H6TZ8lhEU6ei1/Rk1L2dq5uzFUxt9YdDQjqjH4oQ7qPtuPDRmOsSZeLw5I6E4Oc70HhCsoTYmn2TzeAo+F+7TMeaaGuYVVBMJDnQlqkkz2ipz6qSTNyDlwEG5Ojc+7mKmEbZo7pmKwYoSKFhGHW7NchvA3LwM9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713367840; c=relaxed/simple;
	bh=8L9FWH/LHbEyj85WryAl1y2Vb4mXu+cGmOWVxsOrNHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ltjETwn7paIRInHJPUdIZVZR9/hx8LcwYXbnZEJYYI/3644uHDIXjCekKvcDRtUHLXdqFvhh/OhSxGPnIl1uT61B99P6R+W/bfVsDxOU8UotZGuojlR4pfSlhrYVHzN09llW7bL4T0KlFyD+HklIPCgF3KUiJWxgGyZoo9VPQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=z4k6Q+0y; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="z4k6Q+0y"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 138CD8841D;
	Wed, 17 Apr 2024 17:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1713367830;
	bh=1KtpGSfLviXFz3BNKiwi3I/lwFR3Jar+xTmmX6ZHb3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z4k6Q+0yfGx/89jLtjQJ0Kedqp1V3qyJ8JPo8sjpHVXt40Sq+EYKXWEkoZXvS95B+
	 50C/96VROErYpWOgXyt9Lx4zrnDlAmiChVPwWCSvbvjZP3Dl0qxhYwG6PVxGXXf8Lw
	 2JMBXRGLDfSaH4zMM7o04EqwPZOOIbCCrKIzMw8R6nZ1ZNtz2/Em3lytVgZZpw8spp
	 sjYLRQyOG2gLKCc+IcrKoThUoTR1U/vRWraDKCPDt3D/oShmJ8+F9oWv8PeGm+kKNQ
	 nrEaPK3bnf7XFLDtEWeipa9npHo1d+wgvU8Chp1DI2295XPxQg/KCgaRS9BnDjkhaV
	 VOp4+8J5wtSkQ==
Message-ID: <b9147e01-4759-44c6-9588-6151ae2ff113@denx.de>
Date: Wed, 17 Apr 2024 13:06:31 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Elder <paul.elder@ideasonboard.com>, imx@lists.linux.dev,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
References: <20240416141914.9375-1-marex@denx.de>
 <352388ee-a267-4c1f-b968-e1a7709d46ea@pengutronix.de>
 <6872097d-b1c8-40c0-8392-28c351dad3dc@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6872097d-b1c8-40c0-8392-28c351dad3dc@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 4/17/24 12:17 PM, Ahmad Fatoum wrote:
> On 17.04.24 12:14, Ahmad Fatoum wrote:
>> On 16.04.24 16:19, Marek Vasut wrote:
>>> Configure both CSI2 assigned-clock-rates the same way.
>>> There does not seem to be any reason for keeping the
>>> two CSI2 pixel clock set to different frequencies.
>>>
>>> This also reduces first CSI2 clock from overdrive mode
>>> frequency which is 500 MHz down below the regular mode
>>> frequency of 400 MHz.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>
>> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> I see now that the node has a clock-frequency = <500000000>; still.
> This should be lowered too, shouldn't it?

Oh, right, good catch.
