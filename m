Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9CE28FFDF
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336694; cv=none; b=Ffm99Ra/IStN1+3DV2BS59KDf+9R/T5f65yW4B7UjwF3+p12YSxNXvIIwn32qaL4N/n+I2hobwrGj9AodGkqPzJps7nsqncMtHm1X/KNZfCZE+3rEVDX0aw8X+u8o6W29DEsejR8q85g2EbsxZZ6UjbHR41ZXWmcyMAIYkoUk6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336694; c=relaxed/simple;
	bh=+wQ3V/SBCGFw935WChI1t2sSplf3aKsIu1jNFc4fRo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=suarUU7ROi+oJvqmXzVrlM7HKeu4sMwv2oNPI9yRLeQJDQO8uVb1FnY43+uBakEpXIpcqJEcTAAVMNkBtOxOGtAeqfMaA7T3A6UL2Xboc//rEMO+QNnR8SOK1SUzVjY26te7XXD8TIF2nmh6b0nZeS2Tn6pUv30D1msv2ivCwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZEBIZSWR; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZEBIZSWR"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70433283ba7so45838797b3.2
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745336690; x=1745941490; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4EFn2W/SBOz4Ss5vMmt0N5F+gg9XTWWc4yKELcXE5FM=;
        b=ZEBIZSWRINb64RnIoSPLkMQ0qMiCcmXM2hXLKgdHCLlwA0//KuqipggHSg/4Emv4/F
         o6/sOByNjonFYv7kugiCArBj8BwJrB7jYbtLCzZ/sm/6KyKPL0AjlU57e6GsMfm3SxBh
         4ZgscjMgeszOpELt5nAc3UoCB1pAeHVUU/HXlFP8jDp6Vq3vizwZlNDObbs5n1g2V5li
         cbv7wa9y9QSFeuT3Fnp7H3msUYh/S0QkvGTGEZrGoZaKVsweyTmLFbuGjXMb5Gh9CWwl
         Y67zreHe4PxTQ2b5cYw0pgt1jtth7ppxIzvSGXHSawRqPPt6HskSgBePwxIqfDaro+wp
         5YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336690; x=1745941490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EFn2W/SBOz4Ss5vMmt0N5F+gg9XTWWc4yKELcXE5FM=;
        b=qJw6c0OJOAtWTpU+ZSKOYYk9sLbP2BrshaKYSNyXwhnXDavn5iN+ktbJSRz3F8yCeu
         z8aeDFPXRd7P6bYHkFZ2C4QDHD7MZhankC3YQiqkaKJHAiWOR6DzEB+6IZBzEed4vVhr
         HnrWohlrrwbkkwRXUZU0d+PiA6/FJZRGZtPo8w7C1gEhZxFnjHa8w0pqqijdEjoTXxyu
         1aWF0sCtFDiidDqmFHGnI+1H2SYZWfzxqqTboRzqz/ctG/0AAnmpqD7AY4opSgGk2hHT
         3aO3rTtMbRGO6iljFNXDBLSHzYJqlpnTKZDTUKYuZS7nGVlbN7DPN4avwhe6CnQuNqQi
         cPvw==
X-Forwarded-Encrypted: i=1; AJvYcCXr1m6tC0gPxsj+kKAOnxE0ejKczuecSb496QanduFiODvjw7rBHsrcGbGp288UFp43Vns=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa5YCJpX/kgQ2c8HPByKorfET5o2/H+KH2gikfEoewVDRCnCtT
	IlwOBMaiP8ItEZhSFBB+kFL4d2PyAXtH2mPFumEJ9q+flJOLjdHKNVF1r5KimU02o0T3PCselk8
	/Gq62uLXzlotsbwgbNgHdxtPOgeBGdalsiXTQ/g==
X-Gm-Gg: ASbGncv+MNY/xz+ukq8QZP0/SZM9b19l7vGLDidTa2rb3b4XVgOLFgu+ISEXKFdc2e8
	5KPaVDnamYCU7ZONt5Joh/QMHPYoc3gzzJgyvbc5fIL/Us98dafO3mPLlVNqWEw9/P1jaacILo3
	dVNMHEq5PPvGbErXC9knFw5hw=
X-Google-Smtp-Source: AGHT+IEHc2hJ4Cqc2TLQJORRZ7HSilNpRQ02MgV9r96MtzM1W0JpjGC9ejSda0flvQWdusSoW6gwajxpxPi/3e7ThWA=
X-Received: by 2002:a05:690c:6c0c:b0:6fe:b88e:4d9b with SMTP id
 00721157ae682-706ccdf5d40mr253126207b3.27.1745336689950; Tue, 22 Apr 2025
 08:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250409075550.3413032-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250409075550.3413032-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Apr 2025 17:44:14 +0200
X-Gm-Features: ATxdqUFqgpqORv1AG7qmoEJZ9cXTo2y6ysVsgng0e-udR6FloO2w-1bXRpDq70A
Message-ID: <CAPDyKFrNUp93Ouw8MEUNMqgTuYCszT5t6jbJZdRsM2_Ed_peDA@mail.gmail.com>
Subject: Re: [PATCH 0/6] enhance the tuning process reliability for i.MX uSDHC controller
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 09:54, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> This patch series enhances the tuning process reliability for the i.MX
> uSDHC controller by addressing several hardware-specific requirements and
> improving alignment with the i.MX Reference Manual recommendations.
>
> Haibo Chen (4):
>   mmc: sdhci-esdhc-imx: explicitly reset tuning circuit via RSTT bit
>   mmc: sdhci-esdhc-imx: reset async FIFO before sending manual tuning
>     command
>   mmc: sdhci-esdhc-imx: widen auto-tuning window for standard tuning
>   mmc: sdhci-esdhc-imx: widen auto-tuning window for manual tuning
>
> Luke Wang (2):
>   mmc: sdhci-esdhc-imx: verify tuning control status after configuration
>   mmc: sdhci-esdhc-imx: switch standard tuning to manual tuning
> ---
> This series depends on:
> [PATCH v2] mmc: host: sdhci-esdhc-imx: save tuning value for the card which keep power in suspend
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 86 +++++++++++++++++++++++++-----
>  1 file changed, 74 insertions(+), 12 deletions(-)
>
> --
> 2.34.1
>

Applied for next, thanks!

Kind regards
Uffe
