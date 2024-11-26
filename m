Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D02C1D63E9
	for <imx@lists.linux.dev>; Tue, 26 Nov 2024 20:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732654764; cv=none; b=jd/2c2NaMH7sLlg5YRHJb7E6XvaY4Ow1rmv/KSeRyo3XHWLOTGhShTNDCaNiKyjMsLICKUSEsm9xj2XOk/wol1fTHtnXQFuV2aykmWxCaZ/RmDID7BKRqkbp+19suiTQVGw9NgfwiSxwVUKsIMK/DCj8B03/HYp6sm4xUHEZshc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732654764; c=relaxed/simple;
	bh=L3n/QdCo95k3vET0HXDHuVn063jBVSJR/iGmcnDi9SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+MFg9D/M3vaeJ+Qh3dPQnIq0Qe9ABHwU0Z0ZjKCz0A3XSiEa2W5V7QvGP1LQyUUT0wFJo6XixI5/PXC7wBOI+id+tC/j64r59sxYoBN6MV0LFNXhtteKRJC2TGbKuzGh3b8m9/h8yfQa4EAr1Kk3IZU7tVm4qAkSk8bEhtG3mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k74F2cBM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k74F2cBM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-724e14b90cfso4184731b3a.2
        for <imx@lists.linux.dev>; Tue, 26 Nov 2024 12:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732654762; x=1733259562; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pkqGUVpcqR3FJaZivv3n68lrMx5q8kW12p75NFQawIU=;
        b=k74F2cBMk+G1daQQw3CkRKDlCnxwxZicjMh1PST+sStk7zvnJw48nuKQX62zhbaLC7
         Rgm5AE2ibs8gyBjyljWVd0XICdGECnUIDAUWnDGm2WiJ6XPxarGNrIt5UzzSNqShNvFS
         mdLmcYISJWSe2msw33FWs3QLrGoHPEXFIU7nH/76ML2VxtN5pGYstrXHzsY8HkGEh5hz
         BqYMETxzXXZUd2FcomUKGYsk53LUHjcAVMiLwf1KccqMcMFsn4XPrwHRb7iYRtGTpial
         7en4eM4bMry0u5nGfA/iyTNlyv0JJ7FA+SMmXkE/f5kX59g1lmXt+MKWxCNMtSgmMAJf
         ZFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732654762; x=1733259562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkqGUVpcqR3FJaZivv3n68lrMx5q8kW12p75NFQawIU=;
        b=SxJKl5HurYqRl4H2kya3sRnD+0UYE+8aGgDTCND7d3Bd3HTXKeMXEtxhxquNjn8KHV
         gBw7hOPCZcl1sENv/uoAqqWwhfr8iYO8U5DEZjFuyA5jpLyYiT9ds7mJ7qWsiuaQwY/3
         6lyXnTWLWxDwmglpnTl/FfdsQHZ5Gl8aGQZ741B0jksTKWYVG2H/VKll50Xuj+2PfhEa
         T4vQCaykn8S3zbhQ2ju1iS5k1/JNMzonePtbJnF+NZVykijzXNVqVSukhJvBQ4jlAsPq
         fbVyQAfOKyv2iLMoZtsrZh1Yz/3rP+p++t7mgsbvO7tv3mjRSzUT3/6VM/EgN4iiU4r8
         4UDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXto4KjQ16ud95jD1Hx29IQxamQd/6PmqHHl3w199Gx1aH0BWPHW97n5nZahEhORqkQDVA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVVp05Nkj/zrMDbdb+HUXMnfM3VIplMM2xyHxmxuoa8iOCSaIj
	u32HXfh0IWZHKLSnSq8ZXN0DPoMEiKzAPnGyxC8PkYxcPNYA5pGx
X-Gm-Gg: ASbGncsxURipI0QbdugGZqH1x8dC6Q+EEd8S7X7IF2QjZc6Fy0G73EMkkRj52B9YeX2
	KvdJq9jlmMeVDCzSv4p72LHJac9HQPU80wakMVxRQxYg7WsPTNI1RFMjUr36ugNJhrzll8F5Df6
	vROWvGGTYEroXp/8xfXH/ek3tCa7Ghh15K+8Po9Lr5OMSpsgakaEjSxQ0k1oufJU3q4wwCVb87D
	yQOUYSO0/33TQ8MqCu0lWGZnqRZHMBrwTXHUgPHBh9fR+H+FaGtKn6Ot4fv5Pa5AMN5DypCVpVx
	mt2rTyfhIPTYPsknRACIL24=
X-Google-Smtp-Source: AGHT+IFkbQliXMJngdQsKS+kRYin8+jC/qkMwuMPdlrz1mQVCJ4TO13OHNKsmF8s3CBjHPSX9sPlOw==
X-Received: by 2002:a05:6a00:845:b0:71e:1722:d02c with SMTP id d2e1a72fcca58-7252ffcbf9amr876613b3a.3.1732654761660;
        Tue, 26 Nov 2024 12:59:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de554fbfsm8831060b3a.135.2024.11.26.12.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 12:59:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d718ddd2-d473-4455-b21a-15024e46787c@roeck-us.net>
Date: Tue, 26 Nov 2024 12:59:19 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: imx: defconfig: Explicitly select CONFIG_PINCTRL
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, Fabio Estevam <festevam@denx.de>
References: <20241126194146.1193094-1-festevam@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241126194146.1193094-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/24 11:41, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
> 
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
> 
> Fix it by selecting CONFIG_PINCTRL inside the affected defconfigs.
> 
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   arch/arm/configs/imx_v4_v5_defconfig | 1 +
>   arch/arm/configs/imx_v6_v7_defconfig | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
> index 875c8cdbada7..1af29d12129d 100644
> --- a/arch/arm/configs/imx_v4_v5_defconfig
> +++ b/arch/arm/configs/imx_v4_v5_defconfig
> @@ -83,6 +83,7 @@ CONFIG_I2C_IMX=y
>   CONFIG_SPI=y
>   CONFIG_SPI_IMX=y
>   CONFIG_SPI_SPIDEV=y
> +CONFIG_PINCTRL=y
>   CONFIG_GPIO_SYSFS=y
>   CONFIG_GPIO_MXC=y
>   CONFIG_W1=y
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index 0beecdde55f5..73f7aa7e75f7 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -204,6 +204,7 @@ CONFIG_SPI_FSL_QUADSPI=y
>   CONFIG_SPI_GPIO=y
>   CONFIG_SPI_IMX=y
>   CONFIG_SPI_FSL_DSPI=y
> +CONFIG_PINCTRL=y
>   CONFIG_PINCTRL_IMX8MM=y
>   CONFIG_PINCTRL_IMX8MN=y
>   CONFIG_PINCTRL_IMX8MP=y

