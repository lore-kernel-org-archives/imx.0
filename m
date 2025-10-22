Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5279135B124
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152613; cv=none; b=HQxKWG/w/AM/G/1NUAd3Bw+eXenjBNQGpTgFEtXMM2SAYyrMIFAeG0tnUI2nLWisG50/dntNKQYw8PM+ZsFqeJtPwBelRkyAH9yQ2OYT+OIeGYfhmiu7ja1pgUWY2To9cyHLrSsZ27GerEdbOzN6iChOXaOdL3bPwIGZCp7qi+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152613; c=relaxed/simple;
	bh=R3kdlrw77LED+wsVg0L5dNH5LTE4fMRX/9gH9I9W4H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFPsm26k6zVspq4xxFr7LPMgEJchOjRr0W4iPkHKXXiW8b2dzKOLgC47HvaCzwRTkK5S8+z5J0t5z88P34D56sJvr1rsKdcK3F0r8GGAn6lC9Bk3hIf8IZYtGdMu8sqA7ZhHKl134MDriZxzikXEJvqoRnS9vc8d7qiJaC68NoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=b/Hx9b3v; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b/Hx9b3v"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-64a6cff75e9so1944916eaf.0
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761152609; x=1761757409; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwfGThHvmVcSe5ARp0+SHwJ01qbi5m3iOi3dL9nhqHg=;
        b=b/Hx9b3v1c7EQcFzICd62ki/q+ZXgJ3mJZnrjGqL54zOh7v6APIZN5N0fYwrKMwJvp
         qv9gRRgG/tyPr+rxyyyxsp1fCglSgbJJjKB0S6xaDSaonP6qRXeKzzQbJstVQyjb3Tfj
         FhCcUWdFiIGRmUx3mEHzXB81twFqWH9d3m1q/5pr+Lhz3+KCwoWNhHrnnTTTdGJ7Xspi
         VKAlF+SQLt2BCct1nv1ddKoCHqBCMBfUdT5vDJahQdkvjOfDttJ7xETDzMj5Zclukfdv
         bPofJZ0D8UI1RJlyGp58oB9sBcAogPNfA+sqk8/BBc0Kh5uwPWZvDmyHrSqPLPrADVqx
         qjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761152609; x=1761757409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwfGThHvmVcSe5ARp0+SHwJ01qbi5m3iOi3dL9nhqHg=;
        b=L9L+MkPVy0Ziv2gKI1yg5p7q64ggP131pJ41wkgsNFmycpV2TxWUkXxgvmSTs4gDKH
         nCAQ2L0YGRJ4vjK662e6N2nXhBU6lxBIF+Vcu7glDmcXdJzLcD9aaeGEj06jTG2mlLlj
         1iF5cd8qxhGiq1Mzy2r2LVxNAd71Nmfyj3tEtai3TMQrR4EkfIBY86eqqNGdQne04gJs
         QZ7LQuVPIQF8maTjSCpB9wplqSA5XnbO6FUt03ncQ45dvkiGd9CI34CpPweawMoftp66
         EGJ/sagEmdGBcu8EcK70xQZOwAvjqSmmgiMGS18bRrCwIcnmZG4pzh2XW6vCxABm4Cgr
         frrg==
X-Gm-Message-State: AOJu0Yw2hFm85Y2+B+y17cebCfbfpRv96LyagPglCLTcqB49dX4TZMV8
	jTlAjIenkGiF8rn4/vnpSBK721KV2Xq8hTZDvYPY05gJc2ANYfaNweCgXG1mDJKq6Lw=
X-Gm-Gg: ASbGncuO0WRzBznwUIj/Xq0noPSKHhWpHX8f7FBct16CWNKyMrL/eJ9ZJleopE+rUBQ
	pztP9Dho7VpzfKqzpABrXUg0dY4aTTOMWgxVpHWW8bPWUtQDe9LDJ5E23pBbAa/aQaAH6XU4ZAT
	Sx+mf7VuFjGwgGrbg32MoubxMvV/jsicquESRpBzf0jBM796WKErAAgE4PZSD+/QIVOxDg89iJL
	8fv17VmBEOOHMzeTda7bwYLiS2LqElzY1+eRQHc0bNEUsGaoDtS/Ak04xVdAcCPAKW7MmB2uTQS
	hT0SuMdmh+SyC1eyv0cN4rR41HrtYFpWsh78hWMfD/FBnMgpT/l59lEajrHp1YAd9MP2/mJcf3S
	28Cc/RFXoFwQ2A2avlGEOTgg6NOO6MEY4LGNWUskAUu769E62x4tWfB27+3wf4Wo7RZzlkJu9Rl
	/rXkmRQO1it9nTQ5BPYv6Sh1Y4IA9o1JTMy1HR2oN7rG+XLR5rponqKRWPeIY1
X-Google-Smtp-Source: AGHT+IGYMQZ96Ni70MOY6AUaspj+zxS7uLkggZkCTrutX3cSI3hydzShXPRmiBmHi5D+RoDJHRlsOg==
X-Received: by 2002:a05:6808:189c:b0:43f:5634:29ba with SMTP id 5614622812f47-443a2fb2c78mr9828633b6e.35.1761152609165;
        Wed, 22 Oct 2025 10:03:29 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:4176:6994:bd72:1296? ([2600:8803:e7e4:500:4176:6994:bd72:1296])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65368f34be1sm318640eaf.17.2025.10.22.10.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:03:28 -0700 (PDT)
Message-ID: <0e00bb14-19c7-493a-9629-354bac3a273e@baylibre.com>
Date: Wed, 22 Oct 2025 12:03:27 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: iio: pressure: Remove vdd-supply and
 vddio-supply from required list
To: Frank Li <Frank.Li@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Antoni Pokusinski <apokusinski01@gmail.com>,
 Vasileios Amoiridis <vassilisamir@gmail.com>,
 Justin Weiss <justin@justinweiss.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251022164154.2994517-1-Frank.Li@nxp.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251022164154.2994517-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/25 11:41 AM, Frank Li wrote:
> Some board designs connect vdd and vddio to the system power supply. Remove
> these properties from the required list and make them optional, since
> drivers/iio/pressure/mpl3115.c does not use them.
> 
> Fix below CHECK_DTBS warnings:
> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: pressure-sensor@60 (fsl,mpl3115): 'vdd-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/iio/pressure/fsl,mpl3115.yaml#
> 

Why not just add the required properties to the .dts file?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml b/Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml
> index 2933c2e10695e..04703a01cf7af 100644
> --- a/Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml
> +++ b/Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml
> @@ -47,8 +47,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - vdd-supply
> -  - vddio-supply
>  
>  additionalProperties: false
>  

