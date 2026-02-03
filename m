Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94D03D1CC0
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136131; cv=none; b=U33h9blk1/sVUyO0aPMHW1ZRWU3DT3CVkjCW8TWluFTuwkDjqabLrPV4yfc7r8ZpBcMMJ9am8ekVkIC0bD6uj+wGjdkWwvm+7TPurCV2SCLgTnpFSPZIFrjPJPVAVMT//2ygD+Deh5RxvusW04O9+pKc4vtRAd/begtrZFiKzjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136131; c=relaxed/simple;
	bh=C4LCwiHMJLH4EJHuKA0kgNtAtBVk64Afz7AB3Gax50U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0HKmlE693xbgP0cuL6lyiNNcnsBksx3fdrHh9LrkUfWYDmJQTC8f10iZxZ/C9dpfRM0skyV5Pq+toJS51o9wj/grOlXgmA1Bf0OOnpVgKyKhYt82PAPtPHJE+V7awIDjtv2gnyqamMvmEr0Xxy8ATmUmdLQ/GRjZX+6rhV/u44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzBjcf+P; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzBjcf+P"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so4067871f8f.1
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 08:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770136128; x=1770740928; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K10+Z/PfLLLC2tLsBMJ7x0EDY9z49CyvtmsqUUYjuGg=;
        b=IzBjcf+PudaSAK0UIXNRy4aD0kv6oFBhDpVnMj6xibDXqHLgZxbNxkNwAxCjHxhdY5
         se10brkgnkAatRmweUev5w1BfFK3dll302Wjww0MVISolCkV2eR3TG8u74sEPg2wSj0V
         y/jKzO8jHLIsLRUdFyWEcJnThKdji7x7QR4xuqQcOl3sF5vhXi4VMWNlK2Xa+Dd3CtM5
         lSrweJdSBo+Z2pI7BohloMaoO6PTNbDZdnept4fiKNIUfx/Mvfh0nY6dYFGkWrpneJa8
         K/+hwLaXeyMdurh9GovQZRqTpsqj+mH48pkJNLmaGj/te68r4Q7F1qrS4S1MRAdbt544
         LvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770136128; x=1770740928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K10+Z/PfLLLC2tLsBMJ7x0EDY9z49CyvtmsqUUYjuGg=;
        b=uNR8cMlq5lhLKsbfExKcmjjtpl0VbD0/FzgWlBvziisTzSwEbZnH9WqN6O1mWNzr/J
         24U+ztCzkscv0kGQ9NWOfqmP3fSIffzV2uPsXv99zA5NOVTbCJpYv0HepMn2TFxy9m/1
         pW35tIw9llaUjvTQ30kqrELXAjMiHSZ4BAya9seIghlEL9K8Q+xbuYanObci/EWfrKTu
         hLLZHl9rNv7knf4n+4rF+RnEIBPt8/vEuQWQEVd78r71krDc2KzpUy74nV1grlUlw6b/
         ry2dOa10cykG3TuR59iPoDEsmagsOgFpZ27E/Uiu/UX6lQ0m4Oh2RVRe17Hvwaj2QF2c
         MhQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7ABMWWplY6FelImPFhDw0E/HN9e0ka1tZoBDi3FtFwIEXSeA3utLVTBOiu23OcFP/5+0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdozM4gb8gqBgouPEOifLp3cAYpSNFPmIhzXMwQhIg7pzoN4uF
	sNL3MqHo/ImHbaaG5HbPXIzE3VaWScMpdLIN83qikye0ahisSyKtlLQX
X-Gm-Gg: AZuq6aJkUAs9nTLPifUazFExvL7276DVXiqEKVX53lDxaqGRACGQvYY2Tk0mm4Nzplr
	2/5gjpIyZNm4SBqPx0RygMjv4jT3XkD9kyeQ6OzWDyItTR2ZdeicCZXtoWLeZ3bRtFrBewN1aPz
	ZfkfUM0ScLESMYKZr5M6yi6uWkiCZgExNVhtWmIvu9IEbN/hIAKouM4KddQjUW35aPRRZKPtFXj
	b/Q+gENl++TlRI0Avt0kRE2ieXFRcePfhwGxGwz6BaB7UnLz0GNn86jwcKUHxpiSn6OkaPOtj97
	0F+QcimPi9d+hPHEFIbhP3xF3vqUYK76aekY76g6JrE41dyTFB7IGFlciZdk31E1Zibf3DqVAWY
	DcfvqKStsdeXMi1pkKksLFhS+Ps1ausk3a1nxtjYczchlL/xkBdXEmGhW8vyN2Z95c3WQeUIT1A
	0k7BALLRAf/EJd2uonJtQvTTA1
X-Received: by 2002:a5d:5e01:0:b0:435:b068:d3be with SMTP id ffacd0b85a97d-435f3aa90cemr24034054f8f.41.1770136128003;
        Tue, 03 Feb 2026 08:28:48 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfd4sm50668256f8f.25.2026.02.03.08.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 08:28:47 -0800 (PST)
