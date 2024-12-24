Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0569D372
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 01:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735002032; cv=none; b=o8yNXuBYKCOV6ZcnzW9/c1YdVLbDg9Ox7Is0AJOTi4C0FskGhzTY3BHi0yZ8nwEqVYwfJCyFtBAzlBjmXcUAIhAWG3d7zEZAmMxwBkdu9rq+H1NUlA8/00K/0iKKN/14KCpNqane8HlM//j+r5wYTmRx4hjEKnMdiDnDqWvtqjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735002032; c=relaxed/simple;
	bh=t4YrtQrnJGIgcBZJgU3BiGku5Hibi3HNSOcCo2IskSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAoF7R6UcEAhG6cQsbG/r2lQYPJyMuIUUfo/EotxVf9JYae/zlFqMu3zhJ3mtgHqDQURR1zBziwhBMLwCAJCgSoWqOvz3/Fep34KW4MgXAQIHZZLZq5edwCpR1QGKp9I0IemgDlCcp6qf28+YLHacdqAg3z35/iLHqG7bWFCBzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kI+qDeAU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kI+qDeAU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e399e3310so5611858e87.1
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 17:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735002028; x=1735606828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tH4XshjLhtYgFGpFywgz5Uu8exiT5Uij2L/jGX3fAcc=;
        b=kI+qDeAUaSKSHvppX055lP+rTpUwZouBIChOoDZpPhp+0jpa9V+KTeTSucsaHvCLlD
         9pYz6hCV6FAV2w6ilnCySk08RtDElDaKg+IVQI0kO5lCeK3hirHcAXMZz+pht6jzTEXM
         axWqCM0/9qk6f3pra4jDfeBMh8DS34FPrLyz/iK+XqWOczb1J1ZKVU6w1s4qh7bEjJ1i
         luOnDvPbePn99sCkEU5yPwnsFDzifJ5x9zmcV5YPz8sJk9HiWSHaNa8HH2WtH/G1oSjX
         V80KuyUGEGFX63oXYzE4BdX0fhXclfr8jwFFqwvSdVS7gVNc1VyB2k+Plc6gyHkA4Tj+
         SZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735002028; x=1735606828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tH4XshjLhtYgFGpFywgz5Uu8exiT5Uij2L/jGX3fAcc=;
        b=JR40SrJ65zvMNkLzdNzwBlq2U9B9xthDLFSbVOgty0fQqfNo4iOy/UqORINwdU9i6L
         k7VOl1j8M9kcQt6Lt7q56pROiBmYAOVLBsrPQjX/R7enGVTeFYkC6s820o7Fcp0okJOY
         YFT2d31hTEtBQyqo9Fpuf2rA9f7sZTw9rDExcWvp25wRosQeFyp3i1Y6LHRVe+Ay6We/
         dJNyydM+MCUgMXD/WTvhWhfppHOq9KvKVjGLg8YAKMAtUmkPPcImQFNwfJhlQZpv87Gq
         JfoaL7iuUFY6gzIanA86OAip1S060UKl9Kitguiz3zXKeNaqBvsS5k3FXkG8k+0PMTMr
         oy8w==
X-Forwarded-Encrypted: i=1; AJvYcCV7mO9PP/H//jQ2Yw7ML3CFCyDEGJMJr2OKwBXOKACaaAT48YxmUWhBxLcHCwpNP4ojgRA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFtO75QsIso1AOsZmtR2EYWfraXnI6N7ErmSjsltBI/EQw9voG
	HRrHMVVr2JDIw48gOOSJ8KThk22OvhwuQKUY03J3aUMSFWhG9Au+xgqc9PE0++c=
X-Gm-Gg: ASbGnct0yN6dKLDkRDSNhC0W8b4V2Xpt29GwEoZvv+POOjkWtsbgCSMqiXCYG95qdw2
	gMCoSDURQdT9exsOkgxTayGhDkpKr9WhYsq0licHvFK/p1d5VcbgaO8F869g7dR27VoHCzFFUeb
	9qMdW5WbN3FacckjbLHS3uyrf/MYZdD1RNYXGK9GztF3+C1LPHvwgXZSDUDgcvo79NZ5dJSEaLZ
	lH1gZaaBaKKUR3RvDQN7um86AEDmqDnHJKEyrAunYi2YBpZh3/jne6+TM8cJHvHw4z03SEiZg0p
	jx+6hGdsX0Tg8xjknCt4Mz48dIlN/2b5Yyp+
X-Google-Smtp-Source: AGHT+IHtyOoIg7bHGt0g9e1Uo2eNMrzJeCrkRIN1DDXKRKcewpjO0JB5UPvqvpz2rQ2ZoS2g0aK8Ag==
X-Received: by 2002:a05:6512:2807:b0:53e:38fd:7514 with SMTP id 2adb3069b0e04-5422956bdaamr5438834e87.51.1735002027757;
        Mon, 23 Dec 2024 17:00:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422381381csm1459363e87.165.2024.12.23.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:00:26 -0800 (PST)
Date: Tue, 24 Dec 2024 03:00:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
Message-ID: <6p6gvofde5mbjdzjs3am7qrezhwzxf7byguws5lfhexeh5faaa@vw4effmwiyay>
References: <20241224004439.239880-1-marex@denx.de>
 <20241224004439.239880-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-2-marex@denx.de>

On Tue, Dec 24, 2024 at 01:42:48AM +0100, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Plus.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
