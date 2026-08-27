Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B4F35C185
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842853; cv=pass; b=cNJ5Z9/av8IYQF8kBn8TwdKTp8cvPBam1eC5jPrZb2g5UVqccprSUwfxrUZ2nirSSYmYO3uCwivyev558LoGXI9+xEEr2njRCZfD2F7nyGL3iHL5vTNoGePvw3+8rJ/sR4T+zt/Oi7KOujFhZDDwxfSgTKP7TzAutBd9+zYLVEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842853; c=relaxed/simple;
	bh=W3Ab3yphKMxYz1/8CqZ7FpqnITfODGN1+Yw8aaRTaYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOHiSHOOlOguUAG7+IPGH4/Yt4uo9B3Pbv2jYmVeW5jKvlL0pyKld9ZUwi/ca+K6xyoGxJZn7vQKHWcqy6/4kaZkS+JQcGiocrNa6Jsjs7t/qt+ITDKdpiZV2bkiNGsof57fObG2kNCu3etOgIwzpK0ERosJ934ISZv9cUqWAkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WITlWeT+; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WITlWeT+"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a5f95a879cso9243a12.0
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 08:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842849; cv=none;
        d=google.com; s=arc-20260327;
        b=kjmq3AaWs3u54RxoSTQPuDWhOz3ExNDq5zg/pdvNXVJ76j+Z1YalbUg+osGI/6m30r
         DuXhbAJHKLSpEYr5r9frCT7jn7j+Fg5PfrSD1X/ENw/CZ1w5AlxL97xkSC6nIutKuqPs
         NNkWgqOUV8kvO6QxdJIJtLOipJuibcD/tNabpz4vd3uw97L9SJHbKmiECKKW24cocPN1
         /t5I9bn4HhGEYKEWgCnOKinezlfgdVaf5LTVaU5OePDoZ4LEGbnzmAsrI/sfQDeixTm5
         8O8G4VPE2ee1okaRwWkrBKFDTfmMykhQYvAYXlSn7p1JmAp+4MrONg+i3LCwWW7MHC3Q
         HanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        fh=A3/r5AMDn8pliaPHU9q218cEGy+baM/9c8pcb49Uqhk=;
        b=ZMGUNGYX9u1DlirOYMLwfFI1aCkVLMMuW8HbW5Z9LtbpTAEZ+KqeAi9+V7MPkWkQNd
         XWkilEHXCvxpqHHxT5z0GBhznaG6MuUYartLqzha8UDHc8EZbhoEzuSuuuqu8IVV4eHA
         LpfB0me9j/TjeSYDTFJMiTWkuIQIEicVR3xEWDB6C2HxktaPeXbhPnhVzKzV3qzQ4miq
         ghCraPfW0prycWxHMBJNhkoRWS/YZNDvRnqvYUynQcJBIdeBPX4+GXxNMpQdts/a5ma/
         tee+hYLzW5vI6XPClNTXimFBdg0a/AjzS5AZXdIvxHS0mefSrJSal94Ve0hPZQGxvf8y
         hbZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787842849; x=1788447649; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=WITlWeT+ly6y+hzHu1gJ6kV6m0/zFFOdQRt0ghRPJUc6/12TI/fGKOqhZZi8auErKI
         Iv1k+FYS+ldQEsLIQLNNH9UvYqRNSkeVkcnOZXoMu+86p8TNVjBUTp8+CyaVDHHtkGsx
         S/RCr93F5vaOTA66Rx51dhxgohpm31eRL8+XQhmAUKJPmKdsdYmesN1zdnGMPX0KZH0x
         3OGOHgNE5DVvrbZvAsU80U7OL6uciKnCckpOBHLNaumuAyZl/Tt0ry7ITNZ1HLQ28Pg8
         wotsk738EmCOg8w7w75vo90wbcfttv1icn99sD4gn88sO/6ZJjJstT7v3V2F2SqxArWs
         16JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842849; x=1788447649;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=IKGNciq51QbNZb8D0BynN1tXeV8WUYGObZEr+Q1sZWZGjx73CHcmdDiA5ooFLfYrHb
         mGZs/yPBV1Sg9RFufIRR0lY6RqO2JfdlYs1wxsov2dnReDqjSpjfYBb2KPUtXYYhuKD5
         yxSAp8u/sE+4uHvVC1CUAahZFX0kqPbpG8X7kePdNHeDf98VEYJ/oQJ7ptXde8HrY33j
         +RYjdejP/Gu1Qpsm8T/ApsTjlJipcOCHm0r44a/hYuvvThmERhRTFzR/20hCh3NDGqlV
         pCYvM5KULjkeFcuc+qy8Mo9ytHAAKm0iQnpxKEblsJopiFrnVZ01zqH17x8qaf6Cn7gp
         eCeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7MKn30WYI2Jxb86NqlPAG5CqJK6v2dusQMS9al06YhXUWKg9l7Lt2VLJEUiM2Vjb7dYI=@lists.linux.dev
