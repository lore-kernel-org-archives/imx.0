Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7E731A7E1
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554879; cv=none; b=YXMYWF+tSfIRgcludZpseiWPDbD0eEANJYHOBXJSEPZK+cNboo29nRXZS7O8W/5RphB9EVbtw927e0x5/tcSWELGCc9Jm44YPAPXUoDQoy1VkUVxlXrVGbdPojnTkfuiVDlm/DAnRJP69SCTLJu2pDgqYOay54JSleXW/gtlnRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554879; c=relaxed/simple;
	bh=6R3g76kmH8nUka8kU56TR1o+wy0tyxyUH/+Au5/EThU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrLgUuL8DSYKpa0Tk8dIXIDEfod14vAEmlPX7HcwHOij2KF2py/5/ugvo9+R9ik4Z7/4Eh6cgUdz7IqU5UQZzYm8lB+On/1Nzul2LB2pUaK52cN0ysu57cBF5rAkpVdzRyt2Fm1hXKxf+FuMMyVjver24iJ5ubWnrMNlZHTVAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7Y908Qk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7Y908Qk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c523864caso10034408a12.1
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761554875; x=1762159675; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGZz4VWs/JC+aNmL95YeIOEFAldikWyWA5RKgIlO5FE=;
        b=H7Y908QkCYUSbIk0DtIzynickdLrSdsBCTq8M8ORo6tjfF//X+iAiEVsOISaxvNtdQ
         xFWUd7cVEhgJdtZszzCgqfXLPUsnlBrLNXvj3Zs+ePkbqcBPfHdPqvvbzd/dvxkmcdyH
         v/ZxLbhSqNUm/YD4dmCwXEf0xUbIufkmeP9DC2Lym7d8bbcITuApjhOK6TLVhoN0pmLD
         rPCT0oN8BXD2ZUJYzYeWJ/EhBmZAhzvybShzf9pbi7ltZHh6Gp3Y9ix6W3/SkHHKtLva
         ZYhIaki7ELIbDaLrvXoH7dvWVlgWWV5mhjxrxw+ycjH1O14Xc4x5WEyNsdtj9WDyYyaw
         1fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554875; x=1762159675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGZz4VWs/JC+aNmL95YeIOEFAldikWyWA5RKgIlO5FE=;
        b=T/AlMkRN1NAZ5uL0E+wvTGZmhLGkwRTiO0sS1F5sOKK36ARnSc7o9BND74efgCEj1o
         YaU6inabW9tom6coysfOf8PXHjddsYKE4lmQgWKOhASkx/+KTvNyzMvXzZk7Xk7qYn99
         HpS8xDgkqRqMaIkpY5x5nMZz7dbB8K2im6F/vNK7IOrKKuEUs61qYi94Yjz/0qKbzx7H
         zHSVy4lrpUz02xS/Q86MQ5ljJ/Xveml4Kn2RKVCcZo9MjTY4FiNdMPhUGmtzBRanZkkx
         Gp7BuTQKD7wxMBJW7GihkWrD7O7QZtKb+ME625vXGH/jnKY4B3STxptzD2JIrumaXiDt
         Bejg==
X-Forwarded-Encrypted: i=1; AJvYcCWem44Cxm4MeyF5yoiAHwb0ab2v/zvdFd1peTtdmCQq+mZt6+0tqTT9en1bsf4dQ4hqWj4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg5Vi5solFreoOEW5RjDhX6ezFjo1P+1lPXsb1dO7FOJqAqlqh
	stnF6SMBdnImzG87hcTZWLYcZlqz611chFHIv/owZEt8louYgt4k+uAH
X-Gm-Gg: ASbGncuiGg6QWe5bYZYeWdeK270aaMfkNgEzdH47OjtBNkN5QmcNUN5h1wexPMmSeLr
	37BjK6N1907LLMlibqY4flsggWRijKvA2Vvc70aZZxEg6mXzKFAGtqA2dMklMLQEmsAoBxNnlYH
	YHkBMzScUViCmHDISL0TLC89G8fx/dBhLvYtIajGNJbVbfZ+i4Wvc9yEc8Z6F2Ersp2CsG6Xacu
	a5RQUEaf4nx9vK21KTlbUpmV34EQ+Zfo0qRuXsJ73WnEi41cGpUF6dhd2Q/PpMtEIq5E0Rnrpxf
	2GfgXhCKvki9bK2YjLiFqY65TUtjTcvpVneIQZCcjiBQkn8SJYteompYqrYmzP4a8siRLJOmLDt
	/CFFe09VnyYKfVXiiB+3s2DVPMUFQnorx3R1GX8XmYj8HeCOZ6PMql3/gUfAAut//+9BWKNRy8o
	/QVPK05n7GCWFTTrhBIIGMOq0PXN1UInS0lm8PsSOxX0y4MqLvV7q/s0MAtCuSn5cAtAPWw+Iju
	FpvlgE=
