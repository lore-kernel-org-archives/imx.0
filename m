Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BF13BE642
	for <imx@lists.linux.dev>; Wed, 20 May 2026 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268643; cv=none; b=afcPFaV+DmKueBqydbgAimFAY9ppW6R8CTv3SmObX5SqsRxudFqSAUHSbfn1kTs5PHoEJr7m9sz+97eVdAIAitwgEyzUEUT3IxQpHFKmlXdZj6B4bDK8wZQGMTLQEaKCU4cYXIvg7S4r3AbZ/w5rlRr9C1HAVW/hS4lI4AM7MEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268643; c=relaxed/simple;
	bh=D8sx2BsPwomajinB0SVjMtIZ/irs2rdJpVD0gaZczv0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kffuIB5I2TNDBoYv7FmuoFyIvpnGTR1pznXNihaZLMLPlQWwbvN2F3ZKhV0Qys/SbJXrMoIJdqQ/3utwpD8FogXCO/rl+Im81XHaxhvjKsn+X7l++kORWW1ZV70YoLp/3mtql2IVLOvomv2X0AV8/cGwxjdXuYDkvMEDS9S7m8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BcT5nl2D; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BcT5nl2D"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so26918615e9.3
        for <imx@lists.linux.dev>; Wed, 20 May 2026 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779268637; x=1779873437; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQM11Mg1okAZbmmFPoevnMUA1OvrXb8LaWj00KaDlLQ=;
        b=BcT5nl2DIXsQs1TEO/LpFe4Npe86agWuWKVDwe7h4i7ZfOsc1Uzoefgintt0mr3Zuu
         SboAya1nGY8vHfwlngcj0PRUJAn4+eprj70qbqItumEYVATIW+aAPy8ZYnrnsKfoXeQw
         NOyy+9aUpTLY4Cx/Z6GftwdIMTukAxvChx/goTplE32m0RHRDnbzX091mU3VLazga1nF
         avv6ThYtQHPozVmw6NlTbaeoYPER2eoMq8qgMwEXISHnFYr9P1cP22Vxx5z+kP7OB+Yr
         REW4k8yTi8uLHGX4E/1Rzik0WacJGU7eHhshE90/6K6wuBuRzG1nlnig66SivrWt5937
         cIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268637; x=1779873437;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQM11Mg1okAZbmmFPoevnMUA1OvrXb8LaWj00KaDlLQ=;
        b=p5hoKGFWVaIOySpQ9wDM97IWSWCIV+U417EPWMJ2MnYPpva09yIEjpBSXNp9/mqMW+
         NTTw9/FBOzqUqjPd9XOjlWl3WhAdf8I2Qi8HNyRP0rWKgkZRwYBpLt5Yqe2n25xQg7DE
         XOJmJF16JAIHjfWGbXBVG66mjAbEu+s6/O2TmraUJOHl2Ro2GqmySqdo1BS2yxaxzG8I
         3b2OnCFdIc/gToYb9oKm5aidmj0a3xncMPOZ/4uVkKAnZkMh8XEtel91Buz8/sJxYReJ
         vmKpQNuQi9SAHMbMlbspfwjpVOqqw6OSFUlUI8ntnlPrEDtGwL4jzUaPUeyS07aXjUTd
         f0PQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gCWSLvQrpV7KcxtPe8K40CtHvIM/zDwyT5kn5KO5ODRko39PNnPtwLGGH4YyAd6dJPqo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9WBWF0hMERx1UJHOIznmPFTS5AcPaxYgW0et6+TCkGlnJT0rH
	/n3lqUgpMLdX7FyRMW64ZYcpUdrnnoT7M4+IBTfJwK7Ul8/PT6XCuMRzlJ8/gCMqyLc=
X-Gm-Gg: Acq92OG9a1ZyzufCyhp7Hk+CrEPJpw7VDJTDztoKbySmzc48oKQWzSBdaDOj6D7x126
	gitoZt0o5Hech7dL2dPDSmFSiEP0wSdjCMNK6ITQ1S3VPNR1a5bKZbVJ1C285pn16mnkda5bQdz
	tG/DKoEmSHCmx2AKUIoqGsWjA/GL0b80v3K1cCsLXB27SOJQ12hHx7mTaupotl/bJtn6GJBDCDA
	wUXF02Gh3PVIe/j3EQ1GOQxJzWkX/COUTm9uPZh9zfYnGia7cnXuYBpMZtzENM/9U5Yor39bp4z
	sxdzFaRaVzpbKWqpvJzTF9Go0ZEUzVfcfQ1cHOfsYt/KlgRJ8yJz4M2pQkCVWrfZOZrIayYb5FH
	YDhS5xUtxnD7XKK0AXhVo+rIFc1OjSq2D7jG6gqQhvfyiyq38MiGr7qZgmmIabfCTV+sBV3FlH9
	Nb/4D9v/a7a7OY6mj//+yIOFaPwTRwP9sVdMpI8tAKl59imsaJrU7avFOdXmhqD6mrDbnrCC2Tm
	2M+
X-Received: by 2002:a05:600c:4e87:b0:48a:768b:eea9 with SMTP id 5b1f17b1804b1-48fe60e51bamr379132105e9.4.1779268636948;
        Wed, 20 May 2026 02:17:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5dda:3751:f88e:6ff? ([2a01:e0a:106d:1080:5dda:3751:f88e:6ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7543asm127859995e9.28.2026.05.20.02.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:17:16 -0700 (PDT)
Message-ID: <b9499456-3fd5-4c0b-a0a4-7a6344f21708@linaro.org>
Date: Wed, 20 May 2026 11:17:15 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 16/23] drm: bridge: dw_hdmi: Update EDID and CEC phys
 addr in bridge detect()
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-17-jonas@kwiboo.se>
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
In-Reply-To: <20260518180206.2480119-17-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/26 20:01, Jonas Karlman wrote:
> Update EDID and CEC phys addr in the bridge detect() func to closely
> match the behavior of a bridge connector with a HDMI bridge attached
> and the dw-hdmi connector.
> 
> This change introduce a slight delay to the bridge connector detect()
> and get_modes() funcs due to multiple EDID reads. This is an acceptable
> added delay to help ensure EDID and CEC phys addr always are correct.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v7: Update commit message
> v6: New patch
> 
> This is a temporary change until dw-hdmi is fully converted into a
> HDMI bridge in a future part of this multi-series effort.
> 
> The patch "drm/bridge-connector: Use cached connector status in
> .get_modes()" [1] can help remove one unnecessary EDID read until
> dw-hdmi is fully converted into a HDMI bridge.
> 
> [1] https://lore.kernel.org/dri-devel/20260426-dw-hdmi-qp-scramb-v5-3-d778e70c317b@collabora.com/
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 37406555af7b..0c4388e7aa5e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2947,8 +2947,17 @@ static enum drm_connector_status
>   dw_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
>   {
>   	struct dw_hdmi *hdmi = bridge->driver_private;
> +	enum drm_connector_status status;
>   
> -	return dw_hdmi_detect(hdmi);
> +	status = dw_hdmi_detect(hdmi);
> +
> +	/*
> +	 * Update EDID and CEC phys addr to match the behavior of a bridge
> +	 * connector with a HDMI bridge attached and the dw-hdmi connector.
> +	 */
> +	dw_hdmi_connector_status_update(hdmi, connector, status);
> +
> +	return status;
>   }
>   
>   static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
