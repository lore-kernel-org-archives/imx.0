Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F30913E8BC
	for <imx@lists.linux.dev>; Wed, 15 May 2024 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715780843; cv=none; b=NKot8zb8CmrWuV24oUYgUmKxTPBlUyZyNs1DHr6eFrz+Kg/Eb/Yog3PbKqhUYYQEYZBCeS1s0C0I3VwuLZDGBlfShocFBgluOgp2Ind1H2VFw2HZY5UdbTvZHaOyupk8I0ZSG8moDTsCWH4qiZ5OonmoiOuf23vae7Qs4mszzSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715780843; c=relaxed/simple;
	bh=xrhUxugfQmSronO7F7nFYQOsMiIyasnr75Y/dPgA2vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPyBJEN0mkw8XBpJomwE/EkGlNbewk+KaEL3zLeJMtY+aioD3wV/Eaio2eWlPr5r3Lc5MwdxtnluHGDOCaMoVGTmV5hS05O+3mydlmmxnSsMiiQMakEnQWxpLwziIQGIkQSrnNyr1pg7xApjndWUv8JY32BpBD7sgJMERmThF4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nTULDYJt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nTULDYJt"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF225975;
	Wed, 15 May 2024 15:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715780826;
	bh=xrhUxugfQmSronO7F7nFYQOsMiIyasnr75Y/dPgA2vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nTULDYJt7QoihhYWMNHga/yOs8nVYs4KB/g5CKPYPF5vztp3g7pYi2b5PdHQ2C9aI
	 eNCCeq3YUEYuEsW4ZqOqr0UnUP5g7N1c2smlGOHiQPmSPDokypX8DuSb6MezvFE3De
	 FCCTQv5dN9lDR1xeYAJxIrrMs0oulmtvIdjajaBs=
Date: Wed, 15 May 2024 16:47:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: display: synopsys,dw-hdmi: Document
 ddc-i2c-bus in core
Message-ID: <20240515134705.GA12169@pendragon.ideasonboard.com>
References: <20240515062753.111746-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240515062753.111746-1-marex@denx.de>

Hi Marek,

Thank you for the patch.

On Wed, May 15, 2024 at 08:27:44AM +0200, Marek Vasut wrote:
> The DW HDMI driver core is responsible for parsing the 'ddc-i2c-bus' property,
> move the property description into the DW HDMI common DT schema too, so this
> property can be used on all devices integrating the DW HDMI core.

De-duplicating documentation is good :-)

I see no reason why this property should be disallowed on any of the
platforms that integrate a DW HDMI (unless that platform has no other
I2C controller, but I think we can ignore that in the bindings).

There could be platforms where the DW HDMI DDC pins are not exposed,
making the ddc-i2c-bus property mandatory, but that's something for
platform-specific bindings to handle by simply adding a

required:
  - ddc-i2c-bus

That's a separate issue. This patch looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Update rockchip,dw-hdmi.yaml as well
> ---
>  .../bindings/display/bridge/synopsys,dw-hdmi.yaml         | 8 ++++++++
>  .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml    | 8 --------
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml       | 8 --------
>  3 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> index 4b7e54a8f037f..828709a8ded26 100644
> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -45,6 +45,14 @@ properties:
>        - const: isfr
>      additionalItems: true
>  
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The HDMI DDC bus can be connected to either a system I2C master or the
> +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> +      to a system I2C master this property contains a phandle to that I2C
> +      master controller.
> +
>    interrupts:
>      maxItems: 1
>  
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> index 7979cf07f1199..180c4b510fb12 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> @@ -31,14 +31,6 @@ properties:
>    clock-names:
>      maxItems: 2
>  
> -  ddc-i2c-bus:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      The HDMI DDC bus can be connected to either a system I2C master or the
> -      functionally-reduced I2C master contained in the DWC HDMI. When connected
> -      to a system I2C master this property contains a phandle to that I2C
> -      master controller.
> -
>    gpr:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> index 2aac62219ff64..9d096856a79a6 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -70,14 +70,6 @@ properties:
>            - vpll
>            - ref
>  
> -  ddc-i2c-bus:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      The HDMI DDC bus can be connected to either a system I2C master or the
> -      functionally-reduced I2C master contained in the DWC HDMI. When connected
> -      to a system I2C master this property contains a phandle to that I2C
> -      master controller.
> -
>    phys:
>      maxItems: 1
>      description: The HDMI PHY

-- 
Regards,

Laurent Pinchart
