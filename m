Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7666834F49C
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749391; cv=none; b=LqfZxq0wGHsLR5qcant98PthNCSq13jMd3kI/b2A+c/Q/0Q7E8gU+ZchEHwWshUoP66wfS6ijzaVKRdD/hXuKW9t23MsIilsvV9/eYZDaWwUuwemF4LtbGqSY6O1tNt9VbGE/iGVOvyFPEhkbxnnqCqgGjhJakHfxcP/8hXf6Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749391; c=relaxed/simple;
	bh=blmtGdraqZmNef4bdInUD56F+UCEYFIYeD4u5JV9gL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhEizoqTJjyYK/Sh5gjCYQVsoiugteW9aj3pZhBnq6KglnNSPSDwwozMWpfp2L0hM1xVB56s4vK7Pm0XqMMB5rLmLW3P3NOfdrq0Ur9dSbB0qdBc1UIQQaUy8rxlQCBk3zKR3SDrgLg+Lbt/ETCtfvo66NFbc76r7tec/6t1Noc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECofti2k; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECofti2k"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b70406feed3so98889166b.3
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761749388; x=1762354188; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+/I2yfPoWDJTBN37DUOvTovSE+HP8yoku6LrNjmVH0=;
        b=ECofti2kDAuTyC6mWaN+W12F9LcfOOGEKdQI4L+lrb//B38DVyKNAZ/vZPd3avW9j6
         uix3379oGrw7FhwLlThS8jwOmUbAhh/9rNtxK1IbSDAF+USbddAr/HOGBMZwUfcHhcZq
         RIC22BrzJOK0lEC8uocVDRTWbFy+YuZVW5dJPM4/JXyIzRfXdn0dMsXmwGSmL0szWk2i
         4Bsqfw9djj2/fIeyWSLxRTxmgMoiVaB9WEAI+ZiVvO8tSvm7BG9v0UuxoQY3Xox+ZlZK
         2qffupJLtWziO6xrDB88dbob2e2hzr3gIp3aCGmIX+DCCMRZBszmwDzjwvZA6eootilD
         ex0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749388; x=1762354188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+/I2yfPoWDJTBN37DUOvTovSE+HP8yoku6LrNjmVH0=;
        b=tzuYhEYHxm/QV8Q5bIh/mSfBIplFK6XA7rZcjtvIbTbXD63OfCYpaow1V/CS5+QHLE
         6yzbY8Qtxgmie11pQtboaJaQzqY54/srtOwNF/imKd+opZH7p2CcGW9JE33jvyKZN5KA
         6e4q6nYj/nSqn5se34OdoyG5n27cVSewwWsvSd2j7uAq1Itmq1fOSXZJaNwhjpnyTVFm
         ZmPSslFlJauVFVip9J4+Ypv9OGFQWFHlh3DDJye6UymgR2PaEMz0tp3hSG8cRRRYHBvJ
         iJYnaWwaD2oIl1h84B6lqxeOD1GZETZnEZYQiY7liAsLWxG5DTFHLvL5NzhU3k098vA1
         4W5w==
X-Forwarded-Encrypted: i=1; AJvYcCWit5XtBnDt2ugrigd9a/O2Uj0fTFC1wQ4fteMJJFDjBLmKrb0dV/ApZG7EE5KLikNSht0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxN1x6dB7x3Mp5SkWM8mv9jXcx1U2QEJ6TDbtYlDB0v0jTXibKA
	w3VLqQ+jGx4M/QPOUdGNzmbFrtl8ZWflB8DJaIo33w0buFcA6DdhFjXr
X-Gm-Gg: ASbGncuqTDMVitnU+BV91xyBOs7SX/613w+r2Tvp4HBzn/OCzbb676SGOXR6LqE6Bcq
	TV5wGqNoXwEO/CFOdkyDHE6YBI0SWKZNXNLRkpphSBaJBp7fwV/k2CpGURlArNXuqdid54NUl7R
	/2y1VRGrztccKKa6l1Ekk53/9yqdwx/B4N+OAGUtCNXjjxPgZiI1pcFBEJ7/Z6bowMkot1ALy4L
	7meToeC01fNZyEHrFfxUO5m1/HcXRkcL4qLMrrXFsc4M84pmWWCdn6U7/CIk8Oyak2rTaT7Kn+e
	KVgfrER60bMWB2jz/tJo9x/dj+s7TT1gahM/GwFwfVUPHvSDi44c0zukAOld6IXyku6EtRXqDZA
	jplGENBgDTe77m32+R+L0zDvz5xuo2PDU7Cv7ln1I0b5RAoTtklBr4bsU+wVYTHXeKY74uxPqSf
	yWj08+zs/IL0yXbQw8cxr90I/rQwvJOLth
X-Google-Smtp-Source: AGHT+IH7Dg5hdlveNGeW6IpzIDCcpEZ/tZk4UbIRTBBgmJ7JsmueX6/YbGVE72Hk++yrO2YhhzUdTg==
X-Received: by 2002:a17:907:7f0f:b0:b6d:95b3:7f11 with SMTP id a640c23a62f3a-b703d555a7amr325167466b.58.1761749387588;
        Wed, 29 Oct 2025 07:49:47 -0700 (PDT)
Received: from [10.25.210.164] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d854395absm1463176966b.62.2025.10.29.07.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:49:47 -0700 (PDT)
Message-ID: <b939e7f7-6be6-4f07-97f2-a3146682fbe7@gmail.com>
Date: Wed, 29 Oct 2025 07:49:44 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: imx8mp: add aipstz-related definitions
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
 <20250821105634.1893-4-laurentiumihalcea111@gmail.com>
 <cc465cae-a1b2-4116-82fa-ae42ad0706d3@kernel.org>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <cc465cae-a1b2-4116-82fa-ae42ad0706d3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/24/2025 4:29 AM, Krzysztof Kozlowski wrote:
> On 21/08/2025 12:56, Laurentiu Mihalcea wrote:
>> +#endif /* __IMX8MP_AIPSTZ_H */
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> index b62bb821cf61..afcd8c785cfd 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/thermal/thermal.h>
>>  
>> +#include "imx8mp-aipstz.h"
> Completely unused define. Your patchset is not organized in logical chunks.


ACK, will squash this into patch 4.


>
>>  #include "imx8mp-pinfunc.h"
>>  
>>  / {
>
> Best regards,
> Krzysztof
