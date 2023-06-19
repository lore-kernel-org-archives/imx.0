Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C6A23D6
	for <imx@lists.linux.dev>; Mon, 19 Jun 2023 06:20:07 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-970028cfb6cso519826666b.1
        for <imx@lists.linux.dev>; Sun, 18 Jun 2023 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687155605; x=1689747605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tafC9rtGrSbEBkVw2li93WM31ICKV4+FzfLVdlGKanI=;
        b=dPEJ0tP8ft0H1Y6IrgmhNyLHFA1WvqVZZG2hYBY7kuva657ir8JkP6vqC/C9nwAVCr
         2BJcmm2GievWjQTyduZNEQyQZvatFFvbf4OkaDsQsZncjQHYYLWLP1lgEZ3i6UyTR+Qz
         1+utCCTUDG5bmyerBPsygBCq8rmhpPSUz3eS5mD+6G8KDzT9SLjcp/38qq4QICgXJi0s
         8o+rISB6M3mb94t3/KNO2RhguHp6fhm4tC8xy2H1rIQe1IvpSU19WGuXGYCQWfmQr1Yg
         WbvHrJfAgH/LYasW+hiBJcdPhcUd1O7CQjPxpUg63AAJvaF478FC5Omeje4yFDXs7kUT
         jkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687155605; x=1689747605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tafC9rtGrSbEBkVw2li93WM31ICKV4+FzfLVdlGKanI=;
        b=SH7sQGePfoNzhabY6J0C2a+r24a53/FpmwQxRyGXm4VkaHZ9isLuodFTUqMq0+kq6k
         e627yNhLrsjxU/AhBbkWEzMZ9uh10Vn1EzYhBSjPVOjjJ8whSWS579ylV1tLf5obOTpV
         +ZQc0DzegP4jbAwsnvt30CujTe8mBbs2gHbS3QR2pyi+XrX+iOjrSOarYXZPcKJkGcn/
         qgrbybmnHQcfQw1BXYiyxxB+sHQ2KgV3Sp5JAjs2DKeVWsF6GAKzxKoc4Dj3jdLTLPIc
         Lq8cb/KQFUJC4EI5rjE0NXWUxrfOYgG3szG9zY7RE1MyqBoteJQJe8WLMIFLi8dETB6I
         Q5cw==
X-Gm-Message-State: AC+VfDx5pK3ls+ImLffdkf37fxoc8yLulJtr+SZ6EFlt0X2fREAXWPqC
	4kx8Jwa6E/lFvPyN9GN1rymznw==
X-Google-Smtp-Source: ACHHUZ6KehvgKkuQMI/k2qKPJ3Tw3gEZpAtv5I2vo/yLXgO7Ks+E178QWppZ+XoZnpUgK2+2/GnRCA==
X-Received: by 2002:a17:907:9810:b0:96f:bcea:df87 with SMTP id ji16-20020a170907981000b0096fbceadf87mr9153893ejc.42.1687155605700;
        Sun, 18 Jun 2023 23:20:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k9-20020a170906128900b00965ffb8407asm14088745ejb.87.2023.06.18.23.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 23:20:05 -0700 (PDT)
Message-ID: <9463188f-b176-c41c-8512-b0255eab27a6@linaro.org>
Date: Mon, 19 Jun 2023 08:20:03 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 12/12] dt-bindings: fsl-dma: fsl-edma: add edma3
 compatible string
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 imx@lists.linux.dev, joy.zou@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, peng.fan@nxp.com, robh+dt@kernel.org,
 shenwei.wang@nxp.com, vkoul@kernel.org
References: <20230618180925.2350169-1-Frank.Li@nxp.com>
 <20230618180925.2350169-13-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230618180925.2350169-13-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2023 20:09, Frank Li wrote:
> Extend Freescale eDMA driver bindings to support eDMA3 IP blocks in
> i.MX8QM and i.MX8QXP SoCs. In i.MX93, both eDMA3 and eDMA4 are now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

