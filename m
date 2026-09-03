Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19A038B7DC
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456613; cv=none; b=JX9ovpH0ge+KftlddnBd9FlWDDpA5CSacMfQcHNx2p+VII3Cc4GfZzqsA9uuhgIclEVM+Oy0wA4Jmj+y6u3zHB/Qi+5YsiilMpp8I50daFIoVkGpQG9NYifCSRSBXHKi7nb5zvCWVcDKBL5dlez4aZWhvLulXFJ8sqBeRRvGOHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456613; c=relaxed/simple;
	bh=kqRN0KkwKLzlSD27WEYVj3mqo9lQk4t/pj6M2HD1yFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ka0bMVBzQTw0t4BNsHR8Tp11G3T8u8S8KoWc0V7PnGX/1cy+YZwqjGxUNwkhqA1DVvbafJkWuEGSkC03yvUr0GAuJwmKXXCcy03C0RfpkLoMmG0QJSx0eI6r2/9oGWaVUHGrbl3ukEiAxCgfcLoxwC+rbfCBZhOb3MLAWEX/bC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MPcndcK8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MPcndcK8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso615305ad.3
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788456610; x=1789061410; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oBzdii0EUHFGQFKd8zeKRUm0f/svlYti0FerJr5HoZQ=;
        b=MPcndcK8atxkIVUl7o2Mjx8B1p/Fjj6dv87iK9cYE6U50mBbqrfjMBqsK+dEbRv6Xf
         i/IzrNkw8BlAOpkPh20YAjXkiEd/qgjsTRT/D3Z/gYdirFjflrlG4W8rB+/VTnuIrSoM
         WFpGWs2YoIeHq1VNUzt3ZFLGv0pPX4CY1z+2gTtNKdJgiB5FkQAWVpM7DyXElNjyIoLn
         biTP5tg6mq0BV9FDuhKHIcHWIP6XAK+oYWUVDrBbvhEMM9J+jLihNJvhkSFXpbDHxVJf
         UWflTBldEKI5kyb+d/qrCPPqzlz+VcF62+aOeZNrY3bre+d2jUyfMrmCkmEJSz7yBTQl
         h0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456610; x=1789061410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBzdii0EUHFGQFKd8zeKRUm0f/svlYti0FerJr5HoZQ=;
        b=HQanrv/bl0g3OuZEaQJ5Gq1qfkFQK920p5C/E5HZDRJbCVFZbxndMrjGjCeoZS3YuQ
         2GnhApKtISjQJoqNxSALkktRNXyOQ268YieUcuDFcYNpl1JQ65EbeXj07Da3arMTOoAV
         e0ylXClhMFa7ybonzv5+qQ5Facye3yI33/I21qBarE6QeAoY9iB59RNyjAPBZMlS8Bz0
         4liPsfrHjozSdw7GPqIfMh8CkJkA1A5IdTb14JPg6vYWWVeW0hWdb9By0xSqqGmyZMOQ
         CpejBE0TX3mE94RhWQxOj5JPiSxkCVh86EJQ4D/vp2cjAdtivtV88Y5ofVNWWH+37xPj
         paAw==
X-Forwarded-Encrypted: i=1; AKwUvBzBAzDBN/1erroqCqAT3gEVj1oesRVht4fg61+5bpCiZx+xQAdsf23I3Sel/1imbaMK8Mw=@lists.linux.dev
X-Gm-Message-State: AFuF++nlDJs5M4CjsSC3GI32KFGfmsDLlCZQjzi/tJfd5GqmZ3MY1Ki1
	ymdkKKLKIwI04QygoU/JdyIzAB9EFiy78qXF6/ZlbBc2NfWjZZhjY57rNQFTWGN1BHs=
