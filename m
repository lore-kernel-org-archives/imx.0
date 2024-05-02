Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68588200C7
	for <imx@lists.linux.dev>; Thu,  2 May 2024 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714629179; cv=none; b=jals+jJc3t91SBVnTGsNYt1YbnnI2PNMfdW7tG63uehq2ilgHIeLwIMWSa/5zta9IIZm0ZRL3jn3sZOiKQR5hHbR5V1gUH59SmaQKOE09QrfqLoOqkI+3WQh2VlWrlif5Z2gjMrebdSFnb4RKdK7IfPdb+g5i+8z+mz8CR8kxZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714629179; c=relaxed/simple;
	bh=Vr8lTCzO1VAJ0OenIH3p+WXBrU2/jSnRyY4dIxgUK0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8zAKZcs2lshqy9S5cmMgjdXiTQGoTzGZUi50/QyUQ84dYsstBZI6EpgXwEfwrygzQWUrplvDQ0A5/ri8LrlR9s/4YWVRy42g3KATf8LNc9d2wKqfbtllv2r3jmpOlMbRNnRKQ4joHalqZeJeVaL+dGWeAH0BxAa+/JBvP56rjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q0d74eGG; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q0d74eGG"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7f3c944ff8eso295578241.3
        for <imx@lists.linux.dev>; Wed, 01 May 2024 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714629177; x=1715233977; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2v5ycL9gtgqXkrtE6QN/SY19fUHl9GdEfrTwqyHjjjo=;
        b=q0d74eGGXqFWk+8icmqJHOWv68dgWy1SbwwpQCgJSF0u+ZD6uyEascciTyQkh1i/gb
         q4MYgzD6fdIJjOSOQ1nGw6y1cOJxdYGLHn2SsBmVQz24zeAaTUdlevmN4ylnzBvIyjci
         Ig4cu/qLCvsyakNMv+MEPbp4IKXxiMcxPKe6DiECqurxt8eujyq2q3IIPcq1b/tsiYcX
         pGirruj9uCNEAtD258UNIsHF9iVDSbZJaZHqhHbCInE88z/L+8sauz2mcsWfYZOOybkh
         /bNQrTWbISxA9VAcjPqKHA3akIC9y7fbahIesFy9FNWQj1LBi8PxyZjX+ompXElSxQx/
         9/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714629177; x=1715233977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2v5ycL9gtgqXkrtE6QN/SY19fUHl9GdEfrTwqyHjjjo=;
        b=Og/Fn/RsdUFPDXen1YUWelCyywBjMZgwKskOuwwf/FXSoY4lGKRN3Z3DoxFK00icl9
         RclMk/ZfJ+THwd58pv744thYMizTZewe8ITIwnSAy79y3JM2vLgnVbeZSjWHxO9QxPRy
         CP6E9QigMpiUgp1qgDL45XqFwQvZbeB09R2zow2BTMhb0UY1VObCPD+OGs2kNsgDdX/g
         VVRsPaVKJrq841FE5cIS/Fe39W1fPioaeaF+OCUV+v88J4J7HAqY82sM9ADzQkPu1YDh
         5bMr5FdizDM+eEmwC9JYHaH4bzOFSMhUcQFVQW/xlce9VK+kgAQ5/OxXH/x0Se6EJffA
         D3gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxdhbkn5VxMBylh2B4PY2HJ1/VbkcBpBL7r1kjQbNniIJfe+cmSNgibj5mPvoWPoeN0uMHqJyXYgISqvHO6aTfjTRH
X-Gm-Message-State: AOJu0YyB9rHm4Tx0Rr4NwyC7kIZKzPI4285xf+hSaesac2ACTXkXHCdT
	GmxR1nwMIzThPa1SlU2Un+eZEjDWKJVW+ViAKsLTYaHrRMe/MKRwktdW28mmznDkU7r8mqAQIXP
	71Fcz+2NB8zdbnHw2YDDknl+HAYDpC8SeTyopjg==
X-Google-Smtp-Source: AGHT+IE4z0Ze4gzkMIfqiFc+oCUd9KfOkp4NqCn+dDWcOn1IKyPUjkFfjMy1SuxTyT2yHEuBcn9tW//JhlQvugz5uRA=
X-Received: by 2002:a05:6122:3109:b0:4da:9a90:a6f2 with SMTP id
 cg9-20020a056122310900b004da9a90a6f2mr5459247vkb.10.1714629177112; Wed, 01
 May 2024 22:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240429214502.1363592-1-festevam@gmail.com>
In-Reply-To: <20240429214502.1363592-1-festevam@gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 2 May 2024 11:22:45 +0530
Message-ID: <CA+G9fYvAbjZ26RBXmkMGUgO-sXSNFtsVZ8_2Y=JmuFknfL4ZxA@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>
Cc: abelvesa@kernel.org, imx@lists.linux.dev, shengjiu.wang@nxp.com, 
	linux-clk@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2024 at 03:15, Fabio Estevam <festevam@gmail.com> wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().
>
> The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
> compiler to evaluate if the suspend/resume() functions are used at
> buid time or are simply dead code.
>
> This fixes the following s390 allmodconfig build errors:
>
> drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: error:
> 'clk_imx8mp_audiomix_runtime_resume' defined but not used
> [-Werror=unused-function]
>   363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: error:
> 'clk_imx8mp_audiomix_runtime_suspend' defined but not used
> [-Werror=unused-function]
>   356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/linux-clk/CA+G9fYuP7S+a89Ep5g5_Ad69EMwRkJ8nM+MMTzbEcP+6H2oMXQ@mail.gmail.com/T/#u
> Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power saving")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thanks for the fix patch.

> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
> index 574a032309c1..6a9b48b20cd6 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -368,8 +368,8 @@ static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
>  }
>
>  static const struct dev_pm_ops clk_imx8mp_audiomix_pm_ops = {
> -       SET_RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
> -                          clk_imx8mp_audiomix_runtime_resume, NULL)
> +       RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
> +                      clk_imx8mp_audiomix_runtime_resume, NULL)
>         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                       pm_runtime_force_resume)
>  };
> @@ -386,7 +386,7 @@ static struct platform_driver clk_imx8mp_audiomix_driver = {
>         .driver = {
>                 .name = "imx8mp-audio-blk-ctrl",
>                 .of_match_table = clk_imx8mp_audiomix_of_match,
> -               .pm = &clk_imx8mp_audiomix_pm_ops,
> +               .pm = pm_ptr(&clk_imx8mp_audiomix_pm_ops),
>         },
>  };
>
> --
> 2.34.1


--
Linaro LKFT
https://lkft.linaro.org
