Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE766BB5B
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729512939; cv=none; b=P87iVxAhTrBPYfj9YLRExL260+kr8B51Rg5JWepxDw2xQ5AAisl93U+XCQAezgBL+xCi2lvbRSD9SENCmyc4HJ5voCg9l4uB6Sy/F1PiI2vfm1JMVcsQ7zvostf7/hKg+GH9yk3oAp3UONsJA4DdSGWQ9il+bLXtAk43cxcTsJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729512939; c=relaxed/simple;
	bh=ubniCwvujlyUXuESJ+QlEf9nz56jGqzEaECw2Ab5mVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxAgX1+ZFFHBlwdMAhpmXywmTfvbZKMzovoraMLuV31qPy10HtHlTGq4kUXVKU+Gt0vwxQKP3nVOarOI9fUeKLTPlc7UzEQa4Hzr9A9VF09byeDPI6Tay63d14ivh8ExkIr3iETRuHvfx2eMCpOAeZa++DsS0LACEPKkvt2gHjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RtfS+lNZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RtfS+lNZ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso59375811fa.1
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729512935; x=1730117735; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ixvYPjSjHOI3A6bs62BEm+orBMViEbYtWgKUxWp9vmA=;
        b=RtfS+lNZKxIussykAqIrusklu7k8WJyv33WJOs0eaA/OD4CE/XyFvjq9QZXRAUjT6h
         Fp2mmAO2h9YW3trhb6n8rErVmYHVPac+MfYZxpK6A6KzTYzQSjeamRgTxlZ80rTlqdBT
         5aTZeS3bN85G10doMExlBdK2irnlvrD0YzOqRJOpdOhopr8yv9mNH8FUrhnhD7OQL6b5
         5pxn7zFinys7Kk1CEQUxH/wDTs+0qmZfxEI0zYwViOWyM5JWMXPiuaVHo7mjjhULbxbj
         ahueitk7UydfqeKgfNM53PMWXKKpWmkam1XcWrxjyBToqr6fTCpbM/e9P2X+NxGuK4/g
         uPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729512935; x=1730117735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixvYPjSjHOI3A6bs62BEm+orBMViEbYtWgKUxWp9vmA=;
        b=Vj7z/lIBsC/vQPC91PiNa1E1+ZTQvOAjRPPFicQEPuDrt/xFIUtNz3trQbcQHTT8ED
         WSnNZOA9U7CM1tR63hd8nUzlPgdCXsD7vPRyyDqaLKbBeTOpDhI1oZRg/gOwCgDmqtIZ
         UoyWyjV+74UWMPNT81Sctw4ny85YqVXxvzhQ4H/yhpgcj3oS4k3RVzhod/jhlH+kvUkT
         /99b6q5xKvOguUn346tS8Dc3R8oxAbdK//Yheu6zWKgvOevK3+IDMPZQYo/Tb4j5V0nf
         zUAzUNrVqd8lKI9qwr0myoRlufER4YUmDKHgDthMnR4+4AGjQ7oyF3LXvtmRTrOkDQAs
         ctCA==
X-Forwarded-Encrypted: i=1; AJvYcCWG/WQMxEVR3+mlsEFf9k04KRbnkob3InUY93dK2kDnSGGFqSM+SHZ2IetAsDv6ezW+uNE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1XN1Vd4ZV9l7fkjkRpYcm4n/+o75/nofg7uR7aBn7GFvrRlt4
	4d6mdRFpjxXEwPJQs+NcRzN23VoMpMLc3NLdYnCA5raohi2gjiL7FLptspLmL+w=
X-Google-Smtp-Source: AGHT+IEkcKoatMCDEuy5jqS04CW2sFmKYlfJWSMdE2NyRaxseViNDhyaFOJIPHQ/mBlzZ4JfzX+iAA==
X-Received: by 2002:a05:651c:2124:b0:2fa:d7ea:a219 with SMTP id 38308e7fff4ca-2fb8320f101mr78774851fa.37.1729512934612;
        Mon, 21 Oct 2024 05:15:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad60d95sm4785161fa.33.2024.10.21.05.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:15:33 -0700 (PDT)
Date: Mon, 21 Oct 2024 15:15:31 +0300
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
Subject: Re: [PATCH v3 06/15] drm: of: Add
 drm_of_lvds_get_dual_link_pixel_order_sink()
Message-ID: <zaraulehid255ij3hs7hazd463ye4l5ju6sguoos243kda6552@lztoq22vzqyk>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-7-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-7-victor.liu@nxp.com>

On Mon, Oct 21, 2024 at 02:44:37PM +0800, Liu Ying wrote:
> drm_of_lvds_get_dual_link_pixel_order() gets LVDS dual-link source pixel
> order.  Similar to it, add it's counterpart function
> drm_of_lvds_get_dual_link_pixel_order_sink() to get LVDS dual-link sink
> pixel order.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.  (Dmitry)
> 
>  drivers/gpu/drm/drm_of.c | 76 ++++++++++++++++++++++++++++++++++------
>  include/drm/drm_of.h     |  9 +++++
>  2 files changed, 74 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
