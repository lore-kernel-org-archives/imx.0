Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B7921B905
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 21:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753910146; cv=none; b=lmxkXnGcK7aq79al6b7EZuNUcfpHqor+s9yeeXqln200TMCkcEHlmfXEXZV2B2rNZKkE0I/FRWeCl0mktxzxPw0PzkWZXJdF27uJ80DXKd+uz9kcS0LQItpIDQaUiorm3ZrA1qucC8LI60Sr6a0vtms5J/8dbX1DCRs6tpdLiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753910146; c=relaxed/simple;
	bh=OEGRR0GL1Wp5gBBRDstry2Twd8ivbUo1SBiOhiC15Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPqimKkIAULE+8aROu4hscbsziU9LMeF1rE+95qk1qURk/SCKzg8chaKE9OsbRytedFAeuXFDQ35HQMezDIcRwk3gGqRPJai4M/XDqNnKF5mVvtNOR4TXU1NTGm1MQuN27NLHe09pf7vEeQCw+HNv2YJ7EAUv9QMMqyDgiCRIug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gb9+5ODd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gb9+5ODd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b78315ff04so179061f8f.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 14:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753910143; x=1754514943; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQ3CB5Di8XupjMhTVhqFBTkn93P4HElyS0DfwyXNeNs=;
        b=Gb9+5ODdpDQHag6X1+SjaSJkm0mbSqGUFyz/D6KL8uVQwswu0TM4d0PfP72HFDyYP+
         Ztxdp70Hxym9tZe7nHkJycoR/sLDPcjLsgbUEpkY/0O/nbUVxjHpW16hwfSpkXHU4C0V
         JG4tnTiQEGpGXigEjVQsJ5EgzxUxG6cBRN4jYai4fUu8jg9hzDz02sVIlG46Ns9F1qyj
         /fMhU/KfQ09dipnnInpzfqszJme5lt9T5NOH1yASRtzx8XRW6ndOOMwCdVVZBk9/34aO
         ilArO0ffa6eoq+HGhc8u7rUN468NcPOmLzvi3eep5guNvBh5CmeqjwFwX55DNHL9/Gnv
         KB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910143; x=1754514943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ3CB5Di8XupjMhTVhqFBTkn93P4HElyS0DfwyXNeNs=;
        b=XiPRd5Pza+ktUi0qxlXMr3Qm4vpLDm1r/WLTcZZn2KwZ8eg6D3V4MEeoDGnO2juOzH
         HZ5CXsi7wMC5HX6RrUc5HY0W7zIHnxtjGvMV8/+ZzAFV6Jn2vXPknqDC2aWp+anRIuAN
         0aWaYroQjYhlej1DwEYTU4dnoPhFj0gj3SRzq7NKLcc76deA/3Y7xG18xJIC5WHvqOsT
         oGnBCQKohs3a4yyK2CcnqelDkvGyB539vT3V1zd0/9xddC2uVM981HeLulihrG7sWnmu
         ksr3fWBf4VVuim8KFEfG8N26BXfRhlBHkDxLzRPXsplYWO2jTumYXjW7LYQb0ITmhKVZ
         0Hgg==
X-Forwarded-Encrypted: i=1; AJvYcCW5/EpzglmZkg0FVUmdBWY8CLW0gzIAK6hRWgeNOxxgHSZWqwfyLz8xFwf0E99gdCaTguk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXMTt1aN6WkXff8uUuuZKuC57vFYoTrYJxQ9B7bbB7N9w/GpV1
	HFqkHMY/QAbsfNXTasJU8cIfi+FBQn2nWI/MCwtGy0K/b+NwnrVcCysAPg8lepVNlM8=
