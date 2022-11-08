Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611828F4A
	for <imx@lists.linux.dev>; Tue,  8 Nov 2022 10:25:15 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id f7so21723599edc.6
        for <imx@lists.linux.dev>; Tue, 08 Nov 2022 02:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YT3r2EK/gmP9BrDwDycmHjgxKIl2VpJ1dgBCOQfdNuc=;
        b=vf3ZI0Yz1vmQBrmSJiX9hoo327S/9k3fnLEL46ISscdFEoj462w3M+3jDMDbL/cxZ/
         +pVwQAVGw7xN+OMbtVEYQEhlkXo3DPvnrnH4Jkk9hyFf567HOFQziBFuYEssWCFxGYSP
         WKnmiJjHOG4LpkU6tfnwpaEvhfNTmiGd8bN1HjSPEeLsZU1KjcIkrHCtJOFhjqAyam/n
         wpPJXkiqyaL5hHwML9HQIpPZNQ2fSQBb6cquG0rxmbPrRUho0zl2N7AU1+6f7+/5xnxR
         poyO7KQD+299ert8wyAHw1SksJFblPfM2XOZ4IGUpRVzcrAafqDKZB2/hh2az30B4aEA
         NQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YT3r2EK/gmP9BrDwDycmHjgxKIl2VpJ1dgBCOQfdNuc=;
        b=YAvmaCSu45PjNiKtl/FAFcl/Z2NYEMZhx64iZ5PXFdDZUutae0VhPyj5lSDJq48+BN
         ialhgOIHJ5YF6MQYk4JXMu+wCogZ6G9y1MJUYCstgOLxZHLuKBbMQ+391jZrgJIC1/nc
         s3z0a53ZVlkXK3/QGt5JBHK/SYwacl87nbd1wnvFIM+61qEg/fcbahn1k6IXlsx+OIVi
         JE3n4n6xDNvF1q+f4MVlD2x3oyz5fyHV/+uWg6AUjNFJHTWiwaSZWUeT2ThMUjeMqtLo
         kleExkDMFxNjc9zEqHabd6S8KRvF9fQ/iAUhFL2gyn8h405AJChOdRQcg/sZUs7b8Z+b
         awhQ==
X-Gm-Message-State: ACrzQf16EsB9ueMjXcMUsu9SBuaKECuP49m3lWYE07bWrkTLf+587t1q
	69bTassNLTgieDIlw4dyXu31Q6aiUok6gDENVavC3Q==
X-Google-Smtp-Source: AMsMyM7xA77RwpJDljVNBVfizIu19AEjjb/N9RlLWIM28RWvRLroQC2kBSKTeSYzQgr5f83FnWlUehW+4FX10qdW1ys=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr53675644edq.32.1667903113554; Tue, 08
 Nov 2022 02:25:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027130859.1444412-1-shenwei.wang@nxp.com> <20221027130859.1444412-4-shenwei.wang@nxp.com>
In-Reply-To: <20221027130859.1444412-4-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 11:25:02 +0100
Message-ID: <CACRpkdYXh62PPg5iWL+J8xBn+66TUoooy3JWzTtxokm6OgSp5A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] arm64: dts: imx8qxp-ss-lsio: add gpio-ranges property
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 3:10 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> add gpio-ranges property for imx8qxp soc.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this into the i.MX SoC tree.

(If that doesn't work tell me and I can queue it in the pinctrl tree)

Yours,
Linus Walleij
