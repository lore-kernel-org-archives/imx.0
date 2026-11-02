Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625413;
	b=izt1Coh3b35nlqeG0hvFiLX7q1ml7EACaaF8zl7eevBsQWbDoxDWOquzPTkfUo9HTLAW
	 dAJNUeD+DvuZSAyDjQ4tnW24SHBC57CIH3hUkLWKE/1WJ8cls7lONwYwgp3NtQthhD/RU
	 kkfFtEzrZvkw+2GzPQ/ibZ+Nsxy+ZeCquz8DgP4gNxzZxyHSqWNWjOXLMrCl1K2TTRLW2
	 NV23J2OiZq2dZrl6J9JI053hXN4AfFquhT1maDjGCnlzdbu0xehJva1R58jndiSuY+RD7
	 hEY3+/atX4Po3eizFvd96Q98yN6vsII8/FROIJHxQRie18d/owqOc9OrX6VBBXCDZAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
	b=IBtEo119PgKZAlDGdwGbIMxp9Tyh0ata8oCtOZO3Rky+5IaxedlMRzSxYujQGFn0qDv4
	 AKNAtEsm4RPp9NjBoo8mmhW0kM7f7LevO4FPh89HowS/PJbjDifPApO1QXAgJBYLLmESM
	 r9eQfhbGcGptWRDpnCy5MgMVetoVbmnGRdqKufb97bGfYG5umKyWsjsX74Snrd1RwBk1N
	 dWmgY3O//lHO0CBF0/k/EkbwcbNXc1ziNlIrnU7rW2kempDfhtZ7Q7CeRy+o4g8Ts8yDl
	 Z8tyzDPe8afenZytsrcb0HNdKfW0rgLiknn11S8hTZSAbS5v9dx/P1WRFpIQK2HsGqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kH1oIHzt;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFEE606A327
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 13:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DFEE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kH1oIHzt
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso26510995e9.1
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 05:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625411; x=1794230211; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
        b=kH1oIHztDmoo3KvMRexRQbnLn2Cj5Ut1jcGxbCCGL6fLaSWbMHaNKJR8Fv98cyG/nw
         9F+qkLTPgamxN/xQc2bYOeutHPZdoJRcmJbwjjwf34iXww05mY6dKfisY5zeuT5cTXLO
         jfxu5kLvuZFmWnqFSsY2oP6vRgc3PAidMw4uN/lR0NsxSXQ2xJQeshJa8SAbzcOdbHz1
         L9I+zrdwvHck/jVo7aA3wKOghCXNs+rbSEoKS0SgGuBBeyTmdVjYPILXXJmi76MLa0N9
         BsFCbnrltVKJKxQoaFrW4HYPNp0kmYXl98UirKevPs3iJUxFgS2KCk8GqYm8L/xKl7Hm
         dvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625411; x=1794230211;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
        b=Zlpi+9C8mnYRU+ODLyn1+w0AEna6SGdTZcdRh9Dx1tuMHPKyanrGegZiWHKwOb336t
         ZMKPDaEzRP/DT3SxSWDLpJ9AodT+3YPjeEiffqjNfwKRN6Om98iZ9wZW6rVhgeJHaqWG
         xZxmpvj1EbGCts2xo+vo2xZe+ojfIlY7NiHKM0ED68zLdhzM2EmKsCIG7xP+4Sg0x+04
         KIx5uNNXVVZkjnxRbwmPTquG4L5IyZ1JJ+p2QxIacqOXvGiQvcYvwdFNiSxbMBg4RFGu
         o/ogfpvmZ17BvJppI+hCjLGjzWoaSdIhw5UN6VYH8IvU4jTciRQLQqlVi/LZA0tYm5tp
         GEAA==
X-Forwarded-Encrypted: i=1; AKwUvBw5hgSmrbgamC9lKlY6FvLiiYuE2y2m5T+9HhOcu6ZkgR38Xk+b7WO7dagEU1SN8zS1KG8=@lists.linux.dev
X-Gm-Message-State: AFq9FYKTBC1ygrc2fgBwpqODXBeavoRHh1eeCXRQySQTJkOUdizZWHKD
	YZjsmQCe+xpnHClG+TqKBv4lnhJMlfGlSkBmLfMrahXIKuB+ojhyeSzAyKWZcAyvJII=