X-Gm-Gg: ASbGnctfHCF+gfEjivy0x1qHEQIlY/b/w5IHu4MB7ozj5xe3Mtw9VSfzgFytth5lIhz
	168e04Y5u7KMO2rUMzkvQWGdhRYIwnjSOBQb3kanafI/ye2FlsmQLRgAlSzNeo1xv0VCzqBu0Bk
	Sm1PpyBShfkMrjdYFpqw6wDXh/c8syL3LSDLbOX/lcyB5EJJwGmYLKjhQsAfiLquncCZ0AQS7oW
	8zQEERIT+Q6s7gThvWfxHK/zpnME6guctdyXG/BVB5uFstsQe05Oto/FUcYnJ3FlT1k7ySboaVl
	8T91Z3VooelypnOvEwycJphCuovsIFNNX86YUPLltFJwuonjXgvA9kLCu+IgJmpKTNjS9xoEdZP
	8piFV6gMKoTne2uFMY784i1S6FgXptTgeCq7r3nTzDhOBGVEdJK5p/i0tXhKciA==
X-Google-Smtp-Source: AGHT+IGiGhxu3QjHLE0SDvEDQUGCIkL2WCDhj7kxvNBJ2aCm+04aHd/hjhoJsotzbvOt/yI5531MXw==
X-Received: by 2002:adf:fa41:0:b0:3b5:e6bf:8379 with SMTP id ffacd0b85a97d-3b79502977bmr3012564f8f.28.1753910142356;
        Wed, 30 Jul 2025 14:15:42 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm122572f8f.42.2025.07.30.14.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 14:15:41 -0700 (PDT)
Message-ID: <5be6d858-01e1-4c2d-bd5c-0e3385251af7@linaro.org>
Date: Wed, 30 Jul 2025 23:15:40 +0200
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aIp+XTCSpNGee2qx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Frank,

thanks for the reviews,

On 30/07/2025 22:19, Frank Li wrote:
> On Wed, Jul 30, 2025 at 09:50:14PM +0200, Daniel Lezcano wrote:
> 
> I think replace all 'description' with 'node' is easy to read.

Sure

>> The s32g2 has a STM module containing 8 timers. Each timer has a
>> dedicated interrupt and share the same clock.
>>
>> Add the timers STM0->STM6 description for the s32g2 SoC. The STM7 is
>> not added because it is slightly different and needs an extra property
>> which will be added later when supported by the driver.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> ---
>>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 63 ++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> index ea1456d361a3..3e775d030e37 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> @@ -503,5 +503,68 @@ gic: interrupt-controller@50800000 {
>>   			interrupt-controller;
>>   			#interrupt-cells = <3>;
>>   		};
>> +
>> +		stm0: timer@4011c000 {
> 
> keep order according to address.
> 
> 4011c000 should less than 50800000.

Ah, sure. I'll fix that.

>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x4011c000 0x3000>;
>> +			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			status = "disabled";
> 
> why not default enable.

The S32G2 and S32G3 can have different variants with 2, 4, 8 Cortex-A53 
and 3 or 4 Cortex-M7. We enable the same number of CPUs present on the 
system.

AFAIU:
	S32G233A : 2 x Cortex-A53
	S32G274A : 4 x Cortex-A53

	S32G399A : 8 x Cortex-A53
	S32G379A : 4 x Cortex-A53

Otherwise we would have to do the opposite, that is disable the unused 
ones in the s32g274a-rdb2.dts, s32g399a-rdb3.dts and other dts which 
include the s32g2.dtsi and s32g3.dtsi.


>> +		};
>> +
>> +		stm1: timer@40120000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40120000 0x3000>;
>> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			status = "disabled";
>> +		};
>> +
>> +		stm2: timer@40124000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40124000 0x3000>;
>> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			status = "disabled";
>> +		};
>> +
>> +		stm3: timer@40128000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40128000 0x3000>;
>> +			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			status = "disabled";
>> +		};
>> +
>> +		stm4: timer@4021c000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x4021c000 0x3000>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
>> +			status = "disabled";
>> +		};
>> +
>> +		stm5: timer@40220000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40220000 0x3000>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
>> +			status = "disabled";
>> +		};
>> +
>> +		stm6: timer@40224000 {
>> +			compatible = "nxp,s32g2-stm";
>> +			reg = <0x40224000 0x3000>;
>> +			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
>> +			clock-names = "counter", "module", "register";
>> +			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>> +			status = "disabled";
>> +		};
>>   	};
>>   };
>> --
>> 2.43.0
>>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
