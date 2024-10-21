Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F41E47C6
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509462; cv=none; b=JVAomzkO/itMYdpfem3NOybXTXzRHfAuiIKXYKMkjIGuaZ0K2jkvTqdK6meVrvlGN6VAHxBLwNKpvADDMcLxVzkkpC8i0YPMPy8z0cgH+BTGV5VfHedwOf783vH/sxZd+pRLWfW+aZx6krV68tFKOORn61gs8VtMdxxE/izZ2Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509462; c=relaxed/simple;
	bh=FGjFS6H21VmAbW/4feNiFztxcv6DuYXgQWN+2SrfmQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQ3GJS3TCVyawbmNtKo1zDG+pGr8o4uaR3ss5T3D1chXV7nzwhGP8e/Jpe/so6p6BF3tfIFYkR3UekyJOsbj65q+kj/DEvfcd57p/SXcTkyFUuUf5sElw1UENRRdq4QqOu7b6wE7TE+7QlEzK5sP05rhMpZtGN/sP7A8RP7LQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kWU5D2m+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kWU5D2m+"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f8490856so4529880e87.2
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 04:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729509458; x=1730114258; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNeF2ZBGHaW1ol/9+W1XXsRcpbYR9GHCwlVWOv4fcZQ=;
        b=kWU5D2m+yMdV4rhpW0ONHR0kN2NMaftOkfmTdLfldwBEtInrBu75RI1eilpnQ3szzO
         7PSQB2e69mrxPr0s7ssib9Bkov8PvNN4zpqymJ67kUl9lUWz7RezVSX/FPPdfW66wRvK
         l/LnDkNm2U/ZI5Gxh+rirm3HsinDF0/kMJWT3rLGwxfzM5OIrGKdoxtCbAR6HAAZe7R0
         g4CfEeC6L3h7sV1YSK508K2FHpiH8+UT2n1qMf9uOsyzTzmhj8pfPRMBN/D+DMrWXRuo
         /+5OKUL7DXyBjV6XGkoLEHG8dSgwQMoEE4X2W41W4Q03G8bP1i0+q6NDtC3IHFjua91J
         L8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729509458; x=1730114258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNeF2ZBGHaW1ol/9+W1XXsRcpbYR9GHCwlVWOv4fcZQ=;
        b=uvm9t+JgvO4frRGOGlBAkG33LK1HcNNQdibhdJV8XT1cggYz0xbNX8mmukoVfpYUgL
         Vnna0MHCTFCig3oZxUjibkg7WAqG8ZVtPtGx4tK/uYzAfUtn46JD9MLCgQLCEAmxuyl2
         M4ol7cYApj8dgwLNgtnlucOAGAyANC0STaHc69wu3iGUnwdsNXr9aXWZRVnRb6N5i/YT
         lUxmpo6RosG02+FXXzo8FNwNHMJEpVcxoximx47GSLAyzKPY1x8fhm0lgph1WQdoBETz
         8iCqKZZrvIo0Wr6hMr9WxUfZBCTbZpCloAc9eFa/7CmQBy1zQYbNA0Xmpmf0WGYWBa8A
         fB8w==
X-Forwarded-Encrypted: i=1; AJvYcCVdamBW7Lh+BnkkcGLo8Y2lBGswd8tijmFQnTp8KSSXr41wbzsGOWpMFLAFMU+7IVryjfk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNe0R/sfU2APQEz8ZpEceG8NjjrPwe+Egb/EPdDUqOzF/660Jx
	r1rENri0QGGT2Dk8kVqhHY+YQoVjPWnVcfJqNJKJBjvOMxPJq8PjaZdBh03ekpc=
X-Google-Smtp-Source: AGHT+IEEkroMVurdl00NK7PlaqSl2yw7wRW19flraaPUODpUSSN62Bfto3+ygPG9Fg+h3Gwjkprg0w==
X-Received: by 2002:a05:6512:12c3:b0:53a:40e:d54f with SMTP id 2adb3069b0e04-53a1543ef11mr5132397e87.8.1729509457981;
        Mon, 21 Oct 2024 04:17:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223f0007sm458767e87.91.2024.10.21.04.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:17:37 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:17:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 05/15] drm: of: Get
 MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} LVDS data mappings
Message-ID: <ry5fed5bwwlnefcmfrhycazin36j2dsi24zegl4hteiuc4rxh4@qbs7imdlix5c>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-6-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-6-victor.liu@nxp.com>

On Mon, Oct 21, 2024 at 02:44:36PM +0800, Liu Ying wrote:
> Add MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} support in
> drm_of_lvds_get_data_mapping() function implementation so that function
> callers may get the two LVDS data mappings.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.
> 
>  drivers/gpu/drm/drm_of.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