X-Gm-Message-State: AFuF++nQ4xsEu1iTnZZU1OQ1nW4mJY+m8Pcg8swqxwQKQIZjc/iTZ4Z7
	CqOQfp7K3/R3dicox6refvNy2/wH18sAlYWAZb+xtgXFJw4Lu97Uv3CLpNj2kInDlD0qo8T1w4D
	SMjIRA/0VXlhTTYVRfn5fLn4iPLuKMOd2wi++Hktp
X-Gm-Gg: AR+sD12ydrUZIRmvn16lLjbk0M4KFAJOcyk15TU8ekAi3bfD1u7tqozWcy/2ZHyAriG
	owyloNcCBTTS1UOO5qCv3EAE7/jZUO/PpwjuAOChlHNyeX1wHD7/gOgzoMfkyeaZh1A5tFaGQZ5
	9vNRrwgrXzOB0JOr1uhyXXpPRHhhsYHvFr+UxYitt4knPR8GbzSmPereUnRrkjZqwTm5+N+YM0m
	y5kDgs3X60NHPiaeyxD8NTHsThJZxvUAsLMXsRnX/mgE6z4DiXG27lR7+M5G3YBzWwOBRWAgfi9
	rjjJejVHgzyT3KnPtWfa4sPYzVK2KldsheIUXwkVMaJxRA==
X-Received: by 2002:a05:6402:611:b0:67b:7d05:60b8 with SMTP id
 4fb4d7f45d1cf-6a5f5647937mr53711a12.10.1787842848394; Thu, 27 Aug 2026
 08:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com> <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
In-Reply-To: <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Thu, 27 Aug 2026 23:00:07 +0800
X-Gm-Features: AcwNN1UTquEpZeWJV5own34vt8ybBkfXz7pYThlv5e4VIyfdz2_DSFDAfqeUnxs
Message-ID: <CAE14pddHBP6HMihTePR+-Pqhu2DKjVgRA9++5Epod6TOCLagFw@mail.gmail.com>
Subject: Re: [PATCH 03/10] ufs: host: Add common Hibern8 TX FSM polling helper
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Pedro Sousa <pedrom.sousa@synopsys.com>, clizzi@redhat.com, 
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 26, 2026 at 03:40:41PM +0200, Larisa Grigore wrote:
> [...]
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index c2dafb583cf5..034ee988924a 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -563,6 +564,84 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_pltfrm_remove);
>
> +/**
> + * ufshcd_check_hibern8 - Check if all TX lanes entered Hibern8 state
> + * @hba: host controller instance
> + * @num_lanes: number of TX lanes to check
> + * @timeout_ms: timeout in milliseconds for all lanes
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int ufshcd_check_hibern8(struct ufs_hba *hba, unsigned int num_lanes,
> +                      unsigned int timeout_ms)

Hi Larisa,

Thanks for the great cleanup!

Would you consider moving this helper to drivers/ufs/core/ufshcd.c and
renaming it to ufshcd_dme_check_tx_hibern8()?

Since ufshcd-pltfrm.c primarily handles platform device glue and DT parsing,
polling M-PHY states via DME commands would fit more naturally in the UFS
core. This also keeps layering clean and allows non-platform controllers to
reuse it.

Additionally, the ufshcd_dme_ prefix would align nicely with existing DME
conventions in ufshcd.c while avoiding potential confusion with
ufshcd_is_link_hibern8().

Thank you,
Stanley
