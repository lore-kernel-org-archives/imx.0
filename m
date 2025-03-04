Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4CF25DD04
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104723; cv=none; b=q3iwb7VFZygi1E5Pf2W+2hYrg8vauahkABACZLVR4yyUvc43Ow0EX8sAZTxMxXNIxfNXOe8kKHjhq4e7ALSCchI0zKStUaLKbIkUzaqHyDgU6ob2D1sl12/hIvuIh3XgGNvc1StkVCVkyGMJj93WtGZ+pmeSMMfKdeQ6X97bs8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104723; c=relaxed/simple;
	bh=Mgqplim4+FgE7Eq9tRQi5Q91N0eNK1oBMLtKZ3qAXZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Et1gfv6Cyjxg6/m8QezGRdOglX8L9NnnC+ecdqTUFiINh4h9W3XgVkpizy1zB4dASlvZvpmvT4I9nUKB/vPR1ORAqpn0Q2Gnf45Xdvyc1yiX1nboLbTlCffYlCZXq2CIp92FmiU0ave6xH5U5hMnKLeopYRHC63jE0FhcUtAjWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWc2knLC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWc2knLC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so3011207f8f.2
        for <imx@lists.linux.dev>; Tue, 04 Mar 2025 08:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741104720; x=1741709520; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKFVl5Wcef8C2g2vOUYpWd1OHCoI6tR79rGAxjSDkuk=;
        b=eWc2knLCnz6BEtqFH/XcmlDxhi3apuOEyV4xjcPBp+8VopUfUTRrTU9TaiwQT9L/On
         RVuFkCIFW/uL78jrNNSbsnNo5+SYM3+yXo1t0TjLrBj8QwEe2eGzKibdx8AMosg7mFMf
         eh1U0rgXlZW/NR8izMX+tRt0ciNkC+tYN+sv4hY7LkrZZoWfLW1zpMcBtank3fst+mlh
         7AqIToYHAX00X83Xqt3PklrItuOMC+BklPKam5Mlq2u5pmjaWX21inDIxHayItcR4Du+
         Ghu1tzNaj0HO5DmZ8bVZvKVEpwYz1Uaj4ePClbJ6v8M0jBWP1B8KG0tK5V9blly3FTyX
         O/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741104720; x=1741709520;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKFVl5Wcef8C2g2vOUYpWd1OHCoI6tR79rGAxjSDkuk=;
        b=NncHlB+eUzWOw2io2sks+ICVLLamC9ZH45lUpt89KhBrvrCyU7GlW+OiSPiyS5oPC0
         kJSTO1BTq9A++mZn2dhb7IbG/7CPFErBX62CTTFjsaLI9Ye/oalqnjSoNc2g051Vaica
         VolPbGWNZgqRzYzwg5s/Q9UXMNt2KTA4tULK63Xh+x2TLM7vKTUyYI6FQUFeZ845mxe8
         gAfKKRd//xAqImCs2TLPuOLoRC1jss6j7VU5VfAy6C7K6jrFslIphxIP60f8ZGJEBN4p
         t3BJrf/8iM1qLn1WA134zVHPnAW1Hgf88KWpmUnDoryfqT1a3VJ8qtbJSP8QeByDaMP9
         8xbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnDgHgkei7paHxL4M4u1MJZZOtFsBvGZgSOg8YCN6nUbGZV/gsIO3pi+ZGPI5aalxY/fw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw68ttx4jBMGgqpCLMcDhy37U8rN/TxHB10ZbaAE2Y/LAtntA8/
	BxBEBDMG3OAMirGgzyHRZmgQKcvVao3TdEYCa8poYY4SS2XikizG
X-Gm-Gg: ASbGncuBlng/Y+GYlrrVNUTAtrAaDf6MzWbNNFFMWHGWouNdLlhZEJ9aBzJMNV9fGvp
	lOvwfqYlBGowMKw36vtmWw3IwuF5h6UhgWgjNB88cHLbTC1/nu6kcRsGWkB6DTpadKoGxD5MvJB
	LeRgt+oD/x9EayzyS8hIzo8efTsVWpmFxs8gVgQrrAQ+WKLDq0ZMHsnT3dS1LIopHaf1TWoJh3y
	EV5ltI2z09wl4mHWOaCiyjbbMIlC0g9Y1dhZfbfxojlCfrjIED0aHJ6VfPgF6LnVs6gm/1YKatE
	IhIpgp/XPB0mBv8lRtCyp2jVRCONJaGqRm/fGdNRHHK1nSwhfrrwJEYwVFGMRetwVocVX/b1GA=
	=
X-Google-Smtp-Source: AGHT+IECucg6TxRY/3+YaDVr6S0Oivym8EfoWcFrWoYt/S7uuLYkulzezOXsbiAvNlHj/uTIVPGYjg==
X-Received: by 2002:a05:6000:1a88:b0:391:139f:61c2 with SMTP id ffacd0b85a97d-391139f6478mr5227327f8f.31.1741104719480;
        Tue, 04 Mar 2025 08:11:59 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e479609asm17853950f8f.2.2025.03.04.08.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:11:59 -0800 (PST)
