Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92577198A37
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 22:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735598550; cv=none; b=jW7eG3X6ZvC7h1HSiIKRs06RsOXGSpt5jh0zcxxNtOr73MwrOJTarl0RSfGkZNtSnD/z+bjgum6ze6FUfhHVJUE1Y9GP2za+8EzsnV/qJf067U6H2b8QTCJAqk8TycXLUKQabcQjzPvGOJQvGOJbsMM4OZeaawIywqSYoPZmMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735598550; c=relaxed/simple;
	bh=QpSLcs3k1GVD6ytXVbJvt/KV1rFOQINHjN1n55B9dGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxgtN8rzj9q+xvr96/Cjp4LWTqxNvkslDZN46PdRM55dqDzwJrkZl2vq6hv+t+makb1fMXjaNO1Q/6YLPhhJg4UhCIajiT5eF5Yf0kNtjyDWu5/05KfJP/gtc42l4UvHhWQ/p3ZXbooKCgqf8p7NmEtW2c20S0DCHRMl60aTFaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lpB11KQi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lpB11KQi"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so10300142e87.0
        for <imx@lists.linux.dev>; Mon, 30 Dec 2024 14:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735598546; x=1736203346; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ndkBccbxfCNVnrXt+e8YJo/WVVAihoLFIXSgmyxaWx4=;
        b=lpB11KQiBnYh57jzU9XaSy1e7QMgxdGNQyfLvVwDoI4WsAo+y9B7rzb5oiiPCD+7Ug
         sJQY1/t3wa55XHzsfCaCWXMXrkAbA8SGKtWrTUZ28qJRu1UVQ+5GE1xEQgOPEN1YzvOK
         Gtd27j7MIGFekXzMBSS3/dQBDtJsBkDobQa70Q5YVTmzcH3/u6TK39d56xFSjK+ITNVW
         JbNXrG+bVjBjBReoEnv+A2zbA60+t+sMn1xHxBQS/DbbzhdYahGLlwyV6Bm6x+wKsFCr
         RTCg3uAnQ38rZyN4Em6/IbgCV4rFVBd8mUJrKk2C1UdycEH7yuV5pLijS0Ixhe/OwH4C
         IRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735598546; x=1736203346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndkBccbxfCNVnrXt+e8YJo/WVVAihoLFIXSgmyxaWx4=;
        b=lQlvhqpyUfReo/Mv4tkG0Lg4jJDpy+Fr9za4CTVesLuZXyjC4XVDvFb0npp/GkHEhA
         OmLrg5PJnydVaVA2CfdBpSWtNiEblJHtYa8VaGzqJ3Q4mphv5qZj4P7up2Kfvx6CY4+C
         54mJUHPwsWn9DMfYyYspvU8MTKnFH6+tSa8GIBAh9d/taF/AG3oWmUHtK9aQ7xWDsfZ6
         7FXqRF1+m1y7zmYDhAVjfMa2i/JeDQ/YQxVKyn7al+YCkrZlZXxwdgGW83IWhZZoJpb8
         uUq5bkd6PQ4fhMp5WJPRWma0fE8Fbtm+6ChdECFTQDdfcklggeM1VKSOAF1Aq8/FOr+T
         h6wg==
X-Forwarded-Encrypted: i=1; AJvYcCUSQTA3OcaNAAMUeFgw4qcncP48eIF0xe7IkBhQdTqEzMOtQJ6aInVds+evuh4jHz/yJO0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG121sF36v8FWVI8Lpw2X7FOkNLh9IXx4WIPsEaiNlmZXj+m+3
	Mty4nF/NeiXLUAnFwQY2S6z8qzaasS7eZxx6y3/23V6YblcckUHatennKNIr11Y=
X-Gm-Gg: ASbGnctj/+oU5IhnIALafjNzy8xo8ioTrDCUuBw0OeeosgWBmBT03otAX3+1MEARPlA
	DifjNsitFZglWeHrOb8wjDSTrhTgxMbKAifSXk6alD0Q3TbECZLLfLFiHTaUXNQngh2tvXSyr/o
	+wp5kfTcJJA/XtuN06qmz4Vzz53v7G9UpKR1IQCrh+zKtpPxfb1YzuzJAveQJbd/dDE24QUKVFI
	wwF+c4sVjNJUxmA7wTHLVAdeCry8nTMwiqruPHq0A+LOe6ZH071ofmAsI5q3vfnBXXSvG/lYYtS
	9aoTScvXFY8pRt9fkzhbY920atuFn5I+AIGh
X-Google-Smtp-Source: AGHT+IFfViIHM8+f9Mn3fgEtTV0SNNWn/wuOCgLzxbbOuJXZwu8+rTphIETfjjYE6yKOOZA8LgpsvQ==
X-Received: by 2002:a05:6512:2399:b0:53e:395c:688e with SMTP id 2adb3069b0e04-54229524737mr12156974e87.10.1735598546613;
        Mon, 30 Dec 2024 14:42:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301adsm3257694e87.246.2024.12.30.14.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 14:42:25 -0800 (PST)
Date: Tue, 31 Dec 2024 00:42:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <lsfwik47xzx2qjp26x2klx5bgjdrogu6lt3kafchfgppbnwtnt@c56ljycxkiin>
References: <20241224014701.253490-1-marex@denx.de>
 <20241224014701.253490-2-marex@denx.de>
 <a543e24a-1333-42ef-b940-fec01353db5b@nxp.com>
 <59523b40-dfdd-4293-9b02-e16be632d1d2@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59523b40-dfdd-4293-9b02-e16be632d1d2@denx.de>

On Mon, Dec 30, 2024 at 11:11:35PM +0100, Marek Vasut wrote:
> On 12/30/24 8:18 AM, Liu Ying wrote:
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> > > index 264e74f455547..07fb6901996ae 100644
> > > --- a/drivers/gpu/drm/mxsfb/Kconfig
> > > +++ b/drivers/gpu/drm/mxsfb/Kconfig
> > > @@ -30,6 +30,7 @@ config DRM_IMX_LCDIF
> > >   	select DRM_CLIENT_SELECTION
> > >   	select DRM_MXS
> > >   	select DRM_KMS_HELPER
> > > +	select DRM_BRIDGE_CONNECTOR
> > 
> > Select DRM_DISPLAY_HELPER.
> Without select DRM_BRIDGE_CONNECTOR, the drm_bridge_connector_init() is not
> defined .

You need both.


-- 
With best wishes
Dmitry
