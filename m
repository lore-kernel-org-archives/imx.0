Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BF8265CDD
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478386; cv=none; b=SywZqaAoXKDwPEYwiGH7LjoORay4QSlk6a+aiK6fZHePgo2vHXJHPj0IwvuC7zsDbfXS2XJghFtdWAnlczmX4GeFcLLBQ+pvWQK8LhBr7e3V8n6NnbwxoW8YH8TsFdOY+9z69ThHuVcz+DvzqwzLGY6HX7tlDEoVVASum/zBtr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478386; c=relaxed/simple;
	bh=oBN48rQNwcgEEQQHRVpwovfkhEWcWl05Sk8OBJd2mEI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IjnOe0lCuSL2oeTa7yAZOOVNnI3mPb823luBOMvuEFo6+bhIQRzWljK29dTyFRo89VnsoV7iR5vlCSbIY00h6bYWRcJBVwzO/SeCFDn8ltVtjvLN6LRykTVrmIyuQwHfPSNQnTD/MORxh2U7Q+nsMe9qntWIicKqRUr9K7t4jd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/gYmC1q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/gYmC1q"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so2634627f8f.2
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740478383; x=1741083183; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/CdZ+U93yCfAHM20K4VCGZK5tana82Sk9q6rPMpkaE=;
        b=x/gYmC1qYUzr5CXf6OGjx6HcRk9XCsLuYck+zIoZQpR2xUrxuK2I8LqwBi9QE6DJaE
         u6QSlelzwbwJUKJVjGxV9BFQwhVKEHqbUh8v5KLMw6HBLoKcQn1jMIvrmpEaZytCknf/
         wydNvAZBFDGq9TSdKAGz/p8g2z75iMnLmxZ3ZLHy1ru9hB8EN9SLEOjBeoezTo3f6GyM
         jq4pn97Ew59EhT6y5EPdS2+YsZoCF5cO6xvsuExwCa7GcqaLBvzx1mRHHDkHbXcjHJ51
         5bHlQaA2RR1HFl4WLv/tGCIXwFclxzEsdJQh8nE/1ftlcabrefD6gZxM3vgr3CL+H/9W
         OKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478383; x=1741083183;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j/CdZ+U93yCfAHM20K4VCGZK5tana82Sk9q6rPMpkaE=;
        b=pHjQrCjZ8FDfbZL0SdjC718s8g/0G3Y36NNmZdAGW5DCdhfvyaDZMJfLHOI0UWg4hQ
         Nn6ZoiLdyfI0yWP/E0bg9dpucpg+fCtSYfrebhu7dvzhhc1YFShYDk6ARvywjLuffXGU
         PNWxR8s6fLc7E3rJnl9srHCcE0DCmoVc/+/lZI09xPLKdUeNzHHlFo2MyHvgK/7kWg+l
         XCXQdErLcIUNVnF0hAmdwOpFfefrlnHdW/1fuUMPfmSGobt95QZhp/Jpzl7HXojyJ/xn
         UvUSSwuctoCcA0U5kafC5UVBRNpE6DhDhgK3SWbjBZyOx2brkiK7d2Ay4OXI779THw2x
         4ubg==
X-Forwarded-Encrypted: i=1; AJvYcCWwywRqhRKPZOfHrxwKsuMhrs04XAy9yE3RM6NUC85bR6SchhgEd83nuTFT+lAxTnF1PvE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ3Rznt4U53Lneg/SOHGiI9ohG0a8OoiSYb3WnMuf28IrfvaPy
	i2xyHq+6Gq3JYTNrK4MDP2MNsHK7UMKLjhpxhue7hn5fPExB8TuzZD9opnah4jw=
X-Gm-Gg: ASbGncuZQ8MfwohEjt/EUtwsM2sVIO+3sDeFeXx5o8nzxfEewPtoibWOlayAfdSMir2
	0C/12gSU9GHF8SZraBSMhQgM1D46sBbkDc05X9F+9rK6Hhe37wrOBtYdGfdW1yONGewV7WLrP4P
	G2BCSSTo68X5mwo+7ZHQp9h47uhesGb+uFQvSU5yvlbowWMDzDEme8GvKQNE3I5yKvr44RGOIS1
	WdLsfR7J2BVwP1ivwPrvw1kBecU29XtkHx0kN4UtvPFtArnwnaLK+03/iwMRxo08vNHgKM/i75w
	9oqDI41hzVw8cIn8W5308b+wC5H4DypS4TYf
X-Google-Smtp-Source: AGHT+IFG+1rFiHyvGAdLQom1xamSgtQXx5X9EhBwiiiWXiH5ajISwOfGmcfQGL3L3N7dQSd1xz/2Pg==
X-Received: by 2002:a05:6000:1fa3:b0:38d:d603:ff46 with SMTP id ffacd0b85a97d-38f7d1ffbfemr10982478f8f.14.1740478382825;
        Tue, 25 Feb 2025 02:13:02 -0800 (PST)
Received: from [192.168.1.100] ([37.167.173.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43a9d921c9csm93910385e9.11.2025.02.25.02.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:13:02 -0800 (PST)
Message-ID: <d08ce3dd-a639-4829-a9ca-c4f897336228@linaro.org>
Date: Tue, 25 Feb 2025 11:13:00 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 07/14] drm/panel: simple: add BOE AV101HDT-A10 panel
To: maudspierings@gocontroll.com, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-7-5ccbbf613543@gocontroll.com>
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
In-Reply-To: <20250224-initial_display-v1-7-5ccbbf613543@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/02/2025 14:50, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> add support for the BOE AV101HDT-A10 10.1" LVDS panel
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9b2f128fd3094bfb6731fc348b91cc101f495a86..a52977ab73dc2edab0d1954c702fd797d6a5b969 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1374,6 +1374,35 @@ static const struct panel_desc bananapi_s070wv20_ct16 = {
>   	},
>   };
>   
> +static const struct display_timing boe_av101hdt_a10_timing = {
> +	.pixelclock = { 74210000, 75330000, 76780000, },
> +	.hactive = { 1280, 1280, 1280, },
> +	.hfront_porch = { 10, 42, 33, },
> +	.hback_porch = { 10, 18, 33, },
> +	.hsync_len = { 30, 10, 30, },
> +	.vactive = { 720, 720, 720, },
> +	.vfront_porch = { 200, 183, 200, },
> +	.vback_porch = { 8, 8, 8, },
> +	.vsync_len = { 2, 19, 2, },
> +	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
> +};
> +
> +static const struct panel_desc boe_av101hdt_a10 = {
> +	.timings = &boe_av101hdt_a10_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 224,
> +		.height = 126,
> +	},
> +	.delay = {
> +		.enable = 50,
> +		.disable = 50,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode boe_bp101wx1_100_mode = {
>   	.clock = 78945,
>   	.hdisplay = 1280,
> @@ -4813,6 +4842,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "bananapi,s070wv20-ct16",
>   		.data = &bananapi_s070wv20_ct16,
> +	}, {
> +		.compatible = "boe,av101hdt-a10",
> +		.data = &boe_av101hdt_a10,
>   	}, {
>   		.compatible = "boe,bp082wx1-100",
>   		.data = &boe_bp082wx1_100,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
