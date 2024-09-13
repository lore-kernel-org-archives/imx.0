Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB8C1BDA9B
	for <imx@lists.linux.dev>; Fri, 13 Sep 2024 07:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726213465; cv=none; b=RAIZ5+aJpDWDBheGUeIxLqQIVM3ztKFAYsMy2Q5Vt/E57AR+U8bUzR0CJX4y66YeA1gKlfPqn0u+zd8Lx2e4YKVZf0EeuDrVM49/1aYovuWPtMWEquIowNI/wVpd9gNN2nGo+d+VLKKQxpQarY0FOQMXVnEIvyscYMaw/gPO/tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726213465; c=relaxed/simple;
	bh=04h4E5s//lE7AGcZ5WXXq0mdamQexsMEhrSxTnBdrrM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hSpASJ6bALXHdVL3u+rAMS9sHaFym9bvrFdQ/2a+2zLZJRJbROu5IF5Mk2aBR51n7aJOeLS1DCSV//hqpxqB1Gr8ines8zZRmarqVAn0JZGshSxseJ0ZhAaydJnmpZkBoVULJy43INbTDqlcTmN2DxC2d6F5KKZ3e3LS9+mkEN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xVyo/dVo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xVyo/dVo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so17337735e9.3
        for <imx@lists.linux.dev>; Fri, 13 Sep 2024 00:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726213461; x=1726818261; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AheCAqeoUm8jMvzLGmM3qZQOOZVqEnJwf/ppq5LTzDo=;
        b=xVyo/dVo/1jqBrjjdr5fubq7vdC8M2yBJRdr35+pWd8MNLsJT0EUFMOEzpuBsopJrT
         K5GE5JLf1cTWuqyWITb9sXFhKnBSqevPWIfV0jGHIHjDQPVBNZuYJLneiVM6ru7Kmb0z
         ytsz6ZDNpZAEXnQx+GUit++aG6wJd2y5Jw00NYxfieu7QsNAQe8R+gTSiv4phPCZQUMX
         yvz+S2B62fAt6HHbQ5uBbKOq0D1pNq9HuEkHi9WbKyy0EH2TSZlSROgKd6Xb+nYXfzFB
         SPT3HzBv0hcwKZq447r1DQ45LUMjA35bbGyQJu6AOrdhofDUxqPrOtk1i/ZSLP2fULgq
         4Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726213461; x=1726818261;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AheCAqeoUm8jMvzLGmM3qZQOOZVqEnJwf/ppq5LTzDo=;
        b=CQrE2IlOq9EXCVJ8gAd4EFxPPTPWeKr5pGOuv9ym1tScLuK+H0LSqCg6d1+FeBtG5b
         qIQRT3nKYYfuu94i4TRz/lKrH8HmaKv6A+rmYe3PGjqcYruFBeSCEnpm3wll3P0cVk/i
         iYcdzTLBst3rP4nyvnx4xjl2dV1L+yObb+6ufgqvU5GbzknAcjjMttI4abMl2L2uFnCT
         dyHRQVjiGxXJPRW9OP1/5zFEbwwcyX8jk414jMKSaxOQg7f/gDRkJbLJKpVW0ZPJ+uTf
         EMnI5VzWIcx4dWZi81zpbHPvIv/s/98kgFYGDLksbO5iMwny+cPfVd9vTdt7f6fI6Tqi
         BlSg==
X-Forwarded-Encrypted: i=1; AJvYcCV5KQpGEx+NvrZpeq0MhvBSAeqhJYdWQgdOBMFetEjHYCCRxCy4NDYA1cwgBDkQ4JR/N28=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyif0ew2hNpsOIDi8pLH0EpyQGKgnDg54r+qoCcYVtKiqp+mLpJ
	Kx3PJElzhlgjyn3JZuE4j2rFoBxRpSb/wqcZv2N/3KJ/QpUSLn8Q+GcjwveBdVY=
X-Google-Smtp-Source: AGHT+IGsEdjmmPHEFWAf/IGcV2sqiw5X4o9COdYfUQwMTAP2tgacgkx5UhDvEESC5qvKY6aNHfxZgg==
X-Received: by 2002:a05:600c:5125:b0:42c:cd88:d0f4 with SMTP id 5b1f17b1804b1-42cdb56aea6mr48877945e9.22.1726213461409;
        Fri, 13 Sep 2024 00:44:21 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b05a754sm14722525e9.3.2024.09.13.00.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 00:44:21 -0700 (PDT)
Message-ID: <4cbc14ad-0b2f-476e-8da2-08986776eae8@linaro.org>
Date: Fri, 13 Sep 2024 09:44:19 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with
 selected clock
To: Dominique Martinet <asmadeus@codewreck.org>, Liu Ying
 <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dominique Martinet <dominique.martinet@atmark-techno.com>
References: <20240907-hdmi-tolerance-v2-1-b9d7abd89f5c@codewreck.org>
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
In-Reply-To: <20240907-hdmi-tolerance-v2-1-b9d7abd89f5c@codewreck.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2024 07:54, Dominique Martinet wrote:
> From: Dominique Martinet <dominique.martinet@atmark-techno.com>
> 
> This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when we
> cannot output the exact frequency, enabling the imx8mp HDMI output to
> support more modes
> 
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> Changes in v2:
> - Improve comment about the tolerance
> - Link to v1: https://lore.kernel.org/r/20240904083103.1257480-1-dominique.martinet@atmark-techno.com
> ---
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 13bc570c5473..200d65184159 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -23,6 +23,7 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
>   		       const struct drm_display_mode *mode)
>   {
>   	struct imx8mp_hdmi *hdmi = (struct imx8mp_hdmi *)data;
> +	long round_rate;
>   
>   	if (mode->clock < 13500)
>   		return MODE_CLOCK_LOW;
> @@ -30,8 +31,14 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
>   	if (mode->clock > 297000)
>   		return MODE_CLOCK_HIGH;
>   
> -	if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=
> -	    mode->clock * 1000)
> +	round_rate = clk_round_rate(hdmi->pixclk, mode->clock * 1000);
> +	/* imx8mp's pixel clock generator (fsl-samsung-hdmi) cannot generate
> +	 * all possible frequencies, so allow some tolerance to support more
> +	 * modes.
> +	 * Allow 0.5% difference allowed in various standards (VESA, CEA861)
> +	 * 0.5% = 5/1000 tolerance (mode->clock is 1/1000)
> +	 */
> +	if (abs(round_rate - mode->clock * 1000) > mode->clock * 5)
>   		return MODE_CLOCK_RANGE;
>   
>   	/* We don't support double-clocked and Interlaced modes */
> 
> ---
> base-commit: 67784a74e258a467225f0e68335df77acd67b7ab
> change-id: 20240907-hdmi-tolerance-4d83074a4517
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
