Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C74253377
	for <imx@lists.linux.dev>; Mon, 18 Mar 2024 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710776675; cv=none; b=l0XlN2s3nS6Tc2RMalT/OwzZAenIXF9zQjkBV9mwLb5zfYjP7HqpO2tCBDnXE4IppYAI1DxgPSOHxTnaar8ljaakmrtdcRaYJfjfT1FxmlLBELrwqkPzZvjnQp1hrdwKzUcNcjWVqUp3fgykTVFnYxcl5tI9U+FJXYTE88EXSfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710776675; c=relaxed/simple;
	bh=gjmX/rNx4LwSVtgaz0pA95nMRvHWz6o0KY50wska20o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNd7wtG7ylNtWTjjtg0k+lnA5EGjsA61JcQjvUPDXoXE1N1qkD5ZbcuxUFre6Ycnrkk04PrmDEtdHsKRLTuubfNItLjPOrnTomJLKa4R2oD5oPqyV51A8X5K+SOc2g8nB2Y0JXe/lDjMg2bJAb67gIj//7VXvq2itmywOBgZfoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sTtr6BNm; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sTtr6BNm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so9623361a12.1
        for <imx@lists.linux.dev>; Mon, 18 Mar 2024 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710776672; x=1711381472; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJD0rqTuJJvstnAD3y/K2yGiB+m+v++HHr2jpYK0hdg=;
        b=sTtr6BNmsdJ608FlhziB3JTLqKkdC0xq5+eNBocImLIUVuK8AyUc0mBjrbNljasb+F
         1frCRK7Qlc19NZsCQLRGBpIUAHq80C7Q2j+HGg69L8vppC2al63UzRUs377nEwYzLEDb
         LM1zozFKZa0NMUkRQ/ZTklDsMjuqLtkVGospe4Xbmz5qLw58ZhZv7TFznNjvt3w4CGx6
         0obsag1zZA5NaEneuz3m6PctZxa9gmk0lKLQGx70aDwSMQUHfJyhuoFrj/DwBkt0gfY1
         Exoew7SugL/yWxYm84g0P9gHagg+4rPRPathEL0cHqpB/T3TS7sULY0jvEjvHbM6THZS
         D+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710776672; x=1711381472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJD0rqTuJJvstnAD3y/K2yGiB+m+v++HHr2jpYK0hdg=;
        b=QkdN8aTtEEwTjjEB1LvZRXx671LvsYpVihmd3+vhZ/S/ygsEhrHwXlWT4COpX8EFFJ
         hpAcya6W5H2dNDiDqg57j+/MsjCiju/B4kKcasEEryHU1m3tdQnkmaEToOmbhsIw6Cnq
         PcKpVKgdHsBU2BV2A9OOFJLLvRfqAfaad5jgwbzSWXgw47Az1PZeDYroK+tF+6Z95QBA
         Xk54p0gb9OquymZueY864sZ31fEpbWWyFdoSCOb0GG16oCBkJdLQPZdPn2QRAdaFLczq
         m95CQ4uhx5pvpG4SRNU12jtaHIypDPL0y2pXlO4nZ3n/MPkdQpkPkzluGum35AgMzZ3V
         ufxA==
X-Forwarded-Encrypted: i=1; AJvYcCXPjjId2EnBvm7oPDP4j8M0+wLvx0qMPycbOas9aNJ4m9zEdj4wMq9jd2EI93NtM8EII0NMfxeHbX+pBkAMZuQV5DOG
X-Gm-Message-State: AOJu0Yx3Qd7yBUIRTCyFQXWhKdsI0LHsZi3exLhwuSJG+WnZCZ1Zej8E
	cgQc2OiMWpPnMDvFqrPHbTdWf/9BgbJXDAs4IEx0KYuujN4kd+H8DpMn53YRswc=
X-Google-Smtp-Source: AGHT+IHty+VhQgIxNrWFy8eSIWsgi3cT6KgWtz3UQiiAh6Sllvcibq73C4uy17ydhqGTpvF7gO46/w==
X-Received: by 2002:a17:906:3941:b0:a46:a17b:7a37 with SMTP id g1-20020a170906394100b00a46a17b7a37mr24376eje.0.1710776671948;
        Mon, 18 Mar 2024 08:44:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id ck26-20020a170906c45a00b00a45cabd9b5asm4935001ejb.111.2024.03.18.08.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 08:44:31 -0700 (PDT)
Message-ID: <00408b6d-8815-4bfc-a66e-1cd0b5bb8fc2@linaro.org>
Date: Mon, 18 Mar 2024 16:44:29 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] dt-bindindgs: clock: nxp: support i.MX95 Display
 CSR module
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Abel Vesa <abelvesa@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240314-imx95-blk-ctl-v4-0-d23de23b6ff2@nxp.com>
 <20240314-imx95-blk-ctl-v4-5-d23de23b6ff2@nxp.com>
 <b4fe2ffa-bd36-404a-9441-8781f0a81d26@linaro.org>
 <DU0PR04MB94170C3364CF2F522C515D00882D2@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <DU0PR04MB94170C3364CF2F522C515D00882D2@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2024 13:37, Peng Fan wrote:
>>> +
>>> +maintainers:
>>> +  - Peng Fan <peng.fan@nxp.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: nxp,imx95-display-csr
>>> +      - const: syscon
>>
>> Why do you create five different bindings with almost the same contents?
>> Do you plan to grow on them, like add more compatibles here? Otherwise all
>> this could be in one binding.
> 
> The blk ctrls are for different functions.
> 
> We may expand the bindings to add more properties for the blk ctrls, but I
> am not sure as of now. I could merge them into one binding except

Bindings should be complete...

Best regards,
Krzysztof

