Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28AA3218B
	for <imx@lists.linux.dev>; Wed, 15 May 2024 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715754767; cv=none; b=jvSl/KlBE3TCX0+0LQm6KtEzpSqW7h1wJuh1cSMrKAVVyTe/cFk7/1MdOhrvGKqtd3rLWobj5K2TBaR02GDTbv8MCyzWe4kKNVbd4nkiEoq141xdINAiraUEWBSLYqkpD0QMVmC3MteOxrxpUWJHJ/kQL/z1mGxDojtX37Y7dgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715754767; c=relaxed/simple;
	bh=wWW93tTjATC/IKl+3Z2x+jQ8FPNo1o92Xqmlq2GuKPM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ea3TSbudgexCMqyrgrQnsEUrJZoCZ3Gwpe8hZONpvCmh22pRZc/t/w+d+/VzLjvM+//EwIvy5mAnypH4gWnJIxIpm6m7lGWI46XX3o7x6ghRgq6uA5l2sqt9JxCjsjxNLPTkZYJBYlLDAr7WOxw7Mv+GLcTilyC1oIwrT2SMNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=JCXrFDYY; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="JCXrFDYY"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 659EC83339;
	Wed, 15 May 2024 08:32:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1715754764;
	bh=ddydLfOKbSHxwie9AtUSsD05hgEVFV91WgAcpSisnKM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=JCXrFDYY81ICQPhy/53SGj2ZOW6e2B8X3UM7OXB7MSxN20zHO88wtclZnTHmFrgZJ
	 D+4wVaVnIpZNW8a7A1zKYocMfKB5t2o91f9ccGOoWCCVVAvhEWgZDK3rr2ofBVsS/t
	 YnFUIq4K66/fBpzMUOZqbGGJ99kKJVAjQnjMXsc6VNbt8aBQdrIv++K3y1KIWqFBwN
	 cRcAlSsyFU/BERZay3hbgj5l+ZQb542/EtX4qVzrtiXqKbP19eRxzBDAIkTA2+Sebk
	 AcHP0yy4R+3mQWwicX+bt3iv6Mw9vFMdil3RdBuHjCGNl9rhMtos62U6wGNzeW08yo
	 AySBlVoHOoueA==
Message-ID: <bba910ba-e4b0-4ac3-a70e-75f8e5004d8f@denx.de>
Date: Wed, 15 May 2024 08:31:13 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] dt-bindings: display: synopsys,dw-hdmi: Document
 ddc-i2c-bus in core
To: devicetree@vger.kernel.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 markyao0591@gmail.com
References: <20240515062753.111746-1-marex@denx.de>
Content-Language: en-US
In-Reply-To: <20240515062753.111746-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 5/15/24 8:27 AM, Marek Vasut wrote:
> The DW HDMI driver core is responsible for parsing the 'ddc-i2c-bus' property,
> move the property description into the DW HDMI common DT schema too, so this
> property can be used on all devices integrating the DW HDMI core.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

+CC Mark

> ---
> V2: Update rockchip,dw-hdmi.yaml as well
> ---
>   .../bindings/display/bridge/synopsys,dw-hdmi.yaml         | 8 ++++++++
>   .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml    | 8 --------
>   .../bindings/display/rockchip/rockchip,dw-hdmi.yaml       | 8 --------
>   3 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> index 4b7e54a8f037f..828709a8ded26 100644
> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -45,6 +45,14 @@ properties:
>         - const: isfr
>       additionalItems: true
>   
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The HDMI DDC bus can be connected to either a system I2C master or the
> +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> +      to a system I2C master this property contains a phandle to that I2C
> +      master controller.
> +
>     interrupts:
>       maxItems: 1
>   
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> index 7979cf07f1199..180c4b510fb12 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> @@ -31,14 +31,6 @@ properties:
>     clock-names:
>       maxItems: 2
>   
> -  ddc-i2c-bus:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      The HDMI DDC bus can be connected to either a system I2C master or the
> -      functionally-reduced I2C master contained in the DWC HDMI. When connected
> -      to a system I2C master this property contains a phandle to that I2C
> -      master controller.
> -
>     gpr:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description:
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> index 2aac62219ff64..9d096856a79a6 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -70,14 +70,6 @@ properties:
>             - vpll
>             - ref
>   
> -  ddc-i2c-bus:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      The HDMI DDC bus can be connected to either a system I2C master or the
> -      functionally-reduced I2C master contained in the DWC HDMI. When connected
> -      to a system I2C master this property contains a phandle to that I2C
> -      master controller.
> -
>     phys:
>       maxItems: 1
>       description: The HDMI PHY
