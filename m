Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24EA3612D8;
	Tue, 19 May 2026 06:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171915; cv=none; b=o0rIKV8kMBUGfVm2y5TT42VD3qiWLhCvwCNqMV262OWCIJ02Zjlq7ATVslJIIqn0vysTSwLnm7K5nE9oXROb79EfwNC2Dz0XnoGwevLscaIZQJOH09DYVKNQJvaNC2S6+vdxd+IKWVDra3g8mJCVP0TijTlU/4ZhUAF2pTcb9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171915; c=relaxed/simple;
	bh=MpgzPBqE/fWyBM0VdbQHNzKaNFoOyD/JuCeyGfbplSs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GJeqYI+2/3Z//V6XpLMnkfWsfC3mpzejJfaVUQuNmihn/JbaU07T5bXEtcfKKAgdhmakZ4w3taRcJdqpkdgZuF7B2+8fNLxsFBMqjTgt3jdCpWaxeXpujHvbpsKOGePC3FZzTK6EaEDoCgPT6VGHqnW/UFwFzFZB4ukp1QYrtcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jo9E0rC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jo9E0rC6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906AEC2BCF6;
	Tue, 19 May 2026 06:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171914;
	bh=MpgzPBqE/fWyBM0VdbQHNzKaNFoOyD/JuCeyGfbplSs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=jo9E0rC68t/vIL+8vT1U3oPlIMgYNtoE9ZXok8N9x6ULV/N8mqfPdAyrI1tQRnzQ4
	 b6QTyyd+G3c/kCJsgwdMx3M3d8HKPSkkH8hmd8EVqnNoIm82itL7fLwFpAjTZs2NKI
	 oP6dVzJRWYA4pTC1US5z6FoZgtHmFCvoJcG1iQ9dFyImwn6Jsp547vwZEkqH+lOrUF
	 9YdQgczrAATdePQFoJZud3qudrVVW1A6x4Me4zNLcZscep3QjS9UFEjYDKuS/Yd16y
	 szYTcOAY6zjO62mRMRlVNgTxWvs5+GY6+blpY87MbZiB5sgBbeWR76O0RsXqC7klT+
	 lzTnBLfMrCnlg==
Message-ID: <cdd3d7ba-fa73-41d0-be1b-76f1fccad1dc@kernel.org>
Date: Tue, 19 May 2026 08:25:07 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 10/23] drm: bridge: dw_hdmi: Invalidate CEC phys addr
 from connector detect
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
 <20260518180206.2480119-11-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-11-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/05/2026 20:01, Jonas Karlman wrote:
> Wait until the connector detect ops is called to invalidate CEC phys
> addr instead of doing it directly from the irq handler.
> 
> The CEC notifier is only registered for the dw-hdmi connector so this
> has no impact when the bridge connector is used.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: Update commit message
> v6: Collect t-b tag
> v5: No change
> v4: No change
> v3: No change
> v2: Collect r-b tag
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 5fd26ff8f55b..aae1b890167b 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2472,7 +2472,17 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
>  					     connector);
> -	return dw_hdmi_detect(hdmi);
> +	enum drm_connector_status status;
> +
> +	status = dw_hdmi_detect(hdmi);
> +
> +	if (status == connector_status_disconnected) {
> +		mutex_lock(&hdmi->cec_notifier_mutex);
> +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +		mutex_unlock(&hdmi->cec_notifier_mutex);
> +	}
> +
> +	return status;
>  }
>  
>  static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> @@ -3106,12 +3116,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  				       phy_stat & HDMI_PHY_HPD,
>  				       phy_stat & HDMI_PHY_RX_SENSE);
>  
> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
> -			mutex_lock(&hdmi->cec_notifier_mutex);
> -			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> -			mutex_unlock(&hdmi->cec_notifier_mutex);
> -		}
> -
>  		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
>  		    (phy_stat & HDMI_PHY_HPD))
>  			status = connector_status_connected;

