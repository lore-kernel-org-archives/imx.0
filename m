Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C1E181328
	for <imx@lists.linux.dev>; Sat, 27 Jul 2024 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722098401; cv=none; b=i6+EDrU6Zx8M20OPz0Tc+RKu2HCfw5YdEhZghI8wce4uIVuC1XHFIZcXVacvCJ4u2T/+PyHc0r1xeCouf7mPpn8DNbzdp/Qsgqd+XnQxJbHrHI4kcJXRZ3y0NNMDPLMGfs3ppvab50KPV5Mnsey/f3F2BH6LcP+L8dWqB2oA8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722098401; c=relaxed/simple;
	bh=FUNE4JQOrI+mbE6a2Bb/3GxHEC37Whm4hYXMdfdGvWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkSXDB/vTsCNd/7GV/S2kgdSJzVuIYo3CA2JvRULwj3MknMdIT4751oeCH0MXZzR0oKKquuLbJdc4zSWoWXfWLUhhn9POLjLe+2UKaXrTbRfKUQ9WwjS4HjcSGbZ32WtzTtIUBXmk2DGHJcSvEQiy9mAD6JI3TzJxpaxCAxCWM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dKRXFy6z; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dKRXFy6z"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efba36802so3725650e87.2
        for <imx@lists.linux.dev>; Sat, 27 Jul 2024 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722098398; x=1722703198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e37AhEISBQ02gc3ZCHLGCwU3mAG5uPYdG67GQd5E1Pk=;
        b=dKRXFy6zqwjWoJkhCd0VrtJYOc2GpzLxPWkv0C4nQorBk9WsXHIcNyN/QW4bqBSlUD
         /fyAMsoq1k1pWhIY+IzxLnl0LnOHMYNVvfpNMVZA1nAl3ZP4JeYSwvz+irDDzK8jxsoL
         obFWPAoHBXbSSZUBLv6+jP2YqsBpiKkwU4LscQFSdipZmL4XZEfgopyGFnZn3U8zhY2/
         4Mk/0f8FauXAeof69SlzLskRPpw9rIm9XV7ak9dtvxRh2xYZ4xCHLtwkUvEn0RvKOW+Q
         kKATcA6o6vTwUmnuEM7iQfZChmYyHW0sYGs5rZs2urIfwM3SVfDLqavLvkD6Eu7F8cmU
         SiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722098398; x=1722703198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e37AhEISBQ02gc3ZCHLGCwU3mAG5uPYdG67GQd5E1Pk=;
        b=HpoNJwBnIT8fIkQTZ3a/Fmgpe6IlagMMB3Xid3uFWM3BDG/3eLeUG9fb1CrXZUDG2e
         aggFguWrwd2LVy4M/eiLP/4Ercoyxo/a/jJQ4XGmlO92zHmp2fyWnNtpnQ8ZSOhEbm8j
         19X7CLPhuc1OKqAgA7si5HZaQngPgPtPXXgML8EDdka+TEov8io7NbYa5YjRrINGhpoP
         g3MQ2bgHQgYPiVgNDytZAj5pDJeg+5PfJL6AWXDpI4K0kxsCtj3juT+6XGEgx6veiMWW
         tr0TyfYh4LRAZSEZuxC4QW/9HpUaTKzwnO8mldZWL7FBEtGckpZYvWvCHLCiEvGBjiI8
         VHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXnRBWwD41hop79e5Q777vbttYrH1ABZt6hKo7Djjr/OJUK8JdAwrCR8LbMjO6efQDjqIeGlCfQf+8Yab+c5n8QG3x
X-Gm-Message-State: AOJu0YysMFFTr0Vlsl9gfxi/nlaoLicu1BYS4XgDZrNvBiXyNVSerlhv
	2jM2O2HMjjqE2wxXpDloAGdl36NDjBVRn+y141TpITPta/OuwBr0m45lPXiL3oo=