Message-ID: <434bff80-0b89-4fe5-beb2-4b70a4b600d8@gmail.com>
Date: Tue, 3 Feb 2026 18:28:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: provide flag to disable EEE
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>,
 Wei Fang <wei.fang@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
 <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
 <aYIXmsIG_ZJO-cg4@shell.armlinux.org.uk>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <aYIXmsIG_ZJO-cg4@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/3/26 5:43 PM, Russell King (Oracle) wrote:
> On Tue, Feb 03, 2026 at 05:42:07PM +0200, Ovidiu Panait wrote:
>>
>> Hi Russell,
>>
>> On 2/3/26 12:23 AM, Russell King (Oracle) wrote:
>>> On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
>>>>
>>>> Hi Russell,
>>>>
>>>> On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
>>>>> Some platforms have problems when EEE is enabled, and thus need a way
>>>>> to disable stmmac EEE support. Add a flag before the other LPI related
>>>>> flags which tells stmmac to avoid populating the phylink LPI
>>>>> capabilities, which causes phylink to call phy_disable_eee() for any
>>>>> PHY that is attached to the affected phylink instance.
>>>>>
>>>>> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
>>>>> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
>>>>> to the receive clock domain, and takes four clock cycles to clear, this
>>>>> leads to interrupt storms as the interrupt remains asserted for some
>>>>> time after the LPI control and status register is read.
>>>>>
>>>>> This problem becomes worse when the receive clock from the PHY stops
>>>>> when the receive path enters LPI state - which means that lpi_intr_o
>>>>> can not deassert until the clock restarts. Since the LPI state of the
>>>>> receive path depends on the link partner, this is out of our control.
>>>>> We could disable RX clock stop at the PHY, but that doesn't get around
>>>>> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
>>>>>
>>>>> Previously, iMX8MP worked around this by disabling gigabit EEE, but
>>>>> this is insufficient - the problem is also visible at 100M speeds,
>>>>> where the receive clock is slower.
>>>>>
>>>>> There is extensive discussion and investigation in the thread linked
>>>>> below, the result of which is summarised in this commit message.
>>>>>
>>>>
>>>> We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
>>>> EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
>>>> separate, dedicated interrupt line to the CPU rather than being OR'd
>>>> with the main DWMAC interrupt as on iMX8MP. This corresponds to the
>>>> "eth_lpi" interrupt in the stmmac bindings:
>>>> """
>>>> - description: The interrupt that occurs when Rx exits the LPI state
>>>> const: eth_lpi
>>>> """
>>>>
>>>> Looking through the other glue drivers/device-trees, it looks to me that
>>>> every platform that defines a separate "eth_lpi" irq might have the
>>>> interrupt storm problem.
>>>
>>> That is highly likely.
>>>
>>>> To fix this issue on these platforms, rather than disabling EEE
>>>> altogether, would it be possible to just not request the eth_lpi
>>>> interrupt and let EEE continue to work? Perhaps a new flag could let
>>>> each platform decide.
>>>
>>> Yes, because lpi_intr_o serves no purpose from a software point of
>>> view - see the commit message below for the details. I do like
>>> removing code from stmmac :)
>>>
>>>> If not, maybe this patch could be merged to add the flag that disables
>>>> EEE and I will just send a patch to disable EEE on our platforms as well.
>>>
>>> We still need the flag to disable EEE for platforms where lpi_intr_o is
>>> logically OR'd with the other interrupts, so there's no way to ignore
>>> its persistent assertion.
>>>
>>> 8<===
>>> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
>>> Subject: [PATCH net-next] net: stmmac: remove support for lpi_intr_o
>>>
>>> The dwmac databook for v3.74a states that lpi_intr_o is a sideband
>>> signal which should be used to ungate the application clock, and this
>>> signal is synchronous to the receive clock. The receive clock can run
>>> at 2.5, 25 or 125MHz depending on the media speed, and can stop under
>>> the control of the link partner. This means that the time it takes to
>>> clear is dependent on the negotiated media speed, and thus can be 8,
>>> 40, or 400ns after reading the LPI control and status register.
>>>
>>> It has been observed with some aggressive link partners, this clock
>>> can stop while lpi_intr_o is still asserted, meaning that the signal
>>> remains asserted for an indefinite period that the local system has
>>> no direct control over.
>>>
>>> The LPI interrupts will still be signalled through the main interrupt
>>> path in any case, and this path is not dependent on the receive clock.
>>>
>>> This, since we do not gate the application clock, and the chances of
>>> adding clock gating in the future are slim due to the clocks being
>>> ill-defined, lpi_intr_o serves no useful purpose. Remove the code which
>>> requests the interrupt, and all associated code.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>
>> Thanks for fixing this. I did some testing on the Renesas RZ/V2H board
>> with this patch and didn't see any issues:
>>
>> Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> 
> Would you say this is a regression or a new problem?

I don't think it is a regression per se. AFAICT this behavior was always
present as long as EEE is enabled, but I only noticed it after I changed
the network switch the board was connected to.

Thanks,
Ovidiu

