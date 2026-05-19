Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23722F5328;
	Tue, 19 May 2026 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172530; cv=none; b=blC52jLWA12FmxsWgmIcc7VXYjt6BP00anWLClNlVzONoHmQESBHKEG7JT8PsyRrIFDKO3lQNNrerXhVWBp1qY6NW3alRauUMkCjqZeIWsekxvy9bUI+y3dhWOwOGyT8A7xbgT5P2pWYL5NYICureJMbTPNi/aUHCUxrakP3sUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172530; c=relaxed/simple;
	bh=PRsYzknanFyATavLtM7cL+hf9VvsO0oo90C5CxicR8E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=scxxsGduxieLHEZiQyGq5A8t2CCIRy0fay97vII84ot2VUXKDP85d53utjSzTYOP/pUkJNIz6/1LRwGurA2NaUvfeZNbMMNECvLwFeX7eVeq91zRQP0EipyS8//BYP2mXm/+9LbLMsCJmyRqS5Dr6Rkj6Rl48GGAa3KiripTPKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSNqpumr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSNqpumr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A48AC2BCB3;
	Tue, 19 May 2026 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172529;
	bh=PRsYzknanFyATavLtM7cL+hf9VvsO0oo90C5CxicR8E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=PSNqpumrg6dYiiQYEmynbnixtWYpoeBtue8tnZKdS6qB5He5qHUutjvNLBuZJScPT
	 K1YQ6nDd+8DbQDcjZkfN4hcr0VnYElD8W+jpwAAXcG0RwxKfNeQvvMnaIPSnUVhSwM
	 5/bk/7/DgiM4Jd3kWs15hlvvWuqabW69r7hRymqbQADCeyh7gL7iR/AZMyAY3VTX/D
	 +N71z7FTLu2IomD1junPsiCBeG3ZPXQPRquV9lBmerq7Hu9oDE8jvPnZpGKo8clMuI
	 lFzu529xv3zIDVyPSljZHahvq+sjcZTRc3jX4vwXpu1Y7U36tNXlNbJxRVSp1es5ZN
	 R31nkIMZqs4Ow==
Message-ID: <3672b556-e66d-471d-90f9-ef1078527929@kernel.org>
Date: Tue, 19 May 2026 08:35:23 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 17/23] drm: bridge: dw_hdmi: Declare bridge CEC
 notifier support
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
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
 <20260518180206.2480119-18-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-18-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/05/2026 20:01, Jonas Karlman wrote:
> EDID and CEC phys addr is now being updated in bridge detect() func,
> making it possible to have CEC notifier support using the bridge
> connector.
> 
> Add the CEC notifier bridge op to instruct the bridge connector to make
> use of the generic CEC notifier helpers.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: Only declare CEC notifier support when CEC device register succeeds
> v6: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0c4388e7aa5e..5dacb8a99715 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3515,6 +3515,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  		pdevinfo.dma_mask = 0;
>  
>  		hdmi->cec = platform_device_register_full(&pdevinfo);
> +		if (!IS_ERR(hdmi->cec)) {
> +			hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER;
> +			hdmi->bridge.hdmi_cec_dev = hdmi->dev;
> +		}
>  	}
>  
>  	drm_bridge_add(&hdmi->bridge);