X-Google-Smtp-Source: AGHT+IGhwepcIOBfQ1zb5uvMu7DFH8peCt2X7vNb7TKdJEffIwJXb+SCw0b5V1egmjG7hA92CaUC2w==
X-Received: by 2002:a05:6512:524:b0:52c:8c4d:f8d6 with SMTP id 2adb3069b0e04-5309b2bcc06mr2028466e87.45.1722098397341;
        Sat, 27 Jul 2024 09:39:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c1a0d2sm805229e87.224.2024.07.27.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 09:39:56 -0700 (PDT)
Date: Sat, 27 Jul 2024 19:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, 
	frank.li@nxp.com
Subject: Re: [PATCH v3 00/19] Add Freescale i.MX8qxp Display Controller
 support
Message-ID: <wky3mjl7fn773myatyrdsea6oc2xebkvrgmigmmoj36eswgqry@2kox5ad5dynl>
References: <20240724092950.752536-1-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724092950.752536-1-victor.liu@nxp.com>

On Wed, Jul 24, 2024 at 05:29:31PM GMT, Liu Ying wrote:
> Hi,
> 
> This patch series aims to add Freescale i.MX8qxp Display Controller support.
> 
> The controller is comprised of three main components that include a blit
> engine for 2D graphics accelerations, display controller for display output
> processing, as well as a command sequencer.
> 
> Previous patch series attempts to do that can be found at:
> https://patchwork.freedesktop.org/series/84524/
> 
> This series addresses Maxime's comments on the previous one:
> a. Split the display controller into multiple internal devices.
>    1) List display engine, pixel engine, interrupt controller and more as the
>       controller's child devices.
>    2) List display engine and pixel engine's processing units as their child
>       devices.
> 
> b. Add minimal feature support.
>    Only support two display pipelines with primary planes with XR24 fb,
>    backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
>    when necessary).
> 
> c. Use drm_dev_{enter, exit}().
> 
> Since this series changes a lot comparing to the previous one, I choose to
> send it with a new patch series, not a new version.

I'm sorry, I have started reviewing v2 without noticing that there is a
v3 already.

Let me summarize my comments:

- You are using OF aliases. Are they documented and acked by DT
  maintainers?

- I generally feel that the use of so many small devices to declare
  functional blocks is an abuse of the DT. Please consider creating
  _small_ units from the driver code directly rather than going throught
  the components. Also please describe how everything fits together in
  the cover letter.

- I assume that there more functional units that you are cunrretly
  adding and there is more versatility. Please describe that in the
  commit messages.

- I see a lot of small functions, which can be inlined without the lost
  of code clarify. Please consider self-reviewing your code from this
  perspective.

- There were other small comments, but I think they are less important
  now. You might still consider them for v4.

