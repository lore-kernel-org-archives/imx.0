Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190491F4613
	for <imx@lists.linux.dev>; Fri,  1 Aug 2025 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037310; cv=none; b=QmMaEa4BnNHv91vvGsbygQcXhN8HEhG/tM+k7KDwgVlgGvItCm5UYeLURvgM8UYyo63THXAjAY+A5q129BywbHksTSVDdGIeeiGE3GMx4auxdm9CpAh0XBMhtFfm16f1dpqOLbGhb6TEiwPvjZa9Aixq9S/iP3qT2qU5ATgPyw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037310; c=relaxed/simple;
	bh=FqOy+mMo2rR0EN6LQz9aSmLP9UV6EGx2ngQ1VQrZuL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Irl64fF7mQY5/khVe/5RLmTZDMhIdBUPerFt7XZuHYF67WijtJxDzN0zddcbmP6HjZtdOHKGa5Q5gG8auJTyFLnwCArK80ujYpKNqol4D/LoZtEp/Sqmd5XB9hLGXmCg0BAXe9SM/qTedgNne+ruJ5McLc5LMNyn52a+hyeGDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=euGdmYAA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euGdmYAA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b788feab29so809196f8f.2
        for <imx@lists.linux.dev>; Fri, 01 Aug 2025 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754037306; x=1754642106; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jiFqr0OPCqHVXSpWzCqecK/S1S4l0jHxVTGQ1xBrzUE=;
        b=euGdmYAA3SXcR9d6xRO6ctcq8U29PlkQ5mDTJHeqXUK5iNT9+oJfpL3jKcBU2W+fYK
         0794xdCfRcWuAnLB+fMGKjI2kqpt1fSXLf3k2xCkE+/tpOX8PpJLu6QXrKJpigQ0nvgF
         VLI9q8kuBDlvVil8EDi3eSSIGdwtCqSIT+tSPhLJZmsFxejU2ZS/+zrsvfQO2I+uKgB/
         t0q9+TAkrJgU3ORRWnLP7ZHDRbVMxnTBqiQTOSFl3bg2AXy7KjF7CYkvLquUVrx7aQjf
         fuzD3fp3MXAArWznzwGWLqqMv4Uy8tsSh2ojz4lH0Zm/101c/sbQXLYaZXMelmQcb9C+
         3Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037306; x=1754642106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jiFqr0OPCqHVXSpWzCqecK/S1S4l0jHxVTGQ1xBrzUE=;
        b=PXo01x9Oh2WDQzHhNFJUjVyaecj/4ZzF3NtoVNGL1mw8DH9J4sln9it6WHsSqCMqhW
         2ULRFaajQunUyeo2kKhlmdgcLV6lrPfX7q7yXStJ+C+3AAeljP6Vz1Uz/WoK7D9ododx
         FByiynuaHCmBQrJMlvawPti8z0lF4CWoFegHq075kMSLBmmx3XKpaQvOp0tisqZ8qvpn
         4cf0sREsfg/GlLjQ3dNGry4ditZVYVLXOPqSMImpUQakFElnzC0hUpPZC4cOU20BYvax
         1rN8kHt96YjoEfPPlqWNTxuICtMbzVWj7phVGdtJ5Jug+1vuYOBd257it8Ve+yvbwWYr
         pp5A==
X-Forwarded-Encrypted: i=1; AJvYcCUwYjjzkxoXl9Dm4izukE3JccZUlOmaS37n+KUuks5uPLKMTNCJrAzPdu4vrjhQNHmR9K0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzR4OYXIYdzE7KY6bhIewqsxH9lTnpGgSHnXcKsPuOZJJ82AAwj
	fAF7tVVPCFPDcl6HtWBdcjBmIIbF4P1+0NtO+ka1PX28Zml+YAsDBpDgJ1HZ2TWTzjM=
X-Gm-Gg: ASbGncsuczA5GHPbAmpaZIAf8CK+CKGPNZENvw8jBx7KsfTrPtEIIYSGN9DaSxcdbN6
	5Fi862u9EuXUwGGaMAwcUC2Y/OUH0z6S2MRi9G3qpy+4HwVc8X94EAHBFfJ1YuXl+6KYWIMTrqh
	U+/yt/7v1xoOrQucSPjwAZSoUetMKWndxIxCXwGpQ2eE38IYo/wQ8yabrLW+gchdlLE+ivl1iBD
	qcJ17VUHsf6CLFL5u3dnM/szSLb63mK9gltXEVxtxRiTgQ2Rw8zXQVRxI/59kkeD+XPuNNE6OBk
	UiPDb2a4vM6dZ7o1nWQ/d8SKYO4Ym+eLKZUqWX7hmRxb3+14N6flnhxSQk3i1JpXditMMC9ZmIg
	ydPUJb6RTdw9Rcs7oFhRMEqvNo6WmntGsdfMvXpofb/ZVzjqqptgbt8f2EP7aAA==
X-Google-Smtp-Source: AGHT+IGS+73xkShFl6cO1Qu7hyyuX9oTyEOMrN6GMT2KH3N0L9G6LCMIuM6NsKe0gCwLrUaUqn7Ybg==
X-Received: by 2002:a05:6000:2884:b0:3b7:99cb:16ed with SMTP id ffacd0b85a97d-3b799cb1a28mr6844043f8f.40.1754037306324;
        Fri, 01 Aug 2025 01:35:06 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458953f8e02sm92820875e9.32.2025.08.01.01.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 01:35:05 -0700 (PDT)
Message-ID: <164402ad-2762-4d6b-aa34-38ff1b506600@linaro.org>
Date: Fri, 1 Aug 2025 10:35:04 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] arm64: dts: s32g2: Add the STM description
To: Frank Li <Frank.li@nxp.com>
Cc: mbrugger@suse.com, chester62515@gmail.com,
 ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
 <20250730195022.449894-2-daniel.lezcano@linaro.org>
 <aIp+XTCSpNGee2qx@lizhi-Precision-Tower-5810>
 <5be6d858-01e1-4c2d-bd5c-0e3385251af7@linaro.org>
 <aIv6L30mf5bzUqup@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aIv6L30mf5bzUqup@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/08/2025 01:20, Frank Li wrote:
> On Wed, Jul 30, 2025 at 11:15:40PM +0200, Daniel Lezcano wrote:

[ ... ]

>>>> +			compatible = "nxp,s32g2-stm";
>>>> +			reg = <0x4011c000 0x3000>;
>>>> +			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>>>> +			clock-names = "counter", "module", "register";
>>>> +			status = "disabled";
>>>
>>> why not default enable.
>>
>> The S32G2 and S32G3 can have different variants with 2, 4, 8 Cortex-A53 and
>> 3 or 4 Cortex-M7. We enable the same number of CPUs present on the system.
>>
>> AFAIU:
>> 	S32G233A : 2 x Cortex-A53
>> 	S32G274A : 4 x Cortex-A53
>>
>> 	S32G399A : 8 x Cortex-A53
>> 	S32G379A : 4 x Cortex-A53
>>
>> Otherwise we would have to do the opposite, that is disable the unused ones
>> in the s32g274a-rdb2.dts, s32g399a-rdb3.dts and other dts which include the
>> s32g2.dtsi and s32g3.dtsi.
>>
> 
> That's fine by default disabled. but what's impact if it is enable but no
> one use it?

At the first glance I would say we call the probe function for nothing, 
so adding an extra overhead. When repeated into multiple drivers that 
increases the boot time significantly. It is certainly a good practice 
as a rule of thumb to enable only the ones we really need.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
