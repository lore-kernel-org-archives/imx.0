Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA75B1E5
	for <imx@lists.linux.dev>; Sun, 19 May 2024 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716154525; cv=none; b=a6gGyxq9IANitAusTx/QJXrIMBPyklpXCrBI5Mrg0/hv5OyXbVM9nnRNNWux5MhPWt9RChlzdqG6VHzQV9THGmX6kstkCPKgtj7fwkJB4mPzgE8GUu4Z1wgcSiloo8mFCJe4cFptCnJ7HkIX1DJ0HP55ekZl1Vl+8Vi8WGB3a2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716154525; c=relaxed/simple;
	bh=F+jXRC9st30jHQhbNJSE+w/4Mll6e68LbYib2jiYex8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTmHup+jmoDACln11cOl/tUvrXRy/85Rmer/cGxTVkUoTPlgPWTOLX0NEoy5v76W+T+sV5+oAIpcJJee5aulAA/WdCUJ3oiekHdWEsDahsFqiCk4nLGkNmkI4eFzDmnB5UGHgKuaz6pqfmj8NE9cIQGhYqnC0PsxOTx9PuzL9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AEgTdmQ0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AEgTdmQ0"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52327368e59so4105094e87.1
        for <imx@lists.linux.dev>; Sun, 19 May 2024 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716154522; x=1716759322; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3X1Yrmk1MoHmOR9BQlqVx5v5vjA2rIgAkVdy8YftygA=;
        b=AEgTdmQ0qu2K98IOwitiS2MnNbNNco0p42V6sVn+p9oHXln59gXiyyBfPykwEAjiBy
         38dR3xGcNLbBNPUAOlCf6Sw+SigN7q4bfNSpR9an3TD1DH9OTB9wquYzCzoTVSSd6pHP
         6glZDUROWAp06GlWvtV+urkqDxFepK4wn0swMpAO32asB3pM510VAQ86r/bOKLnD8dAt
         0TGVQKUXQm2sfRNJgOZPNJaGRZYc3YjVfqwdHphw9XQyF9qQNeO5nGTe3MbSgiKTRtRB
         4Tgze05k7r15gGcYTfk7WHi/cmk8lpLBpm/3LBMyLpSrSVUumRiLOclcJEaARsSHS2CY
         Fz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716154522; x=1716759322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3X1Yrmk1MoHmOR9BQlqVx5v5vjA2rIgAkVdy8YftygA=;
        b=YQ5N7Di39e8RIg1z7KLgkD9Bx/5nwGyEGMKUu1N2OdOcY9adfuwrCCHEocrqQYF2zT
         7ptIKVm72qn1qnjSgmxnlPtkmBGN7nvRIjuJ5H1hEwTpfkizTQGMr/C2fDRQWavtAgn+
         jXSYUjPaxPJEykNmtp/+2bAInwtnYZaM9egg03LfZXxFz07ePx0WoE8ADXD9zMl3uDZu
         eUG7XHV6IQVEq2TygQiAlLjTr5SH3PfmdwMzrHsT/mfbu1Y+1UcND5sfk3JQ/DF8uRfL
         OcUH4ToRtedWgPe9doG3apRwhsq/cWb4YK405ZK65CUrHNwPoEMSl+eHGmlSnhqaDo3Q
         UheQ==
X-Forwarded-Encrypted: i=1; AJvYcCXye+UN53chiXQ2opRNk/i/F81WftTwk+Znt5KokvqJ7OM4+g+4tHsSaECzupx5EyZ5nXuzdwueHqcfN/bo7ngDVSxP
X-Gm-Message-State: AOJu0Yxbgg0GcYnJKowfUd0RRjNZizvawfRck4/jB56NC2T0wr27Vtar
	m/FoS23CKYettIdw0oseP2RMhlYU6IXbVbpvBh6zQ1NqDOT3uB1Pxe5GSvgO+fA=
X-Google-Smtp-Source: AGHT+IHFhLcimoHFdpBR6hAEKKHgEzXpoaS34rfFdJS0lF8TQ2Ce7Fm3Krw2KG+bznBsSAnt2LCThA==
X-Received: by 2002:a05:6512:23a0:b0:51b:e46c:19fd with SMTP id 2adb3069b0e04-5220fc7acdcmr19544531e87.18.1716154521689;
        Sun, 19 May 2024 14:35:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-523765da43dsm2090065e87.121.2024.05.19.14.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 14:35:21 -0700 (PDT)
Date: Mon, 20 May 2024 00:35:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/11] drm/imx/tve: convert to struct drm_edid
Message-ID: <opukbtmhml563rxrjkg2d6ynysth3id6acscnnnbkrds3ix2xf@gbdxb6e5vvxz>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <2f59a7ad10c29c21f08223ef19221cef48623cc8.1715691257.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f59a7ad10c29c21f08223ef19221cef48623cc8.1715691257.git.jani.nikula@intel.com>

On Tue, May 14, 2024 at 03:55:16PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> index b49bddb85535..29f494bfff67 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> @@ -201,18 +201,16 @@ static int tve_setup_vga(struct imx_tve *tve)
>  static int imx_tve_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct imx_tve *tve = con_to_tve(connector);
> -	struct edid *edid;
> -	int ret = 0;
> +	const struct drm_edid *drm_edid;
> +	int ret;
>  
>  	if (!tve->ddc)
>  		return 0;
>  
> -	edid = drm_get_edid(connector, tve->ddc);
> -	if (edid) {
> -		drm_connector_update_edid_property(connector, edid);
> -		ret = drm_add_edid_modes(connector, edid);
> -		kfree(edid);
> -	}
> +	drm_edid = drm_edid_read_ddc(connector, tve->ddc);
> +	drm_edid_connector_update(connector, drm_edid);
> +	ret = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: if you change two last lines, you can drop ret= assignment and use
return drm_edid_connector_add_modes(connector).

Maybe we shoud add cocci rule for such cases.

>  
>  	return ret;
>  }
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry
