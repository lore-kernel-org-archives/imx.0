Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F2D3043A5
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606457; cv=none; b=UG3de2disWiS/Lx62mjzGSy35oobFntIXleORDUJHongWDQVnbj7iVjU5pFD8RrMQkwUcrNAJHXviawZOvNlRTgDGcKpoLK+n4Hppo4k3wPNe+IItjhnyNsNIq4ZbxYe2hNOZt8ISw9grX1o6VZyXACHgM/Twquxgj4XtPm9l4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606457; c=relaxed/simple;
	bh=DUkk+13M+Ynz7MT74/8ZBBYtodYcantx5Rg9z3JTBsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hupmGA7jprP1zznRo2aB0DaGhI6sFzcJjBH8Mz8vf0G/BVV4nZScrz5TCEyNfnAB77uNAmOmuDWssas48e7nzB1H8Bs0h1/joWs58CPnDgpDZTyYk65PUC/xZ334FYye6ao7Sp+cJ2wh7p8purLa+K1ct1nWwwhH//JIMNnw4rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkFLvMMk; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkFLvMMk"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e94eec0de32so256015276.0
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606454; x=1756211254; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+TPF1YkLiFTNQ8Ccb4IZIqIBMol4u9SbWTxln9EZmwI=;
        b=jkFLvMMkgcFnCe1LwIToSx/NS6drGMsPeGbQKYe7WBIv1Bs2+5FeU/nTE31nuWXKtC
         4vVGQRP2j7L8/UBiE9ttmQWyyhJgwRatP6fkhpfx4O1ECBP473W/sL4kKsrlhLqews3d
         a95bBYCuTjkyc9huixjZ4pWQLVlH4kMB/RbfjZwjBZQK5Thxna89QwmKwLhryyfjypp1
         qIy01N/Ufoub7aUF8fTNM+pewuHK1qaglMunQd0UZoh5ngLqNzUA9q/LUiwR2KgrOgCc
         jeXubj0gtVKKM5f8/uAuYzA6e8TD6WDJq/r27eEOHrdINdMVml33JX52Tkib+xpZq3bB
         cMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606454; x=1756211254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TPF1YkLiFTNQ8Ccb4IZIqIBMol4u9SbWTxln9EZmwI=;
        b=DBq/YZdlGgfHfjtMdIkDImHsOd6wE8UwuVXZKkhs8mo5DjaACGXI1KirCtUQNwoosd
         RlYxKLMsb84llKTkj0Y/buWPaS78SB4XdeK5xLP0WvQJr2yAqgTxxHXhcjyM9Mu4LsbG
         vXice7IMcMrRi55F04AuWxQ+3AHs+YTmHaknCBohJX3BUrSJMQYyjEkrMFTVPsl9I5e3
         ba905oR0XpHVNe0tfitRgvBERZWV9IyOpgnYWm7+Qhoe4HjuF28c0CswPNSBFW0Qjs8p
         7f4vtk/x1Lj/+EyVE8EE5+9S1Mz6c3gGDdK+DhreYgGgM5mDWioC4kMk5mkTWdWI2nEd
         VR9A==
X-Forwarded-Encrypted: i=1; AJvYcCWxxjnksEyokMU1k9VEyR03K0J+UqE6QlmG3uSVFPQ4xs/GdrZ8m7vNvtJPLNEAtDOlmMo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZvZAiXaFK2SZe4gRt9cEsfn5Rv4sP8Y6AfoH13t93b9rlKJXQ
	OCdgitgx5+A5tIEQm2/WlbjnA1Kq73ABAgDKa3uVK/9S/6LBCQj9lba1UiSqjq/C7oSUlIlIMk4
	2g3mGR1CaVrCPhLDKEWD3vn+99nxhWHOdRbQmH75rAQ==
X-Gm-Gg: ASbGncuavlj5MXX6XQowOao+ort5cu6coIQCI0j0wBLzzDiBn6J+0JBvDsf0Algskbb
	egR43NpMgqdEg72Dfbzh5ahKlJucaJrB3zLUm08nlAxxDhllRdk1dBFkWT8upOT+AWmF0XdyXAd
	yRS/smAlKKbm+vjBZAInA+Hsu327foxj8Xb2CiC0hHv1+53ieYpTUi3imk80VCViLxdmcRFWQ6j
	y6pelY=
X-Google-Smtp-Source: AGHT+IEIU63/+GYGzAYDue+vg2X97jfjr+a6yrxDRh/QgcS+rLLZW/s7ptzQYuXL0ln6WvL4vzZQWJIIdTviE+KMReQ=
X-Received: by 2002:a05:690c:998e:b0:71f:9c53:bab7 with SMTP id
 00721157ae682-71f9d6aade3mr26181137b3.36.1755606454405; Tue, 19 Aug 2025
 05:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com> <20250813161517.4746-15-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250813161517.4746-15-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 19 Aug 2025 14:26:57 +0200
X-Gm-Features: Ac12FXzg8y3bcygw4HHi2EJ5hKpXkHEKEIKi8aknzoMhZGkielH4LokEZOomCVo
Message-ID: <CAPDyKFr=bnDZWmnBauWTZa2-2DNCP2swDJxPT1b_TK8Q2o8sXA@mail.gmail.com>
Subject: Re: [PATCH 14/21] pmdomain: remove unneeded 'fast_io' parameter in regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Aug 2025 at 18:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
>
>  drivers/pmdomain/imx/gpc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index f18c7e6e75dd..33991f3c6b55 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -343,7 +343,6 @@ static const struct regmap_config imx_gpc_regmap_config = {
>         .rd_table = &access_table,
>         .wr_table = &access_table,
>         .max_register = 0x2ac,
> -       .fast_io = true,
>  };
>
>  static struct generic_pm_domain *imx_gpc_onecell_domains[] = {
> --
> 2.47.2
>
