Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CA32102
	for <imx@lists.linux.dev>; Mon, 27 Mar 2023 13:12:46 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so1329211otd.3
        for <imx@lists.linux.dev>; Mon, 27 Mar 2023 06:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679922765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy+LGO1hZYQteOYXAi2MTuV8EwkfENi7/3mKtvfcWcM=;
        b=teAnjiBjOh3H8FrR9TwAScOrlovY6l4IL+/WZ+YNSwgUExgKBsKqD7F/mvVdraVm3+
         YHiMUJ49N81nE7BuMxbBrjE0wMMpU5dKI+8pGXMJ5dqvVYq3Kxl6IbqjrOc34g2wUV4r
         EIo+uf3AAWLj2WoxKEwuxyd4B/JCwWtP4kJAAufDWRH87TmscbDug8TWUg94MFCg19i5
         eNaGZ3+vnmJBylJIcjJ5eRa5Rw2k7XcV29QoDLdOT0AvyFms1tqcA3aKfzm5eL8RUsV3
         kJOADKT41ZTEey8tGjUKhbQCuy6GhgVkBzERnq2UkoBVLTtJuHDuOcUIawgwOXrmr2PA
         0Pxg==
X-Gm-Message-State: AO0yUKW8DbB710LyWixq5CNqQ2mOG/8W/avEjhO4+TXmG9mhgy9XaeXs
	Pn6elOMmIEhRUhywQf486Q==
X-Google-Smtp-Source: AK7set+my+8Ru1KWMv/XxGqRnLq6lS4KUJdHjR1C70GN6oF7hoORRk1bGIe0330UCVf/M435x7q+3A==
X-Received: by 2002:a05:6830:1606:b0:69f:9d13:5692 with SMTP id g6-20020a056830160600b0069f9d135692mr5844838otr.23.1679922765239;
        Mon, 27 Mar 2023 06:12:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b12-20020a9d6b8c000000b0069fa7b738b3sm5419345otq.27.2023.03.27.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:12:44 -0700 (PDT)
Received: (nullmailer pid 3279071 invoked by uid 1000);
	Mon, 27 Mar 2023 13:12:43 -0000
Date: Mon, 27 Mar 2023 08:12:43 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: cdns-imx8qm: add imx8qm cdns3
 glue layer
Message-ID: <20230327131243.GA3238130-robh@kernel.org>
References: <20230323163116.2921999-1-Frank.Li@nxp.com>
 <20230323163116.2921999-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323163116.2921999-2-Frank.Li@nxp.com>

On Thu, Mar 23, 2023 at 12:31:14PM -0400, Frank Li wrote:
> NXP imx8qm integrates 1 cdns3 IP. This is glue layer device bindings.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v3 to v4
> - Drop all clock-assign
> 
> Change from v2 to v3
> - Drop two fixed frequency clocks, it is system reset value, no need set now.
> If need, futher work/discuss on driver or dts change. It will not block this
> basic enablement work.
> - Drop lable
> - Drop some descriptions
> - Reg as second property.
> 
> Change from v1 to v2.
> - new add binding doc
> 
>  .../bindings/usb/fsl,imx8qm-cdns3.yaml        | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/fsl,imx8qm-cdns3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8qm-cdns3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8qm-cdns3.yaml
> new file mode 100644
> index 000000000000..654d8704aa6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/fsl,imx8qm-cdns3.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/fsl,imx8qm-cdns3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP iMX8QM Soc USB Controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8qm-usb3
> +
> +  reg:
> +    items:
> +      - description: Register set for iMX USB3 Platform Control
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  ranges: true
> +
> +  clocks:
> +    items:
> +      - description: Standby clock. Used during ultra low power states.
> +      - description: USB bus clock for usb3 controller.
> +      - description: AXI clock for AXI interface.
> +      - description: ipg clock for register access.
> +      - description: Core clock for usb3 controller.
> +
> +  clock-names:
> +    items:
> +      - const: usb3_lpm_clk
> +      - const: usb3_bus_clk
> +      - const: usb3_aclk
> +      - const: usb3_ipg_clk
> +      - const: usb3_core_pclk

lpm, bus, aclk, ipg, core (or core_pclk) are sufficient.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +# Required child node:
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    $ref: cdns,usb3.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@5b110000 {
> +      compatible = "fsl,imx8qm-usb3";
> +      reg = <0x5b110000 0x10000>;
> +      ranges;
> +      clocks = <&usb3_lpcg IMX_LPCG_CLK_1>,
> +               <&usb3_lpcg IMX_LPCG_CLK_0>,
> +               <&usb3_lpcg IMX_LPCG_CLK_7>,
> +               <&usb3_lpcg IMX_LPCG_CLK_4>,
> +               <&usb3_lpcg IMX_LPCG_CLK_5>;
> +      clock-names = "usb3_lpm_clk", "usb3_bus_clk", "usb3_aclk",
> +                    "usb3_ipg_clk", "usb3_core_pclk";
> +      assigned-clocks = <&clk IMX_SC_R_USB_2 IMX_SC_PM_CLK_MST_BUS>;
> +      assigned-clock-rates = <250000000>;
> +      power-domains = <&pd IMX_SC_R_USB_2>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      usb@5b120000 {
> +        compatible = "cdns,usb3";
> +        reg = <0x5b120000 0x10000>,   /* memory area for OTG/DRD registers */
> +              <0x5b130000 0x10000>,   /* memory area for HOST registers */
> +              <0x5b140000 0x10000>;   /* memory area for DEVICE registers */
> +        reg-names = "otg", "xhci", "dev";
> +        interrupt-parent = <&gic>;
> +        interrupts = <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "host", "peripheral", "otg", "wakeup";
> +        phys = <&usb3_phy>;
> +        phy-names = "cdns3,usb3-phy";
> +      };
> +    };
> -- 
> 2.34.1
> 
