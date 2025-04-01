Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53884207E17
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523565; cv=none; b=rJdsXJ6x6FTw0lQpKTjYzRzGWmIFjtkObmodC8q3xaMlX1uu1JaTXaYv04QGDNITCkRFoIJpNy7yZK755wM1Ox+/jul1nhnO76Z70sZi7sxThz4UQ2s4tV5YrIl4/iR9OYMtIVeUCXDzwhPin1qMBp3ZUmCTFzIDRVhb/BEo1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523565; c=relaxed/simple;
	bh=2DTe70VGxuBOt/LP/Qp4+Hu35qgNdvgQcrZCfnEFhzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8tBDhpjzQQqeMgWdnqi0dqP4Xkn4MpWOKtS8DoNnQHitn4DluoAR3s5y2B+CoExLjp9lXM+qv4R2xjREyiUje1cZGO61q10j0DMy7AtjzZ2MaPfco/adEtusJcwzQyQC9N8rkb0BgfjIEmMgMWVh2ZozunGE1Qqm+EHy3FnWxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mGbb+0y8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mGbb+0y8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22438c356c8so112484605ad.1
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743523560; x=1744128360; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuO3JoiBaWEWl3zVvnUtjCtMgfiv8CYDUp0HTVXRARo=;
        b=mGbb+0y8tniAdNvo3sxrhA/rUWaBNAWkM8vcTYSHZ8vXUs6iUZ4RcHPtSesbdca87e
         P5wQe3179Hpv0etxq7xutGHCUM7zxVOGJnH8tFVAOAj2Zlf2Z6jZ9S37wwpeWsr4jTdt
         tHNQeNqcEtaXYtrnZ0lFHiFP9SuAJEQlj//TSQDZBBociCqk0+Lccwx6ejwORuvSIHz+
         p8m+fYr4M1D/aUjzT+a5V1R8ePsLECscAuBUal12Zj5w9CQmwoQ7H/jPQ6hyLL73rQhp
         VPr2g7vmia5yAVNTKdHLqm2X6EEIHCPMQndol8nxo/sHpZol34T9qNG592rnF5jPa6gm
         VRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523560; x=1744128360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuO3JoiBaWEWl3zVvnUtjCtMgfiv8CYDUp0HTVXRARo=;
        b=VqehlABnzsZqbqHEaRrXXMss+oq87Zx66gq9P0y2AiZYSxauY6Mgt93DZYClmR2R0s
         bW0a2arJ0SSBfqk9J0xuJaTgRZMidac+a/lRzz1fbkol12d/DIynEcgfZFeKGrL/OPuh
         fAkyb2kKah29RB5gAX9gY238RfF9k2tr4Rnn9HKm0tqdfhoUu3dXZjUt7C/PjnocdPw5
         zUjVW09rTtPquC3nrYHc6ZoSqW4aXLIpSlxzsU/SNVKmw63SgzcXtGN/iS1VzGIqCgEV
         ZLv0rRlEWnNmLA8IuRH4Abh2YYT9bCehuFuTYZd5Tq/bVbarpCRF4NcY8yX9k+gPrvQF
         KL9g==
X-Forwarded-Encrypted: i=1; AJvYcCXfDwqE5PjH6hdhY+QXzoYmEAfR+oev56Qs8+54Srs7Rw9OFIXbrxVZwIYV9BnygvwLsNM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQod16QD/ru9+RFE5Yi258Db82MXZg0Mp23uO1T46ex6W4ihr0
	rsmk2wNPQI+2FlT/9reMtTDUdo65qCX6zCg15iFm64BJe7j4kIVxkoWp6DR8SBKmFlvE43nH8/K
	3
X-Gm-Gg: ASbGncvIQwvaMxAzrqi01u75qvvhhO6Y0xUZ5yZ6SuMpkvzJJc5noJkB1HyPSF0bcz4
	jP1cnAZlLjMlKQtq1sdV17EtO/BWbQUefDDA5S0/7kOlME3Ol7HTjf0XSPVqwaxdt0nfytWmsoc
	lEBz5iYKyeojmtN3qRrso1uqI8K/BUdawmwP4dCDJpHyE6Di0M/oLtqBfzm9GTOps3oEs8Vk4Ki
	dsHgEkrW4j5SUGpvbHhbo44BWoXKOxC9i6QvylVHeTnwX8b292z/pDDGyExQhMoXs/VUC+o8+HF
	RYnOVozj8Ku1wHwCz06rqu54HAzNSMX846hwNzuqEXVFt49q
X-Google-Smtp-Source: AGHT+IHS665q9tq8I4Rn8gAFViO1Vbyxy5C1fhneAWy0pBzjbtNJpFCpmq60Cuhz94aODSClJDgSTA==
X-Received: by 2002:a05:6a20:2d0c:b0:1f5:a577:dd24 with SMTP id adf61e73a8af0-2009f645311mr20981139637.25.1743523560465;
        Tue, 01 Apr 2025 09:06:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:62bf:3c83:f3df:dc76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af95d59a786sm5788320a12.53.2025.04.01.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:05:59 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:05:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH V2] remoteproc: imx_rproc: Add mutex protection for
 workqueue
Message-ID: <Z-wO5PLU01Nd3QDU@p14s>
References: <20250401140402.3676049-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401140402.3676049-1-peng.fan@oss.nxp.com>

On Tue, Apr 01, 2025 at 10:04:02PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Same as commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex
> protection for workqueue") and commit 35bdafda40cc ("remoteproc:
> stm32_rproc: Add mutex protection for workqueue"), imx_rproc driver
> also has similar issue, although no issue reported until now.
> 
> The workqueue may execute late even after remoteproc is stopped or
> stopping, some resources (rpmsg device and endpoint) have been
> released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> accessing these resources will cause kennel dump.
> 
> Call trace:
>  virtqueue_add_split
>  virtqueue_add_inbuf
>  rpmsg_recv_done
>  vring_interrupt
>  rproc_vq_interrupt
>  imx_rproc_vq_work
>  process_one_work
>  worker_thread
>  kthread
>  ret_from_fork
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Add RPROC_ATTACHED check, because i.MX supports remote cores started by
>  bootloader.
>  Update commit and add R-b from Frank
> 
>  drivers/remoteproc/imx_rproc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

NACK - for the reasons I have explained in "[PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown"


> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..4819a9e57543 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> @@ -785,6 +786,11 @@ static void imx_rproc_vq_work(struct work_struct *work)
>  					      rproc_work);
>  	struct rproc *rproc = priv->rproc;
>  
> +	guard(mutex)(&rproc->lock);
> +
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
> +		return;
> +
>  	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
>  }
>  
> -- 
> 2.37.1
> 