Message-ID: <bfe3c719-f1c5-4ae5-9a40-45ad75cd5855@gmail.com>
Date: Tue, 4 Mar 2025 18:11:55 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.li@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
 <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
 <cd6a84cd-ff17-45df-becc-9bfc74522f73@gmail.com>
 <20250227-monumental-whale-of-security-b1c84e-mkl@pengutronix.de>
 <Z8CWsI/DKZtDBkzE@lizhi-Precision-Tower-5810>
 <20250228101952.g6tae3ni5xrhjk3y@pengutronix.de>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250228101952.g6tae3ni5xrhjk3y@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/28/2025 12:19 PM, Marco Felsch wrote:
> Hi,
>
> On 25-02-27, Frank Li wrote:
>> On Thu, Feb 27, 2025 at 11:57:54AM +0100, Marc Kleine-Budde wrote:
>>> On 25.02.2025 16:14:34, Mihalcea Laurentiu wrote:
>>>> On 21.02.2025 21:56, Frank Li wrote:
>>>>> On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
>>>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>>>
>>>>>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>>>>>> configurations. Since these configurations need to be applied before
>>>>>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>>>>>> be their parent instead of keeping AIPS5 and adding a child node for
>>>>>> AIPSTZ5. Also, because of the security configurations, the address space
>>>>>> of the bus has to be changed to that of the configuration registers.
>>>>> The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map only
>>>>> config address part in your drivers.
>>>>>
>>>>> Frank
>>>> Any concerns/anything wrong with current approach?
>>>>
>>>>
>>>> I find it a bit awkward to have the whole bus address space
>>>> in the DT given that we're only interested in using the access
>>>> controller register space.
>>>>
>>>>
>>>> I'm fine with the approach you suggested but I don't see a
>>>> reason for using it?
>>> Looking at the "AIPS5 Memory Map" (page 34/35 in i.MX 8M Plus
>>> Applications Processor Reference Manual, Rev. 3, 08/2024), the
>>> AIPS5_Configuration is part of the AIPS5 bus. IMHO the bus is something
>>> different than the bus configuration. Why not model it as part of the
>>> bus?
>>>
>>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>>> index e0d3b8cba221..a1d9b834d2da 100644
>>>>>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>>>>>> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
>>>>>>  			};
>>>>>>  		};
>>>>>>
>>>>>> -		aips5: bus@30c00000 {
>>>>>> -			compatible = "fsl,aips-bus", "simple-bus";
>>>>>> -			reg = <0x30c00000 0x400000>;
>>>>>> +		aips5: bus@30df0000 {
>>>                        ^^^^^^^^^^^^
>>>>>> +			compatible = "fsl,imx8mp-aipstz", "simple-bus";
>>>>>> +			reg = <0x30df0000 0x10000>;
>>>>>> +			power-domains = <&pgc_audio>;
>>>>>>  			#address-cells = <1>;
>>>>>>  			#size-cells = <1>;
>>>>>> +			#access-controller-cells = <0>;
>>>>>>  			ranges;
>>>>>>
>>>>>>  			spba-bus@30c00000 {
>>>                         ^^^^^^^^^^^^^^^^^
>>>
>>> This looks very strange: The aips5 bus starts at 0x30df0000 and has a
>>> child bus starting at 0x30c00000?
>> @30df0000 should match controller reg's address.
>>
>> subnode address 0x30c00000,  should be descript in "ranges", which 1:1 map.
>>
>> So it should be reasonable. another example:
>> i2c@1000 {
>>
>> 	device@1c <- which use difference address space.
>> }
>>
>> The similar case also happen at pcie.
> I'm not really convinced that pcie and i2c are good examples here. I2C
> does have an other addressing scheme by nature and the hotplug-able pcie
> is dependeds on the pcie device memory map of course.
>
> Here we're talking about an access control IP core on a bus which is
> static.
>
> But.. it looks like from DT abstraction it's fine because STM did
> something similiar with their st,stm32mp25-rifsc or st,stm32-etzpc
> albeit it does look strange and I don't know why we have to limit the
> address space since it was already mapped but used by the fsl,aips-bus
> driver.
>
> Regards,
>   Marco

The address space of the bridge was changed to that of the bridge's configuration
space because I think it's very awkward from the software's point of view to have
to hardcode the offset and size of the configuration space inside the driver. I also
looked at what STM did with "st,stm32-etzpc" so I thought this would be acceptable
from the DT's POV.

Regarding why I chose not to model the access controller part as a subnode of the
bus:

    1) The access controller is part of the bridge itself (not a separate module accessible
    via the bridge like it's the case for its children) so I think the current approach
    should also make sense if we take the hardware into consideration.

    2) The access controller configuration also impacts the AP. As such, we needed a way to
    enforce a dependency between the children of the aips5 bus and the access controller
    (we could have used the 'access-controllers' property like we did with the DSP but having
    to do that for all children of the bus is not ideal I'd say.

Of course, argument no. 2 is somewhat brittle in the context of i.MX8MP as the reset
values of the AC's registers already allow the AP to access said peripherals. Despite this,
I think the current approach would be more scalable given that the IP offers some more
configuration bits which we might want to toggle. For that to work, we need to make sure
the bits are toggled before the AP accesses the peripherals on the bridge.


Note that we don't do this for aips1-aips4 because it's really not needed. If I'm not mistaken,
they're not really attached to a PD so we don't need to re-configure them each time the domain
is power cycled (which is why we can just do it once from ATF during the boot process)
  
