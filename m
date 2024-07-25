Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B944F1E895
	for <imx@lists.linux.dev>; Thu, 25 Jul 2024 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721920874; cv=none; b=f+s+ml2NNuyx9oAcuKTnZ5WKfER8yXNB38attDMwoRptTL2OVEzndHOWqLtaX2sgKwgUBBaFZ8jko+XL1sjuCFD92e81Bo0/BrR/GlZ+YBS+GxWk86PkqJEUUdUBy9uhUGsmK/0JLrv1YsOFmDKuG4DAQwbgylukq2Ex8qNEn9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721920874; c=relaxed/simple;
	bh=BACA7lc/U3kuyTopB/C6+lFqL+M0+mPuPcll+QYABvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pyjXERXFwxx9dNNq196RTSnUXcm70GWb/s559G7lRhvQIN2h0vhd2izq14Pok5IRmSpka13zYKgaHzdfqUUzZcdp6+HHRMbZAhA4BkCEMmb4iSzjYUNojc8AkWldBdaOqAs1WgmN7xN9WBO2g/fjsirIz6jI+HGOoMU82XMGGfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljp0mfWa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljp0mfWa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4272738eb9eso8160075e9.3
        for <imx@lists.linux.dev>; Thu, 25 Jul 2024 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721920871; x=1722525671; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2eq6cgeg4tjNK/UJ0dS0DsHH+PJFVARgjid38ZB1fJQ=;
        b=ljp0mfWak2RkIgGV8++ojohMOEzDP6MwwCnQSrf8Ez47YiffPqCqlYlQhUjRratKQO
         LINb8cTocBgUfbcWmLZ19WUW5MY5jh8mbOlftklmGpNEkn6nqrQP4cz2s/mQQHO9q7Og
         s2lom1sgMDO4vImbUNiOo/zzjbjajM5H3vU6yGFf4ynKwKwiTjpgcK29i7+NrxUUcVQh
         aMMfYq5G656zPivVBAt3Oys2TcSVm3POYO2OicDYKyvJBCLNOTKg97MP2Ve93W1CxTRU
         AQ22kLzaHHwkHdOe31UUVS2wjQrqFzIi3mpH0+ksj2nIj2iy2BBHQYWqlBO/tgHZWs8C
         454Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721920871; x=1722525671;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eq6cgeg4tjNK/UJ0dS0DsHH+PJFVARgjid38ZB1fJQ=;
        b=dRA9dji0UmPUdUxZ1z0NK0gCjTEeyaWtLXlqz/2s7badyorY9Mmlm78NdGwMw5GOji
         PLihif7ErwAG+4dpqCIuSwlzXeShiCrsmTpBbq0+GCKR2ykv223ljdQxrjx7Emz9+lzS
         5ra8xY0kBZ2ztxPcFr3o/olj0I4seUfU6KWEp8lQqwy1nuvkcSM1GrcDPfuCa97klpuA
         7yowtSo9yF/uJpc8CVPNPEsquXiBamGgop4IYyamKNxNNt2e/jNIvWLZyaVe2G+EwA+G
         XUzO21hvYAbdilCxk/PBHZHvScsszeUD3GHUkREJ2WQrrwpRItKbs/0ryeXJEpBkQRVO
         2HKA==
X-Forwarded-Encrypted: i=1; AJvYcCXpc839CRXpYVNHbhQ/EQLqON3mCbKhCTqd8D/tYwhwI85T3UXd9zIFuvOSEyQBThgUBKFy2xqbwyViMuJnZxgnlzlc
X-Gm-Message-State: AOJu0YzjgSVfeXGjiNTdFpnfB/DkTHkakFgVUnU7jTmGAdYcMYL0MWvm
	gsCKLAvMSqx/EyCCV2R1G6QeYTkk22/D/bFaBK9v7WH6LYXbYxt+
X-Google-Smtp-Source: AGHT+IFRSWnlAYYHtp7B9TX/pm1tmW2wA1dlSwpQdMVtFjf9eyzO/iDYb0W5WyvQviIngjgeTfAO0g==
X-Received: by 2002:a05:600c:1f8c:b0:426:5ee5:3130 with SMTP id 5b1f17b1804b1-4280550879dmr16655795e9.3.1721920870644;
        Thu, 25 Jul 2024 08:21:10 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f935933csm81735615e9.7.2024.07.25.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 08:21:10 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Matthias Fend <matthias.fend@emfend.at>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Martin Kepplinger
 <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx-mipi-csis: avoid logging while holding spinlock
In-Reply-To: <20240723060909.534584-1-matthias.fend@emfend.at>
References: <20240723060909.534584-1-matthias.fend@emfend.at>
Date: Thu, 25 Jul 2024 16:21:09 +0100
Message-ID: <m3wml9mra2.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hey Matthias,
Many thanks for the patch.

Matthias Fend <matthias.fend@emfend.at> writes:

> Refactor mipi_csis_log_counters() to prevent calling dev_info() while
> IRQs are disabled. This reduces crucial IRQs off time to a bare minimum.
>
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>

LGTM

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui


> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index f49b06978f14..0c34d316ed29 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -857,18 +857,21 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
>  {
>  	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
>  				: MIPI_CSIS_NUM_EVENTS - 8;
> +	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
>  	unsigned long flags;
>  	unsigned int i;
>  
>  	spin_lock_irqsave(&csis->slock, flags);
> +	for (i = 0; i < num_events; ++i)
> +		counters[i] =  csis->events[i].counter;
> +	spin_unlock_irqrestore(&csis->slock, flags);
>  
>  	for (i = 0; i < num_events; ++i) {
> -		if (csis->events[i].counter > 0 || csis->debug.enable)
> +		if (counters[i] > 0 || csis->debug.enable)
>  			dev_info(csis->dev, "%s events: %d\n",
>  				 csis->events[i].name,
> -				 csis->events[i].counter);
> +				 counters[i]);
>  	}
> -	spin_unlock_irqrestore(&csis->slock, flags);
>  }
>  
>  static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
> -- 
> 2.25.1
