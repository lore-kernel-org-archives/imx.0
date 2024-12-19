Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8FB15442C
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627758; cv=none; b=s2Vu1zl8qJdsO9GhgmVQ3UIu2yQ1AGkf86FmvjY9Sqfkb38cjY9jgmAYhS6Yhk6NWaULaiNZkvXdZolFj/M0RKWBg+dNRtpG/m6Wj5FoCF6lkaBK7vjl9wlMJDLGsB7B6DpkDBOsVrSEKG/H/WAi/SDxlWKni7Vf6QXzOjbd9iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627758; c=relaxed/simple;
	bh=PEFphxGvGg2l4l0PN0KE0EA9RP0MzBCoenGBhETqabw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oR0Qodl5hgB65cWGCgweXSYV0LWmFZP8kLCILuMUauU3QbYnn6ZXhpSBw2M0bX69e0WmauahNsTwxQTBIVa2fS64csSw8ozZX0PrNqUaxsjC+m/kQ2Ho/2wJkdIQqBc7gF9+Qciuoaq4HeL0zcSTOhvSF8AXPnOh5IMMswgoBxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoHtyzQg; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoHtyzQg"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-728d1a2f180so862621b3a.1
        for <imx@lists.linux.dev>; Thu, 19 Dec 2024 09:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734627756; x=1735232556; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0/L3yqkrFphLSLfi9k6BWAjTwMXwunYK2ocDlQzb2Y8=;
        b=CoHtyzQgBsmEU+xCW+7GMBvb4M4UEkTq6c/Yj7wErxs7jys7NONcBjPO1/qGAgYv4C
         pITnp/0bowB77DMjNnikFviTsUynL3iy/YVofcL6ukskj9sCrCRUGw/XHcI4NTtyhUBY
         m4gv5ErC2xSPVO1n0wcXa3wGsABikRG98HJ7c81aYTJNTGuGonTEVgbwPjsTYxaqF+e0
         y+s11xkv2/2pcu92UUGFwU9BWiWdl27CH6xmY0zX7iWuinc4nhX6ctHrrBkNMfnbkE7L
         P/8N0o/t8TXLVX2xrXO8O9VhHO2dhU6TdFnNxFUV/TM2Pkw8pwuTHo6FOV/23XXzWrbz
         /8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734627756; x=1735232556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/L3yqkrFphLSLfi9k6BWAjTwMXwunYK2ocDlQzb2Y8=;
        b=GMLVCvLZOsqLB6tCQvrG8f32X9OytjpvpFPv0covl1KYKRVi43xngkvyoD1sztzEaR
         mf+rJSri9ak6tnrQo/OegAPwkCnOv6ofa3u9mvdawiOR5v6nuxwIdNqwAg3AUm3RTbC1
         sEoZZt6wyA+ob5aisiJHNevOvhdXVTnFPthr1Uwl6p8rHDsbiFneFg8Sa0T5OCr/Z/yo
         3FNSgAYQMobJKo1aP0FpY+eto4KtTBGt+gw8UYPD+KVf2MWIbx7NrgRGqaoRxMGraaW/
         Bq8iUHqkCGG/6mWG6H1lYYsEfJBcNZ4QV9d3WQeEv22Gdeh4yHrbK8rjcCykdcW7IcKi
         DWfg==
X-Forwarded-Encrypted: i=1; AJvYcCUYTUmNa+A+XFrB3kUQTEDMjNrL2kc9E9zG5XUcuUaCkAPG0WYXNcBm57G0oULdBzkduZc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx4eoC/WZgOottECpg914P3mQgjAACw1xjvUpRJsS2QO+w67Jl
	B2HdSHdNQWC0okpBPvs+mgaw8bB6YplzJiDD2DfsmbzI+L/w4HLp
