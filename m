Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6086116C685
	for <imx@lists.linux.dev>; Wed, 12 Jun 2024 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718192098; cv=none; b=t3Qrp/HQJqBX4iXe2K7ogUNy1+cvXCQWpp72Xf4z7DIBIdlPaoU4aWLugxMxEpFYCorzFDCOVhK3NoT9Ls45WGBpTv0UdfcLRmvCpCAgf0NaYDtCYcigLrOOm7WXBoXb6DK9XHEbXo3KGSnF23LtCGVD7qrA0lnwGz87NusMqDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718192098; c=relaxed/simple;
	bh=MZ0bROeIy+CQjHZ+rRTQWtZgMMK1yDMg4Ruh2BA2+4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=CZaNWEKBlIEqOx3qjO3mWmLD4Fx2rUTAADWLC60KDEUMkiW22rUG2+ph1dsKNHpPeHHy5wCX3C35mI2qHeQecdqV8cQZesQunAETSH2nBRmtPVQ6pwbqqtqZYe05P7HwPcudsHqXUzvsoB81IfhsK2CQeUvB9ExI+AJwgb9bRWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/CNldnd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/CNldnd"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebed33cbadso26246471fa.0
        for <imx@lists.linux.dev>; Wed, 12 Jun 2024 04:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718192095; x=1718796895; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5U7UdpN2UfJDP/46wGRPZr5KWrtreWY0N2ItY8olYtU=;
        b=S/CNldndeIeDFyWuRX8VG9n8SqG8V9cc6kDdtEyYjitJO1P0UjHGMS4bkTl5T6UN2T
         IiFhCTsjtDXxDzMThD5M5IcYVPXW6k78iIlcFG9q7HRgH3tOgDVNfJ4pT0OQlEJr1b0c
         nePLcC/p7BqwIq88351shjpuNqLH1wYtck0ALCkJkzGNQRlXDaxT3lnfB4a2gjfG7/q2
         jtkFyclswwixPWp09Hfv9uE3cndsH9IwMk8vxIJ1QoN0SdgZlLqdPMalPGWpX0enl08s
         cdpq5md6ByLjumXqJtQaeaiDx14uIN+zFmJpbjy2Bp1BYALwUEkvFPU2Zji9Nq25nQgR
         KaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718192095; x=1718796895;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5U7UdpN2UfJDP/46wGRPZr5KWrtreWY0N2ItY8olYtU=;
        b=XJ0iPMAHyp5My0i55kYsZ01FI4YIoYQQIxFJsv/ikHWO4zUzRR18VLWEDvy9CD1B47
         ljDHyj6Ce1Z4EYkyyzpzs0npWdNYq5YPVWnnItpYWLF4l4/zRvLZ2UE7twJ9gVgQjuI5
         trx6OcchKls8vY66tAtOOB5cRHawh8aQGUwEtBPYG77iXvBeHBqrB73EyYn2asDzmKOW
         uH0kcy+6xh22q2cR1ydhLaxQp7mK5kGc3j7nvNPJ2rWcUdNZlLaYimbczK2ZGVa7NT8N
         AuUf1STlZZOjHrdKn+9MOEh6Ol0L6AEoBel/FuSiwUhmCWDMBYafS1TCh3p+5VgdDJ3K
         fkPg==
X-Forwarded-Encrypted: i=1; AJvYcCVvjUkMhDhQsoHtRdEXfQ4AgiL2d/DjoE2Gp6geTnqwEtgMtH666u2ok9RcJajdF7KvlNht4thNEvXpnG4fll35bKyZ
X-Gm-Message-State: AOJu0YxThAivN4tMlnCLbB5BrEjLrf9JOxV/bqxekUvDlaYkK8Gluchn
	JzetFD4QY0x7HBKiK1U77YOVs2A+l1uolk7WabxZrNzn5fR9T3zNzcbR1dalteE=
X-Google-Smtp-Source: AGHT+IH1FWrncntpv/c77frag4GdO+EyR92d48FIIj1Ou8KKpm5o3pPW5TO+GoBcdkGISymABL4kPQ==
X-Received: by 2002:a2e:9ed1:0:b0:2eb:ee24:d5bc with SMTP id 38308e7fff4ca-2ebfc8ffbd4mr9774881fa.8.1718192095565;
        Wed, 12 Jun 2024 04:34:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe75e0sm23408775e9.1.2024.06.12.04.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 04:34:55 -0700 (PDT)
Message-ID: <58d0b3ed-582b-4a59-9599-6582d5953f12@linaro.org>
Date: Wed, 12 Jun 2024 13:34:53 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: imx: align panel timings node name with
 dtschema
To: Shawn Guo <shawnguo@kernel.org>
References: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Cc: Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2024 12:48, Krzysztof Kozlowski wrote:
> DT schema expects panel timings node to follow certain pattern,
> dtbs_check warnings:
> 
>   imx6dl-gw54xx.dtb: display-timings: 'hsd100pxn1' does not match any of the regexes: '^timing', 'pinctrl-[0-9]+'
> 
> Linux drivers do not care about node name, so this should not have
> effect on Linux.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Hi Shawn,

Any comments here? Can you pick the series?

Best regards,
Krzysztof

