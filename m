Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0892C324D;
	Thu, 23 Apr 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951879; cv=none; b=STfJY/SCCnPA3ptrRPcCnh3uJd4Yh+wLoy6Yg0HX4Avlw5HuDu9AQEzVJrTokKGDpX9/K+tF8MnEuGB5YWjtIU23xx+VklotZoTNChs8vSnkl/6PRTEc4wGPYvWkqewrZrmhvkLi8CM2S14i1KsH2nYm2QdghdMr5RF2DKMLcMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951879; c=relaxed/simple;
	bh=0mBUUsjOMlEbXvzGVBcx5siwV+SQGGkEt1AQf0bWd9U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lS0mKLBolLnk+b2ur+HpVuqs0hyTPs32x82Fc0HZAmWAPWymOzVgfATWKPunaR4O98Ho40rVsSDd8K5U1D87YPS2LqlvQfjF2OVskFM/Fg659rfBoI+4cKORY/+5WNnWsmz22wvF02UcM6cIlHTK9EHyXBOHsZH1Dd4ueIklTT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=d26QQlDY; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="d26QQlDY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=eCOUmyCYGwEY2Foet02Vaww9vNupcZt1d3Ifp8xNNkw=; b=d26QQlDYWJoWUhW2tmX2Wu4+ha
	PAd6/1EFB725wzjU4Q149FqJva95gemdkRf0j1Wxy86auHIuqQuXEw/+UakW3lnOvNX390Ltqu3o5
	tktfeLKqQ4weibtcH8bqb2+6lA3ZXv5608bVdrvzSP9kCggg5q63B1E9xkltvkIt2W00=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wFuLv-000000003ju-1JAI;
	Thu, 23 Apr 2026 09:44:23 -0400
Date: Thu, 23 Apr 2026 09:44:22 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 00/15] var-som-6ul: improve support for variants
Message-Id: <20260423094422.09206dc0166d30af36c8b87d@hugovil.com>
In-Reply-To: <20260305180651.1827087-1-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --

On Thu,  5 Mar 2026 13:06:15 -0500
Hugo Villeneuve <hugo@hugovil.com> wrote:

> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Hello,
> this patch series improves support for Variscite VAR-SOM-6UL based boards.

Hi,
simple ping to know if anything is missing for this series to be
applied/picked-up?

Hugo.


> 
> The first two patches fix DT/dmesg warnings.
> 
> The next patches fix the incorrect use of VAR-SOM-MX6UL to refer to the
> VAR-SOM-6UL.
> 
> The next patches add support for the imx6ull CPU variant of the VAR-SOM-6UL.
> 
> Then improves/fixes the following features/options that are currently not
> working on the concerto EVK board:
>   - ethernet ports ENET1
>   - LVDS display panel
>   - Wifi/Bt
> 
> Note that the previous configuration of the optional Wifi/Bluetooth module
> was copied from the original Variscite kernel tree, and required custom
> shell scripts to properly configure the Wifi/Bluetooth module.
> 
> Also factor out optional features into separate DTSI include files, so it will
> be easier to support them for other boards, and to make sure they are not
> unconditionnally enabled.
> 
> I have tested these changes on a Variscite concerto EVK board using a
> VAR-SOM-6UL with the following options:
>   - EC (ethernet phy on SOM)
>   - LD (LVDS encoder assembled on SOM)
>   - WBD (Wi-Fi 802.11 ac/a/b/g/n and Bluetooth 5.2/BLE on SOM)
> Result of tests:
>   - Both ethernet ports Ok
>   - LVDS display panel Ok
>   - Wifi/Bt Ok
> 
> Also tested on a custom board with a VAR-SOM-6UL SOM (will be submitted in
> a future series).
> 
> Thank you.
> 
> Link: [v1] https://lore.kernel.org/all/20260302190953.669325-1-hugo@hugovil.com/
> 
> Changes for v2:
> - Place imx6ull-var-som-concerto.dtb in alphabetical order (Frank)
> - s/include/dtsi in commit msgs (Frank)
> - Clarify and improve patches to change VAR-SOM-MX6UL (Krzysztof)
> - Collect tags for some acked patches (Krzysztof)
> - Reorder pinctrl_gpio_leds in separate patch (Frank)
> - Improve git commit messages ((Frank)/Krzysztof)
> 
> Hugo Villeneuve (15):
>   ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply
>     property
>   ARM: dts: imx6ul-var-som: fix warning for boolean property with a
>     value
>   ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-MX6UL references
>   dt-bindings: arm: fsl: change incorrect VAR-SOM-MX6UL references
>   dt-bindings: arm: fsl: add variscite,var-som-imx6ull
>   ARM: dts: imx6ul-var-som: Factor out common parts for all CPU variants
>   ARM: dts: imx6ul-var-som-concerto: Factor out common parts for all CPU
>     variants
>   ARM: dts: imx6ul-var-som-concerto: order DT properties
>   ARM: dts: imx6ul-var-som: factor out SD card support
>   ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
>   ARM: dts: imx6ul-var-som: factor out ENET2 ethernet support
>   ARM: dts: imx6ul-var-som: add support for EC configuration option
>     (ENET1)
>   ARM: dts: imx6ul-var-som: factor out audio support
>   dt-bindings: display/lvds-codec: add ti,sn65lvds93
>   ARM: dts: imx6ul-var-som: add support for LVDS display panel
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   8 +-
>  .../bindings/display/bridge/lvds-codec.yaml   |   1 +
>  arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
>  .../dts/nxp/imx/imx6ul-var-som-audio.dtsi     |  30 ++
>  ...ar-som.dtsi => imx6ul-var-som-common.dtsi} | 140 +++-----
>  ...ts => imx6ul-var-som-concerto-common.dtsi} | 159 ++-------
>  .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  22 ++
>  .../dts/nxp/imx/imx6ul-var-som-concerto.dts   | 318 +-----------------
>  .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |  44 +++
>  .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     |  79 +++++
>  .../nxp/imx/imx6ul-var-som-lvds-panel.dtsi    | 112 ++++++
>  .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |  27 ++
>  .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi |  75 +++++
>  arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 219 +-----------
>  .../nxp/imx/imx6ull-var-som-concerto-full.dts |  22 ++
>  .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  21 ++
>  .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  36 ++
>  17 files changed, 575 insertions(+), 741 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
>  copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som.dtsi => imx6ul-var-som-common.dtsi} (60%)
>  copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-concerto.dts => imx6ul-var-som-concerto-common.dtsi} (50%)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> 
> 
> base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
> -- 
> 2.47.3
> 
> 


-- 
Hugo Villeneuve
