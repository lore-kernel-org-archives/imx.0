Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745E82E417
	for <imx@lists.linux.dev>; Wed, 10 Apr 2024 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712730872; cv=none; b=Mr1V2TzaxgqaoW3AkZDEoxSVE0H2h4yHyJS8JYrDo0QY8ijmvhAKwxQbYHFT4ciWfH2TOzMXTRkt6vUHqUtGTyX/OZJ5BZ8Qzwa3Eu/XNz0lSumu0+PmWMSKAh74FzMETAz2a8ujHM22tQisvCmnmNd9856EV9h5WkeTij7r3HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712730872; c=relaxed/simple;
	bh=fP7ZYTCP2Cdtmo6OmKBxrC0LSQX0ryjEqk/dY6OTcF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tifF44DJ5QPQj1Mp+PX7fVjQ+8wzkw4PtZpmiwOPBR/+YYXoOUX0TmXbouYA3cb1yx/tH4qfEksRb78dIrwSJeLnmgC4s0g+1Ze79NHCXhFwkG9AIBuZrmeeEpYURYLcU1dvvz6+rymERxFk+fk897KWWLsklJkpXrva85K51Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NA1+vROc; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NA1+vROc"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a51fea60c0bso147999966b.3
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712730869; x=1713335669; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N5979IbGYafb7GZr+3q8Cz1d31k/aPg4+HIqBqNbL8I=;
        b=NA1+vROcdPUt4oo2JO0WwDVdySPzu0y4uWvVeluaUb4eLs8NkZbQ31rquAtYA4cZan
         q63Xv52dDLsL1Gk0/ZrcVl4IC9TmewuCx3184kRMdXtpVUfYLHD6ATc2wXPuVsSCoaDi
         kM0JRL5rhVWGyJHm9NLwdLyg4Ct5ilGBbHGIUgM5R03j9OCSMmYLLmvTZW8wfSwWUhwO
         egEOpz/pLBvw5MakskJST4JK1Agh15theDpdEdNweUJ/EEeUJMII45U9tJoEXxXnwEQY
         hgifycyZTCI03JZRKUJ6L44Np9UIo1aua66OZpDbJvif2k2tYf5Z+aa6vxwwTcMpCTys
         4/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712730869; x=1713335669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5979IbGYafb7GZr+3q8Cz1d31k/aPg4+HIqBqNbL8I=;
        b=ePbMrh5HLlGpcPbSeGkFtxeil27jZ7eixP+A6G75Rpp0QDpQVQmtBCMxVm88FMwAHR
         d8XRBzP5Wb7CVyB/Bq3VAvrIxwU26h1P56hf13UT7bF2EC9Z/tLF/vF0TmG1bBwPEHUt
         IJG0Z2iBDSHRComGMXtzLMHKA+ZmeTgFCK61yqicks3v3OsgiyiF5jMDgcI/Gn2AzQk2
         /4ixMjd4xKanlH6tMRB9Cf5axsCxbyw+zw9PpGJbDl4nyIstIpq8hYz2shBm/qu/6o62
         cs2sDoH9uXShReRgASUiwybTmgTzKGTAoRFONQ6pOZ/3tiwpf0w0mcP+5PW/kNqWO8iF
         OpBA==
X-Forwarded-Encrypted: i=1; AJvYcCUxfamRv9ctDRwrazFHPHkelC1jc6dUnwG+fywPnrf4AioJQLWFM4lplr/tz8ZqLf20JhVRHB7/4ffLQ6Pe3hHWi0mg
X-Gm-Message-State: AOJu0YwzYivNONqnpWZm/Xi/erayUlEpgYQvtRKRZR+JgyDAQDe3o9cB
	1C6wSpUBXretTiNfIYFGEOlFm8tn82Ue62Q3g4att7BFlGh+CeP5yMxi+SecQT0=
X-Google-Smtp-Source: AGHT+IHK0Xzsw7nRgIYHGdHnEFc0s2qdj2x6Ea79N0oZLEa/ugKtyHWIW5uNi6hCTEI7aiOZoi9lBQ==
X-Received: by 2002:a17:907:3f21:b0:a51:dcda:dcde with SMTP id hq33-20020a1709073f2100b00a51dcdadcdemr1452008ejc.70.1712730868743;
        Tue, 09 Apr 2024 23:34:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id g15-20020a170906198f00b00a4e2bf2f743sm6522145ejd.184.2024.04.09.23.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 23:34:28 -0700 (PDT)
Message-ID: <d53ab0fd-cd12-48ec-9a80-6ae17690b726@linaro.org>
Date: Wed, 10 Apr 2024 08:34:26 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: imx93-11x11-evk: add rtc PCF2131
 support
To: Joy Zou <joy.zou@nxp.com>, ping.bai@nxp.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240410033256.1341662-1-joy.zou@nxp.com>
 <20240410033256.1341662-2-joy.zou@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240410033256.1341662-2-joy.zou@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2024 05:32, Joy Zou wrote:
> Support rtc PCF2131 on imx93-11x11-evk.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> Changes in v2:
> 1. remove unnecessary status property.
> ---
>  .../boot/dts/freescale/imx93-11x11-evk.dts    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> index 07e85a30a25f..e66723ed25c2 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -281,6 +281,23 @@ ldo5: LDO5 {
>  	};
>  };
>  
> +&lpi2c3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-1 = <&pinctrl_lpi2c3>;
> +	status = "okay";
> +
> +	pcf2131: rtc@53 {
> +			compatible = "nxp,pcf2131";
> +			reg = <0x53>;
> +			interrupt-parent = <&pcal6524>;
> +			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;

Fix indentation.

Best regards,
Krzysztof

