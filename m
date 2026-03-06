Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E232D32572E
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793566; cv=none; b=tGkIjedpamHG/45HO6ro0j/dmq0OHdIn5s+CCahnHSpoNHsHB7pkOnsWqFlYPzJ29EPeC0whpz46Q48cR1WG2FuVTqHz3NoBzk3QvYnMEtWXxQOxirLEokJfufRq6ujomM85j0Y16YVfqLIHXu8n/PhqsTv8tujcG/o5GNQdXx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793566; c=relaxed/simple;
	bh=eKv+7GRonV7zR5Aydbl9iRFy2PXWUwHoX584wZSFUY8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tLJLdn5aW3+7OxnJvouf4yG7U+t/eZNWdbEa7dTaSAGyR7a3X77C3gGva+NLp2HkBPe+Covc11tCTbess9ncZRlaDwGV5IRmrgbZZXH1FAkYpPKeZlHvJDrJ0uRngDRLMflMozMk3/A4kqt/WSa6DAb3NX+LbhikamxL+8r2698=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RYS1K6bj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RYS1K6bj"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so5737774f8f.2
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 02:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772793563; x=1773398363; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7b/j6Onzsjic24fOqjJouNjRnjy2n5wYSg/eGj1+zfI=;
        b=RYS1K6bjhwqrjuZL4pVSMv9/1smFw9a+OVtar311y++ymMTv6HBpXur2X5cRzVKdI0
         xX3mv+rEmQDPILeXGA2a3/G9hUuzaZRSYRGpEI3wLHg1S5B4KvY/q35vS9lITNo0JBoq
         OIfUwbPUNgeOBr8x8LgE71JXGilGhIu6xC1AiPr/SF66wBLlx/1am4xL18aTEM863lCn
         oUlh0cFwwTFEi+ps3BN7VLzFd/T4/zhn92IKYBls2aXx2Pqbxbqg+W+UzisDfUQkPj0A
         2loAoGL2w3p8KoJcL4FNzK5DsJ0qkqQhqvUCHgIH19KjPBxDZUoeogN/ce2e3inoycoT
         8KQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793563; x=1773398363;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b/j6Onzsjic24fOqjJouNjRnjy2n5wYSg/eGj1+zfI=;
        b=hFp5Ut2odAsAhN3HPaLKn8tIbAG0s3p8LWisUOgVpCMNbcfxNFtxzNe5jD0iFVyAfo
         Yf9RVXioiHygK1OrK3kfRBc6w97Wz1GZIJu/9H9pSor4RMqyfp2jDZn9VRFxPuJDDzvf
         h5uXsuzK9hN38q3p75kHeRG4sIrD7MtCKBw6PtrDrdcsaMfapjvl8WDwk30haHw5DIWY
         fRon5gAtARa2S+EQZfllt8RRD0AcIQqv4S5WLCuaH8NpnDdL+KjOtERaFBu2wHVqta+3
         PWjDbHIQgr2FNkrJrWVeed28M5NNWr7pjseAx1nDeAa/5/LOubOxQnP9ABMc1rYSyxZm
         l/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXtk7h5PqGO4/n9HIVbKRERA5sUfuEdikOQXSTD9ypE0w+MIPBVRCt1Dw7+YsLlmS0FbsU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1xVu17gHp1++g1xOlO/TSAMw1gAJZLhrNJK218IkcJntlugQX
	5gwWpRYJS1Ee9WAlkpupBLdJWgm0R4QWY8aztXZmLwi19lcyWV4JLEvUbxWQwOsjCwk=
