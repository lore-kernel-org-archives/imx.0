Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E12C18E1F
	for <imx@lists.linux.dev>; Thu, 26 Dec 2024 20:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735244479; cv=none; b=kltNfkQ1hQ67hbPyO/vgWEcx6pf/5r+t2xbwT6UEDxb4mvVFC4xI9qaA5OjUJYgO/ftMib5Y7P4wZY31BqEqWMtcHx+ViIciXmuG/YZtUjGS8yU1bmWhq7jQZ76L/oN+r/CLlZglY4n+0AXt+DhJgbMBWtYgLfIzLcw2m4tHyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735244479; c=relaxed/simple;
	bh=LWkNSQJdovHkRXCgoswLP7uTvW7wVZx4qgvdZr4oivw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2R7Sacy6Yi5nhIKkX7iaxAiSORhWrFkY8kyJY1sUr3+A4WKO0FkQ6vzT4vsX5HHpzjwGLVZzwYe2fsSwyXzAE7pArTlKBXMpmBPDEAt1FSMFMqJYgPxp2Ci9cDZMpRryV4/Jg1RB0wBtjp7DIKjCrlS3fYBHzu2ccBiPWmCEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKho8zTK; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKho8zTK"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so5977502276.2
        for <imx@lists.linux.dev>; Thu, 26 Dec 2024 12:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735244476; x=1735849276; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jLsVwUAfZmDtYibCKMVr36pxn6WsjEglULQ5ElBq4jE=;
        b=WKho8zTKDrU544084rdwfTa44rGe2DOX8LSCbmZ7DJZYGe7j3T7OljanGwAGnvdu8L
         oNFvsgYXXYSBidNZp7r9v9R9+7/2FT0isSIf7dmO5QVl6VAA/dMRdUyhDcTTii7bGvja
         rfbC1Dsi9lywaUNlOyS9GiReoNwfZO9UvUL9RhYQYgv1PJmuPlsOeaEKDoUWid+GTYHx
         LIUrHKuyB0SLAgyL+ImsABxTSiwhDep8rOiPRfU4aJ2EnOnGK66dTrTQzgX1+ACtuxMl
         VItR/Vp6+c17rmrkY9EB0kTfCEcqIXitMHe0DyjTj8L7EXor10yMElI56MV5cQ2egdCh
         KRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735244476; x=1735849276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLsVwUAfZmDtYibCKMVr36pxn6WsjEglULQ5ElBq4jE=;
        b=b0IPR7fpLC6jhh1DNYbJkBW9/DjCuyhrLS4EpgblyCg5n/8k74tcn+khwHlGZZxLyd
         gnqojQa2oBRe7Tl5mac2b2dbwTCHUwycKKOnTmEQ7xvJ9PKdAmMWaahNF2iv8iY/VdED
         YjczplXp2c/HrwJwuvF08pOM8uZzd7Uswh8qZUIImIp5SiMc8RwfnyMuC/DRqqQPaMSC
         1+Dtej99pij1UbkVBKHTP0KU70s0K3U/JZ8hQxeBRqHu+ZaylpUytEiFWjiro/Afd95O
         fl+t68iMIH+UL+/NFRP8OsBSrj4ygGtV37GMmnmaDAdY2oL6WNtSsizL5CdwTZykJ6Se
         4aPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7JxPCWD1Ww+nlMZVGoaSSY06JHiTX2VW1iK2Ugdjdluzf89LYX/8vE/kqAaI9ftjGNUA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZYxQe3EeQnYDyIfl55baG16cOwbAwF58vlTOQrSsGYNIhidfc
	62wB6sqV08jECC9HNztmRj0lOWyrNYHcyQJwJy82xqDd3RBSJQJGEpWkrZfImBAhiJH2Koa2DLK
	T84ifHOeGbdJqZrqIsh35gWT+gFCDn0k+Z8CdHg==
X-Gm-Gg: ASbGnctsqKC16GRW6kP3Oz8savZvPy3CbR1hTwt4BJ736p38yxiZ0T6zf9uM5mM3CjQ
	PiitZKJ6gn9hvZaOcDp7yDsARQmkbqPy9JJmoohzOZg04ECp9vHEajjwwJ+ZrqMZi4eTLgA==
X-Google-Smtp-Source: AGHT+IHpTK50yeGUEdpQbMNQSFdQBzjTFqErLlWqrFBeWf8+TuAIQeq3gV48/gavm3fRyyCFeJxcIJC5tp7UGxWvuvs=
X-Received: by 2002:a05:690c:fcc:b0:6ef:6035:82b4 with SMTP id
 00721157ae682-6f3f823d3afmr184345497b3.35.1735244476035; Thu, 26 Dec 2024
 12:21:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241224014701.253490-1-marex@denx.de> <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
In-Reply-To: <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Dec 2024 22:21:05 +0200
Message-ID: <CAA8EJppyPQETyJgYmJPZZu47kb-kVQ8tp9zjrbNO+GRavDXpEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Dec 2024 at 22:50, Marek Vasut <marex@denx.de> wrote:
>
> On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> >> The dw-hdmi output_port is set to 1 in order to look for a connector
> >> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> >> The output_port set to 1 makes the DW HDMI driver core look up the
> >> next bridge in DT, where the next bridge is often the hdmi-connector .
> >>
> >> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> ---
> >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Fabio Estevam <festevam@gmail.com>
> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >> Cc: Jonas Karlman <jonas@kwiboo.se>
> >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >> Cc: Liu Ying <victor.liu@nxp.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> >> Cc: Robert Foss <rfoss@kernel.org>
> >> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> >> Cc: Shawn Guo <shawnguo@kernel.org>
> >> Cc: Simona Vetter <simona@ffwll.ch>
> >> Cc: Stefan Agner <stefan@agner.ch>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: imx@lists.linux.dev
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> ---
> >> V2: No change
> >> ---
> >>   drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> >>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
> >>   2 files changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> >> index 9a480c6abb856..d8e9fbf75edbb 100644
> >> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> >> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> >> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> >>   config DRM_IMX8MP_HDMI_PVI
> >>      tristate "Freescale i.MX8MP HDMI PVI bridge support"
> >>      depends on OF
> >> +    select DRM_DISPLAY_CONNECTOR
> >>      help
> >>        Choose this to enable support for the internal HDMI TX Parallel
> >>        Video Interface found on the Freescale i.MX8MP SoC.
> >> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >> index 1e7a789ec2890..4ebae5ad072ad 100644
> >> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> >> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
> >>      plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> >>      plat_data->priv_data = hdmi;
> >>      plat_data->phy_force_vendor = true;
> >> +    plat_data->output_port = 1;
> >
> > Quoting my feedback to a similar Liu's patch:
> >
> > This will break compatibility with older DT files, which don't have
> > output port. I think you need to add output_port_optional flag to
> > dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> > is set, but there is no remote node.
> Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
> support is commit:
>
> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
>
> That already contains the HDMI connector node. Every follow up addition
> of HDMI to another device has been a copy of the same commit, with
> connector, so I think it is safe to say, no upstream DT is going to be
> broken by this change. Do we care about hypothetical downstream DTs
> which may be missing the connector ?

I'd say, not really. If you have to resend the series for whatever
reason, please mention that in the commit message.
If you don't it should be fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
