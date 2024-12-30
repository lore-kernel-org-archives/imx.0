Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600E2746B
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 23:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735602503; cv=none; b=j43U3ze7/JNWFWCU1f1sjAH2kgjm9loyDYpfw7ZbA5G9bAm1Hsr2QaAder7034wlm8NUarokGDKoJdxz+1E4EcUJe89oGmcQup1e4xtejLmpFpNw+8tb3rKFCUYcSbGYOP3EdBMJsmtyU3l0FCIQDJkPvx0y9psYcblpYq7t0VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735602503; c=relaxed/simple;
	bh=wAYyr4QjWCv0VxY6bBhttsKyoa5ZG7cJVGi9e8NcvFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goH7BxnmvUBnRen0MeC9yPn38pZmIj87MzM7Hp9c8YKJzODadAjUm795oGApt6OUPU63pyhxDlX7LKNEw3IZ26D4mQN6bmsCXdgmugUsAOY3vUIncEO9DbYAsrhfULhKix8a6fAgU1IbLEAw1eRPGKqJ2Ph/F/8JaS92npI4lms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PhwUA3+B; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PhwUA3+B"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54024ecc33dso12131670e87.0
        for <imx@lists.linux.dev>; Mon, 30 Dec 2024 15:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735602499; x=1736207299; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UgSsFPfNrF0K064VfRUL0BVQGngs40cUTxR9qhhxM0M=;
        b=PhwUA3+BFUmfN3E2Tf80ylizlelHvKnqHNHri7njw9NFSgvTPqIuBIKIk8bR2PNEiz
         MiTi0pf5tl8ON6lsBSpFtX9WPynTtaPGwvSvFQty5yoFVw3pq2+zphUvkof/rMERHgO3
         k/FLtT/k+8rsh6IDjfgcKIVSPc66umNIukzE//AoR9kkOQQS1i36m7U4P+diBMuLM69X
         cntzDSBQwgD2uO3hXjWYAfLkX4tHHCOSxEbDv1IbpVfGAuD5LllOWGJ3UMTbtmyeRQAB
         aOmIUwQekaLLaPAxT0Ij/ZdpdoamR+hwGbodkesk47Vk2aZL3SB1ERGANmiRFOM54qQY
         3K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735602499; x=1736207299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgSsFPfNrF0K064VfRUL0BVQGngs40cUTxR9qhhxM0M=;
        b=kqxMkJMKP3AJttss2syI0PK+05qC4ZinS+n0gqLUbpyf2vCw8KySUsD+FVHLg2I8HJ
         JzgAw7MGHwahjCxGk8ua/ZEPveBIY7zlqGdBsK0XCgsM4Z64cbu8gED/8NhIB4hc6IgZ
         We2+KsptDmvul5s55LfPz2yraFnNWF4/Csd7BnvgUqQYt4U1RQUnNKsgVfxgT17ixnuR
         9wtKu/ahvOYPNdk0qECnBarpl8kPRM/4yYTGu8up4AffBTwdv7LoBuK0gMC7y6HPWI6t
         kE7j0lr9IQEsVP7pCGAehBZSbUUburgJYiAndl8svGwkAbZk6lH1k1toB7R61EVP4/3h
         N2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAeIsulKFWWT49BlftTO8vPCO+do1VWSF2D8g73UcAB2vmNe25fiUyK10Uv0zyEo+UCh4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4Z1Fd902etqpfjCNvQzeqWqA45/EBpRyn4XtLwqSncwJGwuNE
	l18ku6ddqdcB73UpSjb1q1jPJQj6Cjd1utaCLkin8daduFcrFJ1uMLS9lw4EuKo=
X-Gm-Gg: ASbGncvl3wCXWZcKZAh63Ts1ylzndgQw0Ri/F/cuJ4Iadw7k+JDslr1ZVimsTtBcNZf
	Az5b4B7sQs3bjaQHGbvV836fr6X1M7Obntl3XBHDVBq2qUmLtPgSgHSWJTOhAU5ffvJ2DSn7J4w
	QYK8VE+cwvd5TrCDaFoEqzL9JWDvQcSM0XPfQ9JhsaOUpNXvNQbup/5Cu9/HS5+G83B9TWqihpd
	B1Jb5L1q4pTWDhdL7qgxSeESaCzR3CvOKdl1D/chSfH6FpEmm20eMNYn+TBE18ZiD2tr6Thts6N
	6YuPH1q0rTRT0cF3GFALzzhjvEtryJnPLaOH