X-Gm-Gg: ATEYQzwFEPJfLNIgeJZwqr5N9srEH7UhOyTdQfkwcpNiL6goBGRzl9BHxL53Khj4O4s
	fYA3AwylAsZnAShUKKRd/bX8s2W2TmaG8sZIeL+rN50vqzl4edoVyH2a/Bac1oOku2Rx/8TQKpW
	G6Yjt/9kBJXlf/rJOfMNeN7+HUjowz20q6VoipVMTdIHG7UDhILFi48jFrN9X2Y6L1eRYJnLkgZ
	PEPMxzjLLKg8Ckg2uI2vZEEv6cZcNjm9lVR/2p8KkaFXSDC7VmGNsWyCVjr6sN9t1Qif5+6GuKu
	g56AF4ta09qoqFZnL08tp5cnMytZF0LXICXXbfZ5y4JaLVaeJp3Z6v114zrTcHoHbmWWq+0044c
	lJYNavpt3kT6ILo2OzwaEArfw7WiX2HON5H+Yklq1X+U4maxq0GhKgCvFOeEGTI/2lXZ/Tcr72Q
	pNUHY8q8Ksi14nNQlwn3Kt52Jk9uSe6VedpCZUbTEEkPfEkLqUm8BKLwKO5BK26lR76sodUPw/l
	say
X-Received: by 2002:a05:6000:40dc:b0:439:ba4d:bf40 with SMTP id ffacd0b85a97d-439da891a22mr2826807f8f.43.1772793563121;
        Fri, 06 Mar 2026 02:39:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3a20fsm3184894f8f.28.2026.03.06.02.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:39:22 -0800 (PST)
Message-ID: <7710959a-5941-4094-a7a9-6c745ca73787@linaro.org>
Date: Fri, 6 Mar 2026 11:39:22 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
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
In-Reply-To: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/11/26 15:49, Alexander Stein wrote:
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>    debugfs: '5f1a0000.phy' already exists in 'regmap'
> Fix this by using a dedicated regmap config for each resource, each
> having a dedicated regmap name.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Same as the one sent in December but with an updated CC list.
> 
>   drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> index 279b8ac7822df..4ab45c9f53dff 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> @@ -107,7 +107,22 @@ static const char * const lan2_pcieb_clks[] = {"apb_pclk2", "pclk2", "ctl1_crr",
>   static const char * const lan2_sata_clks[] = {"pclk2", "epcs_tx", "epcs_rx",
>   					      "phy1_crr", "misc_crr"};
>   
> -static const struct regmap_config regmap_config = {
> +static const struct regmap_config regmap_phy_config = {
> +	.name = "phy",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static const struct regmap_config regmap_ctrl_config = {
> +	.name = "ctrl",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static const struct regmap_config regmap_misc_config = {
> +	.name = "misc",
>   	.reg_bits = 32,
>   	.val_bits = 32,
>   	.reg_stride = 4,
> @@ -562,19 +577,19 @@ static int imx_hsio_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->base);
>   
>   	off = devm_platform_ioremap_resource_byname(pdev, "phy");
> -	priv->phy = devm_regmap_init_mmio(dev, off, &regmap_config);
> +	priv->phy = devm_regmap_init_mmio(dev, off, &regmap_phy_config);
>   	if (IS_ERR(priv->phy))
>   		return dev_err_probe(dev, PTR_ERR(priv->phy),
>   				     "unable to find phy csr registers\n");
>   
>   	off = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> -	priv->ctrl = devm_regmap_init_mmio(dev, off, &regmap_config);
> +	priv->ctrl = devm_regmap_init_mmio(dev, off, &regmap_ctrl_config);
>   	if (IS_ERR(priv->ctrl))
>   		return dev_err_probe(dev, PTR_ERR(priv->ctrl),
>   				     "unable to find ctrl csr registers\n");
>   
>   	off = devm_platform_ioremap_resource_byname(pdev, "misc");
> -	priv->misc = devm_regmap_init_mmio(dev, off, &regmap_config);
> +	priv->misc = devm_regmap_init_mmio(dev, off, &regmap_misc_config);
>   	if (IS_ERR(priv->misc))
>   		return dev_err_probe(dev, PTR_ERR(priv->misc),
>   				     "unable to find misc csr registers\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
