Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC45B3CA484
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 23:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774393919; cv=none; b=aYK3gCrirI9MQVMDwgVIwyY+AX/vcBpzi20hRHKlZpdITPTRlNjWJJprkXdiVqwv/+XCQZppgPPbojLm4CrNY+go9QnT+ghsHPOp4S6/nTjO8BQE+h6cf+Yd5ieLFaOXdTxh8cznnGEyaFBl8IAZ2chamBAnRR+H6i7RIvg3Zds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774393919; c=relaxed/simple;
	bh=UsdJ+Q4kBS1MbW0xQpYTJ+JAo9wLCnAzmaVXx1tB79Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glIiono52ew1h66BwAX5SuoGq4aG/bIIl1oza4mXnBkfwHnwUcIEzmmqAHM0+LJR0XHAZzSL6n9w0Fg2ON1WKBbVQqEfe/I1nzvQ+Wd2Pe7ADm4eGbtlaWrwFO7sOZa1rtAhXQ+DZ/Q4WLAABFNZXjUn2+jX8FLRR+tWad8Sxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=dMPkaKvp; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="dMPkaKvp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15605112263;
	Wed, 25 Mar 2026 00:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774393908;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6hkqmn5/Lm/RJ1zH+MMrxFpBSNBqxslxfAIu548ZS6o=;
	b=dMPkaKvpgdhIyAKyu5nYxwRdnlq3N08T9loLdL6JOo/n7tqhieKPGvR74HmmvbEvTH1Px3
	UrO2Xca6vycanpXrFwcbi1VDsFi1IOxCDf/BljTZHNJCUuk6uw73z0ttCZiALwznufbr/5
	U4VIaOt5Yu9v6o5XI9Eh4ZWdyrPFD/gTQMxxa8vgvRRgmy407PInjQ7GEEQ33x5BnQIVl4
	6IuDYHrF+gKQ761WAFV0CnyGbuL72ws6xInX/fo/y6BKEQI7KAuA0U8fOFDqELKJEhpezz
	vjhsYM1ldlLjk0p9PThqSCfkFZDSExQVAefZDiWfJTKyPV5a95ydouYXUeKQww==
Message-ID: <e580bc1d-96ce-43c5-880f-bb8ee31fda28@nabladev.com>
Date: Tue, 24 Mar 2026 22:43:25 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20260312232500.197096-1-marex@nabladev.com>
 <acK1YU6M5FGK3qM2@lizhi-Precision-Tower-5810>
 <e5d7ca6a-fdd3-4aca-aa1f-1d35bc9c0119@nabladev.com>
 <acLtV4Vwpbj9vpE3@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <acLtV4Vwpbj9vpE3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/24/26 9:00 PM, Frank Li wrote:
> On Tue, Mar 24, 2026 at 06:39:10PM +0100, Marek Vasut wrote:
>> On 3/24/26 5:01 PM, Frank Li wrote:
>>> On Fri, Mar 13, 2026 at 12:24:04AM +0100, Marek Vasut wrote:
>>> ...
>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
>>>> new file mode 100644
>>>> index 0000000000000..534737363c9f0
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
>>>> @@ -0,0 +1,42 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +/*
>>>> + * Copyright (C) 2022 Marek Vasut
>>>
>>> 2026?
>>
>> That was the original copyright year when this was implemented, but I can
>> update it to 2022-2026 ?
> 
> Okay, you upstream this year.

Right, V2 does extend the copyrights until this year.

>>>> + */
>>>> +
>>>> +&display_bl {
>>>> +	pwms = <&pwm1 0 5000000 0>;
>>>> +};
>>>> +
>>>> +&DH_OVERLAY_PANEL_I2C_BUS {
>>>
>>> why upcase for label, generally it should be lower case
>>
>> Because this label is really a macro , please read on.
>>
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>>> +
>>>> +	touchscreen@41 {
>>>> +		compatible = "ilitek,ili251x";
>>>> +		pinctrl-0 = <DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL>;
>>>> +		pinctrl-names = "default";
>>>> +		reg = <0x41>;
>>>
>>> reg should second property,  please dt-format for new dts files.
>>> check others
>> What is "dt-format" ? Linux kernel source tree, even current next, does not
>> mention such a tool . I did run schema check and checkpatch on these
>> patches. obv.
> 
> I send out at many place, https://github.com/lznuaa/dt-format
> I write small tools to detect and fix node and property order problem,
> it may be buggy.
> 
> These node order problem is easy to detected and fix by tools to save
> review cycle and focus on the important stuff.
Maybe "make dtbs_check" target could include this tool , to make people 
aware of it ?
