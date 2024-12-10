Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B41B4147
	for <imx@lists.linux.dev>; Tue, 10 Dec 2024 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733839358; cv=none; b=YXZkP0dOLDbLngtl/99JiURWNGlhUFJE8Z3PzXnHJJQ4zxgyWeGlObSg+6+mhMN/zwAc+d4OgwymEDPOXKVnqBL+RjMcr3GOwagEZdI9diepYb1o22WAmOCgjdwi+vO5H7CiDZ4SW9SMSw61pDDqE5wY/brhOwEC3AR9LLpPKgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733839358; c=relaxed/simple;
	bh=TRfjmBKfiMFehXKfcPR5PjcSzxFgFyiC03eittaPsog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRN8Iov9nnMAEN9thff51SFBnU+xE4KdQlqKpHmt2sAmaBUkyE6wvEFwE34ZTBY+UAlSalMHSYGZLQwmY6FOv5kh61r2/9yfFmSwngg45ACcs0B2ehM9fuuNXP+IoMWN9jpFbAi2+7/bhFmQe9mZDJ4jHqEGCfPaUqVFB0GYal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t0L2P7Bi; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t0L2P7Bi"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e399936829eso4335602276.0
        for <imx@lists.linux.dev>; Tue, 10 Dec 2024 06:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733839355; x=1734444155; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=besKoqTUl8UspqMzSV4i/1U3YcYukO65Us63dIVJlmo=;
        b=t0L2P7BiMTPHE4vYW9pHqnIqAYVM1BfTQaJaf9e9B04t206p95pX3gpA15MUodS3rL
         ZPD5v2K71cJAiQx8ejilYDqQ+pCEU1VwICCXygskEwoGiV9MeTCuyR7nMiQyxfEaREr4
         8gtwCPVS/VWQtYzOYG1epANXy/1ypXSuaJaCsasjoaNNkzI2ILjfVHQ7Fjx1qWW3K1PH
         CeaRi8igZhI97ymPvFarQFiuBbqtFZ/pNQBFRpMFJaHyt8VcB1Do8ZfC8bQfB8BPzGq3
         542tDrI5eSDbj94QjxGfGSAfcemNv5UMUT2BU8bRF1p+kkFE+GhcVKbS0gs8WGeHYvfL
         H9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839355; x=1734444155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=besKoqTUl8UspqMzSV4i/1U3YcYukO65Us63dIVJlmo=;
        b=M6H2I45eNrKVjjSed3tB6zIr37LW9fiqjsvGkiTSP2t+Fq+J58Yv+/tuaJePo46Rfv
         TF+pm3ImmOw4M3XT5t7iZnPqkqiKG+9EnWau1m14XvooJ+rLorDv6tHoney7qAemaoKW
         dsggO8KZ6ywPcMFvv6Db79rdN+/YPYYvgWFNofy27G6UIBtzQsx0mRJGRmBaMCvgSH2z
         Od4ex+VjhKWYOSF1lQrH3x1yQDKE1DIs4HiUhejc61hQgixo69ThupGauGj/yELFqCVd
         qAeHlulvs49kxsgv8KuBDOkpFXFKSYCwHnkseXiZIktRvS9RV24iVdSj/51OVA8c48c0
         byHA==
X-Forwarded-Encrypted: i=1; AJvYcCW1qq6Ipo9gpjPomNt8GPDY6ZW7U8SAt/x+ra0ECLbrOggacDIH1UCRyutvursJB4V7XcU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSUxzvKZCxsbz9ZMhxr0TrVe/lWYoaqa7YD1gEAb5X4hIiE4rj
	w5DkLe48Zgb8CGY/gCw+6fBK0+XUw/P23s4NrHWrRdvVE0o0O/NmTfmKx+7pPV//4OQkYDMifMt
	YrxAJsE8+ctgCWzesrbV48H6JTf0RBVUZ/34ELQ==
X-Gm-Gg: ASbGncssKE8x12LjduS13VaprU8ZJ59yDJwbm10N0547b2gCdAXxBUSVnt31NjoLXlo
	afbiaAo9E9qvn2VjmDzBEyFVmqJTXWSaIdLmU
X-Google-Smtp-Source: AGHT+IFN1yCbB7HlDLaJwtDy5HM3+UgGOrK5CihsW5CiH9M8fU1rwshFqKnyFZ0DMkKGTqWE5e1F/csj0lrK/77hhbM=
X-Received: by 2002:a05:6902:2b86:b0:e30:d4df:4974 with SMTP id
 3f1490d57ef6-e3a59bdca97mr3979566276.40.1733839355475; Tue, 10 Dec 2024
 06:02:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241206112731.98244-1-peng.fan@oss.nxp.com>
In-Reply-To: <20241206112731.98244-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 15:01:58 +0100
Message-ID: <CAPDyKFrM6wX5uWY8g0pgZNEZn8uG5hbD4JsAijBenOMWkEgD4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: imx8m[p]-blk-ctrl: Suppress bind attrs
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pm@vger.kernel.org, aford173@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Dec 2024 at 12:28, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> The blk ctrl drivers on imx8m series are registered as platform
> devices and this opens the possibility of reloading the driver
> at runtime.
>
> But this doesn't actually work. There are some hardware sequence
> dependecy between blk ctrl and gpc, also power domains are used
> by other peripherals, so fix this by explicitly suppressing bind
> attrs.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 1 +
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index 23db85b7aa9e..912802b5215b 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -894,6 +894,7 @@ static struct platform_driver imx8m_blk_ctrl_driver = {
>                 .name = "imx8m-blk-ctrl",
>                 .pm = &imx8m_blk_ctrl_pm_ops,
>                 .of_match_table = imx8m_blk_ctrl_of_match,
> +               .suppress_bind_attrs = true,
>         },
>  };
>  module_platform_driver(imx8m_blk_ctrl_driver);
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index e3a0f64c144c..411dd548c67c 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -862,6 +862,7 @@ static struct platform_driver imx8mp_blk_ctrl_driver = {
>                 .name = "imx8mp-blk-ctrl",
>                 .pm = &imx8mp_blk_ctrl_pm_ops,
>                 .of_match_table = imx8mp_blk_ctrl_of_match,
> +               .suppress_bind_attrs = true,
>         },
>  };
>  module_platform_driver(imx8mp_blk_ctrl_driver);
> --
> 2.37.1
>