X-Google-Smtp-Source: AGHT+IEeHkfQLid0m43pDVugqz/D47PZrbPya309ylG+zd7c0WjADbMWKNB1PQntPAXc5YF0mYnAwg==
X-Received: by 2002:a05:6512:2387:b0:542:2e04:edb4 with SMTP id 2adb3069b0e04-5422e04f19fmr8697797e87.13.1735602498829;
        Mon, 30 Dec 2024 15:48:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236001d6sm3295240e87.85.2024.12.30.15.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 15:48:18 -0800 (PST)
Date: Tue, 31 Dec 2024 01:48:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: Ying Liu <victor.liu@nxp.com>, 
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
Message-ID: <z5so7ce7ufjrf4h7owoupimvo7qhdhqpd6ov7cjq4yoqvcmitg@2gdo2c222hfp>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
 <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <85d87cf5-26cd-4d71-b9ec-71d5e16d4e0b@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85d87cf5-26cd-4d71-b9ec-71d5e16d4e0b@denx.de>

On Mon, Dec 30, 2024 at 10:44:25PM +0100, Marek Vasut wrote:
> On 12/30/24 8:04 AM, Ying Liu wrote:
> > On 12/26/2024, Marek Vasut wrote:
> > > On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> > > > > The dw-hdmi output_port is set to 1 in order to look for a connector
> > > > > next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > > working.
> > > > > The output_port set to 1 makes the DW HDMI driver core look up the
> > > > > next bridge in DT, where the next bridge is often the hdmi-connector .
> > > > > 
> > > > > Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> > > > > 
> > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > > ---
> > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > > > Cc: Liu Ying <victor.liu@nxp.com>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > > Cc: Robert Foss <rfoss@kernel.org>
> > > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > Cc: Stefan Agner <stefan@agner.ch>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Cc: imx@lists.linux.dev
> > > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > > ---
> > > > > V2: No change
> > > > > ---
> > > > >    drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> > > > >    drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
> > > > >    2 files changed, 2 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > > b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > index 9a480c6abb856..d8e9fbf75edbb 100644
> > > > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> > > > >    config DRM_IMX8MP_HDMI_PVI
> > > > >    	tristate "Freescale i.MX8MP HDMI PVI bridge support"
> > > > >    	depends on OF
> > > > > +	select DRM_DISPLAY_CONNECTOR
> > > > >    	help
> > > > >    	  Choose this to enable support for the internal HDMI TX Parallel
> > > > >    	  Video Interface found on the Freescale i.MX8MP SoC.
> > > > > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > > index 1e7a789ec2890..4ebae5ad072ad 100644
> > > > > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > > @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct
> > > platform_device *pdev)
> > > > >    	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> > > > >    	plat_data->priv_data = hdmi;
> > > > >    	plat_data->phy_force_vendor = true;
> > > > > +	plat_data->output_port = 1;
> > > > 
> > > > Quoting my feedback to a similar Liu's patch:
> > > > 
> > > > This will break compatibility with older DT files, which don't have
> > > > output port. I think you need to add output_port_optional flag to
> > > > dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> > > > is set, but there is no remote node.
> > > Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
> > > support is commit:
> > > 
> > > 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on
> > > TQMa8MPxL/MBa8MPxL")
> > > 
> > > That already contains the HDMI connector node. Every follow up addition
> > > of HDMI to another device has been a copy of the same commit, with
> > > connector, so I think it is safe to say, no upstream DT is going to be
> > > broken by this change. Do we care about hypothetical downstream DTs
> > > which may be missing the connector ?
> > 
> > These have no HDMI connector nodes:
> > arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
> > arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> > arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> > arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
> Huh, I missed those, thanks.
> 
> Would it be OK with you to fix those DTs up and add the missing connector,
> rather than introduce some optional port workaround for them ?

I can't say for iMX8 particularly, but usually we try to keep backwards
compatibility, as DT can be coming from device vendors. So, I'd say, we
need both, the fixed DTS and the workaround.

-- 
With best wishes
Dmitry
