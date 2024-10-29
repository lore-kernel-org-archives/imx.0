Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5C1DE3C6
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730197579; cv=none; b=uermcScYDMYUROERAVwP2wHqCBR7ICvX7g+aMQcWDWDh78qkmgeczshXaBc0BEi8jWwGUGJA6A7lvGVqsSLLEYryQ/n4ND9XoKKfiPk+zOBeET8YaHdaz8aRj05XtnmVwwyEcRrtW8XShIlmMiKlDg4nxy6Mli+0gCB1fqGQn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730197579; c=relaxed/simple;
	bh=AZI30ymhUe6g/plTTE976jSmoGpBKSqYBb9ZbFskwpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prZSHFCt4FenXNPgWeqx/cv5gxm9c9rDB4FwRB03ngKKIf7VxdLDLeIMDdojQSw72abY0Yd2q/CpxRG73LEgIONGGT6mR691RhrzDuRQIWRHv5ipoAVUBEQ/AH7FVgQxj4+XeulZD5ugF62J1DQWgsTouFcng0pMSdk/dt+G8ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=io3QHHgf; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="io3QHHgf"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a097aa3daso4600625e87.1
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730197575; x=1730802375; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjBBOufzswfPzjN88tjgJvguTz0vPy0qYODLjS59384=;
        b=io3QHHgfOEWfAyKKFmYuDyWWCeeIH+0vAhkv0dTX6DjwQm1P6tfCLtMI196JfLYNgK
         X6ERcIMo5pRKgIYGHwM9K94+GfLE6OT21ijIM4u8VLkhDEx9zA0gSogy2FINR01u9G+u
         xd2b044s4vhRH80dZUL0kyQywEfjxOQBoOrucsOtW4HQ92BGMYXLriRJTi6AMm6vSGNR
         BwsjZCOxn4+07wOSikWcr9N0LyjNVOIsDfq9Pg3XbZDcVakcGtbQYhVuVYEnBrL9cbTn
         4lVBfjuddok1qMSA9xNndVpOu287dr88aLNKAX6dNkodISrZOT335UYfcjAJ6AzUNlf1
         byqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197575; x=1730802375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjBBOufzswfPzjN88tjgJvguTz0vPy0qYODLjS59384=;
        b=b7AJUs6pqDH0ng6CErN8TG9QuV3xpnAeN1d3RTLHqofRxVRskbEmwQHdN40npuUYub
         o8jCEWt+PB4E1LqkfuTzxyTgCTYKRE6gln80sbiRwGC0hQIBnoJQb2/9/bWJt14gZeSh
         EVQXfM1awYEjaGzvWaESuIL4QTRgGxOvgcE2ONG+dFmPAOXsz3Rab8PwmIiwvbHkmRgJ
         UWWjUhmazDPZvw2Us99uiq2bQjfVteLUlazvdvsKHFyDQDOBLgsqvWaYZ1En7pdSOG+Y
         RpxPu5uETOrWT3hurqNE58AznhWzoAESJOwbq+ZH3K2EoTVgDEIekkzMJKZmUDXj+NIo
         W6cA==
X-Forwarded-Encrypted: i=1; AJvYcCWC6QVKlgxf10ykaHfFIzVd08GObgireC6qycDTL5kALRjO517vKHJkY4Xk7e6JOexF5bU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd3teXrlsbKz3/jVUhOTpQAjHx2kBGpvRvdxj8bleuVNjQ4faX
	5uKMk1tmmwd1nPRBAyy+apXT+yYX+eUKu9IPouSR2JmUNBqCTmhr/1zg4mDw
X-Google-Smtp-Source: AGHT+IFSaVE8Bb2ztypg1vV5TPaMkpmoxaGxHP7ZN6Sh+HLWct1YR8ykARX3BL3Ag/JAqyp24gXrDw==
X-Received: by 2002:ac2:4bc5:0:b0:539:8bde:eb90 with SMTP id 2adb3069b0e04-53b348deb87mr5516093e87.32.1730197575158;
        Tue, 29 Oct 2024 03:26:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a670sm1323272e87.20.2024.10.29.03.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 03:26:13 -0700 (PDT)
Message-ID: <6dcd724a-a55c-4cba-a45b-21e76b1973b0@gmail.com>
Date: Tue, 29 Oct 2024 12:26:10 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: imx: Add devicetree for Kobo Clara 2E
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev,
 sre@kernel.org
References: <20241024142206.411336-1-andreas@kemnade.info>
 <20241024142206.411336-3-andreas@kemnade.info>
 <f2bb661d-8ef5-43d4-aece-c7fec01ff9fe@gmail.com>
 <20241029094402.382594c5@akair>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20241029094402.382594c5@akair>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2024 10:44, Andreas Kemnade wrote:
