Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF31CFBC
	for <imx@lists.linux.dev>; Thu,  2 Jan 2025 03:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735788417; cv=none; b=BKfgRQ1CRcvUOEd3eAYHPE8foYrqGwDAvxzX8xOQdpP1Dug+go04o9DR1r+nhTW0kYGUKJeMeD3uE3DRLZpimmZFqAr116OxaofsqJXunCz5i8w127v3xbsnRgMxMyul8g/IfSBBZ0Mq8mM7Gne3feJKtNMnI4HjBk1HIYkcrEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735788417; c=relaxed/simple;
	bh=DdJYgZc7Q4Jmxkcgf85nULXchKuOAv2m3m5DI1QNZoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVhOlylrahxsjGZXuLTG1lu78eBGtDwYbLwulp81tiYdpjHUBryme+J6muykzGNTIUmbK9PWVgOGA7s2pkhFnZsV/wHlQZK0OuCIKwJfxp0RasLQ6vTzPtPyc4JFdDkX0gUReg1Go8HvrZnoEr3j+zkTbi31j+I7GrU3T/OVrZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T649mz0U; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T649mz0U"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so12004848e87.0
        for <imx@lists.linux.dev>; Wed, 01 Jan 2025 19:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735788414; x=1736393214; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5FmDRLFpz5VQYbAEJQmse1pMniexgMfpHZTjVy2AVGc=;
        b=T649mz0Uyr8hryLjCPq18C1fOeZafGi16/N+G5qWfgdmxmy2skrUxoFCW+4RIlE+sR
         Vmki64tl0Jvt1TrVMk1N3AKgvzGJEo2usXJg4Z3LbHQLK+91+tUPMr477dbJQ+bry9I2
         fN8kMpg204yff6QEmX6bKX35QnVTl0bQU/NbmHS4XVC0AWjgXqI68LISt+qZUA4WdZka
         33kVL1JVTTL2Gub1luBPYsXpmMr7RRIWUNU6XEmceqfY5uyqqYhJPoNxeNogpuZqf1OH
         kWFsq9+LVu17l2YsrpqdnFHx4TZ/CWBDx1FOAYrjAmAPdJx/zLUqaLH0BYyFJGngGh62
         lZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735788414; x=1736393214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FmDRLFpz5VQYbAEJQmse1pMniexgMfpHZTjVy2AVGc=;
        b=lcklbPtdYmixN46FecEd7wnP1U7y3uCOaujZg5yAt09dZ9aIOEs3S4NNCggoAG5Uu7
         zZnQe6Mm2Ih357MR3vscOqne9b9yQO3LEhi4vRTsmjLaO3YUEPDoubMWXiDrCh9cdIpU
         2E/E1v6DjFS0tpMtzeVCGlC9wukokM598Nxs/HVsaPibQKk00udoRtqy3YTNvpFxr6vt
         RwKAYUGN4QihsFXhB35OnYfS4M/V2HlmVe/p6vEbZ7fh2N3+mkb1ONad3D5AxYi15tnV
         FQN2jc8pDcjSc9dMvW5UsIrKnoUDEp7TPe+1LUIDuTzj6LAP+isIulLvDVTeJ42LB9XT
         nosQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm3PvDV7P59AOqjIcOdZl/NQx4bZTZsnrjbjDqrqdaCviC2H0R4Ijh9gJBnvnMaynEtJg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywegn1E71aFqqOGQX+dHd3yoT7TZY23BLGMjYpyr0nfJDktu0lR
	rDubOfnecrz6w5svnT7J2YOiFWyHSqKi2ezu5MGO1dJT+pqHRfRwLckOY2S+Xz8=
X-Gm-Gg: ASbGncuHyDlO/xD+cXqFsSKKrWwlclUwbjxABFMIhY65FeifehujPllR38NfShY2yXE
	wgnjsQOQsXUdhSDchLBonefnZAC07WPoY5D50OqIhTppFlkG9DlJZ2UIayuzbu+DJwcC1q6UcK9
	7acZVK36h+ahHUAswY+xXLVjLvP3fk/sLnnzeBgiS9bnwWb94GiBlxLxxicKoMY3cRBieUZ+pZH
	PRSn04IzAP+TpP4AWrd+mj84cnetBLXihSuiq8DSfP4oWIavhcHSKZ4th/+MGP13OJ6Z17ubgvN
	fElp/sQaVq71lIASr7kZtEHcZTvGXQg/kWdQ
X-Google-Smtp-Source: AGHT+IH7I7RcNKZb9xeKgk2U2YJlaxlN65glovYfr8zNiCQJ9pCqdsXeeY1ES71gZQ0js0Fb7YH1MQ==
X-Received: by 2002:a05:6512:3f0c:b0:53e:3a7d:a1df with SMTP id 2adb3069b0e04-542295619ecmr13281012e87.45.1735788413995;
        Wed, 01 Jan 2025 19:26:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cae6sm41978011fa.23.2025.01.01.19.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 19:26:52 -0800 (PST)
Date: Thu, 2 Jan 2025 05:26:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <ac4kkjv2nmziu6pd6vkuxbllhkqaueu32snfetpemtu2l5s6ud@cvystps3734o>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
 <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
 <20250101223620.GA7206@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250101223620.GA7206@pendragon.ideasonboard.com>

On Thu, Jan 02, 2025 at 12:36:20AM +0200, Laurent Pinchart wrote:
> On Tue, Dec 31, 2024 at 10:10:51PM +0100, Marek Vasut wrote:
> > On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> > > Hi Marek,
> > 
> > Hi,
> > 
> > > Thank you for the patch.
> > > 
> > > On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> > >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> > >> HDMI but do not contain the HDMI connector node. This flag allows such
> > >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> > >> use this flag, do not proliferate this flag, please fix your DTs.
> > > 
> > > What's the rationale for this, what prevents fixing DT instead of using
> > > this flag ? Adding such a flag will most likely open the door to
> > > proliferation.
> > 
> > See the V2 series discussion, there are a few in-tree DTs which do not 
> > have the HDMI connector node. The rationale is there might be more and 
> > they might come from vendors, so this flag is necessary to work around 
> > those DTs.
> >
> > > If you can't fix the DT on particular boards, patching it could be an
> > > option. We had a similar problem on Renesas boards, which we fixed with
> > > a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> > > to create LVDS encoder nodes"). This made the workaround self-contained,
> > > and allowed dropping it several kernel versions later (in commit
> > > 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> > > compatibility").
> >
> > Frankly, I would much rather fix the few in-tree DTs and mandate the 
> > HDMI connector node in DT, which would keep the code simple, rather than 
> > maintain a backward compatibility workaround for problem which might not 
> > even exist.
> 
> The in-tree device tree sources should be converted as part of the
> series, I don't see a point trying to maintain backward compatibility
> for in-tree DT sources.

DT is an ABI. We are supposed to keep backwards compatibility with
existing device trees (at least for a while). I'm adding DT list and
maintainers to be able to provide comments on this topic.

> For out-of-tree sources it depends on how likely the problem is. There's
> no regression if nobody is affected. I personally like restricting
> backward compatibility to the strict minimum, to ensure that all new DTs
> will use proper bindings. Making the backward compatibility code
> self-contained helps there, and we could also print a loud warning
> (WARN_ON() seems appropriate) and set a date for the removal of the
> workaround.

-- 
With best wishes
Dmitry
