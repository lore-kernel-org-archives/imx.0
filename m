Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1825027FB0E
	for <imx@lists.linux.dev>; Tue,  6 May 2025 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534988; cv=none; b=PL9LONrPM7tjb+qcsKea5Vd4AIfk1fEhT+M6BbtBOFi2CQMYO1ermftemwt7BrEp/vyvx7nyL3Cq9TabGwOPTOJvLH0LszEgsQIIc50HuZOXNYHDJmJqeQtZW5uquANSA/6pbivEje1MnpxPcMMYlS3nS/0LE97K20n+mxYUNIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534988; c=relaxed/simple;
	bh=X4Yh3JtCRkiQP87Dxdyse/UwWkT9JwNjx0Xs4dHDkSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MX+Zck0xKFYWXoyf21wrG53sO9m2FhN++ZBT7TNNywL9SZIkE0eZnQXq7b4zTqK563vJm0P2jZv33QVwyjetv1B1NPFJJbipUsW6IU0WMDw/rxLt02sFFNA3saIaLPJXL74mvG+iV0QybC8FJ107Tamg+mTpi2yoY/7eU8bbjEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Urz8EbxZ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Urz8EbxZ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so4499161b3a.3
        for <imx@lists.linux.dev>; Tue, 06 May 2025 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746534986; x=1747139786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fw+usroP3NgOGNx1hpYdeiF4dmvyltKLfFB52iURL84=;
        b=Urz8EbxZShUjI7EsNzxVPwn291kAeprc/ycB2Y5v/1UYm9QxJBZGz85j9vncgYI/PS
         2N4EsNrVb9ZWrAu3+BC7iHzmPTsw7krwyzt0gzCXUcaGqNvfW3acsSVCaD3SEMXSwuur
         JzvvBCgfA9Bdq7S1XyAGHW+53FlHO3n6mxvg7NxotI8NkOG6BI64QL1FgyVaNmN1ihzi
         79UjDS+URwZl48jp1eXKo0/zo+05qrSguZnIMJij3oeEy1P5xEll0wiuxYA0JDaHdRpL
         vl3uof8+WZqcxr47Y5CzTQ7Z1ewdOQqMyX3wE43iCNNQhBIb3bwHp9P56bkdF+czkjSh
         6DIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534986; x=1747139786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw+usroP3NgOGNx1hpYdeiF4dmvyltKLfFB52iURL84=;
        b=OOzA9RLWgNi54JZrfQ3pcqNy61+yx+rbWd5G7YrywowgYMPCPtB7RtJvCkUd0LrZ3d
         WKHW3HzbSMr5xBu/86X7/28arNvE8iAvTaVsPiVqhE1N1T32C+duvxz0j3EqnGYLFLyY
         lfSxD3UlYUWKuYyUh19dU7WikW4JE+h6C99ZordbIayyF1c9Xys4KbKMUe6Y2YyIpHzW
         qQdcwhFrZ251lRahjl7/m4bX2D6lChple+/eHNz4iOl4nST00MNDmdtFZqbUcts9Yslq
         4VXH1elpAEeeUNuvnNquR4hVGUOP5AYo0BeCOQr3GMNt786hSnvDVtbVA/tT5UamIq4n
         LUyw==
X-Forwarded-Encrypted: i=1; AJvYcCXF2Mk93Elq2xZHH8AdkyQSf/jW21vRCrHG1Sm6DNBkV4U23rGUMK8dK7m0bgkBmPBka+c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqQ7Efior3KVf7714bQg9T7BYxDwCg2FFjbIbPVsWrvnXSy/bg
	lOoZqJaNRvNO3TMgBJVOia86ZdUF/rCffZQya3Sd2bonhcWbVKZq
