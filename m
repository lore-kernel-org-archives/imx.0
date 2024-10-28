Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C965199FB0
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107289; cv=none; b=RGKJFiM5dHD1wo9xyxquA0n8NgO0+BAqj0jBHA171iICdstwf3axj7hwMPvhOib9XqRrT6Ueu3828Vv74Bttshr/eFsbhcAn0a9AY5aqWS01OFtehn9QdkH4JyvyUWdrvXUtroitvCvr542rR3umRAWvT98FJjvrNeeCzA6iBNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107289; c=relaxed/simple;
	bh=0jA2nKhDLnxRGiEvYnV+NPzqXUb511R/IyOADJWqmrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6y0RUZRuaqilZPI+ahhbEK79H4PCechoaxAw5YM8zR1EGpFpxUu5Gtvh5S1HK7zKwaIB9YB8US4Elc3SNbHFvDgzYot1TO6iA/fLvi8tJnwYDkQAccmcaLFQ5UZ+vw6OTOmsBTScHC+xeyhSwrhDOm2t/7yzz/t/JrO/WL4DJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVuWp1mN; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVuWp1mN"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539d9fffea1so3769833e87.2
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730107286; x=1730712086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMxl3S3T78M4ZDclpZfWNpG18/6HovRsXKrq1tEEQMc=;
        b=HVuWp1mNv0bkugTc2x0OSO0RozgdRkSX3Hzoe7lzhToplpizx8upS3IQJz7xudbwco
         YPSqbiuF7CC0DUGGQkiQ2b3th6xK6Y5s2EhtQS9E/WpwnWoVvkrFVYIgC0+Iltdl6Ojd
         8Qx364gXUsxyOSICNhrDFvAkAFMp3xXXA0663DYOtT4DxvvbxwovN7vxUVX8ojK3tnaB
         6R3IDNEpZKQkD+4ady+2p0YkcBarvc+hagzp9pyBF3i4UowlerN0mvhgvI3uHzBGSc+d
         HqXpfh8ooJ4SM1u0rIT3b7jggMO7Zwab5xwa+cply8iggx4NKjLJDeyVo33eTjOoaPG3
         0RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107286; x=1730712086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMxl3S3T78M4ZDclpZfWNpG18/6HovRsXKrq1tEEQMc=;
        b=SWISkLDmy0XbFuMdoDZKveG4ygY7++xoY/Aqr2Cc2DjFcUT1+XC5IrhztmJSMB3Zgh
         Ci261OZuBUvz8PS+2GkT0KQVAU5JeU9bgUnNETIdbItjblbNspWxqdTdsKmowoKDOctQ
         9TSZLOZ/rRPs5E5+Snng+i6EQWAzH142iOTZrYvQZXS5IIdQobuQ+Pi2nfcFu1aWYLht
         vatu/fVqEDFnA2AOe99riQM0OuLbfMoY2ZRnPmIYZl8zrkuxRALs9DeH5x4n2YKfJA4A
         oULE+9TwPF/+2SsDr1RtmV2Ii0Fs0/zvwMGZN7+yhvEqzFAV/HQ1+5Rsv86v+WUZYPE2
         tg0A==
X-Forwarded-Encrypted: i=1; AJvYcCXP4Bqo3Qw3iTq36k0EwVWBJsGSaBaIV6GymF93gDGO2m7FquJrfIamhzki5KOK749QEN4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3zXhjGJ1nROSM/GU9WcmH4hWQPvGweIVFJkbuvMxdjet36gYy
	Soh53dKkEOJhnIYmKuC42DXtY75Bmm3h/SCW9GHNbJrcE8U/Lq2lVz9/1CV384RqQtDN+0ztYvt
	T
X-Google-Smtp-Source: AGHT+IFLri/jKsB1rbBwLcG+4d/hkJZCTM08WJqeMH6Xd736MsKNNG7MWeqbuGnrpaHJPvqDTjFhqw==
X-Received: by 2002:a05:6512:2256:b0:539:edea:9ed9 with SMTP id 2adb3069b0e04-53b348ec028mr2877777e87.1.1730107285683;
        Mon, 28 Oct 2024 02:21:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9ecasm1026060e87.218.2024.10.28.02.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:21:25 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:21:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 13/13] MAINTAINERS: Add maintainer for ITE IT6263
 driver
Message-ID: <izlahf3rnobapkvaxvq2lpyz6vsurdhkhnigzogstljpupn37x@3a7ziz63n2zt>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-14-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-14-victor.liu@nxp.com>

On Mon, Oct 28, 2024 at 10:37:40AM +0800, Liu Ying wrote:
> Add myself as the maintainer of ITE IT6263 LVDS TO HDMI BRIDGE DRIVER.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * No change.
> 
> v3:
> * No change.
> 
> v2:
> * New patch.  (Maxime)
> 
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
