Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAA7305665;
	Tue, 19 May 2026 06:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172368; cv=none; b=p0YvwOpWTN0WpIx9w554Kn22jYnUIf6uZEgb+uAwi+XxVY8+HH/Qinf+tvn9WEMK8BNWjCBRQTzETSbdt8j/hmPp1opTfpFLtVB8dZ4T/UZpqVg5VI2GCgkT9/ohIyqBczFWhmrRMNCfYiQ3Kg7PNpBc1Z4KKiW5xrljlC9cGgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172368; c=relaxed/simple;
	bh=ZS8bu+mUGnJsQfUHh5+D7X6IBZxeFHb4boLNUv+hbtk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=D945ccqYrpEwXPbwuskFTSX7VywEkbEfVKApNJymUKBHYoNzsl3acv7qbePGkXJBs4XLx8C9VGihfAjA5OOsl7meMJuRtsU8Z5EX4YcZUn+04SkOuKJDtDlAyOsNVVip3OYE+k8e2cFL2go/KICt0UldJcKkAkyheOI9qBsWId4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6jpm0NE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6jpm0NE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03983C2BCB3;
	Tue, 19 May 2026 06:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172367;
	bh=ZS8bu+mUGnJsQfUHh5+D7X6IBZxeFHb4boLNUv+hbtk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=C6jpm0NE1YWpNOEyLkNml4qFiFT5iAzgwNHy9/WOWO/8Mguh5ACyzbepbI3sND5VN
	 uaGG7gFRVNXoTmoMvIqs0Yqn8TMD5W0iUr9EilOCyPSdtycggrrLOmQ1LGUMMGFUDv
	 frBFtZhVWms/kA5HX84CFrj5VG2zwFT8FklZfqkTwi+xSIG4LUNdepSunu8N2YjbSZ
	 roGum5iOnK1LneWHLbttRiZkfLZp2mjKNftjfvSz6QpOeJoSG7sc6Wk7DI5Iqh5A6s
	 kueYKW9BBfcanCe+vUlxUC6RZxwB2Gxk7CPUlM+que/ucJzoE5nTaSpJKl+fqh/wo2
	 j5qS0PT5EJAbA==
Message-ID: <4b51d6a4-057a-4a92-86c2-a6f41b5d4608@kernel.org>
Date: Tue, 19 May 2026 08:32:41 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 15/23] drm: bridge: dw_hdmi: Use generic CEC notifier
 helpers
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
 <20260518180206.2480119-16-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-16-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/05/2026 20:01, Jonas Karlman wrote:
> The commit 8b1a8f8b2002 ("drm/display: add CEC helpers code") added
> generic CEC helpers to be used by HDMI drivers.
> 
> Replace the open-coded CEC notifier handling with use of the generic CEC
> notifier helpers. Ensure DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER is also
> selected when DRM_DW_HDMI_CEC is enabled so that the CEC helpers is
> available.
> 
> The drmm release action for the generic CEC notifier should run just
> before dw_hdmi_connector_destroy(), closely matching the lifetime of
> the replaced CEC notifier and the connector.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: No change
> v6: Update commit message,
>     Collect t-b tag
> v5: Collect r-b tag
> v4: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/Kconfig   |  1 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 26 +++++------------------
>  2 files changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
> index a46df7583bcf..e6723af03b43 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Kconfig
> +++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
> @@ -49,6 +49,7 @@ config DRM_DW_HDMI_CEC
>  	depends on DRM_DW_HDMI
>  	select CEC_CORE
>  	select CEC_NOTIFIER
> +	select DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER
>  	help
>  	  Support the CE interface which is part of the Synopsys
>  	  Designware HDMI block.
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0e84dff72470..37406555af7b 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -23,12 +23,11 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/spinlock.h>
>  
> -#include <media/cec-notifier.h>
> -
>  #include <linux/media-bus-format.h>
>  #include <linux/videodev2.h>
>  
>  #include <drm/bridge/dw_hdmi.h>
> +#include <drm/display/drm_hdmi_cec_helper.h>
>  #include <drm/display/drm_hdmi_helper.h>
>  #include <drm/display/drm_scdc_helper.h>
>  #include <drm/drm_atomic.h>
> @@ -183,8 +182,6 @@ struct dw_hdmi {
>  	void (*enable_audio)(struct dw_hdmi *hdmi);
>  	void (*disable_audio)(struct dw_hdmi *hdmi);
>  
> -	struct cec_notifier *cec_notifier;
> -
>  	hdmi_codec_plugged_cb plugged_cb;
>  	struct device *codec_dev;
>  	enum drm_connector_status last_connector_result;
> @@ -2453,7 +2450,7 @@ dw_hdmi_connector_status_update(struct dw_hdmi *hdmi,
>  
>  	if (status == connector_status_disconnected) {
>  		drm_edid_connector_update(connector, NULL);
> -		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +		drm_connector_cec_phys_addr_invalidate(connector);
>  		return;
>  	}
>  
> @@ -2462,8 +2459,7 @@ dw_hdmi_connector_status_update(struct dw_hdmi *hdmi,
>  	drm_edid_free(drm_edid);
>  
>  	if (status == connector_status_connected)
> -		cec_notifier_set_phys_addr(hdmi->cec_notifier,
> -				connector->display_info.source_physical_address);
> +		drm_connector_cec_phys_addr_set(connector);
>  }
>  
>  static enum drm_connector_status
> @@ -2525,9 +2521,6 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
>  {
>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
>  
> -	cec_notifier_conn_unregister(hdmi->cec_notifier);
> -	hdmi->cec_notifier = NULL;
> -
>  	drm_connector_cleanup(connector);
>  	drm_bridge_put(&hdmi->bridge);
>  }
> @@ -2550,8 +2543,6 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
>  static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>  {
>  	struct drm_connector *connector = &hdmi->connector;
> -	struct cec_connector_info conn_info;
> -	struct cec_notifier *notifier;
>  	int ret;
>  
>  	if (hdmi->version >= 0x200a)
> @@ -2587,15 +2578,8 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>  
>  	drm_connector_attach_encoder(connector, hdmi->bridge.encoder);
>  
> -	cec_fill_conn_info_from_drm(&conn_info, connector);
> -
> -	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
> -	if (!notifier)
> -		return -ENOMEM;
> -
> -	hdmi->cec_notifier = notifier;
> -
> -	return 0;
> +	return drmm_connector_hdmi_cec_notifier_register(connector, NULL,
> +							 hdmi->dev);
>  }
>  
>  /* -----------------------------------------------------------------------------

