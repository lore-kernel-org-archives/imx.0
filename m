Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0F914884C;
	Fri, 17 Jul 2026 18:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784313938; cv=none; b=dVeN2CF1mm+3k5ZDNu4h46H8NGOM1ucCih2tHMA7NwIS6MfpCyg2GytlXpLIS8Cx7LT7UNctrZqB2XBzlyw/L51/ZkfXCp51VlDJus6kMvD3FgIpj3KNXmC8O8AU9zOsLqMGgH5XRL4rRpXToYwaX0Gju2fNuI7NYsVcz83F32M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784313938; c=relaxed/simple;
	bh=+9m8njqm0EAQRGljyZMRrTl6U/ftUawIM/b8RNOtePQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+s11nP0rFe5enDJo1kcFxfOcpthZAYp/nBmaIYXrykmxrNxRMDFJV3deq0QYhhX2xgcrCctyR34uCyc0i76Nb3MyaNRDIfgzvkbI2lieWGO3IJ9jp2f/vScrUA7X5eRq0NdUCXP0cMkpZOfL8XgROCtiO6g2e/HChIiCrXWQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1fKXYJh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1fKXYJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D1B1F00A3A;
	Fri, 17 Jul 2026 18:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784313937;
	bh=7e5kgtc2YZSO5D03srWrdyaym5Iq/tfMaY+RIMQ8Ask=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B1fKXYJh2h7Ct2/5ML0oO16NwxLPg/4YRE4YHOue1OIZylWuNWnUszWCEoEOaAXoP
	 4HlIqSo5hETN9YBZY48ZcnmuXi5WVyQrJp7jFO+tL7UAmpw/i4mFysLaQXsW8zif1x
	 +RqtsbyH5fy9gDDKfVDNokAXATV+aMfYebYpIkZ7XXKawQ1AXjmmF3jRniGLIs3cOf
	 vf8Ybp/wUvDhMxANd9b42G9fuLAjLXd+fxy4N9PQBcvZR5uGRGkVTe7CnUbCo8ZgT+
	 xoqv+kcYqWru71TvPJPdAJEi6TK12MO/1+2nD0MLv7FRpF4cgufm6hQbSDH1ChnnHF
	 Pc/KIgt9oxttg==
Date: Fri, 17 Jul 2026 13:45:36 -0500
From: Rob Herring <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/4] dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18 as
 child node
Message-ID: <20260717184536.GA1805255-robh@kernel.org>
References: <20260708-arm_dts_ldb-v1-0-4f5579b85797@nxp.com>
 <20260708-arm_dts_ldb-v1-2-4f5579b85797@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-arm_dts_ldb-v1-2-4f5579b85797@nxp.com>

On Wed, Jul 08, 2026 at 04:29:03PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The legacy i.MX6SX (>15 year) SoC imx-iomuxc-gpr contains one LDB_CTRL
> register. Allow the LVDS Display Bridge(LDB) child node under
> imx-iomuxc-gpr.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> index 721a67e84c137..c3b942bbcd6da 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> @@ -47,10 +47,21 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
>    mux-controller:
>      type: object
>      $ref: /schemas/mux/reg-mux.yaml
>  
> +  bridge@18:
> +    type: object
> +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> +    unevaluatedProperties: false
> +
>  patternProperties:
>    "^ipu[12]_csi[01]_mux$":
>      type: object
> @@ -67,6 +78,18 @@ allOf:
>        patternProperties:
>          '^ipu[12]_csi[01]_mux$': false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: fsl,imx6sx-iomuxc-gpr
> +    then:
> +      properties:
> +        bridge@18: false
> +        '#address-cells': false
> +        '#size-cells': false
> +
>  additionalProperties: false
>  
>  required:
> @@ -87,4 +110,40 @@ examples:
>          };
>      };
>  
> +  - |
> +    #include <dt-bindings/clock/imx6sx-clock.h>
> +
> +    syscon@20e4000 {
> +        compatible = "fsl,imx6sx-iomuxc-gpr", "fsl,imx6q-iomuxc-gpr", "syscon", "simple-mfd";
> +        reg = <0x020e4000 0x4000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        bridge@18 {
> +            compatible = "fsl,imx6sx-ldb";
> +            reg = <0x18 0x4>;
> +            clocks = <&clks IMX6SX_CLK_LDB_DI0>;
> +            clock-names = "ldb";
> +            status = "disabled";

Examples should be enabled. Drop.

> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    endpoint {
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    endpoint {
> +                    };
> +                };
> +            };
> +        };
> +    };
>  ...
> 
> -- 
> 2.43.0
> 
