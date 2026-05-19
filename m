Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9223B396562;
	Tue, 19 May 2026 06:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171995; cv=none; b=AQxpgX9+YG7kz5ymc4u6V1W3s0qWjBEENPAG8nHnX46uuL330gizzh+WpLV5rpJQy81RDf/dT/jibBnwTSIY81D0Vu33zCADygVeR6C3KQ4CS7SMver3gz2tQg0DGrtnO8K9J6Wxfj0qOvJOnogsyXJ1AFqDBk8y6nD3T9qm3N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171995; c=relaxed/simple;
	bh=yJz6kF6yktan0ZdR7DH+L3nJHkS+Y3Esdo9Gtwg26cs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=p7Zy8uWZUyEHzCBEINKnCNJJBRFqCntNVpbgHv3bKITzIKR/fiNOzV/Vas//1j3AEpy2WSze7wWNy8nZvJblwhozE1D6e+KlcNzCQLQMOcqUwq0kZ0dpA9wrQGu8gOpfM4XXvNV42ECybekFAjYzXVsxRNd3mzevZ4EeS0XizyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMYwvy8s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMYwvy8s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B113EC2BCB3;
	Tue, 19 May 2026 06:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171995;
	bh=yJz6kF6yktan0ZdR7DH+L3nJHkS+Y3Esdo9Gtwg26cs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=RMYwvy8swROQke8N0e2TqBc8zOrlDQamtQotEeY22Yxc/3y01vQGPf/8K1sRcQ1O9
	 zCXlNCRrIFhHtpkoIqGbK3rFW+2+i4DgJrTFPz/XO4x3vydkAIdE2r8Bw/gsynHxIF
	 YwFVxFW+ihtt16oIxRWxKz3EYin8UM9HjgojFrrHN141ADIDksoyiLOhKDfviuAvg3
	 dk5X8uP6OLohZAOUKx1nwUn9k/ONp80UEeC8cC0Qaj2zi8XzqfkPPFUxfgBTaqzZF2
	 2TecOurQSqX8f6CWSLUshdHyN4esSuCMtzKu33JVQ7be92+Lx1C7JgamB+j7eDA+U3
	 C+eJab4uVXeuw==
Message-ID: <758d577f-cd03-4c41-a9f6-9d8ef909fd9a@kernel.org>
Date: Tue, 19 May 2026 08:26:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 12/23] drm: bridge: dw_hdmi: Extract
 dw_hdmi_connector_status_update()
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
 <20260518180206.2480119-13-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-13-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/05/2026 20:01, Jonas Karlman wrote:
> Move connector EDID update and CEC phys addr handling to a helper
> function as a preparation before moving EDID refresh from get_modes
> funcs to detect/force funcs.
> 
> Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: No change
> v6: Pass struct dw_hdmi as a parameter, to allow calls from bridge funcs,
>     Collect t-b tag
> v5: No change
> v4: Collect r-b tag
> v3: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 27 ++++++++++++++---------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0dd4c823c60a..a056e147731b 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2466,6 +2466,21 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
>   * DRM Connector Operations
>   */
>  
> +static void
> +dw_hdmi_connector_status_update(struct dw_hdmi *hdmi,
> +				struct drm_connector *connector,
> +				enum drm_connector_status status)
> +{
> +	const struct drm_edid *drm_edid;
> +
> +	drm_edid = dw_hdmi_edid_read(hdmi, connector);
> +	drm_edid_connector_update(connector, drm_edid);
> +	drm_edid_free(drm_edid);
> +
> +	cec_notifier_set_phys_addr(hdmi->cec_notifier,
> +				   connector->display_info.source_physical_address);
> +}
> +
>  static enum drm_connector_status
>  dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
> @@ -2485,18 +2500,10 @@ static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
>  					     connector);
> -	const struct drm_edid *drm_edid;
> -	int ret;
>  
> -	drm_edid = dw_hdmi_edid_read(hdmi, connector);
> +	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
>  
> -	drm_edid_connector_update(connector, drm_edid);
> -	cec_notifier_set_phys_addr(hdmi->cec_notifier,
> -				   connector->display_info.source_physical_address);
> -	ret = drm_edid_connector_add_modes(connector);
> -	drm_edid_free(drm_edid);
> -
> -	return ret;
> +	return drm_edid_connector_add_modes(connector);
>  }
>  
>  static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,

