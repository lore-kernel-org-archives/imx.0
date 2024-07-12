Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0556E14374D
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720775407; cv=none; b=Xwj+y17YjwPFRRAI++2oHP6FkybitXf1ccHkF8DlucFqMRHfOnsGwYJVWKG1pZU1GDD+XL/maMWwEqZMAL+07Sgl81y8TaKIGM2lUuSS/fQv1qtFMs669skoPCGMdFaeb9afhv0ktqd5QGPiPoCbh1QI2Ngqgl8yHVOydPLJNhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720775407; c=relaxed/simple;
	bh=92ARlhMrFxnltJoEG/KO+vFy4IkhU7sCILYUeEcc59U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMMI2nDRDS8RI6olXjXO+k9SAjvBVnnSppFPvug573wcpH9TfjRMV/QyKZJSQOMpVrM6Hv5/87OUae6YPDNYqC5qdwu/z/YcmKtQs5kxC7Y0+/4C8znCPBCTM80RGBgMpxZ/mZWqOZ4tT8TnK64z6h5uDXJBAAx6Uf5T5BBxCfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fd+rH50h; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fd+rH50h"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e03a9f7c6a6so1734889276.3
        for <imx@lists.linux.dev>; Fri, 12 Jul 2024 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720775405; x=1721380205; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hp1jgtDDKp2yfm23SCirsWH2DTom7+EqUMqjaOQMl8s=;
        b=Fd+rH50hxb2J4IyfZNF5sJ5EDDzbBM+ATHcM+vtYrbTUFbq5GFG4wx93JYDS4fgU49
         pSqqZ4oijJICmSgmnHOLjGghARKIMa48j9e8CVRpG9F/N/dTJHKBvRMJfpcZZ7oNR3es
         /Dy7UbE8k5Lot59BBs3bXeW5I2KwcmCkWHZ/v3MP/n9gdFqqWUkbnpBuFaxcl/etMNY/
         /1++XJfYhnXMEAVsXzvT4IkkiKMTvfxEq3lTwzKs5UXB1eDrCjjKl9AjlNuzV3HovLro
         qPuJLzBmOw1xxHBJdURAp+fJ1siEN8tigR8LJ+ZL7gt/T7wDqJzIdWfkS3XrCTbaSPRY
         Hjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720775405; x=1721380205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hp1jgtDDKp2yfm23SCirsWH2DTom7+EqUMqjaOQMl8s=;
        b=J7lRvYZsdUbo652Arw33GypKCxle3+y39/tmW+fD/lieXRaIDGh7XrrMNgdqrl8oYv
         PC5vPRfP9FWHzcID+tEwDvtG7lNqhDxCf+0kd2lRd80WD1N88AQTaPgRRVwCKb3IAO6C
         QSb9HL2b68AB070oHdOJBvwogt3or2l0Z1ZBa5MiL239n9EsIwLa9bCsMAZSMHCOeXY8
         0RB47stbhMLQv8iwHAnxueDOJK4HeK8OuFf5W4bGmFbJIQ8fgLrXjHXbDKgt7r5Pvh3I
         wyklDm6H0qCFNq2Rr/G+HYVxMBlqsOlXPPU5iD0LNrPuJSeH4MGGatPj/nAbTXmPy7FI
         ipog==
X-Forwarded-Encrypted: i=1; AJvYcCW5/400G3H8hOp+S/YtJlB/Cbq5sUcvSM7M/7GxzH2UkV5dU+ufvtDLx5aSq8z2n0eDKD3Qlj9g5fo5fq2VrPPtVsZC
X-Gm-Message-State: AOJu0YxR+hyhYo0OpTI6D7IzUWGGjOIlaY7Ejy3agLLCobLTABaMJqK0
	MKpFRYxWtPW/ufG8YJlY16VtcmJGNBBzcx3/2BMz/FYPm1Sy8QZCcv1lbhW9Y9TdojHAQWcssj0
	A5TduJqMLWwRortzf8tond76hj47Yxu7WSPStcQ==
X-Google-Smtp-Source: AGHT+IEhhN868PqjoOtPt4/HXGxzNPUJJGslyFKUXQCrTsbztUttPEoG4X/T5cjLdpglfCj2+mvP6vMuVbajMoDBAHo=
X-Received: by 2002:a5b:1cd:0:b0:e03:5895:31b8 with SMTP id
 3f1490d57ef6-e041b059200mr12504526276.26.1720775404920; Fri, 12 Jul 2024
 02:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240708121018.246476-1-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20240708121018.246476-1-ciprianmarian.costea@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 12 Jul 2024 11:09:28 +0200
Message-ID: <CAPDyKFoWdRdi-NZbtj4yXeBxiH9o1+J0uux+Aiaw8AQbUGpM5A@mail.gmail.com>
Subject: Re: [PATCH 0/3] address S32G2/S32G3 SoC based boards particularities
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jul 2024 at 14:10, Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> This patchset addresses S32G2/S32G3 SoC based boards
> uSDHC controller particularities such as:
> - GPIO card detect wake mechanism is not available
>
> It also fixes a clocking usage issue on 'clk_get_rate',
> in case of 'per' clock.
>
> Changes in v2:
>  - Dropped option to not change pinctrl during PM.
> Instead, when S32G2/S32G3 uSDHC pinctrl entries will be
> upstream'ed, 'sleep' pinctrl will not be defined.
>
> Ciprian Costea (3):
>   mmc: sdhci-esdhc-imx: disable card detect wake for S32G based
>     platforms
>   mmc: sdhci-esdhc-imx: obtain the 'per' clock rate after its enablement
>   MAINTAINERS: add 's32@nxp.com' as relevant mailing list for
>     'sdhci-esdhc-imx' driver
>
>  MAINTAINERS                        |  1 +
>  drivers/mmc/host/sdhci-esdhc-imx.c | 16 +++++++++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
