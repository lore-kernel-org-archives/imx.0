Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A76A1607AC
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208344; cv=none; b=C3oQPgqFt4hodVGNusvsHgBIXy66G/6YZnxNV+m+r7VuWuYa5uuD56ricNeYjAutcqANN36I9BJaQHDqrIWcfUzXl6+j1cs8om8Q7tus3rBK7C0JbtYYQ4IpJe1Zp9UXaollWL4EHS3bPsC/fsS4ITw665DN8Sq8dRujYMg1VfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208344; c=relaxed/simple;
	bh=JKfm6NN2B2hHRdonJoxuB513WOjuDHT7I18uTla7p1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOEkfzT9iuE1u8hjm1F/lAR/VazgqswGUg2jM6bVtz77o6F7HBiDPGzjB7qex9qoY3mZf38iIMYTgjWK3NL8XYmbXo9ShaR316SlPkUQF37/CazYhFO/qrU21+ADK66wn3zQs2N7XlqcuPnSBPlIBvio/wWDFNZM8iBZroOPXfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGprekFa; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGprekFa"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ea5c06bd2b2so1172123276.2
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208340; x=1758813140; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzEB3oyqwg8o4qvK1OgqXlnhNgSoMuFMpP/k/75t3xc=;
        b=EGprekFaPoRbd4cTj3Q5F+xbFTD2d2by3inJCyfhLvicwAasFezsaBD9zA/Ih8LRzn
         XdW84tdjmiiaUtqUIkXJl4fp9/Sg4jnfqln8u4qeIQ3JX1HKvYsL8/YvkgJO328GZETB
         redX5cJsu1eFw101S9BzbnkjaHFDp+FmNYg7aXoSxGunH4XOjni4+JEt8F/ufy/M7z49
         FGGVBgElVHp+5irlfBSESerIyJHh/YopMIR83Hyu9QXjJ6rnZslNngIBl3ww96GcZ7AW
         sm1xh82tx4epeQmaAgIYyeIzwDF4D2zApuah78SSiKHM4izGWSWFz+wa4i98usPI4M1f
         B1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208340; x=1758813140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzEB3oyqwg8o4qvK1OgqXlnhNgSoMuFMpP/k/75t3xc=;
        b=B8Eqy/vEDDHISLzc4ikUNKABQmMii8PZLanFUiyGzpWvS5V4wOq9UM411bNEGZtXNR
         6G62bofSVXqzagkGGCDUl4wB6LMArkh6YdBas0Hx5LtRV2FTo0ScALmzlpg6N9VWBLfL
         xm4AFcukAU0q2QBpwryF/HiHNZze9LlG2Iv0OyI3OBN2DFL4ynwJnZfuazNGtQOuFjl5
         LJFB/W0CqEB7rGNh/jeaw60U1BviYRsiUMOYbVyI+v5mcgY+9ngRAavkTLlKV0an+4pp
         pk6aB3CyogsQPS/Um6Byj8/g4HcancJDMacTiWahhCZukvWt7cQ0hzQve4hnJPOGuaWZ
         Si/g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7fTuAcaJmuufncvq7wGKv+FZtDwsvqFILU28e3yYqBTiKnPNNFVQSEZgw1BnYkeYER8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzHjWbX/C5NJR4yWyZZrSP7zBIM7BMUympfBxNhI6mFyaJkCDf
	kB+hChrCWNPmjRhcWycuutgyWDoS24EqTYZkqBD6wV3bIsBtdp2Fau2LzelDXCjYzqgq0KlTy5N
	KYC95PHXHUJGUxTVnYefqcWaJLK5cFItQAw5/ZbwEbg==
X-Gm-Gg: ASbGncvA7bZH/kLgYB81sC7V1puHmxg6jmZ6ZERiPNvA3LvBG0u7BOf/Dzz8yvPouMG
	GR2SHMtvW6eG3gn55u8Xjgj/lgERAmq/f4nJSxlwjcpw4jnSBzIQMUlqIrnAT5OJuggFJIA56l9
	+U/cwvBZXSyHoeOlFyEWmlMJWypXOivKDcIAJXil14ojYYL8xPI8Gm34cYZbcbcPIig/rwSx2es
	zEi5YAM6pqMEdN0id/es2EEdSLyxzql9HytFQ==
X-Google-Smtp-Source: AGHT+IFOOt5NOlhICVzaBKD3GERcW4IuNpGDCitHn0o/LFtu2/I5P/MFLfzOEfmO/oH8TvqHphqHmXeYL1qjVazMwlA=
X-Received: by 2002:a05:690e:4287:10b0:633:b6b5:ef2c with SMTP id
 956f58d0204a3-633b6b5f5bbmr4133202d50.27.1758208340325; Thu, 18 Sep 2025
 08:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-2-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-2-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:11:44 +0200
X-Gm-Features: AS18NWAvbbmow72oBLB0fop6cXMFfTOtiltZJomLBqlvFFcV_ry6i4BBGlzd4Ow
Message-ID: <CAPDyKFqyLV7UF0E4WxYQrqv3HNuSZCet=F62Lvt7nBYJMOZQeg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] usb: chipidea: core: detach power domain for
 ci_hdrc platform device
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> From: Xu Yang <xu.yang_2@nxp.com>
>
> When add a platform device by calling ci_hdrc_add_device(), this device
> will reuse OF node of its parent device. If power-domains property is
> provided in the OF node, both two platform devices will be attached to
> the same power domain. This should be unnecessary and may bring other
> inconsistent behavior. For example, to support wakeup capability, these
> two platform device need different power domain state. The parent device
> need NOT power domain on for out-band interrupt, but the ci_hdrc device
> need power domain on for in-band interrupt. The i.MX95 Soc support
> out-band wakeup interrupt, the user need to enable wakeup for the parent
> device, but if the user also enable wakeup for ci_hdrc device, the power
> domain will keep at on state finally. To exclude such inconsistent
> behavior and simplify the power management, detach power domain for ci_hdrc
> platform device.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Seems reasonable to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/usb/chipidea/core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 694b4a8e4e1d8583dcbf4a42f8c2dfd785d5745c..70597f40b9997a9766934c67bbbed38e96c210f8 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -27,6 +27,7 @@
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
> @@ -915,6 +916,8 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
>         if (ret)
>                 goto err;
>
> +       dev_pm_domain_detach(&pdev->dev, false);
> +
>         return pdev;
>
>  err:
>
> --
> 2.37.1
>
