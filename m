Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBAF1119B
	for <imx@lists.linux.dev>; Sun,  7 Jan 2024 03:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hr9Li6q8"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6dc018228b4so580393a34.0
        for <imx@lists.linux.dev>; Sat, 06 Jan 2024 19:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704597777; x=1705202577; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZIgdoPCMR+IJzRuNyLi5sJHouzirHwH/wc+njy54058=;
        b=Hr9Li6q8czkAH7HfnJnszEI9VxR13K1s7G9S+6Y7X8qWoc54DheoCAWT9yWmOmBvAQ
         pozevisYLNvF7bY500ZMEjuLjrjLo1XHgUpvSsaPwUzbODoPXdUtdkcKj5+0zwuAX+5f
         /BjCDEfofCF/SEGwC1pSM1XrhTP8bmIplnjjvfvzMIdCWzQRWW+LACvrsblFrxC+3/zd
         baNSFdT8KGi/p9rWj0vti89uzNYoIoGUpQoFFS1Oa/cFlwzG3P+HifP7mGYKMWPC0tib
         c1G6n7o/xK7zJNDSomz4bchbrWSsLMsPdSFyrT4cjgwnTi36ou2AwOHkVNSBliCVk3wK
         jQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704597777; x=1705202577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIgdoPCMR+IJzRuNyLi5sJHouzirHwH/wc+njy54058=;
        b=h+RADkPp8Z9NNPb56M/W+4LO8Z/XbiM9RnLINYovVzZWnDQlNfsp7xXh9QLMY62LnJ
         4LprH6g2yYLp61EH9pIHHJE5q2GP2BPB7pdOa08LZLlNAZ7Yn8x5PEEnI6i8RYQAg17t
         4/HA0EV0HSH+WfpybZz4JrVuYBRGe615V0Wcc0uUxWKEsRo6HSAYNdeFjc4LC58OfH6i
         UDPl5v/q7m6eWZeAR3LV8OEckMdWi77Ci2NrdaOLkLbbcsbHSFZKk/vkbNUjMBOYLmbH
         c35UtU1jXm7vjyLeB2jB1XKgf2/RRy0sN/Es8OnUlXDArmYmREk8tE0jZ0N0BLRquApa
         ZpdA==
X-Gm-Message-State: AOJu0Yyw66ccTzilrGjseqx5Wto0UOJrOx8FVwdfmWEnCRrZoznI+JGK
	1b5gclsM2y0wGY0G9SgNa4GGt0qaSfXJ
X-Google-Smtp-Source: AGHT+IGAXgmBcYgN21344z3oOE0XiMGvh81COK2jDEQmYLpG/eNaQc5M+YRYlk5YHUYhAXu4plGZ/g==
X-Received: by 2002:a05:6870:1b07:b0:206:b2a:78be with SMTP id hl7-20020a0568701b0700b002060b2a78bemr1655818oab.105.1704597777369;
        Sat, 06 Jan 2024 19:22:57 -0800 (PST)
Received: from thinkpad ([103.197.115.97])
        by smtp.gmail.com with ESMTPSA id c5-20020a63ef45000000b005cda7a1d72dsm3839469pgk.74.2024.01.06.19.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 19:22:56 -0800 (PST)
Date: Sun, 7 Jan 2024 08:52:48 +0530
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
Subject: Re: [PATCH v7 05/16] PCI: imx6: Using "linux,pci-domain" as slot ID
Message-ID: <20240107032248.GD3416@thinkpad>
References: <20231227182727.1747435-1-Frank.Li@nxp.com>
 <20231227182727.1747435-6-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227182727.1747435-6-Frank.Li@nxp.com>

On Wed, Dec 27, 2023 at 01:27:16PM -0500, Frank Li wrote:
> Avoid use get slot id by compared with register physical address. If there
> are more than 2 slots, compared logic will become complex.
> 
> "linux,pci-domain" already exist at dts since commit:
> 	commit (c0b70f05c87f3b arm64: dts: imx8mq: use_dt_domains for pci node).
> 
> So it is safe to remove compare basic address code:
> 	...
> 	if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
> 		imx6_pcie->controller_id = 1;
> 	...
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

One comment below. With that fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> 
> Notes:
>     Change from v3 to v4
>     - remove compare basic address logic
>     Change from v2 to v3
>     - none
>     Change from v1 to v2
>     - fix of_get_pci_domain_nr return value check logic
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 294f61a9c6fd9..332c392f8e5bc 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -33,6 +33,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  
> +#include "../../pci.h"
>  #include "pcie-designware.h"
>  
>  #define IMX8MQ_GPR_PCIE_REF_USE_PAD		BIT(9)
> @@ -40,7 +41,6 @@
>  #define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
>  #define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
>  #define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11, 8)
> -#define IMX8MQ_PCIE2_BASE_ADDR			0x33c00000
>  
>  #define to_imx6_pcie(x)	dev_get_drvdata((x)->dev)
>  
> @@ -1279,13 +1279,14 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  					     "Failed to get PCIEPHY reset control\n");
>  	}
>  
> -	switch (imx6_pcie->drvdata->variant) {
> -	case IMX7D:
> -		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
> -			imx6_pcie->controller_id = 1;
> -	default:
> -		break;
> -	}
> +	/* Using linux,pci-domain as PCI slot id */
> +	imx6_pcie->controller_id = of_get_pci_domain_nr(node);
> +	/* If there are not "linux,pci-domain" in dts file, means only 1 controller */

"If there are no "linux,pci-domain" property specified in DT, then assume only
one controller is available."

- Mani

> +	if (imx6_pcie->controller_id == -EINVAL)
> +		imx6_pcie->controller_id = 0;
> +	else if (imx6_pcie->controller_id < 0)
> +		return dev_err_probe(dev, imx6_pcie->controller_id,
> +				     "linux,pci-domain have wrong value\n");
>  
>  	/* Grab turnoff reset */
>  	imx6_pcie->turnoff_reset = devm_reset_control_get_optional_exclusive(dev, "turnoff");
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
