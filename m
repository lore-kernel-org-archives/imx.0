Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E8B7E
	for <imx@lists.linux.dev>; Mon, 15 Aug 2022 09:06:12 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id t5so8799819edc.11
        for <imx@lists.linux.dev>; Mon, 15 Aug 2022 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=44Fl8O7TjbclXQeBVlf9eeR2A/Qg5kDFt4fRh+hjhrE=;
        b=IEgRbmGxJGN4flDsa/Phu7+0pG+lWoyUlmDIQgqzrw7LmZxYepepRA3e4gGM9je5v6
         x6g7jYakBOyv5DjXADfAdk2shSK68hAYjpAzvxTKWzqtMo4H6yf3aywSV9JKagEwZIAh
         7wwobTJ5FoLEpsXhe9QC/rblqS0IQSvuAur3Ex4S3XG+hoFDv7tY8hp1607qR8QVKvG1
         ANfndZsS2RTMckXbbdQvdPS8MacvBsxBL2cJz39bC1D9iXa2rZWLdDaCbEYBpnrCAsNI
         evuSdf7tJ0GQnh+jb6Myw9g4iG68NWUBZolXNYR7nvA/AfjMS7HfKpk/PaZjj5S6DPa7
         Z+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=44Fl8O7TjbclXQeBVlf9eeR2A/Qg5kDFt4fRh+hjhrE=;
        b=Ah+qLtOgu36DOFZdJxb3bUvLfPAQuc7Kzq7IllQ6AvnlQ2YUUvzAhj+AqWBIDxGlGX
         EzzUG6E7nqyT7WFPzOFE7Vd6UW+SBp9IakCEO9YrllNC2xABKcqjKNyD5BLi5pdmuoq2
         CJmKNbtRrdStqvHhUngrKNW0d+3kbChAPCyEP+nJ7r6qi+fhzUuQ/sd7mVpdNOwaisEo
         kDLMDABNFOdNzFQGOK8E4aVUsX87+D3+7qjW7NaQNWPx9KtFNh5dBosj6o9bXHR9rw69
         Tt39OHtyV/Bu/DE9Hh4n4JuLKBw3p1qtnhljBr/g6cwFytFwYvpsxWWI7ZapbyPEzCkY
         OdbQ==
X-Gm-Message-State: ACgBeo2SZkoTn8O0nXdkYYxkv1/hsZw5VgDL81uxjO0RX3sZpgmd8pnP
	GxxmH3Z0aF8Vmu0cmPrLxOUObEORVtv9hGr+45WKDw==
X-Google-Smtp-Source: AA6agR44r30PYJUVzZR0NjpgNUdMjyNkBe9wpD9qBBJNDQRLR8pt744u+pmvMEAbsFZILifQg9yCsfl7NP3jqBwEfWI=
X-Received: by 2002:a05:6402:f02:b0:440:3693:e68d with SMTP id
 i2-20020a0564020f0200b004403693e68dmr13896631eda.29.1660554371336; Mon, 15
 Aug 2022 02:06:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220812133012.7283-1-shenwei.wang@nxp.com> <20220812133012.7283-4-shenwei.wang@nxp.com>
In-Reply-To: <20220812133012.7283-4-shenwei.wang@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Aug 2022 11:06:00 +0200
Message-ID: <CAMRc=MexvX_sZK6RdiAdjNQnvqAU_o_g7pCfUPDORHnQ4PcEMw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] gpio: imx-scu: add imx-scu GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 12, 2022 at 3:31 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> The SCU firmware on i.MX8 platforms provides a set of APIs to
> control the GPIO PINs on the SCU domain. This patch implements the
> standard GPIO driver interface to access those PINs on the
> SCU domain over the SCU APIs.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---

This looks good to me - Krzysztof: do you have any other comments?
Otherwise, I'll pick it up soon.

Bart
