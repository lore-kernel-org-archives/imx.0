Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA1B1DDA36;
	Tue, 17 Dec 2024 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734425146; cv=none; b=C33yVUc44cqqid3nQR12faEczgWvF9w7Dg1NsSkzLOPRfP49nX8WSKup4N+YG/RWK/97OIdowNgTMWLsbThiLHSjhRWt2PeG8DLGkvDLn/SgoSUo7F4K0YfUh5xDaT1apeKmgpr9Fh4xJ+yh1AGFgUTQQZmQO5gjBuA9+NKVAL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734425146; c=relaxed/simple;
	bh=KSFyqlpSL4hl4TAawVgZAL4kOVQrOj/YC6pGfK0JUzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEuKr/8gUr21+W/q7Qa8ffXDoE2UN0vBImmphoArQ7wc884UrDAljPzcY/aD9hxtlsMgQMevfGYxGilkfRpozNoJ6KQBqc2Yu+j8Ki2t7GBKmJkJGis8OrnRsJ5z63mmzBP8NVfLwe92v+VbWOJft5Nr2d/1we1aVTvJnoQqgwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcBaTp78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcBaTp78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910FEC4CED3;
	Tue, 17 Dec 2024 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734425145;
	bh=KSFyqlpSL4hl4TAawVgZAL4kOVQrOj/YC6pGfK0JUzY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jcBaTp78wZU1N6VFPurcMtC6kQu8P/cL/2O8dEQBmfoaCEOhL2UaQantT0529HgZQ
	 kKpd9mvJyUtEggfwWzH0RObZHShp8WcONqrooTxNPoRibciWXQAaQNPa+5aVJ8Yfrp
	 6Y++HD+GbOxFC5utccpRbwMfgBtGasrHMfUBMn+axmu6BkuDOAWm/C8StDfufuE4OQ
	 Y3HUlXU4Op0BvbNtkGX5po7R6V2Z9S933pOyYkIOBUPMScHt3rnjqG3RWUxYdQHP8C
	 3vPIZkOnEGCsQb4GN4hdNOw+I2Jwiy1x3kekkcqAahqg945Z6v+YrPpPdmA19Kd7kg
	 DNAbyx3cx4jlA==
Message-ID: <9c1b3e0b-84d8-4f1b-ba1b-233824d30c44@kernel.org>
Date: Tue, 17 Dec 2024 09:45:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
To: Jacky Bai <ping.bai@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
References: <20241212093555.1376568-1-ping.bai@nxp.com>
 <20241212093555.1376568-2-ping.bai@nxp.com>
 <z6udhrqfmbelspe3eiz2q6twqvn4nkgxnfsdyxdv7ow6llxiz6@qhbaobn63icb>
 <AS8PR04MB8642C9A1DA27CD0F3F51DF2287042@AS8PR04MB8642.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <AS8PR04MB8642C9A1DA27CD0F3F51DF2287042@AS8PR04MB8642.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/12/2024 09:42, Jacky Bai wrote:
>> Subject: Re: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
>>
>> On Thu, Dec 12, 2024 at 05:35:55PM +0800, Jacky Bai wrote:
>>> The i.MX 943 applications processors integrate up to four Arm Cortex
>>> A55 cores and supports functional safety with built-in 2x Arm Cortex
>>> M33 and M7 cores which can be configured asa safety island. Optimizing
>>> performance and power efficiency for Industrial, IoT and automotive
>>> devices, i.MX 943 processors are built with NXP’s innovative Energy
>>> Flex architecture.
>>>
>>> This patch adds the minimal dtsi support for i.MX943 with peripherals
>>> like uart, edma, i2c, spi, mu, sai etc.
>>>
>>> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>>> ---
>>>  arch/arm64/boot/dts/freescale/imx943-clock.h  |  196 +++
>>> .../arm64/boot/dts/freescale/imx943-pinfunc.h | 1542
>> +++++++++++++++++
>>>  arch/arm64/boot/dts/freescale/imx943-power.h  |   41 +
>>>  arch/arm64/boot/dts/freescale/imx943.dtsi     | 1284
>> ++++++++++++++
>>>  4 files changed, 3063 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-clock.h
>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-pinfunc.h
>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-power.h
>>>  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/freescale/imx943-clock.h
>>> b/arch/arm64/boot/dts/freescale/imx943-clock.h
>>> new file mode 100644
>>> index 000000000000..64b9d5d4051e
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx943-clock.h
>>> @@ -0,0 +1,196 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
>>> +/*
>>> + * Copyright 2024 NXP
>>> + */
>>> +
>>> +#ifndef __CLOCK_IMX943_H
>>> +#define __CLOCK_IMX943_H
>>> +
>>> +#define IMX943_CLK_EXT				0
>>> +#define IMX943_CLK_OSC32K			1
>>> +#define IMX943_CLK_OSC24M			2
>>
>>
>> Why exactly are you adding clock indices to header files? Nothing in commit
>> msg explains that.
> 
> These clock index macro defines will be used in dtsi or dts for clock reference.
> I just follow the way that we have done for i.MX95. Anything need to be improved or refined?
> For commit msg, I will add some explains in v2.

It is fine, just unexpected, so you have entire commit msg to explain this.

Best regards,
Krzysztof