X-Gm-Gg: AYBFou0Dh9SUetNsSRfjG5gUWG/CHcXSRejcl/ath3koFgmmnMxWB/wbTd2RjysLhdk
	OMfmteUxUKcm+aVSHA0zx6v2bboxLRbNbbJmicujIJYQ/9spBS8cmZl8jl+qGEQk4Ngq7g7LsQ+
	YmU4f3DVUQZw/jpIUe9d6+LlR+3xfjKpXnp3ffCp4xQV87I5i0/Sh+JXDMHOvSCQjUPUE9zNuxv
	AejXc9BdS1E9x1Rw3Bfz06BcOirm3NUsq0Cc1rOyT2p4uQT2ncKiu6KrDB1/EajWGfC0bbilB3e
	rU0UPqbn1iz1NVYBiCKIjIRY94tfaXLsxRFh2gA+GHA+oAMOjfClIQW4tk4hFfSYxyFdmYu6VWs
	JkSVwWV5jP7ZA6uY+DWuqaIFea8LioU7Gtw4YS87vEagTCABo9dwKb+jwDpSmpCWxV8vIx6vv70
	3v8SE8DCsNhLgQy0iWzmCd/iylQTceNiUS9VNmZTYkpvYYtWOC+Gl64jb2wgyHr0LKtKPobQfI4
	nE=
X-Received: by 2002:a17:903:3848:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2db125f00c7mr7573775ad.13.1788456608541;
        Thu, 03 Sep 2026 10:30:08 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafed70184sm13249205ad.75.2026.09.03.10.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:30:07 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:30:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>,
	viresh.kumar@linaro.org
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <apmunD8bkKOu5_Vm@p14s>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>

Krzysztof and Rob - I'm seeking your advice on the best way to define bindings
for this use case.

Here is some background:

The transport mechanic between the kernel and remote processors can take
different forms.  As of this writing we have 'glink' and 'virtio'.  The protocol
that runs on top of the transport mechanic is RPMSG.  All this is already
implemented and stable.

In this use case, we have GPIO controllers connected to the remote processor and
we want to make them available to the kernel.  We also want to use the existing
virtio-gpio protocol on top of RPMSG, allowing the kernel to interface with the
GPIO controllers as if they were virtio-gpios.  This patchset is about providing
a driver that will enact the virtio-gpio procotol on top of the mechanic used
between the kernel and remote processor.

Shenwei has proposed some bindings (below).  I think they can be improved to
take into account the transport mechanic and be closer to what virtio-gpio
currently does.  I'm proposing something like this:

                        $(transport) {
                                compatible = "$(transport),rpmsg";
                                #address-cells = <1>;
                                #size-cells = <0>;

                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <3>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <4>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                        }

A complete example with a virtio transport mechanic would look like:

m4_rproc: m4@10000000 {
                        compatible = "st,stm32mp1-m4";
                        reg = <0x10000000 0x40000>,
                              <0x30000000 0x40000>,
                              <0x38000000 0x10000>;
                        resets = <&rcc MCU_R>;
                        reset-names = "mcu_rst";
                        st,syscfg-holdboot = <&rcc 0x10C 0x1>;
                        st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
                        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
                        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
                        status = "disabled";

                        virtio {
                                compatible = "virtio,rpmsg";
                                #address-cells = <1>;
                                #size-cells = <0>;

                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <3>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <4>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                        }   
                };  
        };

Let me know what you think.

Thanks,
Mathieu


On Tue, Jul 21, 2026 at 03:46:45PM -0500, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
> 
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
> 
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..41eb2e149942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic RPMSG GPIO Controller
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote processor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
> +  structure and communication flow between Linux and the remote firmware. Those
> +  controllers are managed via this transport protocol. For more details of the
> +  protocol, check the document below.
> +  Documentation/driver-api/gpio/gpio-rpmsg.rst
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio
> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio
> +
> +  reg:
> +    description:
> +      The reg property represents the index of the GPIO controllers. Since
> +      the driver manages controllers on a remote system, this index tells
> +      the remote system which controller to operate.
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..b9b559b186af 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -88,6 +88,34 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Represents the RPMSG bus between Linux and the remote system. Contains
> +      a group of RPMSG channel devices running on the bus.
> +
> +    properties:
> +      rpmsg-io:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "^gpio@[0-9a-f]+$":
> +            type: object
> +            $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>  
> @@ -150,5 +178,30 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +
> +          gpio@1 {
> +            compatible = "rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +        };
> +      };
>      };
>  ...
> -- 
> 2.43.0
> 
