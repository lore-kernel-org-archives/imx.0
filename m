Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF952EFD81
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541642; cv=none; b=Y93KyugNvn6BTzkKPWv3obVJuslZVJAq1QmM/PuJaS0Q/2lmx7OZKzFlfCdOa9TPz4C9Jp6J/eym7id4Oq4LS9RggeyqwggplNDObEfHhUjgOTL6ZW1YECQG9vT3Nb7dA7MkQoDyQ8wxMtN2jbf8YSy014I+o4eclZyJEkR7PQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541642; c=relaxed/simple;
	bh=x6TLr3LM6Uh+uzbnEjDbeXkXOZLS9TDjWxXvdl0D62Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHgCJWnh5hRotoKpk8lii7dDYp031Typ7NfaQDE0O/U2tT7ctmt9LZFnvdCklH9586eb3BeZEtxXH43oQbQQ//iLcY4AWpDV7ffgyWppY1HLPfiADO1agwB6GxqYVceZekRy3B5W+Sdg+TdniKXKcZbtkvmTVS6JeupiSKClB1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/IDoNyG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/IDoNyG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso44643135e9.0
        for <imx@lists.linux.dev>; Wed, 19 Nov 2025 00:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541639; x=1764146439; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBbixjBnBbPva8e3qQDLXuoT9sUiTXbil/L9/fukswI=;
        b=w/IDoNyGCH14QDVI6OqKSnIO5PNaBPaMXtucvmse+yOBg+Q/Y9A6zmPx+DSv+ypzO/
         qqrwf/fnCaKHQrGrYARxxwWx91c3lRWfTFmFtPINFZECw1G8VFjeD/dm38KwdEWOGdSn
         DubYs/fWf3hVm352HKbxrc+LrXlXrZmQEU3unkbfbH6bmJG+iLp4WC8XVOljiKwJ4NjQ
         7fzhDS8LAQLQU0jahrg+R+H5CJr0XTQDZnAb6rl/gDLYhV26WCmoVWihAATDZiSOPxnN
         a4BA5oWOo3Eod3TBB+M9G0aRK6/yggV5HXb8d1DQ8k6sBWoe5qiN1gwd7ZI+uB/ZaYgn
         yBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541639; x=1764146439;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBbixjBnBbPva8e3qQDLXuoT9sUiTXbil/L9/fukswI=;
        b=Q431B62iCjOP0LUSgBc23EmCY8nEG49X78muaxgbI7eTADjyZH+6mDtMb8k3nGC5j1
         cZAOFc4MtMN1J20PQAg2kNeDqc9mplsZREjgldZUH80fR66rk11mxMmUTxSHNeWqViUm
         7eJbev88bn1bpQ2My4PX7ZyC5AH0vY2L0cb/S5I+vWM31xFSb47GuKvcWtaOZFHTA2h4
         8xHgLE2+rm3UvMg421kiu7VMaKmZcgSBH0UV5r5xG8TnyK7JXBSSloVGsh8TfNOR3uug
         2wDt3kuDwBAV57aco/+mCDkX4NNS3vclYfhIw8oQbQ68TFwzx86fK1ZQJ16oUzFygmYM
         ASMA==
X-Forwarded-Encrypted: i=1; AJvYcCVnJRVnDjX1QrlrtTnZpVxYciFlfIvEg5q+ocwFxB1dXMplbiFI63SdAHUTZzxNwUNkzdo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9RK9S0YQlKpzcJQikDo2jK/jMeG3AhxFvfbCkVYvg5KtfTsTw
	X6s4QMUDcde29+rmLita25XcZF+MnXNBQwkPT1WYtRvzB5HGC6Za0N44PuhW4Q63y3g=
