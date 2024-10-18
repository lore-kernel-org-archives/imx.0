Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478C81DF26C
	for <imx@lists.linux.dev>; Fri, 18 Oct 2024 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729267559; cv=none; b=nZdj2vK7RBgZOAmGL2gEB4w3htAb6sTPOyCZzhdH6ytMvaQLnHrEtnmvFMEIa6e2F0SrEPvINlAi2y22PrRGR9TgipNV5gkFDWquUtTYAMTrsmWwE5NQhL87xO36zlUdKh3nyiOWeYV32WxaH6Wc8TchcoLVcqjGDKWEJxCea9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729267559; c=relaxed/simple;
	bh=QCypCPA1T95iwk3UdXBpT27F7o85oRluEEm4OPgylck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFiT391KzQvgtLCG6w/87nCxMDNBsawbgJCOV68ZaKzBB1vCDWaBfcyRRDnekXt1ccMr84SMzA0gwkwWaBsnmxo3JOrfA9NLpoU0HlOezNLwXUAc4oeEYm1lvqnnDCXWp/60V21WP2FAN1qz+BTT2ogrVreqTqmP/X3Bnkpe5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxfEHdN1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxfEHdN1"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e8586b53so2807760e87.1
        for <imx@lists.linux.dev>; Fri, 18 Oct 2024 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729267555; x=1729872355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0wYEvLE5AoTVEsvqBPjLtagcoJbMeHJO2qbYoBljMjc=;
        b=rxfEHdN1/P8sQh16O8S1lfKa+oQ2pUFqjzq0cbDr7naOwc33KkJjdzcdvOax+sZhSP
         jbiqFSWD76CrCcEuWCYGB/IRYKvxt7AaLnSXCH2vi69XO3hq9UcLriQP6RTNeo74/jmo
         dLSvxZ489aSnwnNL5lo56QO4UGDlmdfkY6zdePOxWQLFphSfw28cs8YOeQRcO9cEFOZc
         uYutdVAs16WAwVBqesce2Vippihvfc13pOFdPCvQf88kmROnpqWnFJXBXnFqI0REwvCb
         IDSaRBA8sPJeJXjIds/r1IasdUYl7tlLScO99AAVvuskf+GIIHih+kR7uH1IuHYx8qVs
         kjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267555; x=1729872355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wYEvLE5AoTVEsvqBPjLtagcoJbMeHJO2qbYoBljMjc=;
        b=aH5mMM/FL2RLsxRNGJSXPM5jenpUQRALh/dVYOlFYAoH4lwifcWh8rVOXcaV0J+uu8
         2a+6dcuqs0S0VagphAvhRBHAx/ShMRF/EbSDG/Jjy/2tRNpWQM79sF3iEyMk1Y3pHwhf
         FO2Cv6audQajyQZqU/069j8kM/Cfns9PsiDn5rkSk6lWlMm4Yx1gLGhyvXsF+jmjF26b
         r/BH1TYdH842L/bRicg+i2Yw1vXIqKOsBYZIWtpurHJDGseA3geDavfAoPUxVmy8j0JW
         T5J3mJE9mwAoEyGcQaQeU986VG5tT8sRFB75imA/muPE9TQrV8DRvr6yvDb3L+287nDe
         msjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEXt3ahC2uPEoRm9v03O9Gb7p7A4UWq5b/DESSejSgRAF+Arj2DZp4lWtlds676uDw0y8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMhmjohC3Ekw42n1MWM9VaUbZj0RlSEnVNDUZmI0/OBOprpxB8
	m8POXRXBe9ivKevG51Q+b31x2RFlpwuDyWvPjwcPMuMnQRkU+bbJFrNhMO51JSs=
X-Google-Smtp-Source: AGHT+IFjhdbJ7YZZcyfL2UU7JQ9UyXrDu19ycBJ6CNiQ0dGXU9v10DHjdks2qgl0GgCmrtOLG2ajIA==
X-Received: by 2002:a05:6512:33cb:b0:52f:1b08:d2d8 with SMTP id 2adb3069b0e04-53a15844da5mr947314e87.7.1729267555106;
        Fri, 18 Oct 2024 09:05:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a152044b8sm251517e87.221.2024.10.18.09.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:05:53 -0700 (PDT)
Date: Fri, 18 Oct 2024 19:05:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/imx: legacy-bridge: add MODULE_DESCRIPTION
Message-ID: <7ppx4rpyxrsr7spzopocv2hojwzxivojfpc2ze4leippuvvrj5@drhmfqmajzrp>
References: <20241015073004.4066457-1-arnd@kernel.org>
 <20241015073004.4066457-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015073004.4066457-2-arnd@kernel.org>

On Tue, Oct 15, 2024 at 07:29:58AM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Every module should have a description, without this we get a
> build time warning.
> 
> Fixes: cc3e8a216d6b ("drm/imx: add internal bridge handling display-timings DT node")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