> To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
> instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
> diagram and represents the whole display subsystem which includes the display
> controller and prefech engines, etc.
> 
> With an additional patch[1] for simple-pm-bus.c, this series facilitates
> testing a LVDS panel on i.MX8qxp MEK.
> 
> Please do NOT merge patch 14-19.
> 
> [1] https://lkml.org/lkml/2023/1/25/120
> 
> v3:
> * Collect Rob's R-b tag on the patch for adding fsl,imx8qxp-dc-intc.yaml.
> * Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
>   fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
>   into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
> * Document all processing units, command sequencer, axi performance counter
>   and blit engine. (Rob)
> 
> v2:
> * Drop fsl,dc-*-id DT properties from fsl,imx8qxp-dc*.yaml. (Krzysztof)
> * Move port property from fsl,imx8qxp-dc-display-engine.yaml to
>   fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
> * Drop unneeded "|" from fsl,imx8qxp-dc-intc.yaml. (Krzysztof)
> * Use generic pmu pattern property in fsl,imx8qxp-dc.yaml. (Krzysztof)
> * Fix register range size in fsl,imx8qxp-dc*.yaml.
> * Use OF alias id to get instance id from display driver.
> * Find next bridge from TCon's port from display driver.
> * Drop drm/drm_module.h include from dc-drv.c.
> * Improve file list in MAINTAINERS. (Frank)
> * Add entire i.MX8qxp display controller device tree for review. (Krzysztof)
> * Add MIPI/LVDS subsystems device tree and a DT overlay for imx8qxp
>   MEK to test a LVDS panel as an example. (Francesco)
> 
> Liu Ying (19):
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller processing
>     units
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller blit engine
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller display
>     engine
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel
>     engine
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller AXI
>     performance counter
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller command
>     sequencer
>   dt-bindings: interrupt-controller: Add i.MX8qxp Display Controller
>     interrupt controller
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller
>   drm/imx: Add i.MX8qxp Display Controller display engine
>   drm/imx: Add i.MX8qxp Display Controller pixel engine
>   drm/imx: Add i.MX8qxp Display Controller interrupt controller
>   drm/imx: Add i.MX8qxp Display Controller KMS
>   MAINTAINERS: Add maintainer for i.MX8qxp Display Controller
>   dt-bindings: phy: mixel,mipi-dsi-phy: Allow assigned-clock* properties
>   dt-bindings: firmware: imx: Add SCU controlled display pixel link
>     nodes
>   arm64: dts: imx8qxp: Add display controller subsystem
>   arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
>   arm64: dts: imx8qxp-mek: Enable display controller
>   arm64: dts: imx8qxp-mek: Add MX8-DLVDS-LCD1 display module support
> 
>  ...sl,imx8qxp-dc-axi-performance-counter.yaml |  57 ++
>  .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 +++++++
>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  41 ++
>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  44 ++
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  67 ++
>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++
>  .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 +++++
>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  45 ++
>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 +++
>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 141 +++++
>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  43 ++
>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 ++
>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  32 +
>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 ++
>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  44 ++
>  .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++
>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  43 ++
>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++
>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  83 +++
>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  53 ++
>  .../display/imx/fsl,imx8qxp-dc-store.yaml     |  96 +++
>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 ++
>  .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 +++++++
>  .../devicetree/bindings/firmware/fsl,scu.yaml |  20 +
>  .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++
>  .../bindings/phy/mixel,mipi-dsi-phy.yaml      |   5 -
>  MAINTAINERS                                   |   8 +
>  arch/arm64/boot/dts/freescale/Makefile        |   4 +
>  .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 +++++++++++++
>  .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  34 ++
>  .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 ++++++++
>  .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 +++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  28 +-
>  drivers/gpu/drm/imx/Kconfig                   |   1 +
>  drivers/gpu/drm/imx/Makefile                  |   1 +
>  drivers/gpu/drm/imx/dc/Kconfig                |   8 +
>  drivers/gpu/drm/imx/dc/Makefile               |   7 +
>  drivers/gpu/drm/imx/dc/dc-cf.c                | 157 +++++
>  drivers/gpu/drm/imx/dc/dc-crtc.c              | 578 ++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-crtc.h              |  67 ++
>  drivers/gpu/drm/imx/dc/dc-de.c                | 151 +++++
>  drivers/gpu/drm/imx/dc/dc-de.h                |  65 ++
>  drivers/gpu/drm/imx/dc/dc-drv.c               | 275 +++++++++
>  drivers/gpu/drm/imx/dc/dc-drv.h               |  54 ++
>  drivers/gpu/drm/imx/dc/dc-ed.c                | 266 ++++++++
>  drivers/gpu/drm/imx/dc/dc-fg.c                | 366 +++++++++++
>  drivers/gpu/drm/imx/dc/dc-fl.c                | 136 +++++
>  drivers/gpu/drm/imx/dc/dc-fu.c                | 241 ++++++++
>  drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
>  drivers/gpu/drm/imx/dc/dc-fw.c                | 149 +++++
>  drivers/gpu/drm/imx/dc/dc-ic.c                | 249 ++++++++
>  drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
>  drivers/gpu/drm/imx/dc/dc-kms.h               |  15 +
>  drivers/gpu/drm/imx/dc/dc-lb.c                | 300 +++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.c                | 140 +++++
>  drivers/gpu/drm/imx/dc/dc-pe.h                |  91 +++
>  drivers/gpu/drm/imx/dc/dc-plane.c             | 227 +++++++
>  drivers/gpu/drm/imx/dc/dc-plane.h             |  37 ++
>  drivers/gpu/drm/imx/dc/dc-tc.c                | 137 +++++
>  60 files changed, 7598 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
