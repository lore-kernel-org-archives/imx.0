Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA921D5BC
	for <imx@lists.linux.dev>; Sat,  3 Jan 2026 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767434607; cv=none; b=BMJ/32CpOgyXl/yUDY+LwKpq0xIpqAFm2W51ckP8KhzA7IkzV3F9oobwwfhj72UGmMP93VRWHkTHXv+wVhjr0ogch9tpQ/GIrVykrhnHd5RAvocYLiB3nU4lWl/A7dTyOiKDlSt7Wl8QTxkoNIDzjJylIe7QBue7oQeMtLvpFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767434607; c=relaxed/simple;
	bh=A94DAyTO7kYqQUnINuHd8gangTUwz1WgeTPn3k7pJEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lB9Tulcq4bM36rHoVQyaAv2oLCh6J1prGdmVFA4nfOR5NJVVshjP8XrgrPtY/8clS9gR9eIVMKn940ZUCeH14n0uE6YuCJ3YZUPopOA9w48MJLgKGoiaKL556WcWOek2dXlQsPM1g9eihwZDqSX5yI5zspBbUMiGfUo1FTuQhIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GEshqTtf; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEshqTtf"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957db5bdedso14571195e87.2
        for <imx@lists.linux.dev>; Sat, 03 Jan 2026 02:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767434604; x=1768039404; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bDXSZppGA43wphmZJyL9aJJ8iAZCIXmj8aHnH0wAQ/k=;
        b=GEshqTtfZM6z4QH0lp4qLQl2cUNMt9l8Ft9l/tIVTLpOAIpdYWGW5gqvTW/Pj9dmZ9
         GUhCytXOTltol+Eu/qcfyWG+J1hWB5xBZkgLODDtHocD03krYsCf+YQtqQFfcjb+Md7S
         hs05Yl71MDhYM9m1S5GGz26geNvd4gW1UoUKva5ALO2wiw344YmO+YdjfyBTQaPHcJ4H
         npANX2E8aRnPD6ymH/AQPtNSRleBlLw40b3NQo7YIxFR4iTHQba3ae5BfCJz4P7TpGKI
         5f8Zvd5zgWLiXxeMdd9CBWDKKWh3+SlTtoHyV0KmRcONp1+w/u89+awjTOz/OPhVgAwa
         ym/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767434604; x=1768039404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDXSZppGA43wphmZJyL9aJJ8iAZCIXmj8aHnH0wAQ/k=;
        b=ia5P+AjtME4mGQODJfEWX05JyRYZ22Bi3DiEu16wA2VjPz8cTSYOR6sVk44ePeS0VL
         bQuPlz6yHX5QEyC5wvHpqjwLHZNS2qqCegi5AIuUM9wxSBHZ5AcpIFQq5N/wrsbAgT5o
         j9oWHVig+mVTf5G0xt5kBW774t7ut6aocB8QB2pI+/lOJBA33mrU87v664tegzy9YMF+
         lX4ku+P7cYhPsKnquT7tU2Efe+RQTI5bSaFH8bgVN+UsfwZFhqA0eX1CCgXZ+QMtlIE6
         IlwXAa94wC2ECdkAPo4xlOl/+rQmvh0JkcMkiMlT+XzxfolfmIBKjI8olJ+E7XbaFL+R
         Qahw==
X-Forwarded-Encrypted: i=1; AJvYcCXdcPqCGKooeMR5l4iYFQJcwfvsJsSpWFb56E/cK7a1n1kcoh7JYQNGM/jjHXuzUp9vwo8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKEElr4KWMA2UdDS3sEmz+BGry/Kz46DFusnK6hxJceftIBvVr
	Wwg7wMgBx1g+kju6xc2DHGMtQN3WtacozU1zFXd/DVIYBMpWtovUY+e2SU70mt9rp4WyTCOAkE0
	ZHsjKpJpLou5hmyg84Y8IdT1jCGburmQIBZG3M4doqg==
X-Gm-Gg: AY/fxX6EiYVkZ41gGXr7H0h2Y6NvoLK5tkrV/DfTVWSSutbJQ5CZFajpOmdT5iIqfLS
	W6BZZBgOj7LCZllApoR2yiIeooxAr5AWfs4DeNWUJIEJwHTaDA0wdm2dvsNltB5i07WR50cWA2s
	tfazoPaUR7YpXp9WRIyYKYVuLO1M/C0QqRWcMM9KLDCj1D93gN70P3gd3bzLZ32rNemHFy32o1T
	zqRaY8ho6LLZqtRCCru7zZ2C5YeOoc+cr4DifhvWta3pSoJU7mm1cYUgaw0ecFlzXLymRMw
X-Google-Smtp-Source: AGHT+IFKB5FPDCXC2bA+k7uKQBiw0br0n5E1yiLNSCnfVzhkAKxTdSHEp5ZWB2TbHk2W/He8NymlZBgfriNTTFeJlI0=
X-Received: by 2002:a05:6512:10cf:b0:59a:108a:31fa with SMTP id
 2adb3069b0e04-59a17d18076mr14943741e87.10.1767434604071; Sat, 03 Jan 2026
 02:03:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com> <20251205015428.643-3-ming.qian@oss.nxp.com>
In-Reply-To: <20251205015428.643-3-ming.qian@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sat, 3 Jan 2026 11:02:48 +0100
X-Gm-Features: AQt7F2oMTRKk7t89Y9gE75MVMNztzWV9UDfi1TNNrPc77CmFOSHTt5sl2zwMryU
Message-ID: <CAPDyKFq2iWX-axxnKHisRHwKJqnyHYm5oM2_UKZaeQduKdYkFw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pmdomain: imx8m-blk-ctrl: Remove separate rst and
 clk mask for 8mq vpu
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
>
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> For i.MX8MQ platform, the ADB in the VPUMIX domain has no separate reset
> and clock enable bits, but is ungated and reset together with the VPUs.
> So we can't reset G1 or G2 separately, it may led to the system hang.
> Remove rst_mask and clk_mask of imx8mq_vpu_blk_ctl_domain_data.
> Let imx8mq_vpu_power_notifier() do really vpu reset.
>
> Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> v3
> - Add some comments
> v2
> - Update commit message
>
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index 5c83e5599f1e..74bf4936991d 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -846,22 +846,25 @@ static int imx8mq_vpu_power_notifier(struct notifier_block *nb,
>         return NOTIFY_OK;
>  }
>
> +/*
> + * For i.MX8MQ, the ADB in the VPUMIX domain has no separate reset and clock
> + * enable bits, but is ungated and reset together with the VPUs.
> + * Resetting G1 or G2 separately may led to system hang.
> + * Remove the rst_mask and clk_mask from the domain data of G1 and G2,
> + * Let imx8mq_vpu_power_notifier() do really vpu reset.
> + */
>  static const struct imx8m_blk_ctrl_domain_data imx8mq_vpu_blk_ctl_domain_data[] = {
>         [IMX8MQ_VPUBLK_PD_G1] = {
>                 .name = "vpublk-g1",
>                 .clk_names = (const char *[]){ "g1", },
>                 .num_clks = 1,
>                 .gpc_name = "g1",
> -               .rst_mask = BIT(1),
> -               .clk_mask = BIT(1),
>         },
>         [IMX8MQ_VPUBLK_PD_G2] = {
>                 .name = "vpublk-g2",
>                 .clk_names = (const char *[]){ "g2", },
>                 .num_clks = 1,
>                 .gpc_name = "g2",
> -               .rst_mask = BIT(0),
> -               .clk_mask = BIT(0),
>         },
>  };
>
> --
> 2.52.0
>
