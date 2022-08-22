Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E27EC
	for <imx@lists.linux.dev>; Mon, 22 Aug 2022 08:51:53 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gt3so7336090ejb.12
        for <imx@lists.linux.dev>; Mon, 22 Aug 2022 01:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=F9wABGPJepecNKwit4UZt+CWAiTGn1tZ03tvvlqXGJg=;
        b=mKZT6I2wMsaNwXM5/0bJ7rowcsGG9xiomgEsajUzkHsT7HcuOj9E+1YMCAIhBQPj1O
         w4zLYYxnBcsQ0vJoY3mLCU/KInwP8wcxCYKPmLi13WXAb3tvuImFly+DCPTD+cNvw0uT
         zuIRk5myyhfAIvNTx8YkGARd0UF4FfcbBXBKiipX3NdjbbM0TBL+uxyYnBR+xkMlopt7
         II2FC1IAGUnmoGjJz+vC6jmqCNVu5QAdhUIoA6Ia713KHJg114QhtT5CL5IrdlJj/+3D
         PthbNSqQ3WwME1t32WSntsUJD23td/3o+5ycyLAUf2zLKEI4PBhm+xluk8s9Npon+yto
         zS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=F9wABGPJepecNKwit4UZt+CWAiTGn1tZ03tvvlqXGJg=;
        b=qnzdp95W1gNVBNAhtRhDuLpRCEPAlqb1G7rNuFeRV0SaXFcYPeSZ0ORpW8zcIFFgHn
         eohzBNfvKvs70VgGKRsyQyfXpgOLVUFI7TH2HSBRLNwQ+Ob0wgiN/FHn0TpJRJdcUXP8
         KnzDf2kSzK4vJRBG0H1189CQQmpY1uRd0Ke5D64vSbXtr0BGOxFxlwOxFwMyn7lW7MfK
         X6blwVIk6D6quvMZBcZNEUyfCp3L19lo/ftx421iPSIANX/g2gKsaz83N3yrbV8vOLQt
         O6GXbGAVmoswkFf+/xGfTt7WcWEkqGbZJhbXjrX9NZn37Km1/JGJz+okqPmQYgjU0hQe
         6DuQ==
X-Gm-Message-State: ACgBeo2oKLUcDUO+UQ8WSplpeBCzZ0+DCaBmPCmrQF/S1jFH1dvfC7mc
	iG6ZfR0IAQU4Xb1qNU+oY3LtBeDLL7cFu9makVOv3A==
X-Google-Smtp-Source: AA6agR48fYE55tzDtAC6ibWU/joRibr0uHd0eKN9AvtNXWBFXk4FEax2+UisAqGiMzu7o0I7SacdqzKwZo2px46sLKI=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr4069144ejc.440.1661158311511; Mon, 22
 Aug 2022 01:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220812133012.7283-1-shenwei.wang@nxp.com>
In-Reply-To: <20220812133012.7283-1-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Aug 2022 10:51:40 +0200
Message-ID: <CACRpkdaPPpsm+0dzD5V_HtZfiHbBCvzEP73PUmJ4cEYT18g+-A@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add IMX8 SCU GPIO support
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 12, 2022 at 3:30 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> Changes in V5:
>  - rename the file name from fsl,imx-sc-gpio to fsl,imx8qxp-sc-gpio
>    to match the compatible string

v5 looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
