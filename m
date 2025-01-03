Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD61B2191
	for <imx@lists.linux.dev>; Fri,  3 Jan 2025 05:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735882635; cv=none; b=adW73eD1L4t36o3LaEUR7zGrI/vbtjSyz09Ap7+WjpQLmhqKpJciSzIvOKg5yfYcybq+Q9sqL1Ug0M5sLQIFpNKW+TCxe4cHKvVflcZzh3YF1qU4BmI85dTiUpDsCqJEjEUJsoZdm9I0ZFwt0neoStzn/lz1gwtyXh481U0J81g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735882635; c=relaxed/simple;
	bh=p9Wc2EhvFzf0qMDOYVAQQly/vhOo+LrryL9kNcSxPyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALnNyVRHMiKPIgamQc6rJ5TJYx88VRm+D9i6P+aEqIEH95rmkDRCIXcxxN1Zi0mtYvDDrRABlw+rELcuIh8QcZ2rzo61nL1UBqINkdJ8zbuIT2VSENNM3l2jeWuqynVmJw/n8/TZ98eg0KK9ofXAC1Msk+ZRwZtnG6Sf7cTbXFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2UfxegG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2UfxegG"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so12049900e87.2
        for <imx@lists.linux.dev>; Thu, 02 Jan 2025 21:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735882632; x=1736487432; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KOcDqtGRXf/UHLTIfgwSITvMK0QtY2PkEv0bG0mXGH8=;
        b=c2UfxegGHLWZNlgcXx3aZ11ygzgWTtyyRIj/+8JOSXUCNs38KLNUT+la3XgPr1Pshq
         7WLXDqf/Fs0uJBpuA2ZEGM4/01/+6RdnHEfGf8vIFZdplIs3KDNluLHwNCAfIRfyvC+A
         diCge/5sxB/ue9CrqSyU0IuKSUEtK9o0Q9jUZ+VzFU9IJo91LKYQPFJGFd+JDUiRzxGT
         EFhMbIzbzbf98qaGWpkK5QDo0c1XNeVAdmoUvjAr8hw3MCKrouC/cMtmHxfk46ekA+9S
         iVtUYU9PUDuiivvFWFotsOYwiuQim4YxIuUxUp23Nt1tXygRc6+/OPk57ta9J+nXQNbb
         HBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735882632; x=1736487432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOcDqtGRXf/UHLTIfgwSITvMK0QtY2PkEv0bG0mXGH8=;
        b=dDnHpNyr0YZvYJ2BhvYXSXD3uXj79YWMVX2QB73EzYUmBxu7irwlvVfmxlcyguCt9D
         64sxK/jhVojb2GUzafnj/+Ob09iM+NqjFU7JCkvExI7zcdRcKAzfejLd6p4TXI4r6vE9
         +yX52I8qHooQ4hUtxwMtjZtcv4viVjDKQa8gg2h8HifF8RqRBcW5T8H3gLI8idhJHHP1
         hbq6xrwJF3vU+tLblis6Jp4SislWSZAB1ZtuQXRbymqGXoKXWEc76ONIAuP85qVrOV9w
         L29zA9TAY/FD4Hz4dHdcmslaKCSRAcfl7KHZuPnzC1MAaf1v5aI8BJh5azxATTOeXvYq
         7t1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVq7oGAscEBy2skfuqtE8qaCfeGzCmtLDzvpI/PHn46wOIy8FdhO3BHMmkGDQKGXpkycuk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUJiQdFmOLZQbIck8rxEdnnMbiSMiV8i0Y2WkERcBtTu/v776L
	3V+15cZrfR39cYhYKxIqz7CrzhY7V7oaV8zAbKmaEh7RwjUeB76xFXA1seszr68=
