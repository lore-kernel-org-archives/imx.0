Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3244E11187
	for <imx@lists.linux.dev>; Sun,  7 Jan 2024 03:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1JftG2f"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-595aa5b1fe0so614421eaf.2
        for <imx@lists.linux.dev>; Sat, 06 Jan 2024 19:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704597314; x=1705202114; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTSKHlVmMubC5kEPp4TOeWLAyI0E8w+0FU0X7VBdSK8=;
        b=P1JftG2f5WwFKF/E/fi3H3yhEyNaSCscdJRbgE/cuL+mibVeMssRkxLqzY0ugmvOCK
         QT6LlV91z4Zf/ztaC0DGIytQMugF8YMu4wGGi7cQKpH4q67x0Il88jBPcLY/Ptued5gs
         Mi59tzZASWaAjb9kRESl0KLgN0rEJnH5FF4wLNyQ9ZuE3dkLLHkvNPAuKTJDpj72oRJU
         MKAU5KcQb9zjZVnMaj7UccNcui29BgT4diY1E6/GjZkzNSjprSdpC4aIN0urh04AT8eR
         Mr2OsgFmGAwIvG8k6aV9aeYtoWb7tMj59CPzzN2xocdujw1Fxv+vJnUIp3ytST1ESm1o
         bp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704597314; x=1705202114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTSKHlVmMubC5kEPp4TOeWLAyI0E8w+0FU0X7VBdSK8=;
        b=ppRDBrnXDOI7Cb3Qao+KC4NCEvapNddp4z8znCIfMPQ8JY/NzZM62Za/geswkvAuD6
         tTXVvwM/M7DjmIjfHWCcA/JZekqCVNjRhtjxZP6cXwCUoINBAhbM03OFzOES5ih6wwOV
         HgVBs34nUWgYTf3Dv7BI2V8QqK4LZQ0LSEhRyidpZOfdB2qLra/cOt84C0oVeB5VX/G4
         lolApYTe9qDn2viocqZvVh8W/VmVBf9PpZzrAEmJOLkmbTmc1YIBvStxw2sakfND0AEz
         sXnes+wZWxpxUSgLcC3hHROT0GfB79fgRRbNSpNRMQ10thnvsFE9/+NypGMfk8nKA1g+
         rf2A==
X-Gm-Message-State: AOJu0Yxhfyb0YVjMMurrEa0CLDzYdXV/hl1b7GRXw+l9sDVhbnQgM+7c
	76CFd3PD0S1TiOfPp5EG7OtDjjlB0MeJ
X-Google-Smtp-Source: AGHT+IGXkw6IM2mb9M0FTGw/gLZEPmq0TvilhKDKzYZWKSQNDUW24GLr3cdcVThMpJBJvlhJYBFffA==
X-Received: by 2002:a05:6358:7f1d:b0:175:b87:1a3c with SMTP id p29-20020a0563587f1d00b001750b871a3cmr1985625rwn.6.1704597314161;
        Sat, 06 Jan 2024 19:15:14 -0800 (PST)
Received: from thinkpad ([103.197.115.97])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709028c9600b001d4b685f82fsm3716601plo.165.2024.01.06.19.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 19:15:13 -0800 (PST)
Date: Sun, 7 Jan 2024 08:45:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: krzysztof.kozlowski@linaro.org, bhelgaas@google.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	helgaas@kernel.org, hongxing.zhu@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
	kw@linux.com, l.stach@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lpieralisi@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	shawnguo@kernel.org
Subject: Re: [PATCH v7 04/16] dt-bindings: imx6q-pcie: Add linux,pci-domain
 as required for iMX8MQ
Message-ID: <20240107031506.GC3416@thinkpad>
References: <20231227182727.1747435-1-Frank.Li@nxp.com>
 <20231227182727.1747435-5-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227182727.1747435-5-Frank.Li@nxp.com>

On Wed, Dec 27, 2023 at 01:27:15PM -0500, Frank Li wrote:
> iMX8MQ have two pci controllers. Adds "linux,pci-domain" as required
> proptery for iMX8MQ to indicate pci controller index.
> 

property

> This adjustment paves the way for eliminating the hardcoded check on the
> base register for acquiring the controller_id.
> 
> 	...
> 	if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
> 		imx6_pcie->controller_id = 1;
> 	...
> 
> The controller_id is crucial and utilized for certain register bit
> positions. It must align precisely with the controller index in the SoC.
> An auto-incremented ID don't fit this case. The DTS or fuse configurations
> may deactivate specific PCI controllers.
> 

You cannot change the binding for the sake of driver. But you can make this
change in other way. See below...

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v5 to v6
>     - rework commit message to explain why need required and why auto increase
>     id not work
>     
>     Change from v4 to v5
>     - new patch at v5
> 
>  .../bindings/pci/fsl,imx6q-pcie-common.yaml           | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
> index d91b639ae7ae7..8f39b4e6e8491 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
> @@ -265,6 +265,17 @@ allOf:
>              - const: apps
>              - const: turnoff
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mq-pcie
> +              - fsl,imx8mq-pcie-ep

"linux,pci-domain" is a generic property. So you cannot make it required only
for certain SoCs. But you can make it so for all SoCs. This way, the drivers
can also rely on it.

Now, you should get rid of the commit message about driver internals:

> This adjustment paves the way for eliminating the hardcoded check on the
> base register for acquiring the controller_id.
> 
>       ...
>       if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
>               imx6_pcie->controller_id = 1;
>       ...
> 
> The controller_id is crucial and utilized for certain register bit
> positions. It must align precisely with the controller index in the SoC.
> An auto-incremented ID don't fit this case. The DTS or fuse configurations
> may deactivate specific PCI controllers.
> 

- Mani

> +    then:
> +      required:
> +        - linux,pci-domain
> +
>  additionalProperties: true
>  
>  ...
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
