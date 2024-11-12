Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB4A205AA1
	for <imx@lists.linux.dev>; Tue, 12 Nov 2024 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731427031; cv=none; b=sqyRJlQz3VOa8rYwQMW1TDGAPDnmW8DvCNS50d+U1gy5tk5WgbXkN6j7YE6IbJ9rS8ARu+okA27b477/dV0SC8R9J2DMVCr4EkrbW6D9tbb6BWHiytkTyFPrZH3fcgpaH6LNNYMLd99j5IWkWb12QQDYbunYShQ5edmAIxh1Qhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731427031; c=relaxed/simple;
	bh=7T1EWpUdFVknKbZI8QiuRaCYoZtqqd0I+lPaOsqrczk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gh/XXdEDtL/QB2Maf4upTsvh3tdIbqwVzGMCGq4ueup297+n6+ReLbDK2TbYl5BWNuqAGUDgeJCbrEmaGHi+W7jH5F7SHo+jhWYnLIBqQUVh3w2ZTNdYA2tW7kn4S0rhBimIXWuTTP56XJXHPtAlzgndLfk4kKaFOFh9CBK+7ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5aSKu/F; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5aSKu/F"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ea50585bf2so57156197b3.3
        for <imx@lists.linux.dev>; Tue, 12 Nov 2024 07:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731427028; x=1732031828; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wBk1KBzwEOHZKuHnC3LcVYLaBvifyeSlS2dX2zuDsKo=;
        b=l5aSKu/Ff6aslCj/46DW0xPYYDT26z4m0WrW6ixMV4+aeN31ovhu5/0ZFVkbJ+JI6O
         m+O8uUu3m4d0rijsgCgDUQ/mhQV47GbrkVWMgN6epWd3F6EIc2L4wltNTVaIQAsKh9me
         zfytKN56a9zyJeB5B2ueeL7GuzizO5kpumZJG9HThNIRt7jzOE86eSZdg+JrSttFK0oK
         UxG1iSGvB74gwuBtEStRp8wtyErKmcxPJrZgv8MkRB5bQn37u0xyn6LL4lmuuYU2BgIF
         35SMdsTIiu0iQdD3QlqMWIWlhLREU7QJh3XARkUgrVxT7x3n14yGOx+GoFD0xtHT0w91
         kgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731427028; x=1732031828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBk1KBzwEOHZKuHnC3LcVYLaBvifyeSlS2dX2zuDsKo=;
        b=YEczkFsGgovU3KjXxGpeZrtVlEqO4Y4MFJktob05m19qlTuGbSz5JifY+Gs8+t81AQ
         iv8wxyrahw+cWL3hFeUSmSMbPbHIGTS9BlMteORVJ5wCWj+70pXJlVLOv+sbu3ADo5BR
         UahY72Tjob3up9PS0uuQGRUrM+CLg9xLcArzt3SPg5P4gppURI/Hg8KNoBF0qywEO41Q
         cPK3hLjxM5rgqi667HbokJkZS7q3jqyArKrdSrsPdHVTVIZvLc/WwORXHktM7bjsJ9Gh
         rYGWBBEiPPs7IBuFozob9/phB6z92vdRIDCTipYCoOoix97ne0+q+vufjy/8yndBPbqx
         MxDw==
X-Forwarded-Encrypted: i=1; AJvYcCUg187wG9rA6lmgZIZG3gj2q3/Wr567Op9ZwUS2lfaafm25tGFWJvEygiEwnzGNtoquUT0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbA2u4wC+Mc521G371JyR6WDU+RISxfSP/GUhOf0m3k+DNIe2v
	Tcm2iFjQV36mHJ6EKWmrvfzr7yfTChgecXvdd+xdESJHn2msH3fex0zDRxlv9y1ri/XB3z9S5cQ
	DzTgc9gbgSQRVeY7+GJNbiP/9a0msjelTAKgnVA==
X-Google-Smtp-Source: AGHT+IEbIXuO/FqYjARrZep3wROIZJT+00STOjU9kzztmEI5hpPneiVqw/DMdVTNmBDXF4I7LbrGsgy3l8sZTRamFzM=
X-Received: by 2002:a05:690c:700e:b0:6d4:4a0c:fcf0 with SMTP id
 00721157ae682-6eadddbcfd8mr154933787b3.20.1731427028254; Tue, 12 Nov 2024
 07:57:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241104190742.276710-1-robh@kernel.org>
In-Reply-To: <20241104190742.276710-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 16:56:31 +0100
Message-ID: <CAPDyKFreU6wVnsOwz9nstiQ=0sSKN=xtGOaqotwES5UByxQeKw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Nov 2024 at 20:07, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 80a4dcc77199..fbb4c90b72c4 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -411,7 +411,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
>         pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
>
>         /* bail out if DT too old and doesn't provide the necessary info */
> -       if (!of_property_read_bool(pdev->dev.of_node, "#power-domain-cells") &&
> +       if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
>             !pgc_node)
>                 return 0;
>
> @@ -511,7 +511,7 @@ static void imx_gpc_remove(struct platform_device *pdev)
>         pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
>
>         /* bail out if DT too old and doesn't provide the necessary info */
> -       if (!of_property_read_bool(pdev->dev.of_node, "#power-domain-cells") &&
> +       if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
>             !pgc_node)
>                 return;
>
> --
> 2.45.2
>
