Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE06D2577B
	for <imx@lists.linux.dev>; Fri,  8 Mar 2024 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709920606; cv=none; b=hgyFdMmXRfGeHsQjZkZH5Jrr2rMnMqaSvd+r2mTiYF1VPEOcLYNAQp9MEzKWpW6OFe7nK+vjiyW6GWiuFD2+1HVc4aqRQkdGot8eWrCgX96crjXcJBdT194KdfVOILAnoE+beFBRjz+zhsTxZP9+Plw+VYToa41q2L8MiNnvCHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709920606; c=relaxed/simple;
	bh=C3/OQ3lvmtWM5Fk2NQ/zYD5f1oUYWVti/SktEx2bsrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XweiPBO+/KnzEHhar2MoF9wqi+CteuKJ2jFUj2MXIHgQKTQiNAikRKFsR4Q6ww/WJu5sud0zUeaRe7Qt6uwevjaOOQYcwGJFLU/xoaNE1vl0kXxSIU/mkyQFqW8PMaRwEllJBssdhUbXfcBn/UN3uzvf5gM0mfHlv3MmbGTwF6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epFXFgUX; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epFXFgUX"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so1545921a12.3
        for <imx@lists.linux.dev>; Fri, 08 Mar 2024 09:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709920603; x=1710525403; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OgXSP3d/pfH7TPIm6gVXNmyWtFVxa9g4fw/sbjv/wQ8=;
        b=epFXFgUXuB6dNZAkDbldvuFaukjGpzgEZazqCplu2nbmPscgtkJ3A96TQHEcoOB2Qk
         xgXbb2AmN6WiIespyt/+b7dTud7iVewDsdNIFqqU25Jpw15gtBEzT6PV4hP51kXXeoxZ
         Q+dwiU0TnXlS0H+2E07SA+s9zbhPkaTjDLnQMd8909ZyhghEixLihy1HxTef8gQooPsj
         kwWJVrklFnZd+sMH93nKYf897stUVJlBBFG5AkAas01XCK8TvWyKrekVizOCdlqnMx1t
         XbM/BrhEHSegLeHZ90AEHAtAy5qu7NBWL2/cYRHYaXgXWqgvITdCrCeB9PSdl0iiH97f
         0ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709920603; x=1710525403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgXSP3d/pfH7TPIm6gVXNmyWtFVxa9g4fw/sbjv/wQ8=;
        b=gVf+/TYvBrZ309O/ifxCZ88IxZGARH8c+saRuHtjgzNAFp6n4r/uQKCL4Bf2/xvl9W
         d7rpLaR85FrCwlgamwOPI7cMbMEHhBvIF//hpCZs19Hcg326KQiDfbLHf8CwNEs71Pkb
         COpOY1ete3Tm8HlEsmBCVdXUlRUOdQ9rVsmxlNT0rBUnscCKc9irdmW38o7exhHlGCZ1
         ynASaQesDJwVdHJ7ZdVLL9m1EjylAmYAbKc+2LYx5kZYamW4mnVKSa5K2s51QKPhl1S/
         vSMDcQ1x0TtnGbRRrp5MyEDGqu701Q1MYgyy9wzCekOhxTsPhJaeHDmVvHCexDas05FV
         m4cw==
X-Forwarded-Encrypted: i=1; AJvYcCViiqKXOKSoM5SOCq7zaJfNEwbdyyaa6tb7hLHxFbaQCQH24hacgOqECa3tUE0/Aht7ongHgedwBfiVKUVxk18L/4Wh
X-Gm-Message-State: AOJu0YwiQB2MIw1N4FYsVYEygSFe5R7i/ACxy0AzGrNMRrUwn5QQSWDy
	cTdKk3v+qzbpLgwhjTMPvCgzJYctMTVVnstNoLb7N8IvHibEcE+e
X-Google-Smtp-Source: AGHT+IEjLZQEiki14E+8+WuQTj2DOEDO9pnd9LRofgXc5k2m0gMxe8g0kXRmMDI4Og1HNoFRHiM7HQ==
X-Received: by 2002:a17:90a:8d85:b0:29b:6da4:277e with SMTP id d5-20020a17090a8d8500b0029b6da4277emr801752pjo.1.1709920602765;
        Fri, 08 Mar 2024 09:56:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id cx12-20020a17090afd8c00b0029bc28b8cedsm27722pjb.28.2024.03.08.09.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 09:56:42 -0800 (PST)
Message-ID: <9bb24a9b-4c95-49f9-8afb-2fdeeed64198@gmail.com>
Date: Fri, 8 Mar 2024 09:56:39 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-imx: add support for PHY
 WOL
Content-Language: en-US
To: POPESCU Catalin <catalin.popescu@leica-geosystems.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "xiaoning.wang@nxp.com" <xiaoning.wang@nxp.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
 "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>
References: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
 <20240306172409.878928-2-catalin.popescu@leica-geosystems.com>
 <bbe3e611-a310-41f5-a037-4b7d5e914b94@gmail.com>
 <ddd2f984-e5e7-4708-a013-bfd668794466@leica-geosystems.com>
 <a25d4d76-a49a-4423-8916-5d7d9303b87a@gmail.com>
 <917f5cea-69d2-4ce2-a5a3-184332415fe5@leica-geosystems.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <917f5cea-69d2-4ce2-a5a3-184332415fe5@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/8/24 09:48, POPESCU Catalin wrote:
