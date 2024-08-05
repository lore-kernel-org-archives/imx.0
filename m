Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ECA155735
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 11:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722857718; cv=none; b=pTU36LwXJ3VObm8BhAJhXreqRHyH+UZZKeJbAWySdOfCXH3kmcAkRLeo0ACexeJ/6I1ZE5y8/Ximi0McNKVjo7u/VQjk/ZnqVgtnqovLtXt2pldSORzoQVbqNpEkpIZWZVFyvUMiwgsuDdA/8JKvOj5CA+/fBYfNyth63+Ijt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722857718; c=relaxed/simple;
	bh=qnEoHAbLbztYtJlZvfey0ZsPGaJzZstgHfUoEiNAM6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZx0ZNmJQgoxbA216w+eC9aUthZThoNbS6VwOgsI9NQ1ZUiEruqjd2+JP1Kv2n7Glih/Yj7250Nq3Hup2JgUhN7fGbxsTgWIkPBHQcaNDnLZyUkSRQeCdI47TBZGBGCeny11pU+5ecgXD95k+y8Lpj1cn2O2NX2UCcWVRXhinpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QM4M7uUM; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QM4M7uUM"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e0b9d344d66so6452164276.1
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 04:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722857716; x=1723462516; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TO0MJPO0zx9jBVGkTEuM3whZ8sbaCUqD/Pjnqip+vro=;
        b=QM4M7uUMZFsaIn5CLnCiKZ1Vch5zbKRUct5qwG5lK8bpw5zIaSrqy17lqhiGJ3wgh9
         +tiv++ky3+x7zJsEvUigWkZVuWsWgEQey5W7f+vSlB5PZGaEo5vlmxQV6h4YOr8sEAKr
         IfBncVkNLz3qP5hKESGFZfwhJPr1/MnIP3PVAzcYUZcoWyeRG39MHaqriRBDSdxeXRr3
         EP9W/lYl645jXqQC0eBbSrb0XSJWYOr9CPdCUDvLH0xamTa7is9PV6bmfywdSNF0svmg
         e8t6RTA2EZmRec0sJCpPmTrRxIo2qsKN7brAZSZSH/TpkKP2/8DFVnL9OSLaHRYTJCec
         3GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722857716; x=1723462516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TO0MJPO0zx9jBVGkTEuM3whZ8sbaCUqD/Pjnqip+vro=;
        b=w1C+VJS0k2kSafHhzWkiEbbIlC4PjJVfIeNCHkeKi7y2CsbJkng4J/D/T6Iu1oOMwe
         9Eb00ZfHcsEkxkHAuNfm9UR+oC3YgtMDCckdIo3D0L5rkX4ySjQ0vgVhdodr+CKDbWCk
         LPu1kA/j9APspdWMlgaRoMfmVT5xPMXGfmvHVGwVnuu3vLtiELJzdAZo/g9K51vpJT+r
         gqf0AiPcsxeLiLT7Ix1D24IG2npZ/Lhbvxmj9l5qQDVoH3jtl8iMyo32ol9GjHTSFKlQ
         /nA3OSyJI8R7qnZEZz/QC4WNCwuvz08bpeiCMWk3EBP7Ilw305lpMRu3S1y1t2Z7A/ek
         A/CA==
X-Forwarded-Encrypted: i=1; AJvYcCVbjNUo3hAz0JZt9rbz/cLHL0cXF1iuJ+gij0Gjg1QN/aWTCqIEIz5LVoAO6LnalJeRNQ15sJQTwcnQohCQkFkuACc0
X-Gm-Message-State: AOJu0YwK4xGbdkVVDx5QikSUtj7MPa/Nz7KRCcBU1NRcEimUw62R+olS
	GwZLpfPTkCHtxpna5FOKM2X0SMi8cXVdUjQQlhNKBsd2DH8Z3K5578rPaPZyq8Mi6gDnIbEwmWV
	5AbQeCiDS76fb73zu9BfQyPpzs33rkBVWEj/zXA==
X-Google-Smtp-Source: AGHT+IFbg8tWI5RFE3KRag3rDI4C+uv6ImGTWbvbo77ifO+g1kVWnL3yOQ5zXRyTZnSTnvqDHetlpPcxkjMcvAO70QE=
X-Received: by 2002:a05:6902:72e:b0:e0b:e2df:b422 with SMTP id
 3f1490d57ef6-e0be2dfd3dbmr11385051276.24.1722857715924; Mon, 05 Aug 2024
 04:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240717080334.2210988-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20240717080334.2210988-1-alexander.stein@ew.tq-group.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Aug 2024 13:34:39 +0200
Message-ID: <CAPDyKFojBzKCoRZ-buDQ3LK4wm2EUrE4uZDv7_f-k3bebNWUew@mail.gmail.com>
Subject: Re: [PATCH 1/1] pmdomain: imx: scu-pd: Remove duplicated clocks
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 10:03, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> These clocks are already added to the list. Remove the duplicates ones.
>
> Fixes: a67d780720ff ("genpd: imx: scu-pd: add more PDs")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/scu-pd.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> index 05841b0bf7f30..01d465d88f60d 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
> @@ -223,11 +223,6 @@ static const struct imx_sc_pd_range imx8qxp_scu_pd_ranges[] = {
>         { "lvds1-pwm", IMX_SC_R_LVDS_1_PWM_0, 1, false, 0 },
>         { "lvds1-lpi2c", IMX_SC_R_LVDS_1_I2C_0, 2, true, 0 },
>
> -       { "mipi1", IMX_SC_R_MIPI_1, 1, 0 },
> -       { "mipi1-pwm0", IMX_SC_R_MIPI_1_PWM_0, 1, 0 },
> -       { "mipi1-i2c", IMX_SC_R_MIPI_1_I2C_0, 2, 1 },
> -       { "lvds1", IMX_SC_R_LVDS_1, 1, 0 },
> -
>         /* DC SS */
>         { "dc0", IMX_SC_R_DC_0, 1, false, 0 },
>         { "dc0-pll", IMX_SC_R_DC_0_PLL_0, 2, true, 0 },
> --
> 2.34.1
>
