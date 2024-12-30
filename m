Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951D425949E
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566532; cv=none; b=PLOBbJVXEEfOQWz8LodAEI/CseFDRhRphozMjozu1cEQC+ZpbRtaQj/ygJRHOthqzopydz36DDmLY+wnjOW7mFFrp+Vw1UAIKYQXEu5clRrW4FL4z5lVmxSOF4ZLMtUQySZNl6CyrYSYD0/TSHArHeTGlI0BeuFTF4sJ7121TlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566532; c=relaxed/simple;
	bh=nruulhAoFYajk/uMUusqOGNfEcvHzEEIdRVyeHAwtR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1IV7DbNQGo99utayRW9s5pRrth/Yefxv8Gl9JJmeW7sdj8CDhegIJYdDXf0FYS0KSoIdnqaft/yZP6G4/PZbfe98Ph6pRnzHrILnyphf46CLlpbsFL59H7XaQs7jST+nktppLsA925/vfvyyVNke4Os3KlDvWsUft3/XwCKlZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vmiS7G7M; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmiS7G7M"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30227ccf803so110861111fa.2
        for <imx@lists.linux.dev>; Mon, 30 Dec 2024 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735566529; x=1736171329; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1mVeNrsz4JYHJ9P+OodijYNnFFvqhMvZ+GAyZwBS8A=;
        b=vmiS7G7MNioDruqpNyQtnzMx/hhg3TRpuofNybM8DPx1114ORNZTyLJqbs7ol0E78T
         LBwDHffdKeGj3QuL0VJdBO0yP4oJk85REHPoELBskWcmNPbiVOPg1kshlv5wAnqMXTlI
         jV2r/Yos01hFt4mTVjeTvl8ydNjtqHlqKtM89JW+hyhcn6Wm9GZzET4+b0ZieXCsSKII
         TvxN6eY/hzVwyygUG6guZmepeu/BxHmVzIaw/MoOzCd6tFSZltGYJ8yrVmND/xqiwpSQ
         uXlMujSjJcArYb/iqC9FBJGuNopMwZvV4lVT1Xq7P+pIm7rdxFEpse8KKFUNXEqsAmrL
         HoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566529; x=1736171329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1mVeNrsz4JYHJ9P+OodijYNnFFvqhMvZ+GAyZwBS8A=;
        b=sj4FVcXJzqINzDOoUrBmJL+CzSIWHWsz+FEQMcZHqmkwvudX0AOsK7VTCpKsMG8Fel
         fSL44zTULnpx82ntw0Yup0zrRsA4NS8hsLoTpIA2M8ksah1ej7EdESu6EPhB1mP9zVAc
         wCsS/i8ZEH176uvum1FnuJ8kOwDHUWWcaPXEexPD9gS7HRB3JUvmho1bWG5qeg/t9hMy
         Bu/jhlrPKJaxAnJr4wv8QqEgjSBD6rkUR8QzJJNtgBkHOTMgDBgp7IBvS4bnpTUx5xLI
         DJcByvonrFAEnxFBvoLHHOwgidXiMnfZ6Kd8BCnrIN06ujzZOjbG+MyzDSKsRaGy9oip
         n3og==
X-Forwarded-Encrypted: i=1; AJvYcCVPEi0aDiaOJL/Djfi82daw+HrSgdOey39g3CQWarxCXQMuz9WmzYpwb1ej6fCCe/HRdh0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyVIZbOV1sqXEZl6k75XKn1vxPS3VDEAe+AcN2w5uJSGhAf4M1
	RE/vWCuorGev5NqzPnGPZzHkiHBMJQdM4cY/PVE3hHpNM6ugLAyFtA5uLRZvz1k=
X-Gm-Gg: ASbGncspwLeKf5ESMk5QULksSfLqLzTZaVRez860OAFv9QlqEve3sZtDaHxaJizsjf0
	fQB8vH5SoKjYbCqAbejH0kXfMy/u7Ged22RWxQmpyM6EIFrv4qz8Wolh5WeDbRU6xolAy2VB5Hw
	qTDQmhZZTS43jURIetF4vOsjAh89eVfnasZ3Te+ZbiJr4+GszRMnl/tlVjygPyXDT3e6eju4/m0
	dU7veUAmhkwiZn4+qybmd0PivWNkgg45v5n5zhMvTp4E1vIbBAKNb5xQAgjYtPpQE4rjkIIc5g0
	loHeFSQu21xQBfAOizpo2bh16U9+rd68h40K
