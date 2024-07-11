Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A3D28FF
	for <imx@lists.linux.dev>; Thu, 11 Jul 2024 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720713370; cv=none; b=KIbLy23VYiZK8A1IjgfjfFoG0mxnbxRZznNqEh6NQ4/nAlZiDQHwDJkSfTxJgT2D3VPyieGyRbo+lOGubJ05d709jw0r2OvXeSnsDqcHcY3Tx2IIfVkcB1n7fTvzYKdmI5b2BDhiDcNmz551gozeO5itxS10AJhNBGMM+QMvCC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720713370; c=relaxed/simple;
	bh=fK93rdN7UPAjzzNdY9a2W7zpHlmO1W+0cPnbEmcEXTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbdFaCr3CJZbTyJFSs+n8eLjzkaASSzwKviY9sgdQSDACWMA5DSHH9WM7YRpjPRJU2MoQuiyE8AKnIppLZyV9OB84PxQyKCr6AAQ3Gd9CZil5V3gK7FKDmYpct1/QPVyfxHIBY2OHiuq4f9IyDKY1PIcuO+PdpT86dv347Yyk+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l0AbxMnh; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l0AbxMnh"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e03a6196223so1028288276.3
        for <imx@lists.linux.dev>; Thu, 11 Jul 2024 08:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720713367; x=1721318167; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o9NK8vbwSl6fVYipiYD+K+b1VqL0LZzXwcN17mQG4N4=;
        b=l0AbxMnhcklhUtuAb0J7n+YaBol7Bbzc+mSsD9MZbg/o2zLzGsE6mg79GzV1bwmHy4
         DQqpyHguf5CNMIi4aWgK4tbEsx8N7MWooTBZmIUcIWWwnckItEmEPrvSRkPdXsI9dSdm
         AqwSPijYQk/46grvuvH9Locbx1iCGEiTsEW9lIl/R07Aql7UMtFCCAZJJX6GXq5Fy5gk
         1/R8evxeIvKecTSBEMoJGHkz2cVlUWaVIOqOrvPGa9xpHuCVneoCyOytsftPRoyeulsG
         2+ny5lANzy2davX4z7ed5yHtwdTtdJBAs3xOcMSfn9k2WmeGlWFXZOCsujGtjJtEdSxI
         RDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720713367; x=1721318167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9NK8vbwSl6fVYipiYD+K+b1VqL0LZzXwcN17mQG4N4=;
        b=IkqaYE0WnO3oQSNETlLtHlIAfwW2Y401m6j+VNWbCvNMeXDizoG0x5/jYMeKPROCLD
         6OTtMeab1jTF7fb6//xvmt/C9x1SYYxkebCoyjeN3cmkqWYZtUNnkrKhj6vznMUms1bK
         QBDmA67LXuF+0cDCIqPNSs0hHyDcHG+mT8/3cu8zhuKARbmy/gYxiEhlGyLwcXHMADJZ
         zMulRL1pqrdeagN0zZL8zDGVE6a7FJcV+DunaZKwDtb+GjoieNmhJ4bnTEN8EnZ1pFBs
         KyLLSCXctj8p0vFYcBGxGq0m64unEOKY7qxBcRvnuy9IztfL2gYQ2KLsAbMKaLBK08G/
         lloQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsNml0QppVUd+5Y3u6cxyXnsTVNYYhjBPeKJpJgbyyxmD2IY3a9thG2p/AFavjMxOytK4lGOETd6pHpNJG/ssLUJxs
X-Gm-Message-State: AOJu0YwvRmyZxkjS0wNsBColX7OnficQLUTdSmf4d6BOz0QkXIxC1EyL
	iDu8YQCjqyXr/+FAEpHoH/ROnkgIXt/k2PimnhNI5p8DceWJFWy/Pc8Jb6yAU/SmCKxBQ4QszqG
	AXRQ6KJ6IJgKTvgZNnnShEpeEG/2kxfq7KBjyrw==
