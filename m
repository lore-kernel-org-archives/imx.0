Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D8D2D5940
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455490; cv=none; b=Gz/GCXRcB4gIzBhxp+zBKYXDqzQfxDDCawJnuGkPFzVl5GI64b+BZxFM4wuaqB4sxVsWFrNRFIbzjFRD1EA1wFIG47zswDuS/tvWWdxKiv9XXHozKLwzVeMDvd5RNT8ms5ZJQkmuFJcqoBv3KD/B8n179t6oUudf21QRV0l/6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455490; c=relaxed/simple;
	bh=ZY0piXHjcqDP2SnkG8dwSoXn/rxXsYi9b5kgdmUdqBo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SIrMlJsxeG+Pjp04JwYOr2Ev9i7sjX/xjXVYcSt7rXZ8gGCm01aurvDVjiDNdgAY/CpEFktw2n+C94yI2+i0FYNH6KTD2UPOgOfkwUhSBLSky0ybhCleTPDYb7LP7e6IioFPdLyQoBLRuFz2oWUZQ0Ztm73m8V0SsEI6428RaQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=efQpPVme; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efQpPVme"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso26413935e9.1
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 00:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763455487; x=1764060287; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiLXvYR3SAh3lzG8T3IGcW7j/zOR5abUB7/PBrsQY6A=;
        b=efQpPVmen+rORD2jHeUkOFil0AIJIyShJByi5Hk/P6tJ0AE3eGbnFnPiJVCcDNkL7G
         CI7bsq668UgMelo86jpoCWSqAc68xp/c+2NBXYtAK1s9q5pC1vhmI8Q9xzv2nND/FqRR
         /Knzr+HP64HYvaZqlPlhuM91Kl4/kcBJwLwKjYoSw/5G8bKAqgWYlewFK0PYNhs7uQke
         QXRBA1BNUAaBxl7KS7KDW3dTT90kHdR7N4y5FX+hsLidUHrL32Hx258z/X8DCRcrpLsD
         YLSEbJ5+yKysnxh71+buOSwHYwW7wICW7lRMQkh29/UlKFI5hm/7hYyMb4mKezIEUjwV
         OJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455487; x=1764060287;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiLXvYR3SAh3lzG8T3IGcW7j/zOR5abUB7/PBrsQY6A=;
        b=IkjeUrxwUnmxHfpf6l75RWDIW2dYBENxVbsMa0xFT151bMrd2HjZ+JQ2i7UwgqzYwy
         uXuivxVa+cSw0ghWTTEv2LMXSI6ybDnGvzPT1FO+3XOzlBeQO4D76CSldcB+EGBDSbl+
         bAXSCGPolv79HJz2xat9yhsKqOUr77evlPgEAuwsbB6wFWMIDaZqdyZyNe//Y5Y+td+B
         MaFUqSSLSRNmT1RE+cIlkSsu1bciD/XSdfp/Wak0hCRuyYFa+S353Xfzd9XwgQYoQRXn
         vVzRNAQ8/+WWF1q/7Z9NOkQnxamyfobks6uwh33NcHRGS57gHGxS1B5p3yTKCArVuK/q
         Y3ng==
X-Forwarded-Encrypted: i=1; AJvYcCWgnTariPncRX6JHkoeRhT2aC0vflynKxXKbBscEB2QRyKlY2OwCx3KWQg4W6uVgcufR48=@lists.linux.dev
X-Gm-Message-State: AOJu0YxljoOAlDQVB7FrmqBsPRBH1PJ70sn073Zq05MYuh0jHx1M9ee6
	07wo9+9fh00vM4hv+DH0FFFjlf5gAroLGcHxGg3BBKFwBSX9jRO8oGvcQR+zO4A9bPs=
X-Gm-Gg: ASbGnctYcZhH98vNuCZGJsMw8g2FJM2zEaxVy/Lt8GHHdBq6CN2+zygqbhzmBsd/Syb
	8rk6uHTQzTaoO2Px1jKGEDQ/hQrpsuboHMxYRuRJ9AdTsxk4AbDPfPUkPgWcXAn+2mSm9LOW4QM
	j0udXmkS6arNCHgT2FGE2wTPNPJfbc3aTBbOvAcHjIIvaHfWLdm2Ub9bE8z7XdzFRb17qUxPFos
	/9S+WtOW2v7EM4TLt6bGStVceljvndRDZGCtlHdbdJAg49wS3vR+YTiODwrqWe/Sq8zvHr7FXcr
	2xR5cpepOnpAlfYExx7bfY5ChhTFhGURO2KRbnP/4P+mrABLbCaS6FLdMu1CDc7ywBs256joPeZ
	wNXvXg46U5LaO6qw/25gbjThCJeVR6sNNPkNfwwJ6ayZrAATHlhUcUglLBXVUW7FWMd1ZucH+VE
	xKw4pzUOut9hFDkmtYZ2XNWmtOXA1l7wmoXeIx6hY/DwIiErrOco/6lOx+E5mUs3JxX6f+ue/Ry
	Mt3KjicDmKN
X-Google-Smtp-Source: AGHT+IGJqAXhGGSb6TQDs+/kJY+mvonLz1d9fwow8P219ibyRskSfl5sWQxul2oAsZJHK4/xFqAfuQ==
X-Received: by 2002:a05:600c:1f88:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-4778fea7579mr123949675e9.32.1763455487194;
        Tue, 18 Nov 2025 00:44:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dcbca9sm11108095e9.6.2025.11.18.00.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 00:44:46 -0800 (PST)
Message-ID: <5401d99e-fa43-4c9c-8eb2-c3bb126ff75e@linaro.org>
Date: Tue, 18 Nov 2025 09:44:45 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 05/11] drm/panel: ronbo-rb070d30: fix warning with gpio
 controllers that sleep
To: Josua Mayer <josua@solid-run.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
 <20251117-imx8mp-hb-iiot-v3-5-bf1a4cf5fa8e@solid-run.com>
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
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-5-bf1a4cf5fa8e@solid-run.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/25 13:28, Josua Mayer wrote:
> The ronbo-rb070d30 controles the various gpios for reset, standby,
> vertical and horizontal flip using the non-sleeping gpiod_set_value()
> function.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>   drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> index ad35d0fb0a167..c3fbc459c7e0d 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -54,9 +54,9 @@ static int rb070d30_panel_prepare(struct drm_panel *panel)
>   	}
>   
>   	msleep(20);
> -	gpiod_set_value(ctx->gpios.power, 1);
> +	gpiod_set_value_cansleep(ctx->gpios.power, 1);
>   	msleep(20);
> -	gpiod_set_value(ctx->gpios.reset, 1);
> +	gpiod_set_value_cansleep(ctx->gpios.reset, 1);
>   	msleep(20);
>   	return 0;
>   }
> @@ -65,8 +65,8 @@ static int rb070d30_panel_unprepare(struct drm_panel *panel)
>   {
>   	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
>   
> -	gpiod_set_value(ctx->gpios.reset, 0);
> -	gpiod_set_value(ctx->gpios.power, 0);
> +	gpiod_set_value_cansleep(ctx->gpios.reset, 0);
> +	gpiod_set_value_cansleep(ctx->gpios.power, 0);
>   	regulator_disable(ctx->supply);
>   
>   	return 0;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
