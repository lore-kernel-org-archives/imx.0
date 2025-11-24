Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69F258CD7
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980545; cv=none; b=Ji1NPVXv5rL5LgbHAkIuoFEQxXgylq1X0wHVxMqhs6SalhXozMovRVmLgpiTsN5hZigX2xXL7ZV5fMTam8Lz5ZGcL2y9U+9hIKXmrH7wqYyTdCItSHFUIj6c+AM7vdRGuMTtn4B65MbnE+gIWPArDTeY4rGIV94TwT1BJTNm/4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980545; c=relaxed/simple;
	bh=6OTESRwNLxScQU78nE0ggduh/VNF1NB1gn02JAFvRw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cl7ktHJz6PaxoWjNLZJBzwdSFtoXG95uA/omLOE88cITK+dFnu6+XTjBEzE8ttn8AK9pUm5qnwOhcBfsPQhyuvf2NVM1MCwp1FkSc44yJZr9rTQxSrknJlW/3oc3Rw6+LfzKXr6NAjH8BkWSqUJenDJHk1K2RdesLwFGPCBLPUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ohZtcqtq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ohZtcqtq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so34781785e9.1
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 02:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763980542; x=1764585342; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAIKS+tQIq5G6QZu607XSH9VxwKXNkvRuOzR0ldY0uA=;
        b=ohZtcqtqE7c0rGhlqpcMKyeKCNPt46tMxfVUkZKGlXSYzHtHzeD9La6YC7H+UbwTpl
         xTYe3fA74+K630mbmH2dT2L277OmuBqvB8FOb8pBscIgssQd5GH+CtP/igpJI4Aw7pJn
         3VzDleyXP0FS0S04q3To0KHL832BcYMArzPpoLsyo1vQUP2SzcjzeEVxVJ4rpmZzCR5P
         4l+xZKzKhWogeUu1Pwkl64P/8bNoFcvcp3zzY13Tx5n3vKwFDxl/WMfwh1BYs/qhml+h
         SZkonI8odrkr04ZEpoqqeipsTkgjxD8oou/MV0cCHnO5aSvFTPo2eyOYaEQhKD4xnRlP
         lFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980542; x=1764585342;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAIKS+tQIq5G6QZu607XSH9VxwKXNkvRuOzR0ldY0uA=;
        b=QA02MFSvzZiuuZ0Ml2TBzhOXXGeUkFZsN1Bq+/fkvZznjUiqw9dw44uwlTAqXT6cGl
         EdtYPuQLv7Eg/WJFxybJZ+x/AWa3JKgsmdimRJl1OG2uUdVD1MFQ3mlBeVbCFjQISsHf
         HD65DP+4ASCebdt+ovSS8S6zckHLVVi1ILe3WuA7p2lY5BxcTFWKYf2IqHXvpj5CuJfw
         CLZ70XHI/+VUCos/8QN8Q+GbpIth/qNTsvETjtBpwws54qhjyNrae4xPIkeAVa+nWPBt
         kgJYSewbjlRMtph6eDayC28vvIbfOV2Z6rM/vIvQ7kufH/8zO6X2s2Dz4n33rGCVBq4s
         ZCmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXudXnMEsYyHh2kg/UstboAU/gfzXVQXWBcPCw6pOXI3U9DVTKn8Wygx05Qmca2cyUGW1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzW3e1Y9jAqNbvYKdDyz174ZTfKLeRYu8J9HOA9PWoQwWmTdTi2
	kK7InJd45VN36wT3ks6nMktNOGA72QPZnvNpG//hUjv4vyl5jJmAsAw5x5nR3aZldFXQvXyGgUl
	Ll0rM
X-Gm-Gg: ASbGncs9a3x8y1ywCqwV8Bl7FchXvAAiZww6//AFQW9kzaVl5yMTB1fBBhQjwxJWpuH
	ncUbm+8eZzYQ9GnVf+P1GNeQksGnAbfB4r8T07Uby+vJ9XC5s5Kony/XBYamYoPFjhrm8yOGicL
	RjViRUb61NeGLaSNILkDbpekOz0pA1QJlpC//oIEJNvmH/c7GwTd0dCoNTWmNCe10daoK3r0Mfc
	IHLpbnGbISR/yMPmxFVoYR7057Tf+w281l6Jlx8q+uC432MDYybUIddYv0x+85CRt8at35EUZ0p
	u20Hd27f43vOp6BgCluiHYt6PcT8SPuFqY+KfYSm08MCRYMYN8gpHxRoEhL/IIWkgUV3XxSN36s
	fNARHqDK7gKQ09ozDyPYvO1SGSbsq1UYK92nkKCkFmTSnuP3rzBEaO11Gnc9P4zgPzcEr/HKxaI
	xv7NizrezUNGDbypBPYkxaaZls8IQggVU7Rwdc4WlumRAPs41aP1y0tFEG4P0lXqXQLU2vePKHR
	w==
X-Google-Smtp-Source: AGHT+IHGv4bbS+3bVyw0pYcsA3BeS6dNhxGlltqoLwAE51qnNbKpUpuxJhUkaEhMz5T/wEJo8trcPQ==
X-Received: by 2002:a05:600c:a01:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-477c01f5980mr97488605e9.33.1763980542060;
        Mon, 24 Nov 2025 02:35:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:ab13:96f5:1459:8396? ([2a01:e0a:3d9:2080:ab13:96f5:1459:8396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dbec2bsm150012445e9.5.2025.11.24.02.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:35:41 -0800 (PST)
Message-ID: <1d0ccc76-bc19-4446-926f-a12a16a3f88e@linaro.org>
Date: Mon, 24 Nov 2025 11:35:40 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1] phy: fsl-imx8mq-usb: fix typec orientation switch when
 built as module
To: Franz Schnyder <fra.schnyder@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
 linux-phy@lists.infradead.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>, stable@vger.kernel.org
References: <20251124095006.588735-1-fra.schnyder@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251124095006.588735-1-fra.schnyder@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 10:50, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
> 
> Currently, the PHY only registers the typec orientation switch when it
> is built in. If the typec driver is built as a module, the switch
> registration is skipped due to the preprocessor condition, causing
> orientation detection to fail.
> 
> This patch replaces the preprocessor condition so that the orientation
> switch is correctly registered for both built-in and module builds.
> 
> Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> Cc: stable@vger.kernel.org
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> ---
>   drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b94f242420fc..d498a6b7234b 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -124,7 +124,7 @@ struct imx8mq_usb_phy {
>   static void tca_blk_orientation_set(struct tca_blk *tca,
>   				enum typec_orientation orientation);
>   
> -#ifdef CONFIG_TYPEC
> +#if IS_ENABLED(CONFIG_TYPEC)
>   
>   static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
>   				enum typec_orientation orientation)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
