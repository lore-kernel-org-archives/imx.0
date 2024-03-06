Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E291813A89D
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 17:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709746917; cv=none; b=iCZhtRBLXe9hy3w/3MR9WXFq+cYhMdpmSfqfCuqbBsOa1GU8OTz5ZVpEAC5RLgpvGzV5UCgMUUF3fvImew0Oaq6ERGIoKkQUTzpi+hjL3kI2EkpYXYrMQPNW1Ik3ALg0J67pmitSnS9NBlRgO83JI3yKneqnHBSiUjGjqg0lO00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709746917; c=relaxed/simple;
	bh=AOUS7HU1iUG/e8eQD7OjmY5ew+MT0Q0Av2kRZ3T6SpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYxosCI3D3DDw1omiI5gChfZkyJ5MR/DiHBB/rFwu9OBpi/J15GF3wHEXIJKmY3kegmj3dk7CISlC56VlLLty9b7kr6oh/7YpIxIDNcYsNRrnOs0AoqJE+T+tR39bzWcsm/WN5PYIgP65ok/B+LgRr+8or1KIeGRr6YmvtMUyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyjBf0RV; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyjBf0RV"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6900f479e3cso20193826d6.0
        for <imx@lists.linux.dev>; Wed, 06 Mar 2024 09:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709746915; x=1710351715; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoGpBFyUJXIJqUxawCbUvlxpYBQviBzPiWSgkxLAi40=;
        b=UyjBf0RVjNT3m8NE+P5cJZxCXu+lE9vB+lnwEVtJ8awLe/rzfWRF/nqbKaFhnvwj4r
         KLIcHq9/Kh4zu+njhTIcJ+/IqX0acbh70cRGhgPjX/tGj921sA65nEny++M/1uprBSx6
         Ki10nB2WSAac0btnatHnNfOOgMYJnmhwu1wUKdHr37l4kPpZNbljP9MHLbEdMWqRR4KM
         q0LnGo1F+LBrhaB2Fd6jOPvAADXvyhrObHm/adWXNSIAfc3SStk/Tw96CO4xi34KaTnO
         nFvq6PJeEAbckwgWXVIE0ep1y9UQT61G2NPcMkM+pqIXHl915hlu8+/7j5eJbmfizw6b
         UUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709746915; x=1710351715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qoGpBFyUJXIJqUxawCbUvlxpYBQviBzPiWSgkxLAi40=;
        b=MY9bHmpwbrKEOQEr2K2Gyf3jAj9OK88fXsH+JMlJ7y7x/h7VZ3wsrK6dPmYqyAX/AB
         V0XqM/UW5n0JwzOggXVGAQfOu3sgJkjPN8Bvsizf+clxDJnOAUwgMLgBGH/LqskF3ZdQ
         YJtMAee0Xvfzlq019GC3+fIN4biyZAuG28+Z33g+L0/6vdniliw05U2ItbNRB2Jp7Cfd
         J+0pa+IHOWTETsqVPTrP/dmp+RbALFS/xk3i0tDi1Hx4wTTMt/PIQuPR2aKfZBOkZhb0
         ezsCeVm4F3AiLpsbKsrlDWqEMz3JmwLHsNuwHl74BJ3hLdvpy8hS3dL4ppVNlwINF8IA
         iuxg==
X-Forwarded-Encrypted: i=1; AJvYcCVN16/R3LKHMgCO4AgDYjGKXJF4lBfAo9FVWjpUwyLq0xM+CWtnfSCq0xajE/AEAypwULUSXUOynvQ/9WWOWI03CQbB
X-Gm-Message-State: AOJu0Yy8iyLJU84AbsPsE5efwXuXi7RsFstD6YtixAHPYn+A5+W8JAhv
	/3GoK+JfZcnB8w2s4nbB13O1rZiSk65AS5y3an9w+6LWveF9uVTM
X-Google-Smtp-Source: AGHT+IFD+RKpduUO3UYUWKne+01iux1Pi69wxHgOjz/HwCNYjShAG4SFhDUnQo4ph2bQjFWyjVcpAw==
X-Received: by 2002:a05:6214:1788:b0:68f:fe7f:abff with SMTP id ct8-20020a056214178800b0068ffe7fabffmr5829870qvb.19.1709746914713;
        Wed, 06 Mar 2024 09:41:54 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id kr9-20020a0562142b8900b0068fcd643b9dsm7654626qvb.22.2024.03.06.09.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 09:41:53 -0800 (PST)
Message-ID: <bbe3e611-a310-41f5-a037-4b7d5e914b94@gmail.com>
Date: Wed, 6 Mar 2024 09:41:46 -0800
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
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
 linux-imx@nxp.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 bsp-development.geo@leica-geosystems.com, m.felsch@pengutronix.de
References: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
 <20240306172409.878928-2-catalin.popescu@leica-geosystems.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240306172409.878928-2-catalin.popescu@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/24 09:24, Catalin Popescu wrote:
> Add support for PHY WOL capability into dwmac-imx MAC driver.
> This is required to enable WOL feature on a platform where MAC
> WOL capability is not sufficient and WOL capability built into
> the PHY is actually needed.
> 
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>

Nope, this is not about how to do this. You use a Device Tree property 
as a policy rather than properly describe your systems capabilities.

What sort of Wake-on-LAN do you want to be done by the PHY exactly? Does 
the PHY have packet matching capabilities, or do you want to wake-up 
from a PHY event like link up/down/any interrupt?

If the former, then you would need to interrogate the PHY driver via 
phy_ethtool_get_wol() to figure out what Wake-on-LAN modes it is capable 
of supporting and then make a decision whether to prioritize Wake-on-LAN 
from the PHY or the MAC, or maybe only the PHY can actually wake-up the 
system in your case.

If the latter, then you need to add support for WAKE_PHY to the stmmac
driver.

pw-bot: cr
-- 
Florian