X-Gm-Gg: ASbGnctuQ23v3io1tUecRkVQfs215IUymvM9EGolFUeTBLRE/S/yDUHduRE4FvpeGNt
	qMC+BGj7nRvzplX6ytd7x/mo1ibwQ90cqhBgn9ac/t0oia3XMyUnVUEo5RODYM/riphxWkwtnd0
	HLnshJaW7x/XCyjmQ6tPHMOB8N5Ll/89mGJv0h+cO7PNVZNnhVOcq1ZHewMOiyZ8+s45oIEn/X8
	z6QgK89XOt6i4BfkC2L+kBvImjqKscjD0RrrGBAzGKo/i7QScikIBwL+W6H0iYCLW2S94tKc0K2
	l3p6Qe8f
X-Google-Smtp-Source: AGHT+IFvO/vY33BZqTQhbbTJF5eCLtVfCMylIh1R3YvZnFBh1z0Kxx8OrN4QUhUjizZ7XF0Hpji1eQ==
X-Received: by 2002:aa7:8d15:0:b0:72a:83ec:b1cb with SMTP id d2e1a72fcca58-72aa98f5b53mr5561488b3a.0.1734627755927;
        Thu, 19 Dec 2024 09:02:35 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd58asm1580581b3a.145.2024.12.19.09.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 09:02:31 -0800 (PST)
Message-ID: <629802cd-ddb1-4e3d-9050-612739d8f3fc@gmail.com>
Date: Thu, 19 Dec 2024 09:02:29 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net] net: phy: micrel: Dynamically control external
 clock of KSZ PHY
To: Wei Fang <wei.fang@nxp.com>, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, florian.fainelli@broadcom.com,
 heiko.stuebner@cherry.de, frank.li@nxp.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
References: <20241217063500.1424011-1-wei.fang@nxp.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
In-Reply-To: <20241217063500.1424011-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/24 22:35, Wei Fang wrote:
> On the i.MX6ULL-14x14-EVK board, enet1_ref and enet2_ref are used as the
> clock sources for two external KSZ PHYs. However, after closing the two
> FEC ports, the clk_enable_count of the enet1_ref and enet2_ref clocks is
> not 0. The root cause is that since the commit 985329462723 ("net: phy:
> micrel: use devm_clk_get_optional_enabled for the rmii-ref clock"), the
> external clock of KSZ PHY has been enabled when the PHY driver probes,
> and it can only be disabled when the PHY driver is removed. This causes
> the clock to continue working when the system is suspended or the network
> port is down.
> 
> Although Heiko explained in the commit message that the patch was because
> some clock suppliers need to enable the clock to get the valid clock rate
> , it seems that the simple fix is to disable the clock after getting the
> clock rate to solve the current problem. This is indeed true, but we need
> to admit that Heiko's patch has been applied for more than a year, and we
> cannot guarantee whether there are platforms that only enable rmii-ref in
> the KSZ PHY driver during this period. If this is the case, disabling
> rmii-ref will cause RMII on these platforms to not work.
> 
> Secondly, commit 99ac4cbcc2a5 ("net: phy: micrel: allow usage of generic
> ethernet-phy clock") just simply enables the generic clock permanently,
> which seems like the generic clock may only be enabled in the PHY driver.
> If we simply disable the generic clock, RMII may not work. If we keep it
> as it is, the platform using the generic clock will have the same problem
> as the i.MX6ULL platform.
> 
> To solve this problem, the clock is enabled when phy_driver::resume() is
> called, and the clock is disabled when phy_driver::suspend() is called.
> Since phy_driver::resume() and phy_driver::suspend() are not called in
> pairs, an additional clk_enable flag is added. When phy_driver::suspend()
> is called, the clock is disabled only if clk_enable is true. Conversely,
> when phy_driver::resume() is called, the clock is enabled if clk_enable
> is false.
> 
> The changes that introduced the problem were only a few lines, while the
> current fix is about a hundred lines, which seems out of proportion, but
> it is necessary because kszphy_probe() is used by multiple KSZ PHYs and
> we need to fix all of them.
> 
> Fixes: 985329462723 ("net: phy: micrel: use devm_clk_get_optional_enabled for the rmii-ref clock")
> Fixes: 99ac4cbcc2a5 ("net: phy: micrel: allow usage of generic ethernet-phy clock")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