X-Gm-Gg: ASbGncvv1PFdZ111kYK+f7AuM6XIXuSfDsGRH0I00Wz8ziGRkaFMIlWc2GjRw5Osr1M
	Y+jsZ9edt/lQI6PIF4PoNUxiQeB8dkPVuM5mAk2P+jHe/BAPt/58YfwllABM3pdqfeVL0JMZL6h
	FVKzDb3alznLaRwAzmaRfzVQvCW3Sw+TeSJSZf0pGGrJFCIDSKwnEWLbIw3iGiLbYteq6NWWKZK
	Cd4KQALrAGTNd6IM1cyBWSXRnpCho+d6d3Jrru1CkDBcBhr46XPd0B5z3Ihl3v7665z/94FuC33
	5EpN6sFCnYmeNd1F4YOirHS89KpuLajq8hqAIgjNb8V2NykSK8hyFS1dZ7IukELPl2e47DZMHKY
	Azq51DJPgPUHKP14H4oW7/aGmtOFCwKC10fiBh0aAHTsAvMd5l/lCk7vnUk4YFxtg0bYaor1aja
	3zvIg20YliOkPFOf/FkmDe4O4ICMX5vXtD01oMSyRqH+cJ9tcPTjrH0+94JnbSh2Y=
X-Google-Smtp-Source: AGHT+IGKiZiYBXjHj/z9lV7e7rsBSdkQWY5bFdVCTdvJUrbHHgREFhMcJGGNNV9FKXHCj3CnZDcH/g==
X-Received: by 2002:a05:600c:1986:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-4778fea7037mr172201975e9.27.1763541639176;
        Wed, 19 Nov 2025 00:40:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad? ([2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1012a92sm34648755e9.4.2025.11.19.00.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:40:38 -0800 (PST)
Message-ID: <50bdc65e-b052-4f81-b501-016b36e86574@linaro.org>
Date: Wed, 19 Nov 2025 09:40:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] phy: freescale: Initialize priv->lock
To: Xiaolei Wang <xiaolei.wang@windriver.com>, Frank.li@nxp.com,
 vkoul@kernel.org, kishon@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250925013806.569658-1-xiaolei.wang@windriver.com>
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
In-Reply-To: <20250925013806.569658-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 03:38, Xiaolei Wang wrote:
> Initialize priv->lock to fix the following warning.
> 
> WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:577 __mutex_lock+0x70c/0x8b8
>   Modules linked in:
>   Hardware name: Freescale i.MX8QM MEK (DT)
>   Call trace:
>    __mutex_lock+0x70c/0x8b8 (P)
>    mutex_lock_nested+0x24/0x30
>    imx_hsio_power_on+0x4c/0x764
>    phy_power_on+0x7c/0x12c
>    imx_pcie_host_init+0x1d0/0x4d4
>    dw_pcie_host_init+0x188/0x4b0
>    imx_pcie_probe+0x324/0x6f4
>    platform_probe+0x5c/0x98
>    really_probe+0xbc/0x29c
>    __driver_probe_device+0x78/0x12c
>    driver_probe_device+0xd8/0x160
>    __device_attach_driver+0xb8/0x138
>    bus_for_each_drv+0x84/0xe4
>    __device_attach_async_helper+0xb8/0xdc
>    async_run_entry_fn+0x34/0xe0
>    process_one_work+0x220/0x694
>    worker_thread+0x1c0/0x36c
>    kthread+0x14c/0x224
> 
> Fixes: 82c56b6dd24f ("phy: freescale: imx8qm-hsio: Add i.MX8QM HSIO PHY driver support")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
> v1: https://patchwork.kernel.org/project/imx/patch/20250923141611.1295395-1-xiaolei.wang@windriver.com/
> 
> v2: Use devm_mutex_init() instead of mutex_init()
> 
>   drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> index 5dca93cd325c..977d21d753a5 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> @@ -533,7 +533,7 @@ static struct phy *imx_hsio_xlate(struct device *dev,
>   
>   static int imx_hsio_probe(struct platform_device *pdev)
>   {
> -	int i;
> +	int i, ret;
>   	void __iomem *off;
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev->of_node;
> @@ -545,6 +545,9 @@ static int imx_hsio_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   	priv->dev = &pdev->dev;
>   	priv->drvdata = of_device_get_match_data(dev);
> +	ret = devm_mutex_init(dev, &priv->lock);
> +	if (ret)
> +		return ret;
>   
>   	/* Get HSIO configuration mode */
>   	if (of_property_read_string(np, "fsl,hsio-cfg", &priv->hsio_cfg))

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