> Am Tue, 29 Oct 2024 09:53:33 +0200
> schrieb Matti Vaittinen <mazziesaccount@gmail.com>:
> 
>> On 24/10/2024 17:22, Andreas Kemnade wrote:
>>> Adds a devicetree for the Kobo Clara 2E Ebook reader. It is based
>>> on boards marked with "37NB-E60K2M+4A2" or "37NB-E60K2M+4B0". It is
>>> equipped with an i.MX6SLL SoC.
>>>
>>> Expected to work:
>>>     - Buttons
>>>     - Wifi
>>>     - Bluetooth
>>>       (if Wifi is initialized first, driver does not handle
>>> regulators yet)
>>>     - LED
>>>     - uSD
>>>     - USB
>>>     - RTC
>>>     - Touchscreen
>>>
>>> Add human-readable comments for devices without mainlined driver and
>>> binding. Such comments can e.g. be help to find testers if someone
>>> starts to work on the missing drivers.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>
>> ...
>>
>>> +
>>> +	pmic@4b {
>>> +		compatible = "rohm,bd71879", "rohm,bd71828";
>>> +		reg = <0x4b>;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&pinctrl_bd71828>;
>>> +
>>> +		interrupt-parent = <&gpio4>;
>>> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
>>> +		system-power-controller;
>>> +
>>> +		clocks = <&clks 0>;
>>> +		#clock-cells = <0>;
>>> +		clock-output-names = "bd71828-32k-out";
>>> +
>>> +		gpio-controller;
>>> +		#gpio-cells = <2>;
>>> +		gpio-reserved-ranges = <0 1>, <2 1>;
>>> +
>>> +		rohm,charger-sense-resistor-ohms = <30000000>;
>>
>> Well, now that I got this out - I suppose this could be
>> rohm,charger-sense-resistor-milli-ohms = <30>;
>> or
>> rohm,charger-sense-resistor-micro-ohms = <30000>;
>>
>> I further guess there is no upstreamn binding doc for this property.
> 
> The binding doc is upstream. So an impressive amount of maintainers
> had a look at it...

Oh. So I have upstreamed it at some point... I suppose there is no users 
though.

> Well, everyone seem to entrust Rohm Semiconductors to do magic...
> wonderful reputation.

:)

> So how to proceed? As this property is not required, I can simply
> remove it and add a comment.

I would like to suggest adding:
rohm,charger-sense-resistor-milli-ohms = <30>;

and a binding with minimum 1 and maximum 50. Those should be sane enough 
limits. At the same time the 'rohm,charger-sense-resistor-ohms' could 
probably be deprecated.

This, however, is an extra mile for you. So, if you don't feel like 
doing it, then dropping the entry is Ok as well.

> 
>> I think there is also no upstream charger driver for the
>> BD71828/BD71879 - only an early RFC and some downstream mess - but
>> stil it'd be nice to have the property in place as the size of the
>> sense resistor is needed when converting coulomb counter register
>> values to current.
>>
> What are you upstreaming plans here? For all:
> I rebased the charger stuff to v6.11 on
> https://github.com/akemnade/linux branch kobo/power-6.11

Excellent question.

The reason why this driver is not upstream is that (as far as I know) 
the PMIC variants supported by the driver have always been tailored for 
a specific customer's needs. I don't think these PMICs have been sold 
for anyone else besides the specific customers. Hence, there has been 
little benefit for creating an upstream driver.

For the charger there has been additional complexity because the 
bd71827-charger driver implements also an in-kernel battery fuel gauge 
which computes the SOC values and sends them to the user-space. Like you 
know, this is very battery specific and requires correct battery 
parameters to be given.

I think your work changes things a bit. Seems we will be having an 
upstream board (kobo) using the PMIC drivers - and it might also use 
some information from the charger block. I know you also implemented 
some control logic to get the charging working with limited power-supplies.

(I think the BD71815 is also used in some projects which wanted to have 
upstream drivers - but I haven't seen upstream dts using it).

Furthermore, we still seem to be having new variants - I am right now 
writing drivers for another customer specific PMIC using somewhat 
similar charging logic. Having upstream driver would help in work like 
that. (By the way, I took your rebased kobo patches and continued my 
work on top of those - so thanks for the rebasing!)

So - in my opinion, upstreaming would be beneficial and I will push for 
this direction - but it will be slow process.

Also, I think that maybe the downstream driver shouldn't be upstreamed 
as such. I am not 100% convinced the SOC should be computed in-kernel. 
It'd might be easier to implement the SOC computation in a user-space 
library which just gets the details from the kernel. On the other hand, 
I think the driver should support a few currently unsupported features 
like setting the currents for different charge phases based on 
device-tree properties.

Giving I am the only guy at ROHM working on these Linux drivers (and not 
only these drivers), and knowing I don't have a system which is equipped 
with a real battery - I wouldn't hold my breath waiting :(

Yours,
	-- Matti

> Regards,
> Andreas