> On 07.03.24 19:52, Florian Fainelli wrote:
>> [Some people who received this message don't often get email from
>> f.fainelli@gmail.com. Learn why this is important at
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> This email is not from Hexagon’s Office 365 instance. Please be
>> careful while clicking links, opening attachments, or replying to this
>> email.
>>
>>
>> On 3/7/2024 1:13 AM, POPESCU Catalin wrote:
>>> On 06.03.24 18:41, Florian Fainelli wrote:
>>>> [Some people who received this message don't often get email from
>>>> f.fainelli@gmail.com. Learn why this is important at
>>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> This email is not from Hexagon’s Office 365 instance. Please be
>>>> careful while clicking links, opening attachments, or replying to this
>>>> email.
>>>>
>>>>
>>>> On 3/6/24 09:24, Catalin Popescu wrote:
>>>>> Add support for PHY WOL capability into dwmac-imx MAC driver.
>>>>> This is required to enable WOL feature on a platform where MAC
>>>>> WOL capability is not sufficient and WOL capability built into
>>>>> the PHY is actually needed.
>>>>>
>>>>> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
>>>>
>>>> Nope, this is not about how to do this. You use a Device Tree property
>>>> as a policy rather than properly describe your systems capabilities.
>>> I'm not sure what policy means in that context.
>>> BTW, dwmac-mediatek does the same with binding "mediatek,mac-wol" which
>>> is a commit from 03/2022.
>>
>> Policy here means you want a certain behavior from the OS that is
>> consuming the Device Tree, and that behavior is encoded via a Device
>> Tree property. This is different from describing how the hardware works
>> which does not make any provisions for getting a behavior out of the OS.
>>
>>> I understand this way of doing became "unacceptable" since then ??
>>
>> It was not acceptable then, but there is only a limited reviewer time,
>> and it is easy unfortunately to sneak through reviewers.
>>
>>>>
>>>> What sort of Wake-on-LAN do you want to be done by the PHY exactly?
>>>> Does
>>>> the PHY have packet matching capabilities, or do you want to wake-up
>>>> from a PHY event like link up/down/any interrupt?
>>>
>>> PHY is TI dp83826 and has secure magic packet capability. For the wakeup
>>> we rely on a external MCU which is signaled through a PHY's GPIO which
>>> toggles only on magic packet reception.
>>> We want to wakeup _only_ on magic packet reception.
>>
>> Then you need to represent that wake-up GPIO line in the Device Tree,
>> associate it with the PHY's Device Tree node for starters and add in a
>> 'wakeup-source' property in the Device Tree.
> The GPIO I was referring to is a PHY GPIO not a SOC GPIO, so there's no
> way to describe it into the DT.

Well, technically there is, it's just that the PHY is not registered 
with Linux as a GPIO controller/provider, nothing prevents you from 
doing that, but it starts raising the bar.

> The PHY is connected on the SOC MDIO bus, so the SOC programs the PHY,
> but the PHY wakes up the external MCU which in turn wakes up the SOC.

OK, but that still needs to be described somehow, otherwise you are just 
cutting corners and assuming that the pin from the PHY to the external 
MCU is only driven when the PHY drives it, how about other wake-up 
sources to the MCU?

> 
>>
>> Now the PHY driver can know about the existence of a GPIO and it can
>> know the PHY is a system wake-up source, so the driver can call
>> device_set_wakeup_capable().
>>
>> In user-space you have to configure the network interface with
>> WAKE_MAGICSECURE which needs to propagate to the PHY driver for adequate
>> configuration. Still in user-space you need to make the PHY device
>> wake-up *enabled* by doing:
>>
>> echo "enable" > /sys/class/net/ethX/attached_phydev/power/wakeup
>>
>> If both WAKE_MAGICSECURE is enabled and the PHY device in sysfs reports
>> that it is wake-up enabled would you wake-up from the PHY's GPIO. Your
>> PHY driver ought to be modified to check for both
>>
>> device_wakeup_enabled() and wolopts being non-zero to call
>> enable_irq_wake() on the GPIO interrupt line.
>>
>> That's how I would go about doing this, yes it's a tad more complicated
>> than adding an ad-hoc Device Tree property, but it's more flexible and
>> it's transposable to other configurations, too. Whether that sort of
>> encoding needs to be in the individual PHY drivers or somewhere in the
>> PHY library can be decided if we have more than one similar
>> configuration to support.
>>
> Yes, it's more complicated and it doesn't apply to our platform.
> But, this doesn't really matter in the end, the problem I'm trying to
> address here is to allow stmac for IMX to support PHY WOL.
> Since the binding is not acceptable, I guess the only option here is to
> remove flag STMMAC_FLAG_USE_PHY_WOL from stmac driver and replace it
> with a call to phylink_ethtool_get_wol to identify whether the PHY is
> WOL capable or not.
> Then, how should we allow the platform to choose b/w MAC WOL and PHY WOL
> if both are supported ?

We don't have a good way to configure that decision consistently and 
across *all* device drivers currently, what I can think of as the least 
bad solution is to intersect between the PHY supported WOL modes, the 
MAC supported WOL modes, and checking which of those is a wake-up enable 
device via device_wakeup_enabled() and use that one with a preference 
for the PHY since that is the closest to the wire. But this might be 
good for me and you, maybe not for others.

> AFAIK ethtool only knows about MAC WOL capability since it interrogates
> the MAC interface. ethtool doesn't know anything about the PHY, or does
> it ??

No we don't, and until Maxime's patches about PHY topology land upstream:

https://lwn.net/Articles/961959/

we do not want to invent many different ways of specifying which of the 
MAC or the PHY should be used for WOL. FWIW, I have a similar need:

https://www.spinics.net/lists/netdev/msg751196.html

https://lore.kernel.org/all/20231026224509.112353-1-florian.fainelli@broadcom.com/
-- 
Florian

