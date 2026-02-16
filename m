Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848A5239099
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238524; cv=none; b=Yw8xwrcbdu0/OfNLn+AzKrjdlSTloMLbBcEALaVEni+iQ/jn3CGXg8HSg6srEvQByG0uUD9Rt65tuxfIgFW6kL3tzNEL+dZLjpyIY26zLBXhZD2mZB1OzTo6iII3wXDrJbMUBXqLr1Wr7ozyFC721Wz8sFLqp17zizfXyX+IxtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238524; c=relaxed/simple;
	bh=10wib0l60Zb+rcCHmrg4klzWUN61T37b/wgdqf/5Pls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qfjq8znqVulPgpSgJmuKmcEm/sadGo7umorLYcoNi2BzhVmvFOOfXipkPrArjtZlwHEna3v/t4DmqaBeu42cFpkl4VV7QZU//QjE6LAv5hVPKSH/rF6UwdsNlNLHusdW6HbpQQmtxUquOetcpFyTDUedH/Z4JqRJmWFUEdzkVe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vrw2i-0007nE-Km; Mon, 16 Feb 2026 11:41:28 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vrw2f-00138T-12;
	Mon, 16 Feb 2026 11:41:26 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vrw2g-00000005pMv-2DGA;
	Mon, 16 Feb 2026 11:41:26 +0100
Date: Mon, 16 Feb 2026 11:41:26 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com, 
	Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 0/3] Add i.MX91/93 parallel display support
Message-ID: <fpnruayalannx3jrsjqfjzawrzxazy7ioo7ufxcwkbwj2eezfp@6i6ty7fz5xtc>
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

maybe this fell through the cracks due to the maintainership change,
therefore a gentle ping :)

+To Frank

Regards,
  Marco

On 26-01-15, Marco Felsch wrote:
> Hi,
> 
> this patchset adds the driver, dt-bindings and dt integration required
> to drive a parallel display on the i.MX93.
> 
> Since the i.MX91 register layout equals the one from the i.MX93, I added
> the support for both but tested only the i.MX93 case.
> 
> This patchset depends on:
>  - https://lore.kernel.org/all/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de/
> 
> @Conor Dooley
> I dropped your r-b tag since I added the 'bus-width' property.
> 
> Regards,
>   Marco
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changes in v9:
> - Link to v8: https://lore.kernel.org/r/20260113-v6-18-topic-imx93-parallel-display-v8-0-4abccdc473a5@pengutronix.de
> - dt-bindings: drop unncessary changes (Frank)
> - imx93-pdfc: drop bridge.driver_private usage (Luca)
> - Kconfig: Adapt Kconfig symbol and prompt (Luca)
> 
> Changes in v8:
> - Link to v7: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de
> - dt-bindings: add nxp,imx91-pdfc compatible (Liu)
> - dt-bindings: use video-interfaces.yaml# (Liu)
> - dt-bindings: s/data lanes/data lines/ (Liu)
> - dt-bindings: drop 'reg' poperty
> - dt-bindings: drop #address-cells, #size-cells
> - imx93-pdfc: drop drm/drm_print.h include (Liu)
> - imx93-pdfc: s/exist/exists/ (Liu)
> - imx93-pdfc: drop MEDIA_BUS_FMT_FIXED from imx93_pdfc_bus_output_fmts
> - imx93-pdfc: imx93_pdfc_bus_output_fmt_supported: make fmt const
> - imx93-pdfc: Rework input-fmt selection to always fallback to a sane
>               default.
> - imx93-pdfc: imx93_pdfc_bridge_atomic_check: make use of
> 	      imx93_pdfc_bus_output_fmt_supported() 
> - imx93-pdfc: drop 'reg' dt-property usage
> - imx93-pdfc: imx93_pdfc_bridge_probe: pass -1 for endpoint reg value (Liu)
> 
> Changes in v7:
> - Link to v6: https://lore.kernel.org/r/20251201-v6-18-topic-imx93-parallel-display-v6-0-7b056e1e5b1e@pengutronix.de
> - Add missing bits.h and bitfield.h headers (lkp)
> 
> Changes in v6:
> - Link to v5: https://lore.kernel.org/all/20250304082434.834031-1-victor.liu@nxp.com/
> - Add bus-width support
> - rebase onto v6.18-rc1
> - add review feedback (Alexander)
> - driver license "GPL v2" -> "GPL" (checkpatch)
> - make use of reg of-property
> - fix to short Kconfig description (checkpath)
> - add OF integration
> 
> ---
> Liu Ying (2):
>       dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and example
>       drm/bridge: imx: Add i.MX93 parallel display format configuration support
> 
> Marco Felsch (1):
>       arm64: dts: imx93: Add parallel display output nodes
> 
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |  78 +++++++
>  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  54 +++++
>  arch/arm64/boot/dts/freescale/imx93.dtsi           |  12 ++
>  drivers/gpu/drm/bridge/imx/Kconfig                 |  11 +
>  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c            | 226 +++++++++++++++++++++
>  6 files changed, 382 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251201-v6-18-topic-imx93-parallel-display-95f9234bf6cc
> 
> Best regards,
> -- 
> Marco Felsch <m.felsch@pengutronix.de>
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
