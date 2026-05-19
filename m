Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D6338BF9E;
	Tue, 19 May 2026 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172095; cv=none; b=c64F3FwgKdgFtgKx8ewCvSGhq0AmZGscS9aCb4pfGGY+1iywh5Ec++MMFPVAo+TUt2GNqSLIszMvsyMaoJiLRHMK0OaoF5cbC28YOnhsyg4aBhMg0atnCOEUsQq8L+ip14kDPV/UhfJaD3kcA+BE8ewwKWGRhLhj1yUWYpXg4Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172095; c=relaxed/simple;
	bh=41Z1DJEfpN+VlduVVFn/3scUAnCvvTeqtOFh+uOYsg4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UCmZW16Uf5YfpbY0eJR6bS6i59+mOz/29ZFWuT8FtwACqqb+1t6X7pvxCKb6pGtHbGmhF6U7/iibotbzjO4eWLz1afzQmKbbc1dUfwXX4AjSrrOQHTjtA/Zm0jhU7Mwe1t+1lcfCLGtjGZ5xV9IDFVh+FuoRF9wPMkS8NW6m0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/J0clzp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/J0clzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEB4C2BCB3;
	Tue, 19 May 2026 06:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172095;
	bh=41Z1DJEfpN+VlduVVFn/3scUAnCvvTeqtOFh+uOYsg4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=m/J0clzpRsVypsb/Rfh/gS2eapAjDjjf1PljJ6ytcPf9J95UAW0JfZ1LlUyjuq7dV
	 1zqLvmIp8aismGbFz1epwjPiBnv9NqQD2XNZ1wFPQuMXxH6JSKtLksx/8agCil454f
	 0yq1I+AZCKyLkbf+99RQ3symRNel6LtSBJEczw38ooquSf27HYwCs0mHN9xDZ27nkE
	 JZzau2SCwXSiFo0sWqVHS2/mkafyb2KW06BbUn9WY08yYLQsyxZRs/P9P/Rd+CtLqk
	 wsoa6q4jaBvipUSEZ41sPKq/xxb+zDl/iZ1rHN7yNvX5gLLlkKqh8P0SC9F8bGzmjt
	 /EdmMDm+S4+nA==
Message-ID: <44a15912-b099-43aa-afe1-83f2025309cd@kernel.org>
Date: Tue, 19 May 2026 08:28:09 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 11/23] drm: bridge: dw_hdmi: Remove cec_notifier_mutex
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
 <20260518180206.2480119-12-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-12-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/05/2026 20:01, Jonas Karlman wrote:
> With CEC phys addr invalidation moved away from the irq handler there is
> no longer a need for cec_notifier_mutex, remove it.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Nice, I wondered why that mutex was there at all.

Regards,

	Hans

> ---
> v7: No change
> v6: Collect t-b tag
> v5: No change, cec_notifier_conn_unregister() call moved
> v4: No change
> v3: No change
> v2: Collect r-b tag
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index aae1b890167b..0dd4c823c60a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -189,7 +189,6 @@ struct dw_hdmi {
>  	void (*enable_audio)(struct dw_hdmi *hdmi);
>  	void (*disable_audio)(struct dw_hdmi *hdmi);
>  
> -	struct mutex cec_notifier_mutex;
>  	struct cec_notifier *cec_notifier;
>  
>  	hdmi_codec_plugged_cb plugged_cb;
> @@ -2476,11 +2475,8 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  
>  	status = dw_hdmi_detect(hdmi);
>  
> -	if (status == connector_status_disconnected) {
> -		mutex_lock(&hdmi->cec_notifier_mutex);
> +	if (status == connector_status_disconnected)
>  		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> -		mutex_unlock(&hdmi->cec_notifier_mutex);
> -	}
>  
>  	return status;
>  }
> @@ -2542,10 +2538,8 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
>  {
>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
>  
> -	mutex_lock(&hdmi->cec_notifier_mutex);
>  	cec_notifier_conn_unregister(hdmi->cec_notifier);
>  	hdmi->cec_notifier = NULL;
> -	mutex_unlock(&hdmi->cec_notifier_mutex);
>  
>  	drm_connector_cleanup(connector);
>  	drm_bridge_put(&hdmi->bridge);
> @@ -2612,9 +2606,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>  	if (!notifier)
>  		return -ENOMEM;
>  
> -	mutex_lock(&hdmi->cec_notifier_mutex);
>  	hdmi->cec_notifier = notifier;
> -	mutex_unlock(&hdmi->cec_notifier_mutex);
>  
>  	return 0;
>  }
> @@ -3323,7 +3315,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  
>  	mutex_init(&hdmi->mutex);
>  	mutex_init(&hdmi->audio_mutex);
> -	mutex_init(&hdmi->cec_notifier_mutex);
>  	spin_lock_init(&hdmi->audio_lock);
>  
>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);

