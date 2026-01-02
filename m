Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CCA221FCC;
	Fri,  2 Jan 2026 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767365017; cv=none; b=V/hbVNmhqOeDf+XMq9IcsK6T7v1dsRY9JDMZYR0hviF3PVomZfV2g0yRf9c0UFEPgEFsNCfmYyfGKIFMrRtZ90TLHFvhOtBYkxa0vDRgEz3keP6E+nD2RrLGP4Tw0N7hWiJESt9zSrw+a/FyuYgshlNJF3PorTHNXAE2mpaKWGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767365017; c=relaxed/simple;
	bh=XVEsFqEG/IZVEwsfy3Izs25RabVDKGcMpArFmXmdw4Q=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KDfLFgPv3QzwdV03ghK9Gkvoc6E4Z7aK7tvJUQ/fn2KU+/uFShhxcxK4c/ylPWC4/DljKqa1VMJsKTQwi8fcwt8sy8hrJsoi3/glt/qchC8dKTKamRv/kwHt66IVokpk2l3J1yqV5jBj0nhvBDg++Mw4h/rgw+XbWvzZF+WG28Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svJ2oV8N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svJ2oV8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E710C116B1;
	Fri,  2 Jan 2026 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767365016;
	bh=XVEsFqEG/IZVEwsfy3Izs25RabVDKGcMpArFmXmdw4Q=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=svJ2oV8NwccnrrqMY+zxcdAmdVM4HdvmGi+EOR9xxL3Wewigahn2XOTZP0yaVtiV8
	 0bo9VDkRpmK6uWRRYQ+sAvsn44vjnuOEgOHkFymSTxHT4s+PxmHnxQNHh3/fX+FxFr
	 oFR/0t4MYGp6qM1pFl5AGhGtds/f6BlGxVKPI39y6Td2DKJ5zB4mzvy0Wh7vYt2lov
	 Tx4oQ08c5gBtn/S7IqQdiIcb8hkpzXTx5hYTPnzNoSLW2ut9dxEGOOWsoD71SxeziU
	 zMKrzLw61k5oeann9HTy2arsA0Pxfr0rsQB4ZaK0FWiYw4hUkqTjtzzRkHhCgwimOu
	 n+OMMkM1n5s5g==
From: Rob Herring <robh@kernel.org>
Date: Fri, 02 Jan 2026 08:43:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
To: Josua Mayer <josua@solid-run.com>
In-Reply-To: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
References: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
Message-Id: <176736452823.3671482.4196945570874126466.robh@kernel.org>
Subject: Re: [PATCH v5 0/7] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot


On Thu, 01 Jan 2026 17:05:40 +0200, Josua Mayer wrote:
> This patchset mainly adds description for 3 SolidRun boards:
> - i.MX8MP Hummingboard IIoT
> - SolidSense N8 Compact
> - i.MX8MM Hummingboard Ripple
> 
> This includes dt bindings and a range of bug-fixes:
> 
> - dt bindings for the boards
> - fix to dsi panel bindings referncing panel-common and adding port
>   property
> - cosmetic fix to some  solidrun imx8mp boards for regulator gpio
>    polarity
> - fix dsi hdmi bridge on hummingboard pulse
> - compile dtbs with symbols to support overlays
> - gpiod_set_value _can_sleep conversion for panel and touchscreen
>    drivers
> 
> Open Questions:
> 
> - How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
>   (affects imx8mm-hummingboard-ripple.dts)
> - Is "description for" implied not only on dt-bindings patches, but also
>   dts? E.g. is this commit subject acceptable?:
>   "arm64: dts: add solidrun solidsense-n8 board"
> 
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> 
> Changes in v6:
> - imx8mm-hb-ripple: sorted i2c devices by address;
>   removed unnecessary newline.
>   (Reported-by: Shawn Guo <shawnguo@kernel.org>)
> - hb-iiot dts: sorted aliases alphabetically;
>   fixed gpio flags for vmmc regulator;
>   specified led@3 reg field in hexadecimal.
>   (Reported-by: Shawn Guo <shawnguo@kernel.org>)
> 
> Changes in v5:
> - rebased on v6.19-rc1
> - dropped ilitek-ts patch already picked into input-next
> - solidsense-n8 / imx8mm-sr-som: drop untested wake-on-lan support
> - hb-iiot: disable software unsupported rtc timer irq
> - hb-iiot: fix wrong pins selected for uart4
> - Link to v4: https://lore.kernel.org/r/20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com
> 
> Changes in v4:
> - dropped patches already picked into drm-misc-next
> - ronbo panel: picked up reviewed-by tag
>   (Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>)
> - ilitek-ts: changed mdelay calls on reset path to fsleep
>   (Note Dmitry requested msleep/usleep_range)
>   (Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>)
> - changed hummingboard-iiot tpm irq type to level
> - Link to v3: https://lore.kernel.org/r/20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com
> 
> Changes in v3:
> - sinmplified language in gpiod_can_sleep patches.
>   (Reported-By: Frank Li <Frank.li@nxp.com>)
> - collected ack on winstar lvds panel binding
>   (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
> - Link to v2: https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com
> 
> Changes in v2:
> - fix spelling mistakes in commit descriptions.
> - remove redundant "binding for" from subject:
>   https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
>   (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
> - remove one useless comment from imx8mm-sr-som.dtsi to fix long line
>   warning.
> - change ronbo panel binding to inherit panel-common and switch
>   additionalProperties to unevaluatedProperties.
>   (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
> - add dt binding for winstar lvds panel
> - fix dtbs_check for dsi & lvds panel addons
> - change n8 board dts comment-style in header
> - collected ack on solidrun boards bindings patch (patch 1 in the series)
>   (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
> - added standard led label property to hb-iiot multi-purpose leds
>   ensuring consistent names in case lp5562 driver starts using it.
> - Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com
> 
> ---
> Josua Mayer (7):
>       dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
>       arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
>       arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
>       arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
>       arm64: dts: add description for solidrun imx8mp hummingboard-iiot
>       arm64: dts: add description for solidrun solidsense-n8 board
>       arm64: dts: add description for solidrun i.mx8mm som and evb
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
>  arch/arm64/boot/dts/freescale/Makefile             |  15 +
>  .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
>  arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 ++++++++++
>  .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 851 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
>  ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
>  ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
>  .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
>  .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
>  .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 719 +++++++++++++++++
>  .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
>  .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
>  13 files changed, 2538 insertions(+), 9 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251026-imx8mp-hb-iiot-525b03beea62
> 
> Best regards,
> --
> Josua Mayer <josua@solid-run.com>
> 
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: 8f0b4cce4481fb22653697cced8d0d04027cb1e8 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com:

scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo
scripts/Makefile.dtbs:20: .dtbo is not applied to any base: imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dtbo





