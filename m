Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE21EC006
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 14:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755613821; cv=none; b=hcddjGHN1KS1MqRX1q/jcpx+st6gQ+D61t6aEWdnWbYHH8brMgBScfWJrH767pd9YC4MrQpSmiVn7E4oDPOZAnFvPg2WiJgBL3KxakfHKoWk0sM3jz3YIysuh98vxdelxaAWf+LNYLqgmoGGvI3h+0Ff46F/5dF9WVXhrjPUfl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755613821; c=relaxed/simple;
	bh=BHb5XD3m30dVa31U4JXmcUnl17RQxKxpugYlmcZkkgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsUxdQaUuMadwhJIlpgZBLJnavez4uMUS1A8eZc82vjIn57IFoDt1rAp21hnmK6RqV1Ze2OKRA0HxtAcm86ASnxJh4R0ci2BXHHTCwDd40JFa4NwN+TCu230OFKvz/UADI8DSfB3kON0vSespv9kcOQcCKiB7W7i4BwG/pgsh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rnlECPix; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rnlECPix"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7a01426so93510066b.2
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755613818; x=1756218618; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hybfEz1ih63ikoPDM1Ar1esaLuaGhNzZj34A72ctWSg=;
        b=rnlECPix+ibwjGNlBPELjM/nWp/uXgD1KNdT/4xo6jlIYnOsWHCj01YcJ34uaYHJLI
         psmw6QdYYz9cy/98SURO2Ab4P+Ut64x1tuRlmmSKPUQYPJ0yzkDu5lDJcrk/fLovVNbC
         xz4V8BG66vGIqmYIFXcDtBRbL3x0wcGfAvhimpoLkX4iQaRjh3fL4ZRtWYQSODoOR+QI
         AN/eql+0liMdFejUvs1Xu3ddCHGaxAVZW/ST0UIdxsEdkQ87MuvSrOScmBNsNA5tE2rh
         IyfOcj3ntK9xbwwU+8/7uDHWpLD3TXO8nJPpCG85RF+NwaPikt4Bae/NyVeiC0YiFwZn
         ZU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755613818; x=1756218618;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hybfEz1ih63ikoPDM1Ar1esaLuaGhNzZj34A72ctWSg=;
        b=o/1IgSMQ4Bv6mSi3jJCcpsS52d1BiqRFuOHj4l/YoQF3dy88OUx5xd9CX5dfv45ecm
         pIGD/x2Ts17WdFUE+RlAlhd6OH8q4Yv8UJzaRXBIKJT4skYvJfEI+hAVWCRmr40is3i/
         llnc+KlfaaCz7Kt1Dn60rNwxeyGGg1fifHmaH3UCecK7vNPeNWtI257rgo4Sy8HZsvze
         ht54hTlMA+rQzq1JOAufSycKYSlNOdiPcmBNK2FnLGg3lVMIBApprXYXOEBmi3a2lNef
         X7+3rftlOdxXyocEwjF56346ahpca+8ZYaMSL4wIqWZ5GkMu57BwIzmZ7AvgUyJdIRk7
         8L3g==
X-Forwarded-Encrypted: i=1; AJvYcCVIfQU4ypeN7zJu5ITFnkfvYXEVoFBm0lixWX45yGvUA0u++MGunCvNBxJrHknF3mVlBEc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyJsgM5rGFFtq1L9VXTvjxeGovxp5x6Y+ahkjXkgrdekflAL76
	aNJB1kFMK9Aumtr+51ymUiHjkb7XttWmQ4VVhi0K8d5MoaxV6jtWH1twtj5yo3C0Idk=
X-Gm-Gg: ASbGncsJ18pREE7ur+Wn65kD0StWKfsZS2yupJSN3Y1PtWzOm63Hia8F+qqMhcyc0fl
	Xyd1egLOIEEcfsTTzWM0lcSVs8/9lf5bANNBTat/Jxwk2Yyb7jIMLholM9mV3+xXZPM1XjKOApU
	57c8JsRJHjDhGzpMKclHebAT/uE8GwZJNeVDSdLCLzj0NXdOfXOG5cI4jFCz5+wUfGCkLa6RAwr
	xIHRTJ5jw79awH3vhtqy/YgyvOEPE4HxhqwUGiiD1Jiw0TbDsgrMMhm82P6TDBEMF035sx/Yb18
	Rk+zLDZ64cJ3suyu7cy1Ksozdx/ZzxxySXYD3qDJJ5wYg1NKJhmYTx6MvbvP5oE3cUoIpC7Ytt2
	esl7NGwQhuG6ZoU3btI0NzMwPDS4YizMr7yGclCTn8aM=
X-Google-Smtp-Source: AGHT+IGKPmRaGgK8HMhsDrZZpgNZ2uaUF2T2I9/ycTbkOOLbzeT+kBHZXU5Q5tFNqRz/MeyRprIvDw==
X-Received: by 2002:a17:907:3d03:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-afddcb63ca0mr111993566b.2.1755613818281;
        Tue, 19 Aug 2025 07:30:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1031580566b.35.2025.08.19.07.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 07:30:17 -0700 (PDT)
Message-ID: <b4d322d8-b55f-4345-8d9b-8efa4e9b76d7@linaro.org>
Date: Tue, 19 Aug 2025 16:30:16 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Minor whitespace cleanup
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
 <20250819131800.86990-4-krzysztof.kozlowski@linaro.org>
 <aKSKIkUTyc391CYS@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aKSKIkUTyc391CYS@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2025 16:28, Frank Li wrote:
> On Tue, Aug 19, 2025 at 03:18:02PM +0200, Krzysztof Kozlowski wrote:
>> The DTS code coding style expects exactly one space around '=' or '{'
>> characters.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Please kindly trim the replies from unnecessary context. It makes it
much easier to find new content.

Best regards,
Krzysztof
