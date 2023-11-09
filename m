Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD21DDC3
	for <imx@lists.linux.dev>; Thu,  9 Nov 2023 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y94ZZoPN"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53b32dca0bfso2295455a12.0
        for <imx@lists.linux.dev>; Thu, 09 Nov 2023 08:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699548702; x=1700153502; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EB/GVelCwv918J74mEa2RtiTqM5Zt5ATdZIb7vJjWqs=;
        b=Y94ZZoPNcEiujcgd/qVb9/N8mMlwvkCV0b3YczuygosJ4q5JFHxCyOmjI0/PWmFzKU
         qujrpL+qc21fpcKlnKlseh2OJXm8DDCXDs1UM7znaXkp4XPacgrxOZhIasVpAQYmJ/7f
         uH0MABThsIPrXOCNgHr23KGoG0Da6eOxOx4KUE5mHLBY76HWuFDgE1VlgVCeAcaoWmLv
         xTFfIfwgP+Sa4NvvTjuBchgSQb3RKwWe9uXB5jjsEwet72VBW3LgDT5+W4F5/fKO998a
         EJVecfRv+POspP0gdSnrjuc6PUiJGWZjQ73t6od7roV68N4xbg09Xc50ujg31N2cAP9M
         kDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699548702; x=1700153502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EB/GVelCwv918J74mEa2RtiTqM5Zt5ATdZIb7vJjWqs=;
        b=HA0hBw2rZp0AmlBdskl/Iu3XbxV3t2DqtRapGddYMwkTy+zjDZtsZnVNHif8KhbacM
         iIzvZcU6tbOVfrVyczX33C3cEGx5bzDL/9uE9dpsCN0fXwwg2UMB3COUTQ5PixW30j6Q
         /1q0ocrV5V9oVlfMkQjkK9KY/YNZjRl2++LQ66ge4/hSDenIf/WuNM6aowU9BSO5RSLm
         OmYSBDfhVRD/Wx4HGl5bgwkJ8naWGT1OrXgEAmM9Tq+33djKjnv7OrOhYBAJat0a6BIJ
         X9h7PUdjgEGGG6HkE497ytuZ0YqFfErG7ZsAhP2ysiJJb6g5G+OQHlH5YwDNBHrneRsF
         tStw==
X-Gm-Message-State: AOJu0Yxxnm0hnWz4potxtFaaNd6WNZ/sxzhy2Udcmy+J62k0pqghcRjE
	mtCkp5azh7EOUSUZ6tonEeGmKQ==
X-Google-Smtp-Source: AGHT+IFbGuVzjNYYjJEj8Z6UtrMmOE+jObppKQkMkmfZJeCsI4LVyZRa2bt4nhjL41nb+31LKc8H+w==
X-Received: by 2002:aa7:c79a:0:b0:531:14c4:ae30 with SMTP id n26-20020aa7c79a000000b0053114c4ae30mr5471759eds.0.1699548702186;
        Thu, 09 Nov 2023 08:51:42 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id d4-20020a056402516400b0052febc781bfsm34335ede.36.2023.11.09.08.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 08:51:41 -0800 (PST)
Message-ID: <847fc857-0229-4e5e-9cac-4be5bec6e9c1@linaro.org>
Date: Thu, 9 Nov 2023 17:51:39 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx93: add i3c1 and i3c2
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>, shawnguo@kernel.org
Cc: alexander.stein@ew.tq-group.com, alexandre.belloni@bootlin.com,
 conor+dt@kernel.org, conor.culhane@silvaco.com, conor@kernel.org,
 devicetree@vger.kernel.org, festevam@gmail.com, haibo.chen@nxp.com,
 imx@lists.linux.dev, joe@perches.com, kernel@pengutronix.de,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-i3c@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, peng.fan@nxp.com, ping.bai@nxp.com,
 robh+dt@kernel.org, s.hauer@pengutronix.de, sherry.sun@nxp.com,
 xiaoning.wang@nxp.com
References: <20231017194657.3199749-1-Frank.Li@nxp.com>
 <20231017194657.3199749-2-Frank.Li@nxp.com>
 <ZUz/8fBWtnwdSW9w@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZUz/8fBWtnwdSW9w@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/2023 16:51, Frank Li wrote:
> On Tue, Oct 17, 2023 at 03:46:57PM -0400, Frank Li wrote:
>> Add I3C1 and I3C2.
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
> 
> @Guo Shawn:
> 
> Driver part already merged. 
> 
> Please pick up dts part

It's merge window. What do you expect exactly?

Best regards,
Krzysztof

