Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186E297A46
	for <imx@lists.linux.dev>; Thu, 15 May 2025 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301329; cv=none; b=kFp99+TI5fV7Ll20b1JKBLzwKD7yVRYryTYyole32i0CuAoykLPsn/NDJjykyEkv7KwVKxNAGZL95He+7b/v+/mTn0E72qdcwGuWXbeEigiKcASurmkwb4qSsQoTzhYyRMvrg+8ZAbPEffPT32CEw2G2+oA4A9CXMRk1w85P0jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301329; c=relaxed/simple;
	bh=8HDKOO78NW4n9McYgFb9i+h1xt2fE41Co7f0h1JCzP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ka5ilLG9mgWMCGLGkN4iTdOIji1xDmNLRGKhKRlj/C8ZZI/2NhMyEaY5379QOyP4tPUAiSB7eRstOcQblP8T8wCmK7iHlHfF+gDDc9cBUr2sgcY8wgBEORXUiu4ec5ld5jhucGNT//l7os7S5qGMBEKoSSpNxfjoHA+agVzpYC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ssf7bpk3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ssf7bpk3"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10956398so826486e87.0
        for <imx@lists.linux.dev>; Thu, 15 May 2025 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747301325; x=1747906125; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUZnZ1nzA1VahWTXdD9nimd4WKEUhUq33YKSElfIzC4=;
        b=Ssf7bpk3EaVbDK7HeqfgXWjyKxHpm1L12NhgjlB9P5qVwV65Zp/o8vCXq5GCscu8VD
         6T0WY4P1kV56qJCcm8TANis/gJRJLW+GCjwUPqSharye34Cqqwq7J9jM3m0ej4VUssEZ
         Xn4xTU0DODmHOVPQfevYz5jNlHrLCnk87scUE7FYs5Jhq4AXjDs0Ygjt4gvL2C+8PXL0
         EZgthPhupI+IPSivKAtkNrrMhOLuJ5Uz/oLpjrmtnUYlXbO6+W6cdxPodHeZ5xfAe2J8
         lk/YZV8l6uN4qVR3dDOBENx1W3Q4GpPZiKqSdqnLaxo6VQOOMcjUhX4Ml+4MsRX+b1zG
         nLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301325; x=1747906125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUZnZ1nzA1VahWTXdD9nimd4WKEUhUq33YKSElfIzC4=;
        b=asTbRtgZOYbMhVBXRQgTsOzgr7M6x/1w73E7unEgHNqyQBcn3H4LM8bkIryP+pbh9A
         vjx/6vr0X9OeED8EuNKu679sB+rOaINso9Guq65EhC+XRuPCcrYwez4FmXBBOV7N11Kg
         drFN9a6Q8URoZN7waIkmwdOipEjH3H3lJRj1h5f0eFU9osbU+pp38ocd53IAoeK5Rw4f
         OmT3OjI20c98C6JaD9Z8dQckQWwTvw2Yi7vir1nRzfv16PisLAaTIRS18cX+pNzy1FSk
         yWHfwn8vunH7QfbNgBA2UAT6ieHKJ+B5QyRHKkOVy0gxZ0H5BSF0fG3b938SYDRewsjy
         KWkg==
X-Forwarded-Encrypted: i=1; AJvYcCUZogmXhOxzLltR/O+FZHYippwCJG05jt31h0iwcDnOcbiICrkkHZWKXS1uRPJbOstjXJo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEftjELk4DOV/KHgSaBeL5Jm5KQTbU2qiX2GYpAU5Vbv+eBRVU
	hSZqpYI2s4vs8prgW6CwdzBXowTbfUW9M+4viO/OfdwkwQrnyRfTjl0W
X-Gm-Gg: ASbGncs65k9qpeIXTYKKZK9ljXIVk63CcF76j4FLRPk08V5sITbe4T2b7k936eSRIBm
	2yzKxtEEblsImmMPQLtM7mUkSUh9wiZZ0JVtNHFaLP9SY4TN4ER5yJIi/8YRymXsj6xhGHC+QMp
	qz4gWw5KydYUfe64FAdUOgMQRYh3ou8fH3eXWNh16ZEuvCzzdvm/izG8Xnu2VDfOu4N6jBrqeXa
	1zs3fLvkIZEnCacczLuwBZIkFsdsZ+y7uW06+kuAs62UAMadtUdlyYhouZvQgxeVv2J9w1otT8G
	siGO1A4hNjzNxx2mZY5AuRcuPwK4g18l8HohXmLsmn/G3bcPb/OXRRgRye2D5qANS5qZAn+xIWG
	UP9TxGeJXDFFT5vUOYGbZP0DryGRBDwjy
X-Google-Smtp-Source: AGHT+IGtzN/vJeQqjXNcCh6S+CyPGXXKJUFYk7VQPziFd4r34mBTi90PPXGWHwTS9SK3MYrz0Qwrbw==
X-Received: by 2002:a05:6512:b11:b0:549:9643:68d0 with SMTP id 2adb3069b0e04-550db97d223mr937454e87.17.1747301325041;
        Thu, 15 May 2025 02:28:45 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fafdsm2565109e87.51.2025.05.15.02.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:28:44 -0700 (PDT)
Message-ID: <fb5b60e9-eaf9-42bc-9bda-0c80bd55f81d@gmail.com>
Date: Thu, 15 May 2025 12:28:43 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx8mn-bsh-smm-s2-common: Disable PMIC
 SNVS reset target state
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
 Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Wolfgang Birkner <wolfgang.birkner@bshg.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-10-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-10-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:25, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> VDD_DRAM was disabled on standby, therefore the reference hardware did not
> wake up reliable. Use PMIC reset target state READY instead of SNVS, to
> keep VDD_DRAM active during standby.

There is something I'm not quite sure I understand. Lookin at the 
BD71847 data-sheet, the VDD_DRAM is OFF at READY.

(Page 27, Table 3-8. Voltage Rails ON/OFF for Respective Power State)

https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/switching_regulator_system/bd71847amwv-e.pdf

Please, explain.

Yours,
	-- Matti

> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index ea8d741c6904..633874b3bf66 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -94,7 +94,6 @@ bd71847: pmic@4b {
>   		pinctrl-0 = <&pinctrl_pmic>;
>   		interrupt-parent = <&gpio1>;
>   		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> -		rohm,reset-snvs-powered;
>   
>   		#clock-cells = <0>;
>   		clocks = <&osc_32k>;

