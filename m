Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7212186291
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604701; cv=none; b=Au4/Axt4712yb5jwkob/YXmTaWxyLCApqD/YOvODKOCbpvWJNLl4DqE9fa1QD2RAwLTTD2uSEii8jDhhuDtK7IQtVSWg1rDKBvEvWp/GmBUIic7FUtlX/bGmmvon/b/dGP2PqySQNewOls2TPRRC/PLvwEy6VXDySFOMF2q4vCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604701; c=relaxed/simple;
	bh=vpGyn37HoKQU9ZCMZp6hhzA0NMH1CjBNZyXDjfo6eko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qP393LzC0QwQjwztQrRdkBv3PFlroRpHhIWzZKmSd3ZK3esAw21mhhN8Cm5vuPnjSa9W9boPiNfTzvhph4ktxH7iISb9xA7MUUbN/KW4jG20ol06L0Xv3O8FFn7u2xvlFRxTbuS19RoWCNEzjjOzXIWjVbgxTFzNCio9wy8XWEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q594b3ek; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q594b3ek"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a63359aaacaso606810366b.1
        for <imx@lists.linux.dev>; Sun, 16 Jun 2024 23:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718604698; x=1719209498; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9kdEToaRtEtLTBxGmIJLoLouOnpDnXZ/+scsxAQ6PL4=;
        b=q594b3ekULw1IcO8apz6/eqdzE9AtDEqJoVmoyuuUcirdduzeuc5naTPZDn36bgtRD
         JFpwmf0uTFrhhjBqyQLP0j5HqQ/CZtxHsGOb5xKEzYGtbECTdDTz/5U0C3XRdAZWX6Bn
         NGWqQx3DQFRDmes4sSBybCaeB0xyr6j+OW7frtFAm/PVHvwQLLHASV4ow0KuRbgflZDZ
         s5rKYeNOWqj9bNUROYQJZr2BOB6Gkz0RtTdCBEL9Rh+S8JMlZCsl9m7FqOxitz0LmOYe
         kNsAlE4KH9l6dHvGJ+DagT6Qk9+wJ9nuixDFGMW2ihf16/pgOyXOLE/hzftTRrZ/getY
         S0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718604698; x=1719209498;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kdEToaRtEtLTBxGmIJLoLouOnpDnXZ/+scsxAQ6PL4=;
        b=RoIV/f1xAIXhnJFP8XOHA7xf8PoCpxrtn75RO2uLNI0/DVwTQeg10T5WwvwNNS4pt/
         yZNS+fbrXRu1c3f2h4YZ3aLrqwRGSCIcq8F8QLu1NVgIK1hqVe7eGF+5vHEdLwd4prLA
         bhZbHswOKU4BSwhEOijoP2eXhmPaP1B3L1Z0f019PXBHi2M0fhbjfFNamM/2PUqeKyK/
         hLUa1nOuAr2euRltgV40jzQphmeRXH8SSjboU59A0nE4L/8lRYwt/OPC0jlLKX082zty
         DEX6+CNLJ7nzUwIIIjiC8KDTDTF5kV8KSqXrSewPRdyhWl+qyE9Wm0jkefwL2CbAy4K3
         c6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwLLJHIb6u5MwgSYEYQ7U0PjKi3uhT3eXr1hRRzJZqlfpeoKggZDUg5D3Pq6nV1+0o8DB6d1+7EOxsE2mxg2ko9VfG
X-Gm-Message-State: AOJu0YyE49ei3RGrJCWb1DDkL2SXN+zSakCXP+OV65nS/3osUJSmQtSW
	CQN45HCJ4eaH4bJeqmtTgrtYuoxYWB/YZOaoBhcz25e4/72vUsI/3Jiea7D+LFA=
X-Google-Smtp-Source: AGHT+IFRvJX2rYvRV7Pzan0qIx7xvzoBrqprat8773thSOqIPo4ExMRRUq3jvVxaxcAt7mqtQO0Mkg==
X-Received: by 2002:a17:906:c29a:b0:a6f:5957:7b8f with SMTP id a640c23a62f3a-a6f60cefc2bmr570704666b.11.1718604698066;
        Sun, 16 Jun 2024 23:11:38 -0700 (PDT)
Received: from [192.168.0.18] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db67e5sm480498766b.66.2024.06.16.23.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 23:11:37 -0700 (PDT)
Message-ID: <0fa211df-5786-4447-9c8e-1c57528e8582@linaro.org>
Date: Mon, 17 Jun 2024 08:11:35 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
 <Zm9ZUWpievH+P8Yc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zm9ZUWpievH+P8Yc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2024 23:29, Abel Vesa wrote:
>>  
>>  maintainers:
>> -  - Anson Huang <Anson.Huang@nxp.com>
>> +  - Shawn Guo <shawnguo@kernel.org>
>> +  - Sascha Hauer <s.hauer@pengutronix.de>
>> +  - Fabio Estevam <festevam@gmail.com>
>>  
> 
> For the clocks, please add me as well. Don't mind having more help from
> the others :-) . But i.MX clock bindings usually go through my tree.

Sure, makes sense.

Best regards,
Krzysztof

