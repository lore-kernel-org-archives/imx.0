Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE7219301
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 17:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545327; cv=pass; b=sDEVbUwmt4Y7DNBHjifN3iOf6SOVulNdkkAQq3OMEY8Xw7Q6r9Ojurd1SUxbBFizj/w9inZ+AmTl7wR57LaO5JJ/AWgLXFGfuIRweywxrA6nxeP3IsCLq4Fb85sAXtINPTu50lbSzJMA7+tn27QE6qfSwpOzULRT9XPSA6Atq28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545327; c=relaxed/simple;
	bh=VTzEkr7L4aS/sPn6TLczQ6LKYQ2s4kS044JuP3HQbnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnkBcF8NP0uiv8HkIx6OY03AI1qONrlcjAgfcHrfkfaby2ze+zKNYyEuCBxsO7At5JEETjSVCBA9BIBcZ2S23d1nDAKLEyaRp7cBdhIIyEV8W157nRz8AV8olBOD1lM5KB26dUwszU2sxlDaPvH7fWr+HW9k66ZtlfcTVgTdeYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=NeDsS1PI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="NeDsS1PI"
ARC-Seal: i=1; a=rsa-sha256; t=1774545262; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kqAZwu1ySKx6jur+08R360LzwVwNexY+I9eifdZiGiuS/VO+cJvBsAsNCtFs45jfyD2UkAtmAgFrL924JMAactXBcGDT5HYIFmNCy1xxBzit0PasNKufuP25O2YvhY0L5YXmsFd4fedTYNcC4M/nxBxfYAz1mDhR2kevHyDPbGk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774545262; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hIwHPgKroczcraBFmjBx7sfSYocmTQ5ow6bV/DaRoOc=; 
	b=j0BXiYRNWAAHv6Sqt6V9YCMLkInUDD0PFBR4ukE5EMXeCw2N5fttFNgBdIRPfrEiZffWgMLzxGXM9lmp+rC4+orSxBH1y0vYjoZvM7o8JyN6jpVarGK9a8VuUTbHQa9FjaXljnzEztWEgdQjYNrmUiMb1aIT7J5o76Q4LFuScfg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774545262;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hIwHPgKroczcraBFmjBx7sfSYocmTQ5ow6bV/DaRoOc=;
	b=NeDsS1PIKBLqQEwWGWTBMga7hItj0jFa5ZyblKGysbeGmszU+yKU14Rwo8bF9p5E
	ePtFvq3CEHN3szypTv4rV6b9b4olr8+UBQD95nBMTAIb3PTHywGgLgh1C+s/U5TtN+a
	8nUbLCamqQDGAA2g6JFUI0+zxXgYb5psFOsNEo9E=
Received: by mx.zohomail.com with SMTPS id 1774545258284948.1058809311842;
	Thu, 26 Mar 2026 10:14:18 -0700 (PDT)
Message-ID: <25aaed3b-1f15-44ca-bd0e-e16c683ee403@collabora.com>
Date: Thu, 26 Mar 2026 17:13:59 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] drm/mxsfb/lcdif: use DRM_BRIDGE_ATTACH_NO_CONNECTOR
 and the bridge-connector
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Fabio Estevam <festevam@denx.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Gilles Talis <gilles.talis@gmail.com>,
 =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
 Heiko Schocher <hs@denx.de>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Josua Mayer <josua@solid-run.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Richard Hu <richard.hu@technexion.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Vitor Soares <vitor.soares@toradex.com>
References: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
Content-Language: en-US
From: Martyn Welch <martyn.welch@collabora.com>
In-Reply-To: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 20/03/2026 10:46, Luca Ceresoli wrote:
> This series modernizes the i.mx8mp LCDIF driver to use the
> bridge-connector, which is the current best practice in DRM.
> 
> == Call for testing on i.MX8MP boards (especially those using HDMI)!
> 
> This series applies changes to how video output devices are probed on
> i.MX8MP, especially those using HDMI. Even though I have put care in not
> breaking anything, there could potentially be pitfalls I haven't realized,
> causing regressions on existing boards.
> 
> I have thus added in Cc all developers which appeared active on dts files
> for imx8mp boards involving video. I would appreciate testing on as many
> boards as possible, along with a Tested-by tag, or a report about any
> issues encountered.
> 
> Thanks in advance to all testers!
> 

Tested-by: Martyn Welch <martyn.welch@collabora.com>

Using Ezurio Nitrogen8M Plus ENC Carrier Board with i.MX88MP SOM and 
1280x800 HDMI display.


