Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1321434DB57
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749244; cv=none; b=WqSO57etBXDjT5S9Z0r3jCDx9ihAsHg6cHXlZDH702Md8cEQzUh2y/8QaTKgqnhkdz7MijC31J0M9FttzenargPZqrhvbLLnfun7GKQMRdjbOLBrjRybjRd6wEfdpDqK+nUOe0qpioUsvXt6oItZjMtSIPgXwizRgrR7EH8nNIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749244; c=relaxed/simple;
	bh=LTP67G+nQEoavdX5Wqu457R19zx0Ya1qFOJgtgAcoUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPyH4+0copfGlmxn5uBjvhu9qSbdH9c9GoUNiuG/FtMO8EBZ1Rx6xF/Yfb9dqvXqldhPProdozFjf09h2iqtD2yAkbUdnpyBIDZ99nm4pDX836qYhrWpJqtE54r7g0AUaArmFl6SRn/in7J3G98A/BjTUou5e3DlDBGywu8RxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRgZ+W4g; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRgZ+W4g"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so6046736a12.3
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761749241; x=1762354041; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8y7IaEKl9ZSpE7jjzq1dSeS8kFbTxAEVZQkW1AF3jcE=;
        b=ZRgZ+W4g0mgVlA6W/MqaWJCrrFrjP9+JHyEgCSTaA5nO/WYuPUz6FoQsEnvZ/9k6Lq
         v9kFAT1RqFNeC+A4ZFVWD1KOvFQYWzjo9PuyTtOgx5HXBXuiUjt1NoCxQ+5kLIWOw2tc
         CeD4SpZw/sEh1LnQZhZFjHdASyqLoELAe53Naqiu4ptoZvNfpYNboJN6CzGpuBfY9rXu
         dujxR1i6/IL9uME6E1XlB9PJkHJa+zpUv2K/XwE19pnX3N08IGCnsKT3C+BiKwm6hVSt
         EBe4PFwX1HVWO8xfmg8ptarB6yQLFSVEx6+o04mVbKnfS4sRiQFxswdEhJu986IIhSUL
         H/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749241; x=1762354041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8y7IaEKl9ZSpE7jjzq1dSeS8kFbTxAEVZQkW1AF3jcE=;
        b=flHmI3Aa35Vzwy4lbGMWWIpakAp529uFyi6qOGPtk4R3SmYG9o9VFUxzgy4bY53lgp
         0UGSuPUx4VWJxsRPdXIupI47THOGQKKJeHZVHUfDPBT4t6IWq7EoMN3fFMY51wGXYddg
         DXLfSHCOsmnfikylCYn8vj6+dZzpfBDnDPDOs2/Yxes/tTXCqQ1DpR3Rm2gaVSVIcCDB
         MlT3XDEkNLaGl/dK5M8vlMTxfN8lWiXE0ibGPAsiOlRzZDicCHHc+ZdlscfT3su2muo9
         rXXefhC6Mmg6ktjGlaKEyDLX3prIvI9ajsYVYiENRgq6V1pP4t+HWOPg/p6fS7zSyYhu
         pn8g==
X-Forwarded-Encrypted: i=1; AJvYcCUhfoT8uWLd90NoXfIucmS+gAAO/RwUKH8GW54uXh9TkN+TsPbQRqL+Lm3Zfp0B/0yZYe8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4doItYTh/ITWDxHejgmTC9Sinhzvk/oSnfr+aM75QFm0ZAtTF
	G8S7ebRuKE1VE0SD0SxvA7CyaLMa8QfXDQCPgnfsqfiQ1QSleiZq1mp9Ou4prj6sQkE=
