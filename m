Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7961C290
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712299325; cv=none; b=iJdjHabCxAAoCSso4kSEYx7EZogp2R6sUUUXEzg8xL2L4v4u27JBu4XFapO3QxlNhXlqpZsvjuPK/dBvy/zUvS2bJszsszMohc7OcuixAgX5SKugBUzLRrI4HOYfiJhJGRsiBnT63GmcHUbqgcts7G1gNc2kZfkaRJfbf1/11lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712299325; c=relaxed/simple;
	bh=27ZDnDYcreKYKVkxxboqJiIR8plnoxwbZp6QI7ua1Tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ppuRAxxJeArRXIvB3Cx8Om3QB0AvRAJ4Oc5bYuunCAQbT1eogqNb31urrZpQA+O10Q2OrT6C6WphsXj3oBb3xfkbzS97QtDwLLCxN7C3mIa7WDQdRkoYvbqKTBotnodWyHtWAkdgktJlMyj8jCUfFdF6o+pjxg8Xw1rkqe0BEaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PoXhbgOh; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PoXhbgOh"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a4702457ccbso244968066b.3
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 23:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712299322; x=1712904122; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IPnNLYgZW0WX2sa9dn47g+8KSkqH5iQC/NjMxuo4I6o=;
        b=PoXhbgOhotxQgAc+QWpuVtfzmMfKbv12LlXuzU2IcfCSrJv2tPhIBHXY1sYc9UAdiU
         koUoeiLNL8WyVe4v1AdLI3LlH+9FU6oLft1g2i98marUTQxSbYxu/jij3CzSZtmQ/nj0
         3AT5XOfob6Jl5KHBTHRzVrzEMwlkQ5Bj1Sq5PoicoNQPNeIAeXDyhzdrf+FmQo1B3azK
         6K/kh7MEEO/ojKFV22N1Ret9EDdDtLwn/6UznJ3dfSzGgO8QR8fNeY80WyQJowWpWbye
         exbW6T4/JLUxvn95YQpNHgikqgyu53e/g7lpTDD4qUJavVRgH+TY39sSXn0PBEk41fAw
         XLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299322; x=1712904122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPnNLYgZW0WX2sa9dn47g+8KSkqH5iQC/NjMxuo4I6o=;
        b=nCNG/cvD7Qv680LzF+JWlFDH0sHK9DzorMNATaV7fAvFzH0UM5WOMByZWZgwzhYBWQ
         QYF6ioUxh6dkTWQdBHABBvzUGtBZ6bWL6QcMFwEvbps8SkiBQDvxLLx9R36c2mAqRyqK
         7/NZ6wCY07WI+1JrlB4uR4JNIQ9chsYVYz9oom9Zi3CvKugapfpQ439CYOj+eqdZ82dL
         RBXRY5he5/AyyxWVcyo5CWNKGIF9toZypDEeM9q/erMVu3LwXoO1ck7SEZk8nK5L2hys
         S2QLoHT8C33GXbAgpj1xbDTDrVvJltcz1zSQeIkOG5CbGZeW3eb0SvWM/qIe1Sa8rnEf
         JxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd08zFbNE+QaVqJQYkq94XOW0ljhY920+dPr+bKXaTSiXy1GW6aAn8fiFr6sv1d5eF7fJKLbZMjUEi8IgrZ2Beg5X6
X-Gm-Message-State: AOJu0YySXh1Ivqo5FT1x8FIufRPLJH+epkfvdwt4OR5A0UHtpV58Ct5n
	ls70e4aqqeuNuL0UwzgmissBeADRDNioqB6APXkPl6s5NZovxeZiPKJgDUfdzKQ=
X-Google-Smtp-Source: AGHT+IFNUlyigu2MXLi3aIrasre8AlM4h8shDPLd+LOUC71UHVHPd76sjCNtKxKPgmUKxbIAbsvDyg==
X-Received: by 2002:a17:906:459:b0:a45:ad29:725c with SMTP id e25-20020a170906045900b00a45ad29725cmr287471eja.62.1712299322096;
        Thu, 04 Apr 2024 23:42:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id h22-20020a1709067cd600b00a4739efd7cesm482395ejp.60.2024.04.04.23.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 23:42:01 -0700 (PDT)
Message-ID: <efc9c624-6a31-4299-a604-8aad1d0cd878@linaro.org>
Date: Fri, 5 Apr 2024 08:41:59 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: imx8qxp-mek: add cm40_i2c, wm8960/wm8962
 and sai[0,1,4,5]
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240404161914.1655305-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240404161914.1655305-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2024 18:19, Frank Li wrote:
> imx8qxp-mek use two kind audio codec, wm8960 and wm8962. Using dummy gpio
> i2c bus mux to connect both i2c devices. One will probe failure and other
> will probe success when devices driver check whoami. So one dtb can cover
> both board configuration.

I don't understand it. Either you add real device or not. If one board
has two devices, then why do you need to check for failures?

Anyway, don't add fake stuff to DTS.

NAK.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 210 ++++++++++++++++++
>  1 file changed, 210 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index 8360bb851ac03..adff87c7cf305 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -30,6 +30,13 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
>  		enable-active-high;
>  	};
>  
> +	reg_audio: regulator-wm8962 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3_aud";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
>  	gpio-sbu-mux {
>  		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
>  		pinctrl-names = "default";
> @@ -44,6 +51,105 @@ usb3_data_ss: endpoint {
>  			};
>  		};
>  	};
> +
> +	sound-wm8960 {
> +		compatible = "fsl,imx-audio-wm8960";
> +		model = "wm8960-audio";
> +		audio-cpu = <&sai1>;
> +		audio-codec = <&wm8960>;
> +		hp-det-gpio = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
> +		audio-routing =
> +			"Headphone Jack", "HP_L",
> +			"Headphone Jack", "HP_R",
> +			"Ext Spk", "SPK_LP",
> +			"Ext Spk", "SPK_LN",
> +			"Ext Spk", "SPK_RP",
> +			"Ext Spk", "SPK_RN",
> +			"LINPUT1", "Mic Jack",
> +			"Mic Jack", "MICB";
> +	};
> +
> +	sound-wm8962 {
> +		compatible = "fsl,imx-audio-wm8962";
> +		model = "wm8962-audio";
> +		audio-cpu = <&sai1>;
> +		audio-codec = <&wm8962>;
> +		hp-det-gpio = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
> +		audio-routing =
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"Ext Spk", "SPKOUTL",
> +			"Ext Spk", "SPKOUTR",
> +			"AMIC", "MICBIAS",
> +			"IN3R", "AMIC",
> +			"IN1R", "AMIC";
> +	};
> +
> +	/*
> +	 * This dummy i2c mux. GPIO actually will not impact selection. At actual boards, only 1
> +	 * device connectted. I2C client driver will check ID when probe. Only matched ID's driver
> +	 * probe successfully.

NAK


Best regards,
Krzysztof