X-Gm-Gg: ASbGnctdA1gWopyIl58q5N8+kNSmh2J8lVX4upR8EiNn6eoGXS0blfxjyxYJVpwitni
	uwsHG20Kmu4sXczbK38lShgHD9M7kMNX9ljkPri0k9//SxwnEef7jXuu9WpI5NFWpdRdaYGYe5S
	lyeAuwOEqOkwoBKWGJgG8ycyb+gP9DXXLcxQk1dgvXL0e45iqvsJyiUSC3SxVuPX8gKnxwpqV9X
	6vdpVGkKX0y2RHqblZiIhC1seFfhaFXRJtovw37o7JnrJZXd7yy11P7VQSpfET9LINVmTJWDXb2
	Ascq0Au/E9gONQPp3giVlCW4DnkmErLmNFZm
X-Google-Smtp-Source: AGHT+IGHQO4fKXV4A6UUeSv9pwYWeECIbpOiy9USqHzKJoO5upSfChVq4x5/CdajiSuV1O+v4t+BjQ==
X-Received: by 2002:a05:6512:334e:b0:542:218a:343 with SMTP id 2adb3069b0e04-542295989femr10755627e87.52.1735882631424;
        Thu, 02 Jan 2025 21:37:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238215c1sm3942084e87.206.2025.01.02.21.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:37:10 -0800 (PST)
Date: Fri, 3 Jan 2025 07:37:08 +0200
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
Subject: Re: [PATCH v3 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <elhtblbv265iorfwagrdenkujrbufakqakgajkdmldcen3xrar@plu5h3jrfqmh>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-2-marex@denx.de>
 <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
 <549d96ee-a675-47fd-9af0-0dc05744591c@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <549d96ee-a675-47fd-9af0-0dc05744591c@denx.de>

On Fri, Jan 03, 2025 at 12:22:34AM +0100, Marek Vasut wrote:
> On 1/2/25 5:55 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 31, 2024 at 08:28:49PM +0100, Marek Vasut wrote:
> > > The dw-hdmi output_port is set to 1 in order to look for a connector
> > > next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> > > The output_port set to 1 makes the DW HDMI driver core look up the
> > > next bridge in DT, where the next bridge is often the hdmi-connector .
> > > 
> > > Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> > > 
> > > Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
> > > the oldest commit which adds HDMI support is commit:
> > > 
> > > 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
> > > 
> > > That already contains the HDMI connector node. Most follow up additions
> > > of HDMI support to another devices has been a variation of the same commit,
> > > including connector node, which is the proper way of eanbling HDMI on the
> > > i.MX8MP.
> > > 
> > > The rest should be covered by output_port_optional which should make systems
> > > with DTs without HDMI connector node work, but such DTs should be updated and
> > > the HDMI connector node should be added.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Liu Ying <victor.liu@nxp.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Robert Foss <rfoss@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Stefan Agner <stefan@agner.ch>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: imx@lists.linux.dev
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > > V2: No change
> > > V3: - Update commit message
> > >      - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
> > >      - Enable output_port_optional
> > > ---
> > >   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> > >   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
> > >   2 files changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> > > index 9a480c6abb856..db5c8a76193ac 100644
> > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > @@ -17,6 +17,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> > >   	tristate "Freescale i.MX8MP HDMI-TX bridge support"
> > >   	depends on OF
> > >   	depends on COMMON_CLK
> > > +	select DRM_DISPLAY_CONNECTOR
> > 
> > I was going to write that it is not to be selected by anybody, but then
> > I stumbled upon meson driver, which also selects the symbol.
> > 
> > I still think that it is not to be selected by your driver as there is
> > no direct dependency (and there can be other bridges inbetween or the
> > bridge chain can end up with some other bridge). Such decisions belong
> > to defconfig or distribution's kernel config file.
> Wouldn't that only lead to unnecessary surprises on user side ?

This is of no concerns to Kconfig. You can't select all drivers that can
possibly be used with your platform / driver. `git grep
DRM_DISPLAY_CONNECTOR`.

-- 
With best wishes
Dmitry