X-Gm-Gg: ASbGncvU8WgNQSuC3CJE1bEV9Wmqd7j1iovloHUHRWaYlSp7+OpfiP2aWwt053/+kNV
	4GbM3zoHIS72/i3HuAI1w2oq/vVuFH7yQtHw02TDSeRPlfGBUbfDc1qYgeztRnDCwV9szPFUUII
	0H/b18Acf9kQQzn5V2hKtgqX7NttEZzakqTTIau+/jP+zKX/pa/rekN136adLpKX5Dh6rauipUX
	OQbuFFjfDgxOrn7xyCd0deeAerkKLZoitTyvmwz5iOGvUnOCSfT3cSiwDuyXaGA9DDnjlEt0uv3
	H5reEa1Nq8nx7U2OzO+ozwZLUzflMEy1hxYUcWY3fmv4tLjycy+regZrSMPlJ6GfeY59zNdhkSK
	0WZxnWKUTxYT7uAdoHWyb+ObNg7VljkvKJeDrBYUu8w5DdNJF6h66X1eqPrhzz/p1Q6IciX/p0F
	zPuXXvcWzA6lGI7Fsi7re9iFvK6lYylzat
X-Google-Smtp-Source: AGHT+IHgORKDGPw+ITEWuAutZRKq+hGzvmS0B08lzp6+SYDYojWyhecKTsUlp7KruwEoQhiFvx9elA==
X-Received: by 2002:a05:6402:5207:b0:639:c9c2:3956 with SMTP id 4fb4d7f45d1cf-640442692d9mr2330509a12.28.1761749241215;
        Wed, 29 Oct 2025 07:47:21 -0700 (PDT)
Received: from [10.25.210.164] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef9a5cbsm12168527a12.23.2025.10.29.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:47:20 -0700 (PDT)
Message-ID: <20a3325e-d8be-4a1d-890d-bf112d170bcc@gmail.com>
Date: Wed, 29 Oct 2025 07:47:18 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
 <20250821105634.1893-3-laurentiumihalcea111@gmail.com>
 <e25494da-9d27-4416-ac79-317c8b9a6653@kernel.org>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <e25494da-9d27-4416-ac79-317c8b9a6653@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 8/24/2025 4:29 AM, Krzysztof Kozlowski wrote:
> On 21/08/2025 12:56, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> AIPS5 is actually AIPSTZ5 as it offers some security-related
>> configurations. Since these configurations need to be applied before
>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
>> be their parent instead of keeping AIPS5 and adding a child node for
>> AIPSTZ5. Also, because of the security configurations, the address space
>> of the bus has to be changed to that of the configuration registers.
>>
>> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
>> missing 'power-domains' property. The domain needs to be powered on before
>> attempting to configure the security-related registers.
>>
>> The DT node name is not changed to avoid potential issues with DTs in
>> which this node is referenced.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Where did it happen?


https://lore.kernel.org/lkml/Z+xY4wZ8ZFSOJhGS@lizhi-Precision-Tower-5810/ <https://lore.kernel.org/lkml/Z+xY4wZ8ZFSOJhGS@lizhi-Precision-Tower-5810/>


>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> index bb24dba7338e..b62bb821cf61 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> @@ -1396,12 +1396,14 @@ eqos: ethernet@30bf0000 {
>>  			};
>>  		};
>>  
>> -		aips5: bus@30c00000 {
>> -			compatible = "fsl,aips-bus", "simple-bus";
>
> This breaks all the users. I understood explanation as "it is better",
> no real reasons.


sorry, a rather poor choice of wording on my part....


the reason we're doing this change is because we need to configure the bridge's

security-related registers. If we don't, masters such as the DSP core won't be able to

access the peripherals connected to this bridge after the AUDIOMIX PD is turned off

and then on. The configuration needs to be done before any of the masters attempt to

perform transactions to the peripherals.


yes, this change is not ideal and we've had problems caused by this

(see https://lore.kernel.org/lkml/20250707234628.164151-2-laurentiumihalcea111@gmail.com/ <https://lore.kernel.org/lkml/20250707234628.164151-2-laurentiumihalcea111@gmail.com/>)

so if you have any suggestions that would be much appreciated.


>
> No, you cannot do that.
>
> Best regards,
> Krzysztof