X-Google-Smtp-Source: AGHT+IFkr/j+VnCO+Vl5QVu0QsqTKrqy4owjYSW/qtao35IwLP4Q3jMZYHSbiM4nmMtUoEAIPyhT561j44bWpNjvOPg=
X-Received: by 2002:a25:868b:0:b0:e03:5dd4:ec1a with SMTP id
 3f1490d57ef6-e041b03c277mr10295295276.4.1720713367555; Thu, 11 Jul 2024
 08:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240708121018.246476-1-ciprianmarian.costea@oss.nxp.com>
 <20240708121018.246476-2-ciprianmarian.costea@oss.nxp.com>
 <6a577d6c-04ad-4c12-bfad-815e811deee3@intel.com> <123ce7e1-1981-4a41-a131-168f4f7b5417@oss.nxp.com>
In-Reply-To: <123ce7e1-1981-4a41-a131-168f4f7b5417@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Jul 2024 17:55:31 +0200
Message-ID: <CAPDyKFoHmvZLogUY=-WXM2G+g1h=fbaakySHCJh7MSaFMYuCXw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: sdhci-esdhc-imx: disable card detect wake for
 S32G based platforms
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jul 2024 at 16:26, Ciprian Marian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> On 7/10/2024 3:34 PM, Adrian Hunter wrote:
> > On 8/07/24 15:10, Ciprian Costea wrote:
> >> In case of S32G based platforms, GPIO CD used for card detect
> >> wake mechanism is not available.
> >>
> >> For this scenario the newly introduced flag
> >> 'ESDHC_FLAG_SKIP_CD_WAKE' is used.
> >>
> >> Signed-off-by: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
> >
> > Should have:
> >
> >   - put the patch set version number (v2) in the subject e.g.
> >     [PATCH v2 1/3] mmc: sdhci-esdhc-imx: disable card detect wake for S32G based platforms
> >
> >   - added Haibo Chen's Reviewed-by tag
> >
> > Anyway:
> >
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> >
>
> Hello Adrian,
>
> Sorry for bothering you with this question, but should I send a new
> patchset adding the new version or what is the process after this step ?
> For example, should I send this patchset again with V3 adding all the
> ACKs & Reviewed-by tags to each commit from the patchset ?

No need to send a new version this time, I can add Haibo's tag when
applying. Although I prefer an ack from him for patch3 before I merge
this.

Kind regards
Uffe

>
> Best Regards,
> Ciprian
>
> >
> >> ---
> >>   drivers/mmc/host/sdhci-esdhc-imx.c | 8 ++++++--
> >>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> >> index 40a6e2f8145a..21d984a77be8 100644
> >> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> >> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> >> @@ -201,6 +201,9 @@
> >>   /* ERR004536 is not applicable for the IP  */
> >>   #define ESDHC_FLAG_SKIP_ERR004536  BIT(17)
> >>
> >> +/* The IP does not have GPIO CD wake capabilities */
> >> +#define ESDHC_FLAG_SKIP_CD_WAKE             BIT(18)
> >> +
> >>   enum wp_types {
> >>      ESDHC_WP_NONE,          /* no WP, neither controller nor gpio */
> >>      ESDHC_WP_CONTROLLER,    /* mmc controller internal WP */
> >> @@ -298,7 +301,7 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
> >>      .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
> >>                      | ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
> >>                      | ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
> >> -                    | ESDHC_FLAG_SKIP_ERR004536,
> >> +                    | ESDHC_FLAG_SKIP_ERR004536 | ESDHC_FLAG_SKIP_CD_WAKE,
> >>   };
> >>
> >>   static struct esdhc_soc_data usdhc_imx7ulp_data = {
> >> @@ -1726,7 +1729,8 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
> >>              host->mmc->caps |= MMC_CAP_1_8V_DDR | MMC_CAP_3_3V_DDR;
> >>
> >>              /* GPIO CD can be set as a wakeup source */
> >> -            host->mmc->caps |= MMC_CAP_CD_WAKE;
> >> +            if (!(imx_data->socdata->flags & ESDHC_FLAG_SKIP_CD_WAKE))
> >> +                    host->mmc->caps |= MMC_CAP_CD_WAKE;
> >>
> >>              if (!(imx_data->socdata->flags & ESDHC_FLAG_HS200))
> >>                      host->quirks2 |= SDHCI_QUIRK2_BROKEN_HS200;
> >
>
