Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AE6209F5F
	for <imx@lists.linux.dev>; Mon,  2 Dec 2024 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153062; cv=none; b=YmIlMb62ubGw/7Y6ffCXUzBvfDsRpJ7AD3iZW0jChuZ/8+Fc4W7DcZR72SL9kLMA2mPbse4ei5AfjtfqTpEjQ/DJkNJTYHLB8Fpu8+GUg7ricxyKmMBYAPNHgNOSpJ1VOO3oR8HnwzdRWF5A285utbYjYDsgveqe3kfI1D7qBc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153062; c=relaxed/simple;
	bh=s+q08AhHsFGE1EfP39d6m5AmxX15U2YOkkHYuDiep54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1LHZkvI+LcR9vMfbVKo/FvLnlvLj2i2HQxNUL3F/XHpY6ztz7wlnD/3OklLPt5Bav1r4RnYSiUFf+ljkRqdmwmrdYvCLiPjKqW5MfeabBMtZRL2upBMDFKUvXM2+n5onH3640OJKVHGohJyK3bRLM73gAj7TlgJhLRO6Ce354Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCBJrPEc; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCBJrPEc"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e399f8bb391so1471159276.2
        for <imx@lists.linux.dev>; Mon, 02 Dec 2024 07:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733153060; x=1733757860; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vZdmxpNfvpO1w4hAAEKWGZSvaKeExVY5BF0241uhp8o=;
        b=nCBJrPEcNGvL+YeyiWlxHHr+W8GyoR2QZ2ScpO70zvxsZJ+1VaG6lSoM383xrt40Go
         zio1jU2E8r5FcqHdM1OS2JRN4y/APx45G1VEpDzrqdFdQZmurswTLhoUI38QlSM8XK1v
         HkdGRCTFwPe5Ro11AswbvGEl1VYBReMoOsHXyFSK5jJ2FR/Npl3ejZSHFOwzPQB72oZA
         MhMJfA6Crv19WroiF41NJLjnt9NCikvI9h7f5RA18+wKfiqvDq0TGBDo4AXe61IfbyFx
         staYa9aAT/qa4JCBqrfivGErhK0YTxrXEdVcdox4xQhrbYBDq3oXOSWXYkmeirBBnBfh
         6U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153060; x=1733757860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZdmxpNfvpO1w4hAAEKWGZSvaKeExVY5BF0241uhp8o=;
        b=G7vNHmUo4Dqjvj0u47uxLPaLEpQqQO+9Ty7ZcplVi8N22iZ9EnC8kjHjQkKnBAW9zp
         QtgCp1UycnTnztxK0ROmerElBLqKeYHr4+19JQtZvii1+chFsaB7P4+DY/uYzWOjeUrN
         t/gxq5M9B8fIusPELlsxtIL/R7j55iMDOhV55piYen80wic/P8YyA3FEb3aGpXPopPVr
         asNSCJYfPrbp5xCltFszw1JBZiWwOOT6Vqf0KhwVhJKo3ZtK6eg2Te7rTq2GEgI9mege
         Fdl205EFr3WJ66hYz8DQtTRCEdvFdOqG0XBxEJQHUNYXxqwg+yYg9/4qHsgq7yCWtM1/
         Jc6A==
X-Forwarded-Encrypted: i=1; AJvYcCUukp+1Cbols+LzFRdGtoqfxQyajin7Y519icEHTOGlHGs9g1j0TOg5YBKB/GqgOatUxVE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJo+YFojMG8UaXZczNkZ4OqYoh5bX5tIm0UrJX6+mgCF1a0qAd
	Uu2qhjfwrwfQzCChQLkSfBmqkcP30fKInYscDdYbXHvkGQP2nIC4vVsz7eIVXtnVPKYqt5lXov9
	Aa8DdkjF3jXRTFMHUsWUzYzYSDW8ZOjyJHT0X+Q==
X-Gm-Gg: ASbGnct5S4ekAYFRWRyHgjf1jn6XaeW6h99jEqaVdio0P7MJHXxXcbTpx32yF1kCupd
	USDB4cSCseB/9exX+ZM/Ypmh+dNosWDjc
X-Google-Smtp-Source: AGHT+IFOFC5zPUF0itgIKsAUHr0BlLtuJZtIXZEze3rfpOri9Ohtmk1VeC2LzJL5dOFw7QQghHYnT6Ig09tgFYZXMYk=
X-Received: by 2002:a05:6902:18c1:b0:e39:8482:5d5f with SMTP id
 3f1490d57ef6-e3984825e68mr13245250276.46.1733153058435; Mon, 02 Dec 2024
 07:24:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241125083357.1041949-1-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20241125083357.1041949-1-ciprianmarian.costea@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 16:23:42 +0100
Message-ID: <CAPDyKFpkSRmGhZ68m7TyQNSqYKa7gnHigKpu4nKOpb-HWfCdeA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: enable 'SDHCI_QUIRK_NO_LED' quirk
 for S32G
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-mmc@vger.kernel.org, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Christophe Lizzi <clizzi@redhat.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 09:34, Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Enable 'SDHCI_QUIRK_NO_LED' quirk for S32G2/S32G3 SoCs.
> S32G SDHCI controller does not have a LED signal line.
>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index d55d045ef236..e23177ea9d91 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -304,6 +304,7 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
>                         | ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
>                         | ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
>                         | ESDHC_FLAG_SKIP_ERR004536 | ESDHC_FLAG_SKIP_CD_WAKE,
> +       .quirks = SDHCI_QUIRK_NO_LED,
>  };
>
>  static struct esdhc_soc_data usdhc_imx7ulp_data = {
> --
> 2.45.2
>