> == Review recommendation
> 
> I recommend reviewing patches in this order to be understood more
> effectively:
> 
>   * Cover letter
>   * Patches 1-5 are small preliminary cleanups/improvements
>   * Patch 8 is the goal of this series, but would not work alone
>   * Patch 7 this lets patch 8 work; but in turn it can't work alone
>   * Patch 6 lets patch 7 work
> 
> == Series description
> 
> This series is not strictly related to DRM bridge hotplug, it is rather a
> preparation step. Introducing hotplug would need two different approaches:
> one for the new way, for drivers using bridge-connector and
> DRM_BRIDGE_ATTACH_NO_CONNECTOR, another for drivers using the "old, legacy
> way" where the last bridge is supposed to instantiate the
> drm_connector. Hotplug is complicated enough in one case, so it makes sense
> to only support the new way.
> 
> The hardware I'm working on is an i.MX8MP, whose LCDIF driver is still
> using the old way. So this series converts to the new way as a preparation
> step.
> 
> Patch 8 does the conversion, which is simple. However this would introduce
> a regression on some boards. Here's why:
> 
> There are 3 instances of the LCDIF in i.MX8MP:
> 
>   * LCDIF1, driving the DSI output
>   * LCDIF2, driving the LVDS output
>   * LCDIF3, driving the HDMI output
> 
> The device drivers of peripherals connected to LCDIF1 and LCDIF2 already
> support the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag. So far so good.
> 
> LCDIF3 is more tricky. The HDMI pipeline is:
> 
>    LCDIF3 -> fsl,imx8mp-hdmi-pvi -> fsl,imx8mp-hdmi-tx -> HDMI connector
> 
> The fsl,imx8mp-hdmi-tx (hdmi-tx) component supports both cases (with or
> without DRM_BRIDGE_ATTACH_NO_CONNECTOR), but in the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR case it does not create a drm_connector,
> thus preventing the creation of the pipeline. To make it work a connector
> must be created, and the way to do so is describing the connector in the
> device tree (compatible = "hdmi-connector"), so the display-driver will add
> the connector along with a wrapping bridge.
> 
> Unfortunately not all device trees in mainline have an hdmi-connector
> node. Adding one is easy, but would break existing hardware upgrading to a
> newer kernel without upgrading the device tree blob. This is addressed by
> patch 7 reusing an existing approach to add such a node to the live device
> tree at init time using a device tree overlay for boards which don't have
> one.
> 
> Finally, patch 7 cannot work alone because of a bad interaction between
> devlink and device tree overlays. Patch 6 solves that.
> 
> == Grand plan
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> Here's the work breakdown (➜ marks the current series):
> 
>   1. … add refcounting to DRM bridges struct drm_bridge,
>        based on devm_drm_bridge_alloc()
>      A. ✔ add new alloc API and refcounting (v6.16)
>      B. ✔ convert all bridge drivers to new API (v6.17)
>      C. ✔ kunit tests (v6.17)
>      D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
>           and warn on old allocation pattern (v6.17)
>      E. … add get/put on drm_bridge accessors
>         1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
>         2. ✔ drm_bridge_get_prev_bridge() (v6.18)
>         3. ✔ drm_bridge_get_next_bridge() (v6.19)
>         4. ✔ drm_for_each_bridge_in_chain() (v6.19)
>         5. ✔ drm_bridge_connector_init (v6.19)
>         6. … protect encoder bridge chain with a mutex
>         7. … of_drm_find_bridge
>            a. ✔ add of_drm_get_bridge() (v7.0),
> 	       convert basic direct users (v7.0-v7.1)
> 	  b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
> 	  c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
> 	  d. ✔… convert direct of_drm_get_bridge() users, part 4
> 	        (some v7.1, some pending)
> 	  e.   convert bridge-only drm_of_find_panel_or_bridge() users
>         8. drm_of_find_panel_or_bridge, *_of_get_bridge
>         9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
>      F. ✔ debugfs improvements
>         1. ✔ add top-level 'bridges' file (v6.16)
>         2. ✔ show refcount and list lingering bridges (v6.19)
>   2. … handle gracefully atomic updates during bridge removal
>      A. ✔ Add drm_bridge_enter/exit() to protect device resources (v7.0)
>      B. … protect private_obj removal from list
>      C. ✔ Add drm_bridge_clear_and_put() (v7.1)
>   3. … DSI host-device driver interaction
>   4. ✔ removing the need for the "always-disconnected" connector
>   5. ➜ Migrate i.MX LCDIF driver to bridge-connector
>   6.   DRM bridge hotplug
>      A.   Bridge hotplug management in the DRM core
>      B.   Device tree description
> 
> [0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (8):
>        drm/mxsfb/lcdif: simplify remote pointer management using __free
>        drm/mxsfb/lcdif: don't unnecessarily loop over ports
>        drm/mxsfb/lcdif: use dev_err_probe() consistently in lcdif_attach_bridge
>        drm/bridge: dw-hdmi: document the output_port field
>        drm/bridge: dw-hdmi: warn on unsupported attach combination
>        drm/bridge: dw-hdmi: move next_bridge lookup to attach time
>        drm/bridge: imx8mp-hdmi-tx: add an hdmi-connector when missing using a DT overlay at boot time
>        drm/mxsfb/lcdif: use DRM_BRIDGE_ATTACH_NO_CONNECTOR and the bridge-connector
> 
>   drivers/gpu/drm/bridge/imx/Kconfig                 | 17 +++++
>   drivers/gpu/drm/bridge/imx/Makefile                |  2 +
>   .../bridge/imx/imx8mp-hdmi-tx-connector-fixup.c    | 60 +++++++++++++++
>   .../bridge/imx/imx8mp-hdmi-tx-connector-fixup.dtso | 38 ++++++++++
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |  1 +
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 45 ++++-------
>   drivers/gpu/drm/mxsfb/Kconfig                      |  1 +
>   drivers/gpu/drm/mxsfb/lcdif_drv.c                  | 88 +++++++++-------------
>   include/drm/bridge/dw_hdmi.h                       |  5 ++
>   9 files changed, 174 insertions(+), 83 deletions(-)
> ---
> base-commit: 8402cf4fc8f8d5756dc81cf9fda1dccdb3622634
> change-id: 20260306-drm-lcdif-dbanc-83dd948327de
> 
> Best regards,

