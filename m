Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334463AFCF9
	for <imx@lists.linux.dev>; Tue, 19 May 2026 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203568; cv=none; b=ePebr807UNFgI2kRjHG8lYJ6HRRB2Uf7mgtCQzGAWujjjEfSwyM84fHSwqG4m6+/Mm+TOCMPYYD2ByaXl1nUMOUDCqsfOHk/+SmjJgQCDC5m2qPRXENMQ3oAH6SY4n4uPgAltlBXNmeoDi+bT98cRYpTsBC+QkFOV9AciM+elsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203568; c=relaxed/simple;
	bh=JTEW9xaI8Km5/C7/S1TdwNYRR1/NaikLd42okuSiXJI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LWiNqcE4E6WsVyMfuhwLt2UWgHBIOOGsD9wH15JwEkbQWttUY5zI5037wLmjsOG1gSidIfjNrVXwLKR3TA49q4XTLo3vjmkfjQb4/qVg/mqIoTO4rOumTJeQS3fWd3RIWle+Ik05MVz+bZTd10UYd3F5010pQsmzXLz2yErFb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vt8laYe7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vt8laYe7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45e7c636e74so1667291f8f.0
        for <imx@lists.linux.dev>; Tue, 19 May 2026 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779203565; x=1779808365; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVQp/cA7Et9VS7l3eduBKFhTtN4ZONdXEaRfRIEiTJc=;
        b=Vt8laYe7vYDHd8HjunRwINtWNZgAy+kl4Uni4/fSTF+RvO2TtB0OvTB8DvWxr6VJ6H
         QBB81XV1PD6w7k6mA6T9idRFNJ0fBJ421q45pU5TuNpva8Os68ejcXDLsPLzFhKTam3y
         kRACp33WpViGYWy1w4Eim91fXhOY0UcGf1y6zjS72+Cput/QLzhzddR9tdePMrOt1Wmy
         AMO+7NJ+NOA+fMregIlGi2/OZd28FtRTIUcMqor85E/4PcjETs5JUuez7PR7/lITLAEQ
         bgGJq3tt7CwnoxzcpQR+fY/BpndtDthxIpOVhzlnjjY2lPSntDgoC6mX6LCu5YiG3YX6
         tzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203565; x=1779808365;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVQp/cA7Et9VS7l3eduBKFhTtN4ZONdXEaRfRIEiTJc=;
        b=HHxmipJKK4qPVFiUQrxBpvOzE+mUNXj+0YQH3V16e0TKRvt11ubdhbrsS01ZpLyp+h
         SZRKOBcyYnXBgZXG1Z78dXCGJdI4Y9kkLirLyEQVkacII1iMrdGWM1gN2fz7vLsDPRC0
         YS10I+6j7U6tXk9bWbMR2BwYB8fPEB0DUgey0WGJhDKwbWANaAtUbfpKt5FU4IFeJqei
         qgeYQq/lbq8fse5AMN7QfwVPNRpNsUQfnGEoFhy0FuEoV3Y0ZA3LgdiUyBobsjH7TXFr
         ahoHYkP62ZFwhEEXzH/Ii8OBzMoRTUFXA6oPnu0JypMuVj0fPmgsG2x1XH69M5naK/MD
         hA9A==
X-Forwarded-Encrypted: i=1; AFNElJ/GQWTl7eDUnUarUk+QNR79MKwE19axskFhNMdqOJKiMjd4DQ3l1w7QgptNniJQJ5ZQpfI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwL2Rr3jRQdZOYWUJWUIOaB2L4fZdPtUX/AdJD2NU8gEgcthQvy
	PddzCUxsFq/2/oVMmqI12B6TYz4ogk7WYHN4o/D77rLvVBWrAoQj+qtJOzOiiyf5pYw=
X-Gm-Gg: Acq92OHwcYnNdTSTD/GzKipTvlP/53jrjrUvpe5s/x44tx35cGSuiJD++e+GvFDwdKO
	SC69ZINy/7EiscC6uuh7ll72TjYfawa55vjCp5N+BH3J/IWCZ27HCV5jOcc1oQF9CUf1GZ2fXRv
	dt67UR97VgSV4LWM7766RTJbwWFm+jM3jnj3bovFtMIq3ALqZwE8PCtPsOGxay1BCs8FQkaTrwY
	7r4w0+aKk4ltNChqREqjmRVkIJtb0f3QZo82NeWNiFAF1e5L91NWvfVBVP2mnIH4kR20cjiy1w7
	7OocS7fMiRDEeWp5FOpcfWMGIRpj7js6UZta1PpMTrqCUhC98hVjSKdalIRKcO955LI2ZgRCVl+
	0A8oivy9zaBozfjDB3QigwO6EsCPF/wwtyeklacn0nqGswxKA4Q+Xf8SVhtjxIe4B9agnMXZAYf
	9mWd7I7ySFiQP3yY7aXAK0nrI04dJ+MOgheCZc/tKZN5iPOh43EhvRKRYICK5wPhQOrlk1ArCAL
	Oqify8=
X-Received: by 2002:a05:600c:314f:b0:490:389:7644 with SMTP id 5b1f17b1804b1-49006db5bc0mr175326005e9.17.1779203565446;
        Tue, 19 May 2026 08:12:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:45b7:1191:7413:7781? ([2a01:e0a:106d:1080:45b7:1191:7413:7781])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm354389755e9.12.2026.05.19.08.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:12:45 -0700 (PDT)
Message-ID: <2de87295-aa31-404a-8e69-5ee7b14bf8c1@linaro.org>
Date: Tue, 19 May 2026 17:12:44 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 31/37] drm/bridge: panel: implement .is_tail
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-31-45e2bdb3dfb4@bootlin.com>
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
In-Reply-To: <20260519-drm-bridge-hotplug-v1-31-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 12:37, Luca Ceresoli wrote:
> This bridge is always a tail bridge, i.e. it never needs a following bridge
> to complete the pipeline. Add a is_tail func to expose this.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/bridge/panel.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 4978ec98a082..102f987b1235 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -58,6 +58,11 @@ static const struct drm_connector_funcs panel_bridge_connector_funcs = {
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
>   
> +static bool panel_bridge_is_tail(struct drm_bridge *bridge)
> +{
> +	return true;
> +}
> +
>   static int panel_bridge_attach(struct drm_bridge *bridge,
>   			       struct drm_encoder *encoder,
>   			       enum drm_bridge_attach_flags flags)
> @@ -206,6 +211,7 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
>   }
>   
>   static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
> +	.is_tail = panel_bridge_is_tail,
>   	.attach = panel_bridge_attach,
>   	.detach = panel_bridge_detach,
>   	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
> @@ -297,7 +303,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
>   	panel_bridge->panel = panel;
>   
>   	panel_bridge->bridge.of_node = panel->dev->of_node;
> -	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
> +	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_IS_TAIL;
>   	panel_bridge->bridge.type = connector_type;
>   	panel_bridge->bridge.pre_enable_prev_first = panel->prepare_prev_first;
>   
> 

This looks reasonable

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