X-Gm-Gg: AYBFou0DdlrQSxaMS46Zfmesv1cL3W9NQw2zzf2HK4v7tVwzgNZZoATDfhvdGx1i0ss
	lTpbfy1+KH5cf09dgPcS8ISrrBzlPrPJZ3K5q4n7GOXuiP1W4HD4Lso8igydwJuW7KY+dfCGztN
	hCLOFWFohjJPtWU0+kbHmHU5Ch2jzuPlW7iHBxgBbyvtZTgH9LnbHV0RDLkjQhBRXpOLMvnLE3w
	MaO0Jm9ywq3H5Dcq+E9VMF8/RINclJJfQG9/wrfobnwns59bL5NlCe+rSXPiaJCnhFvZEeihrD9
	d9TCgpiBJ4lgq/9r3ap5idh3K50I/conQiYcGYtJpLTMTZYSFRhwLvYNaoQHjjlnAw79+EvveXh
	Pa2SenjfQ6Q6WzTjmbYbtblBjcsVcSk2iN1FgbYbgzS9N9Om9f0DZFyqfvTxgpiUsNj0YwMXsso
	s1ZgWJd0dKjn0Gl1Xsx4opspOqhNZMQB4BG36tWhgnBrfzHUX95ckupKIUqGMj2oPZ+hBpiPEAO
	UUlBeqj91Dp3Lxrg3sy8p84g38yai6C5bLiWo1MAZcrDUXlV3zKGYXG0IwKnrjj8l/ZFJJdv99W
	lheCJ8JpXx8Eu5QgXOjI5cK34q4w85ccEmAaFLaYgMevCCXFBtpecMnna1l92RnovwfJKKR9PWx
	XF3Y7Ug==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4ac1709ae4emr246187665e9.14.1793625410523;
        Mon, 02 Nov 2026 05:16:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm331607645e9.2.2026.11.02.05.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:16:50 -0800 (PST)
Message-ID: <fbf54a00-33c6-4b5f-a9d9-3f6c23744ae9@linaro.org>
Date: Mon, 2 Nov 2026 14:16:49 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/7] drm/panel: simple: Add Waiken WKS101WX001-WCT
 panel support
To: Frank.Li@oss.nxp.com, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
References: <20261027-dxl_lcdif-v5-0-3a974e4b94b2@nxp.com>
 <20261027-dxl_lcdif-v5-3-3a974e4b94b2@nxp.com>
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
In-Reply-To: <20261027-dxl_lcdif-v5-3-3a974e4b94b2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 16:00, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add support for the Waiken WKS101WX001-WCT, an industrial-grade 10.1-inch
> IPS TFT LCD panel with a capacitive touchscreen.
> 
> Although the module advertises LVDS support, enabling LVDS operation
> requires hardware modification, including the removal of several on-board
> resistors. As there are currently no known users of the LVDS configuration,
> only the default interface mode is supported.
> 
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v5
> - drop "If LVDS..." in commit message (Liu ying).
> 
> change in v4
> - s/LDB/DPI
> - variable use 101wx001_wct
> 
> change in v3
> - add wct surfix and change to use MEDIA_BUS_FMT_RGB888_1X24
> - Add information about lvds support plan.
> 
> change in v2
> - update height to 135 from 136 (sashiko)
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d7dbd7442919b..5ef6a79f0de95 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -5252,6 +5252,34 @@ static const struct panel_desc vl050_8048nt_c01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>   };
>   
> +static const struct drm_display_mode waiken_101wx001_wct_mode = {
> +	.clock = 71100,
> +	.hdisplay = 1280,
> +	.hsync_start = 1280 + 70,
> +	.hsync_end = 1280 + 70 + 10,
> +	.htotal = 1280 + 70 + 10 + 80,
> +	.vdisplay = 800,
> +	.vsync_start = 800 + 10,
> +	.vsync_end = 800 + 10 + 3,
> +	.vtotal = 800 + 10 + 3 + 10,
> +	.width_mm = 217,
> +	.height_mm = 135,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc waiken_101wx001_wct_panel = {
> +	.modes = &waiken_101wx001_wct_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 217,
> +		.height = 135,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +};
> +
>   static const struct drm_display_mode waveshare_28_lcd_mode = {
>   	.clock = 50000,
>   	.hdisplay = 480,
> @@ -6248,6 +6276,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "vxt,vl050-8048nt-c01",
>   		.data = &vl050_8048nt_c01,
> +	}, {
> +		.compatible = "waiken,101wx001-wct",
> +		.data = &waiken_101wx001_wct_panel,
>   	}, {
>   		.compatible = "waveshare,2.8inch-panel",
>   		.data = &waveshare_28_lcd_panel
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
