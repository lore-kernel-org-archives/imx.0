Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE89238C0A
	for <imx@lists.linux.dev>; Sun, 28 Dec 2025 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766937104; cv=none; b=bjZJHGpXncbkNzAsy3AO6uBZjnWf1TjbluQ8DwkdU9LsbMoumJj9gZwXlWM01dmbVSmvkLIJ/dQPzAYzB/2NGoKbGJjlNM4Vg6uRrDT0iLATEKqM+MUyafljsEdzEMxE+PmY4sdBaCiHY4y+6QkpLTJ306zh/e6Xk67Bb2GHBZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766937104; c=relaxed/simple;
	bh=UPBdwscMbeewUmZS1YlHhhaecNMpTlEwPf4hXKqUXHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsxgZu8W7VuiZI2wyE+7XPqPJ/uYGaDM7bBZf4fZbW2Y1qxp0WPe+czsSiAALMk/JQvs0bJd/DQ+lCUmLw+h9DxbO/84BL/4PUTQL2lSTU4bHFhP4aUE7f0jTB5Hz/2uFcLfyJiY+uq1/Ps87xPG4XOY4hNr3hGnANIjJnA23n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hKVQ0Z8G; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hKVQ0Z8G"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b935df7bfso72631311fa.2
        for <imx@lists.linux.dev>; Sun, 28 Dec 2025 07:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766937101; x=1767541901; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vMOElam5lFCQ00bwoN+FTpOkP8287mrJpVz34H2qYuM=;
        b=hKVQ0Z8G9FXnZmS1Wbr5lKtYjQ7kyrOw6DMjAfmuEWK0qRO0WLk/sfeEQVpgbkIPXe
         XkBhZl0PQMqAMzjdFSQ6QVNmZAJNDr+lFQ2gzdL5NBQobm4adjtvn+V292sr5hYrHIBM
         RbjtS/jU4T1DHQSs9/++SW6HlSVn1oIiJ2xCWCRgYBvistQmRZTkDxieNMh1IvG0L1i0
         UUCdqj7NHpgmeGb6LablPFaBojUeKYoDAcXjJ6JgynWkwj/AtSvp559G0vewJ3/oficV
         o5GPsYISV9LrPOTUULkAklLvo8x5mF2lbb97qkfC/d3+qoU93xR75e2WPOGZTyr00XLq
         RaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766937101; x=1767541901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMOElam5lFCQ00bwoN+FTpOkP8287mrJpVz34H2qYuM=;
        b=XYGCbT3iZ45O0f0WWAgQlqLpOG3i+pglVPxUD44tDptHiv3dD3qy8s9VtUGIuZ7+bV
         SsTxt3plATuXR27t+qDF1EVtteBUPVJcAub42b8kCvJuZ+cdgF3zXf57e6PvkhS7qXoS
         R9klZwutKNzxVoLcK1/ysoqNMPXhEqcBLoPg4W2fG8BfBIUyoYIP8/c8c6ZODa0hYUIw
         Lk1458Hv4T5pv4MAP/4OdKTOFTqNYilUDGBoD9vMi63pmhUOGgYCMqc6R4po7LcXE59Q
         A2F1F/8s/oyUMYWRsmzXZbk68FZpL0Eqo2cbLbd+dyOWVMLmzZUJc1EVNaMf/wpKWc05
         mbbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/YQisOx0HZlCjpjHdXvOnUOThicen8rjbWf2qpLGvbCOmkpJrG5NCE9Jb1Q8itGNnokw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy58MeoQuEcDKQtZfsXbJ5IFbJl6cE8yTRx/xIlm9RbwCELh1tV
	vO9tbmJ90QOQ239qoSVUeeAKJFIAMy4BsU7hM31i2g8gfwjkfoYGRaaJQaSwRnqVH7ulePYNPtg
	5lf9KtzZxlwKDMLyV1PM5JYccyb8mqAgTN5GJJIta1A==
X-Gm-Gg: AY/fxX63AI8fuaKFQ7xagw1MALoJFg+JNKd5TLRsqakdYZ9XJhpZkZ4CV4cGJZcDXfW
	hS+CfWrgu9JZcnpX94Zlo2+pjlX2395Fm/pRTp2ym5prODwIUs7eQQmbCfvhIumM3vyHjxQI3pe
	zxGC3PjjdWCDhKTPP6I6b7Mmd4125SWvSYNhKoVtZOCRnzFNc28AwUnschimxHf7OIc2J1Q7scU
	VOIHB0mzLbbDabWtlCefT7hkrLiQu9qIvsk6RLR7TebqbjVyniCO7E9lX+T/NTADUf8JS1y
X-Google-Smtp-Source: AGHT+IHLUFVsnwRwkLFb3Tq4L6Zc3f/V8NutlxDmQ4VBL3ts9a5/EsxCVdAPRyCi+loA38VXEQC6iUojrpiM88ffZ7E=
X-Received: by 2002:a2e:a913:0:b0:37b:ba96:ce07 with SMTP id
 38308e7fff4ca-38121596892mr81755101fa.15.1766937100554; Sun, 28 Dec 2025
 07:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251211040252.497759-1-vulab@iscas.ac.cn>
In-Reply-To: <20251211040252.497759-1-vulab@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sun, 28 Dec 2025 16:51:04 +0100
X-Gm-Features: AQt7F2q4HOmCP3AtHKfQGHLB3c99yZpMtVEIsP3Gmo2gfisxBcr_gBvsZWBQEl4
Message-ID: <CAPDyKFrPZqwDmgFuPfbpX+FF3-r9F-r+9+Mm5v8z5Wb7TQJvmg@mail.gmail.com>
Subject: Re: [PATCH v4] pmdomain: imx: Fix reference count leak in imx_gpc_probe()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Dec 2025 at 05:03, Wentao Liang <vulab@iscas.ac.cn> wrote:
>
> of_get_child_by_name() returns a node pointer with refcount incremented.
> Use the __free() attribute to manage the pgc_node reference, ensuring
> automatic of_node_put() cleanup when pgc_node goes out of scope.
>
> This eliminates the need for explicit error handling paths and avoids
> reference count leaks.
>
> Fixes: 721cabf6c660 ("soc: imx: move PGC handling to a new GPC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Applied for fixes, thanks!

Kind regards
Uffe


>
> ---
> Change in V4:
> - Fix typo error in code
>
> Change in V3:
> - Ensure variable is assigned when using cleanup attribute
>
> Change in V2:
> - Use __free() attribute instead of explicit of_node_put() calls
> ---
>  drivers/pmdomain/imx/gpc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index f18c7e6e75dd..56a78cc86584 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -403,13 +403,12 @@ static int imx_gpc_old_dt_init(struct device *dev, struct regmap *regmap,
>  static int imx_gpc_probe(struct platform_device *pdev)
>  {
>         const struct imx_gpc_dt_data *of_id_data = device_get_match_data(&pdev->dev);
> -       struct device_node *pgc_node;
> +       struct device_node *pgc_node __free(device_node)
> +               = of_get_child_by_name(pdev->dev.of_node, "pgc");
>         struct regmap *regmap;
>         void __iomem *base;
>         int ret;
>
> -       pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
> -
>         /* bail out if DT too old and doesn't provide the necessary info */
>         if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
>             !pgc_node)
> --
> 2.34.1
>
>
