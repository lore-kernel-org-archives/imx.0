Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C5A2942A
	for <imx@lists.linux.dev>; Thu, 16 Nov 2023 19:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5869914484fso616396eaf.0
        for <imx@lists.linux.dev>; Thu, 16 Nov 2023 11:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700163029; x=1700767829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7FbFMZyOm4y21zxxd4fG3rlnBc8F2We8GtC4w2SS1w=;
        b=NNWJTrZgwgr5b1jGKdh75FfwNaqv8E6QUrOr4YmUb1TeCD9dbPQqD5uCRK8fGDfG7F
         XTtEQbrRot356658z9QnuwSWYOcQUggbT/iJxPm71Sv5NLG0Be5eLAsXWvvKTX28qyos
         cQCGOfxOqQ1/UkvLEjZjBijPx95Lc7AYWtVA9By22hU1/k+Y4MwyIaERTJkTP17DzIPY
         RvG/TJwkVjfk5+Q3HyJX6qei24JYx+U/MsOTzUrh6X0O0EMHMvWf84sdxv+tOBQhWhP+
         0VGS0JUnEgXJnp9pUx3LAQ9s0Zy3jwc3nkGe+Z85oWlgN4yjmL02RtCFWpwXl80Zt39F
         t7OA==
X-Gm-Message-State: AOJu0YzvrVJ0Yk+dTAzEtMwY2UuNHNLywZ/Qi4gg3q7hjcZXN3664JQb
	SKXOHN3oZ3lYszh0PSIBLA==
X-Google-Smtp-Source: AGHT+IFSp1f7TbpivIjIY//huUNmDslsDMxVBCti4nc7OSLQ6yL118JR1HPflrHOkpP+ls1MaiRwBw==
X-Received: by 2002:a4a:85c1:0:b0:57b:eee7:4a40 with SMTP id u1-20020a4a85c1000000b0057beee74a40mr15895111ooh.7.1700163029011;
        Thu, 16 Nov 2023 11:30:29 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ch1-20020a0568200a0100b00584078d1e17sm10580oob.45.2023.11.16.11.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 11:30:28 -0800 (PST)
Received: (nullmailer pid 3079204 invoked by uid 1000);
	Thu, 16 Nov 2023 19:30:26 -0000
Date: Thu, 16 Nov 2023 13:30:26 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org, joy.zou@nxp.com, shenwei.wang@nxp.com, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, festevam@denx.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org, peng.fan@nxp.com, shawnguo@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: dma: fsl-edma: Add fsl-edma.h to
 prevent hardcoding in dts
Message-ID: <170016302591.3079151.39706037865284534.robh@kernel.org>
References: <20231114154824.3617255-1-Frank.Li@nxp.com>
 <20231114154824.3617255-3-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114154824.3617255-3-Frank.Li@nxp.com>


On Tue, 14 Nov 2023 10:48:22 -0500, Frank Li wrote:
> Introduce a common dt-bindings header file, fsl-edma.h, shared between
> the driver and dts files. This addition aims to eliminate hardcoded values
> in dts files, promoting maintainability and consistency.
> 
> DTS header file not support BIT() macro yet. Directly use 2^n number.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  include/dt-bindings/dma/fsl-edma.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 include/dt-bindings/dma/fsl-edma.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