X-Google-Smtp-Source: AGHT+IFz6vnKDsjYSCj71qMJRlNWygcgRvbZvMXcj/k0biLU+n2vHyB+qTqUo+a6PyxFg6r3rse+Tg==
X-Received: by 2002:a05:6512:ba5:b0:540:1ec7:ef57 with SMTP id 2adb3069b0e04-54229586f9emr9237438e87.56.1735566528611;
        Mon, 30 Dec 2024 05:48:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238137cesm3129503e87.148.2024.12.30.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:48:48 -0800 (PST)
Date: Mon, 30 Dec 2024 15:48:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ying Liu <victor.liu@nxp.com>
Cc: Marek Vasut <marex@denx.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <dc5apgdlj7ybujm7spadpxhilwdb3266x3xwok7blno4y6sp5m@4iwa7wiwkaof>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
 <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>

On Mon, Dec 30, 2024 at 07:04:51AM +0000, Ying Liu wrote:
> On 12/26/2024, Marek Vasut wrote:
> > On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
> > > On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> > >> The dw-hdmi output_port is set to 1 in order to look for a connector
> > >> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > working.
> > >> The output_port set to 1 makes the DW HDMI driver core look up the
> > >> next bridge in DT, where the next bridge is often the hdmi-connector .
> > >>
> > >> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> > >>
> > >> Signed-off-by: Marek Vasut <marex@denx.de>
> > >> ---
> > >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > >> Cc: David Airlie <airlied@gmail.com>
> > >> Cc: Fabio Estevam <festevam@gmail.com>
> > >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >> Cc: Jonas Karlman <jonas@kwiboo.se>
> > >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > >> Cc: Liu Ying <victor.liu@nxp.com>
> > >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >> Cc: Maxime Ripard <mripard@kernel.org>
> > >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > >> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > >> Cc: Robert Foss <rfoss@kernel.org>
> > >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > >> Cc: Shawn Guo <shawnguo@kernel.org>
> > >> Cc: Simona Vetter <simona@ffwll.ch>
> > >> Cc: Stefan Agner <stefan@agner.ch>
> > >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Cc: imx@lists.linux.dev
> > >> Cc: linux-arm-kernel@lists.infradead.org
> > >> ---
> > >> V2: No change
> > >> ---
> > >>   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> > >>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
> > >>   2 files changed, 2 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > b/drivers/gpu/drm/bridge/imx/Kconfig
> > >> index 9a480c6abb856..d8e9fbf75edbb 100644
> > >> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > >> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > >> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> > >>   config DRM_IMX8MP_HDMI_PVI
> > >>   	tristate "Freescale i.MX8MP HDMI PVI bridge support"
> > >>   	depends on OF
> > >> +	select DRM_DISPLAY_CONNECTOR
> > >>   	help
> > >>   	  Choose this to enable support for the internal HDMI TX Parallel
> > >>   	  Video Interface found on the Freescale i.MX8MP SoC.
> > >> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >> index 1e7a789ec2890..4ebae5ad072ad 100644
> > >> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct
> > platform_device *pdev)
> > >>   	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> > >>   	plat_data->priv_data = hdmi;
> > >>   	plat_data->phy_force_vendor = true;
> > >> +	plat_data->output_port = 1;
> > >
> > > Quoting my feedback to a similar Liu's patch:
> > >
> > > This will break compatibility with older DT files, which don't have
> > > output port. I think you need to add output_port_optional flag to
> > > dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> > > is set, but there is no remote node.
> > Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
> > support is commit:
> > 
> > 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on
> > TQMa8MPxL/MBa8MPxL")
> > 
> > That already contains the HDMI connector node. Every follow up addition
> > of HDMI to another device has been a copy of the same commit, with
> > connector, so I think it is safe to say, no upstream DT is going to be
> > broken by this change. Do we care about hypothetical downstream DTs
> > which may be missing the connector ?
> 
> These have no HDMI connector nodes:
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts

Indeed. I should be less trustful.

Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