X-Google-Smtp-Source: AGHT+IHI/dPLHOEXbAgh9incjnpJfjqNEb+KRQ5szvPQKR2/DbuucHSelag9VvNOHA5WUfOKDq1CeA==
X-Received: by 2002:a05:6402:430d:b0:63e:142e:4b18 with SMTP id 4fb4d7f45d1cf-63e600843bamr9053952a12.7.1761554875180;
        Mon, 27 Oct 2025 01:47:55 -0700 (PDT)
Received: from [10.0.1.60] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef8288asm5688230a12.10.2025.10.27.01.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:47:54 -0700 (PDT)
Message-ID: <341f56de-9dde-4c44-9542-b523e1917dcb@gmail.com>
Date: Mon, 27 Oct 2025 09:47:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20251027072749.GA7811@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/10/2025 08:27, Laurent Pinchart wrote:
> Hi Andrew,
> 
> Thank you for your quick reply.
> 
> On Mon, Oct 27, 2025 at 04:08:42AM +0100, Andrew Lunn wrote:
>> Adding Russell King
>>
>> On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
>>> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
>>> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
>>> devices produces an interrupts storm. Disable EEE support to fix it.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>> The exact reason for the interrupt storm is unknown, and my attempts to
>>> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
>>> understand, the DWMAC implements EEE support, and so does the RTL8211E
>>> PHY according to its datasheet.
>>
>> I believe for DWMAC it is a synthesis option. However, there is a bit
>> indicating if the hardware supports it.
>>
>> The PHY should not be able to trigger an interrupt storm in the
>> MAC. So this is likely to be an DWMAC issue.
>>
>> Which interrupt bit is causing the storm?
> 
> That's where I hit my first wall :-)
> 
> I've tried to diagnose the issue by adding interrupt counters to
> dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
> (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
> interrupts storm, increasing at around 10k per second. However, the
> corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.
> 
> The ENET_EQOS interrupt on the i.MX8MP is an OR'ed signal that combines
> four interrupt sources:
> 
> - ENET QOS TSN LPI RX exit Interrupt
> - ENET QOS TSN Host System Interrupt
> - ENET QOS TSN Host System RX Channel Interrupts
> - ENET QOS TSN Host System TX Channel Interrupts
> 
> The last two interrupt sources are themselves local OR of channels[4:0].
> 
> I ould suspect that the LPI RX exit interrupt is the one that fires
> constantly given its name, but I'm not sure how to test that.
> 
>>> What each side does exactly is unknown
>>> to me. One theory I've heard to explain the issue is that the two
>>> implementations conflict. There is no register in the RTL8211E PHY to
>>> disable EEE on the PHY side while still advertising its support to the
>>> peer and relying on the implementation in the DWMAC (if this even makes
>>> sense)
>>
>> It does not make sense. EEE is split into two major parts. The two
>> PHYs communicate with each other to negotiate the feature, if both
>> ends support it and both ends want to use it. The result of this
>> negotiation is then passed to the MACs.
>>
>> It is then the MAC who decides when to send a Low Power Indication to
>> the PHY to tell the PHY to enter low power mode. The MAC also wakes
>> the PHY when it has packets to send.
>>
>> A quick look at the data sheet for the RTL8211E suggests this is what
>> is supports.
>>
>> There are a few PHYs which implement SmartEEE, or some other similar
>> name. They operate differently, the PHY does it all, and the MAC is
>> not even aware EEE is happening. Such PHYs should really only be
>> paired with MACs which do not support EEE. An EEE capable MAC paired
>> with a SmartEEE PHY could have problems, but hopefully the EEE
>> abilities and negotiation registers in the PHY would be sufficient to
>> dissuade the MAC from doing EEE. But i would not expect a setup like
>> this to trigger an interrupt storm.
> 
> Thanks for the explanation, I read documents to try and figure out how
> it worked and didn't find such a clear and concise high-level summary.
> 
> I'm not very experienced with ethernet, but I can easily test patches or
> even rough ideas on hardware.
> 

Hi Laurent,
I had the same problem, interrupt storm plus link instability with dwmac.

I found out that 2c81f3357136 ("net: stmmac: convert to phylink PCS support")
commit is the one causing the problem to me.

But the phy used by our board clearly do not support EEE, so I disabled
directly in the driver.

I’m very interested in your investigation, as I’d like to understand why that
commit causes a regression, given that it supposedly just switches to using
phylink for EEE management.

See https://lore.kernel.org/all/20251023144857.529566-1-ghidoliemanuele@gmail.com/

Thanks and regards,
Emanuele
