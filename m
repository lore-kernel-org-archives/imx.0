Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B302144BF
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478399; cv=none; b=vBdESPjYkF6oO3jQwKIZRBqTgoPYM8CyxTMYG+wKN7tQbsOwcZB7YixR+Elhn7pYfaXeDlc7KnypgaagYJKYVLDpKCWGQ4g35nKrRvKvT4/963z7RAqyhRqT82PSswCptZkiTheaZDLXezurFx1/6RZAJTFRIRdw/J1Di1yKdHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478399; c=relaxed/simple;
	bh=dh+DdXrD41FoDCiywpl4Jl9pY722E2W/HNmKBDuQ+KQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rS7x1XZMKyWE0oqKppvFMJLVD7ADAVV2uUESKF82pJM/LYtORz1StO5pPtdx+f3Bs3h3glKCyABTvXhreF9Xg8TS0PxAeOAeEdbayXqZsNVK2MTsjAgWIc0PRXDwDRT05lruwAdBep+mo4a+RFIFYDmjC8Kcpxa5cidUiK6Hi0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ag+L+JfR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ag+L+JfR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4399ee18a57so31872975e9.1
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 02:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740478395; x=1741083195; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIEVpBfqzlAIj3t3+p9Xkb4HBEKJwXzTRtthqqzde8o=;
        b=ag+L+JfRDTM2p6HAzYEaEvVxXrHxeefb2dzxoBfoGqFVBmxbzHDPOmws+bMUFP1hIh
         ULrvpTiMYe9NIIQDDEQhDdITZ5T2RPGLmU5Sp+zlf1XImATcsRY8Jk4yC1Srm/h1ttl+
         tM/FDXLViSgloUAZVvh2M8n/5shhzyBfwqx9LP8X0gtUKBr4o60JDoXuZTJi6YDqAuLk
         87LXNG5GFl/6pCG13r4o4340OgMD0SjiAKJuxp6UDIOnYBCoczHq0kH0bMr3ge3KmPdM
         RzD3n2aLJNUZ3emziHlZ2U5L3RqO2RDZei1GC6+KhvWidMzyX39tkS7osDTBOCHDbhUM
         yrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478395; x=1741083195;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UIEVpBfqzlAIj3t3+p9Xkb4HBEKJwXzTRtthqqzde8o=;
        b=JC2r88tE94VIhMySqfGFDv2RU/DLFOCTgetFnUStfLbIHbM1LJpk5oRsNWJOHSYuVs
         mPku6bvQLDYcbGAbG9D0djnhd+PdeLJGW1Sw+JXyxWJk4PtMiFpoUkbERWL0PteNAzhb
         iU0bjHh3wWfaIbeK352lMCyz2r/8X3/EOLPGeuyYFJt9NwJE+JvA3U9KzXw7+ixBZBL3
         jH1N7Mki0evGAu1D3D6nItvSRQMporkAk6lNxbCPq6L/rdDwc3zdDmTHH92zZI/SqKUZ
         rQlDKhaTPpkXoiswbViljEkFfzmJql/j8iqA64dvXtwXncsDGI4BWhlPARLE2RT1XTAR
         TfRg==
X-Forwarded-Encrypted: i=1; AJvYcCW0ADrlOlfm2xHQyMa0m0clAOKUJZGLakophfG59rgwhbsZsl3aPuW0TiCUNMFMoyK6cs8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ/ygwPT12QPE5KTfzGTiZv7T30WA9e6d+lKdJozWKDuKTlQMs
	aVqRNyVJZhRhgnk3XUFNagWV1G1K4rMCXzYj/Xfhe6wKz7y48mLzcPEb45059is=
X-Gm-Gg: ASbGncuT/d+L7QXoMDSb5n9vg7RT9+/rCpvxj1Rb4lUMeCiWnDf4B2cPzg2RcLrkYBm
	2nnvbUrDijseO4536FDLGvnIwzUNhAgVqqcDG4GRy3nWcD9wkyD+/PLm1xRfCfBJi1st4plbFSg
	MChMTshDDpDvzsQ+fqi2zmSDqfao0LHQSMddprSJRWkrw+c8qXMre+YqIYbfZ6nNN1ulYdEG3+y
	RlpcfK7aUojPxfctkOimBSViNmLHE283ej+5DlUsuBRhxqSOf5fRW+oj+WghUG82wsyfqG1F0QK
	1Au8V7SsXu3ASVg3QZjw9yYMNcrERxWRxjir
X-Google-Smtp-Source: AGHT+IHuxrFve4RrQxTJm/qq5KQxrxMVsYCL+f8dws0ADcO/Z7yzKKpEwdKKdpFUHyiamvR4ZVYVPw==
X-Received: by 2002:a05:600c:46ca:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-439ae2d1f3fmr129669155e9.3.1740478395441;
        Tue, 25 Feb 2025 02:13:15 -0800 (PST)
Received: from [192.168.1.100] ([37.167.173.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce615sm135803455e9.5.2025.02.25.02.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:13:15 -0800 (PST)
Message-ID: <d4903cb5-f876-4229-b89c-c1fafd77fc3c@linaro.org>
Date: Tue, 25 Feb 2025 11:13:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/14] drm/panel: simple: Add BOE AV123Z7M-N17 panel
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
 <20250224-initial_display-v1-8-5ccbbf613543@gocontroll.com>
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
In-Reply-To: <20250224-initial_display-v1-8-5ccbbf613543@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/02/2025 14:50, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add support for the BOE AV123Z7M-N17 12.3" LVDS panel.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a52977ab73dc2edab0d1954c702fd797d6a5b969..232b03c1a259eb15e423b9d452d28e2ff95c70f8 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1403,6 +1403,35 @@ static const struct panel_desc boe_av101hdt_a10 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing boe_av123z7m_n17_timing = {
> +	.pixelclock = { 86600000, 88000000, 90800000, },
> +	.hactive = { 1920, 1920, 1920, },
> +	.hfront_porch = { 10, 10, 10, },
> +	.hback_porch = { 10, 10, 10, },
> +	.hsync_len = { 9, 12, 25, },
> +	.vactive = { 720, 720, 720, },
> +	.vfront_porch = { 7, 10, 13, },
> +	.vback_porch = { 7, 10, 13, },
> +	.vsync_len = { 7, 11, 14, },
> +	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
> +};
> +
> +static const struct panel_desc boe_av123z7m_n17 = {
> +	.timings = &boe_av123z7m_n17_timing,
> +	.bpc = 8,
> +	.num_timings = 1,
> +	.size = {
> +		.width = 292,
> +		.height = 110,
> +	},
> +	.delay = {
> +		.prepare = 50,
> +		.disable = 50,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode boe_bp101wx1_100_mode = {
>   	.clock = 78945,
>   	.hdisplay = 1280,
> @@ -4845,6 +4874,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,av101hdt-a10",
>   		.data = &boe_av101hdt_a10,
> +	}, {
> +		.compatible = "boe,av123z7m-n17",
> +		.data = &boe_av123z7m_n17,
>   	}, {
>   		.compatible = "boe,bp082wx1-100",
>   		.data = &boe_bp082wx1_100,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
