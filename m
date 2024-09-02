Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E88613F454
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725272433; cv=none; b=ePJkYzk+Odkb0jkMWwFUc2tpnA1RvrFsGaSagDtC7Hdcms2rxTMocDHNnTBlycje3Jj+onGHca0N9ecY8wmJHljJIXzrAb7uXZoi0KUxxGWOVwZ0qzc7BPOZI1XUUKlSNTJ5VI09NEXH0oknKyA75hjzb2oyD8SXi1gacYGqUSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725272433; c=relaxed/simple;
	bh=m2+SbPzms8UxM+xJL/ev64HbjIgPl7KAqZRsS7pn7eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r8scw+005vCBBzEwocJrczikDI44BWRfxPDWC3crzzYCQIdT0K1FXCztuMvBD63X57AGo288lDxyV4J3ZNVdlOQJ50eI6WvWnoDK2n3Z4jXYuSXhG7/YflwXbUAMcfB+N+sigxScXk6ypsEdMXOp5JMaZ4AGgSFDbr9NWejcnDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKNe0rAG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKNe0rAG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42c7bc972a5so2295975e9.0
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725272430; x=1725877230; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vRSKkhAdeleXt0LAg5y5qL40UQ/77V2R6wYH8YoUM0s=;
        b=lKNe0rAGxrtKDH6t0UqmAGw2Z5QjHFYIGCLO+yz0f0WhM2NTEmikM3a81ONA9pS8V/
         X+v94QpGMV6hxdmjbx3nNxLaQpNjKN94bJ1VU8NUnL+/A91Rd/Lnc+FFij+ffchIljH5
         mf/Te7Nmca6jpx7FLOAov7Q4zvPpCAhUlbkx0s51UMM0mjiLH1Yx0/aVRNmAue6JO7lc
         4hdk0KF0pnHOgIyqUxPcJF+lOgtECsrIyY/rQciEllpra7VKxFXupwj/EXAarrEUebJz
         bdCWooC+SaZFhhDHsTPO3QN+jH4elFngHBddflrSMMLDaWSZ+oKgtYtSi/D9GGfuYlSq
         z1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272430; x=1725877230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRSKkhAdeleXt0LAg5y5qL40UQ/77V2R6wYH8YoUM0s=;
        b=ZxgTa9bG/nNbzT5dkPmykcN+08da1Vh+0atQa/++NHekLRtfz5ShZCQNRV1ZNvH2tX
         GiqZC8dcefAm9lLSULEZYwG6+ufMDeoRjfwxJmSI8YberxZDcDsJ34ZMaxzuuwGOPfYg
         v3GyGQEIHVeDu76m8j20wVyjAyzhAnSmP1qXkkjS1cA0iV/PjWdL1L7yZlN/oalJdj5h
         wrDVitfgE1xpQRBGv7dHf43AR3Ze1UpxiIQkkMBRtkGa+K5sVGluQVS7daLrhlerISS3
         Zx9IOx6pqxC3A91wM5MCLa8tfMl65xKjHxz/o0LIR4rTnK3QtT4/CnDyknlLtaMsXUvB
         RBYw==
X-Forwarded-Encrypted: i=1; AJvYcCUKvD/9NjGqgpaKPOvmS9vodtfnX3yzQqggQ/IDKowWglxah7O0tDwMvY8ynosBAaigLFU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXC0m+FuG9oh2pDpd6Ld0l5IO9tVoz8LVDh0LilwtZU69wZi0n
	7jeH0NXZ8pQcWP5HN+GZlE3XDMNKnVtVknMQRXmJ41fCb2v9S6gSs7KhtCDA1Lo=
X-Google-Smtp-Source: AGHT+IGjtdOTho2XQUieF5n90G9IGbxC8GYlG09ryb+5aH9rGBOQeeQHSZh6Pjs3rtK+CDlStyH+jQ==
X-Received: by 2002:a05:600c:46c9:b0:424:ac9f:5c61 with SMTP id 5b1f17b1804b1-42bbb43423dmr38592725e9.3.1725272430441;
        Mon, 02 Sep 2024 03:20:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df100csm132306735e9.20.2024.09.02.03.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:20:29 -0700 (PDT)
Message-ID: <91ca3ddc-c33f-45ca-b55a-0e0d4a8835a4@linaro.org>
Date: Mon, 2 Sep 2024 12:20:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: arm: fsl: drop usage of VAR-SOM-MX8MM
 SoM compatible alone
To: Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240902075220.27971-1-krzysztof.kozlowski@linaro.org>
 <20240902075220.27971-2-krzysztof.kozlowski@linaro.org>
 <PAXPR04MB84596E0C1F9ED62F6A5B5FCE88922@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <PAXPR04MB84596E0C1F9ED62F6A5B5FCE88922@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2024 12:15, Peng Fan wrote:
>> Subject: [PATCH 2/2] dt-bindings: arm: fsl: drop usage of VAR-SOM-
>> MX8MM SoM compatible alone
>>
>> The Variscite VAR-SOM-MX8MM System-on-Module cannot be used
>> alone without motherboard, so drop the usage of its compatible alone.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
>> b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index 1abdeb804468..e5f982fa750b 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -953,7 +953,6 @@ properties:
>>                - toradex,verdin-imx8mm     # Verdin iMX8M Mini Modules
>>                - toradex,verdin-imx8mm-nonwifi  # Verdin iMX8M Mini
>> Modules without Wi-Fi / BT
>>                - toradex,verdin-imx8mm-wifi  # Verdin iMX8M Mini Wi-Fi /
>> BT Modules
>> -              - variscite,var-som-mx8mm   # i.MX8MM Variscite VAR-SOM-
>> MX8MM module
>>                - prt,prt8mm                # i.MX8MM Protonic PRT8MM Board
>>            - const: fsl,imx8mm
>>
> 
> Line 1072
> "const: variscite,var-som-mx8mm" should this one also need removed?

Of course not! How is this related to patch description?

Best regards,
Krzysztof