X-Gm-Gg: ASbGncsgIYm7QfsgHj+F5KFH5ztBhPxWrsFr91lLCVUubviBgazwRdBgb4MUHROcpDE
	EnbSRcDKq0LeLlXRqwA/0xhqipG64x4BtA1z7v/juNTwJJIxdO3IUN59/9n93YxpiWrGkMIylHz
	4xCK0N2at9i0tRKIimElYoXZ5eH5C2nCe+61BqbPfDYTQlyYkGntcJsDCFLeS7QToPBtcZ1nOLP
	vKzR0ejLPiHdj2FIhccBKq2DwGR/izc5V4veTOb5WYZPNsBlK2mZgkFijoDGuA5GzOIXTnEepMz
	VGMVh9v7FVyQ5uobaTX6rd45dYt42tmT5v5tBRc=
X-Google-Smtp-Source: AGHT+IELVS4lhs43iILfpwkhJE1qzvUcBDpCZPSr8G03kGFiX1zF+uJrHmJifYxOzwmCsKQfm2eOFA==
X-Received: by 2002:a05:6a00:1d21:b0:736:32d2:aa8e with SMTP id d2e1a72fcca58-74091a1ee5emr3278160b3a.6.1746534986102;
        Tue, 06 May 2025 05:36:26 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7ad6csm9089557b3a.17.2025.05.06.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:36:25 -0700 (PDT)
Date: Tue, 6 May 2025 09:36:19 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3] remoteproc: imx_rproc: skip clock enable when M-core
 is managed by the SCU
Message-ID: <20250506123619.egobussm6b74imso@hiago-nb>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
 <20250505154849.64889-2-hiagofranco@gmail.com>
 <20250506043835.GB24259@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506043835.GB24259@nxa18884-linux>

Hi Peng,

On Tue, May 06, 2025 at 12:38:35PM +0800, Peng Fan wrote:
> On Mon, May 05, 2025 at 12:48:47PM -0300, Hiago De Franco wrote:
> >From: Hiago De Franco <hiago.franco@toradex.com>
> >
> >For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> >before Linux starts (e.g., by the bootloader) and it is being managed by
> >the SCU, the SCFW will not allow the kernel to enable the clock again.
> >This currently causes an SCU fault reset when the M-core is up and
> >running and the kernel boots, resetting the system.
> >
> >Therefore, add a check in the clock enable function to not execute it if
> >the M-core is being managed by the SCU.
> >
> >This change affects only the i.MX8X and i.MX8 family SoCs, as this is
> >under the IMX_RPROC_SCU_API method.
> 
> I would rewrite as below: "
> 
> For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> by the bootloader, M-core and Linux are in same SCFW(System Controller
> Firmware) partition, so linux has permission to control M-core.
> 
> But when M-core is started, the SCFW will automatically enable the clock
> and configure the rate, and any users that wanna to enable the clock
> will get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> gets failure because clk_prepare_enable returns failure. Then
> the power domain of M-core is powered off when M-core is still running,
> SCU(System Controller Unit) will get a fault reset, and system restarts.
> 
> To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> because SCFW automatically enables and configures the clock.
> "
> 
> You may update if you wanna.
> 
> >
> >Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
> 
> -> peng.fan@nxp.com

Thanks for the review, I will update the suggestions on a v2. Meanwhile,
I will wait a little bit for other feedbacks.

> 
> Thanks,
> Peng
> 
> >---
> > drivers/remoteproc/imx_rproc.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >index 74299af1d7f1..627e57a88db2 100644
> >--- a/drivers/remoteproc/imx_rproc.c
> >+++ b/drivers/remoteproc/imx_rproc.c
> >@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> > 	struct device *dev = priv->dev;
> > 	int ret;
> > 
> >-	/* Remote core is not under control of Linux */
> >-	if (dcfg->method == IMX_RPROC_NONE)
> >+	/* Remote core is not under control of Linux or it is managed by SCU API */
> >+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> > 		return 0;
> > 
> > 	priv->clk = devm_clk_get(dev, NULL);
> >-- 
> >2.39.5
> >

Cheers,
Hiago.
