Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35249299957
	for <imx@lists.linux.dev>; Mon, 12 May 2025 18:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747073345; cv=none; b=WDaUGY9l2uu18+8I+XM7MqS9B6Amyoa4NaZfT9TpUX1EB9lJyEmdOruAxdfaIYovuk5S3Hk+xsLydR33cmLZLBjjGcW8Y2Em2geFVZ8O2Ff5wCZa8oNUixQyEAOLu8T2n3BT19mdr7jFRtQzATDE5hKLYy3ra4MZqEduNL0WBqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747073345; c=relaxed/simple;
	bh=FWvYOr8sG81qYIL6uLusAIWToSTzsXn/CUa6oVyIEvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ps1qfNdGu2w4v+QA2hTeHsQzPaS+jpV/QIG7j/hlUQPpcvz3X6WSB0AjoSk6Kvy4H7Yzcp1X46wXTqiIHc3vHIISC9RxfSqsvwVu5TtM4dY8JobdqdXTdEUAPgC6jgIfId7JfgjHAcJvi5JQLBkdT28idRsli9FwOf1CIB9S8uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfvQdNR1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfvQdNR1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso2687304f8f.0
        for <imx@lists.linux.dev>; Mon, 12 May 2025 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747073342; x=1747678142; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TqGdI0u7r+KY5CbJScsuboirtiZOmF2NseWC3BorEbo=;
        b=EfvQdNR1kcfbn+Mm0WhHq+L+BqUnlcAmTx/bJ7wG414dQ5qNUuK9qrUSjnn7t99nET
         uGCU3JonUjkBlW8QkDx83hLFK2o6FaUOjaCH+wyKGBV0goQcgbtsqC5Dp3U8DEO34Slb
         zjvMiGRje8D1XvMM4B/N+5Ubhu8z4sVoP7DJB+FycmEX7hrVl9p+6yrdbi8nKs5uazvw
         jo8z7yoPqyyi8oxWac6zTRQRJUjk8imiylqCJ8Olmz1RDg7kqGITGarSlPLVzngz/Zqc
         4xCJScBvRtVb5yal7vGuknga8yqNdmm3yjUO2rYz8lzND9eGAHNwVjh0uWRrh6EQR7YD
         ZBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073342; x=1747678142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqGdI0u7r+KY5CbJScsuboirtiZOmF2NseWC3BorEbo=;
        b=qzSNvNIYbYP6igkVqPFLLFl1Aehrj09onr+C/zrrjEjUmcZ8KrsaauZXtszDbhflZA
         IJOx7fC9eplOsZrdcoF8TeOOF/t0HlJKFakeWrn17+5CSM10aPSEsrb/dNQOvfJXAe0f
         bGiE2KzDZU+lm1JaHKEhjPKhX/Gg39F/mq7LiH+d6G9GAgY6Zzsw1bk/4XsPUIIr/x5y
         OGJ6ViTbXoj3Ni+gSELB0VjV1Ql2tEYNQBWBrJAqzH0fDWccjIDijeaRNcJ2SiKmcwef
         9ETUnFubhorBpBpmjNYxo2v2hMfA1oYzS8NBAqKZ1hXM4BpfyQJGqkS9IU0Pk3UZ45UX
         6jsA==
X-Forwarded-Encrypted: i=1; AJvYcCUA0DHakh8O0KRqTT89bkQtii+2kBiY+J0Il3WtT2DK87w6TnlVFSsy7iZFt4JbGYDkZBE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxus8r+ndwIxUDBeGhqGLIcdikRDvCw7k5dxjCU4grdKauOpfR0
	8f7TInREuaZsrXMm+A5y12FxYV1HHTMSgkykyv9AloDIuaKVh3PJ
X-Gm-Gg: ASbGncs7AzsFrnUXFN/nic+DS9Jw3hd03H11d/jBqnwvQA/UsfGRxdQ1lzOS/YZKBHt
	QliLp33KlJxt8EMYWBUUCdGwZdrX02dS6HQmvxVU2fZ6BVdyR3moeLLws2TVL2zN0fY8TfIvBGQ
	5NZCXtjGA0AyFIHPOQNLH/oOCL2TNmmLvtFdy6a8hkOM2abJHZ/C8h73k/L8E7ttsciGMkjAxpS
	JWymSfo3oi4VoMGyx6TewG1G+00wSl2z1Y9Tm02vCl/wyn3eICrWTT5blTOFQAEplnA6kmfS73L
	rUYTirSkanI4jEe0TFlBYs10k/uFoNf+b/1tTRlxBcyOQCmNRcdAzTtxLKtVGwc=
X-Google-Smtp-Source: AGHT+IFw+AkbDnKjFZClxNbYQI+3I+tTSTGJnGpv7ufV8y5CAq7nGPHM3nF5qWIrKS5j7UeyFSkz5A==
X-Received: by 2002:adf:cf03:0:b0:3a1:f6fd:da50 with SMTP id ffacd0b85a97d-3a1f6fddab1mr8230689f8f.46.1747073342301;
        Mon, 12 May 2025 11:09:02 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde6bsm13417967f8f.13.2025.05.12.11.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:09:01 -0700 (PDT)
Message-ID: <fdab2ea2-824b-4b52-b880-0b097fd29086@gmail.com>
Date: Mon, 12 May 2025 20:09:01 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm: fix imx_* defconfig
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250510011806.13470-1-benato.denis96@gmail.com>
 <aCGPMvP6F6r-57KF@pengutronix.de>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <aCGPMvP6F6r-57KF@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 5/12/25 08:03, Sascha Hauer wrote:
> Hi Denis,
>
> On Sat, May 10, 2025 at 03:18:03AM +0200, Denis Benato wrote:
>> Compiling the kernel using affected imx defconfigs lead
>> to a hard CPU crash that reaches a state where each register,
>> including PC ends up in 0xDEADBEEF.
>>
>> That is because the SoC support depending on CONFIG_ARCH_MXC
>> gets disabled since CONFIG_ARCH_NXP is not defined while
>> said feature depends on it.
>>
>> The default arm defconfig is unaffected as it defines
>> CONFIG_ARCH_NXP=y correctly as excepted.
>>
>> These patches solve the crash causing my confusion:
>> https://lore.kernel.org/all/c84e8246-8104-4409-8d95-389d61bc07af@gmail.com
> In this mail you say you want to start a ARMv8 i.MX8MM board. The
> configs you are changing are for old 32bit ARMv4-7 SoCs.
> arch/arm64/configs/defconfig is for you.

Hello and thanks for both of your answers.


Yes, I have made the mistake of using that defconfig for arm while building an arm64 kernel.


I am sorry and thank you both for correcting me.

Please, ignore these patches.

Denis B.

> Sascha
>
>> Denis Benato (3):
>>   ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
>>   ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
>>   ARM: imxrt_defconfig: define CONFIG_ARCH_NXP
>>
>>  arch/arm/configs/imx_v4_v5_defconfig | 1 +
>>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>>  arch/arm/configs/imxrt_defconfig     | 1 +
>>  3 files changed, 3 insertions(+)
>>
>> -- 
>> 2.49.0
>>
>>
