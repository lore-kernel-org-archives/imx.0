Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F98342849C
	for <imx@lists.linux.dev>; Wed, 27 May 2026 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893468; cv=none; b=ebY3BHp2VetKjhVcGwqTjrNAut2Jm1slfXelrgQ1E+UcyDKd5fUwpIZDRHpfg9wJneNsKI9ot+ecxPPUsfLDXiiOqIADtRLayLv998pu7GHpAeSgXF6qcoa10Y54F0Uu7Ep5dYQuX8GTqwcB/HdjhPSlbwvayRh+N6yIcrB0Gkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893468; c=relaxed/simple;
	bh=kfHR1gmdonWK5BA3Mhntt829OrtJVf91xTnsollQ0dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kY6eZF7YDjFD3wdTLQ1E6eOC72LfAD6mbW6SRKVvPq75dEBXIodKNr+/t2f3G5HZ5fKotyeTwtWKgi0PHiKz/zOMG2eCbPzNALuZdoS/7A1ZhVC3uMgwZ0N81B86gg/NSWehqDRF8oJtmk4+wO6sJXqt+mI7JAOE0D7XA9Hfajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liNmjWay; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liNmjWay"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-369002b26f4so6914807a91.3
        for <imx@lists.linux.dev>; Wed, 27 May 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779893466; x=1780498266; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEIMrVYkYuOr/jrT1mpNj0MLt2jx3k0rtw2YLN1SnvI=;
        b=liNmjWay73FBUYD/H9rzlCFRHaShaj8iL78v8xf2+/xqhWQQmzZ98nTIrUEiq3962x
         Wapu5JsnOer9bdJsDztStvOWiHxTUz5cFtZMHsJ9HMLq07IFQHzzbI4faeno8I1td3tH
         OXcz6llH1Y8g+8+t2w5VFlWLLy07RArJw3ryIxU/YYF2pYQEa95TLnNoEyJTOj9GkWN3
         cKSLa6EF7Wimbt3biCGRNGS4nwtJ3yvSiaU6nrRdeyMPM6jGd0hb5WwCPf4RWjpU0Ixk
         l8dfUs1Yj2DEN1/bimVj9LG5RS7kiBI4u1ecJjeobtPot6e9sYOVKq3NfgSkImIEo3Jx
         owgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893466; x=1780498266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEIMrVYkYuOr/jrT1mpNj0MLt2jx3k0rtw2YLN1SnvI=;
        b=YMKgjwU31rSDxLuRsU3XMAwkrI7emmEROnkEktROkS7BOS0b2WZzTRQIp7Z32cQKgS
         7Gh9SsU4iMzJhwconmJjR9btQX5Cw8Kvsd8P1F2UAI1VBVJ0Nsr5T88fln4V5kYnENti
         fhWB0aLnChDOC/nIq5bw7QU9prjMvaY7S62BVViOAxGk0NjL6N7DA9H9S2dSPmUf//uz
         LPG8nRgn2YtjFphJCGp+zbsY7dstEQnyLZhBvWJw1PjOXiiqWPYu5HX3vIsgrZ6CkkSW
         NgNRmoVXK3JWijqeUgv3TBB203w23I71VjzQ4F8V73w8nwj+Wret+jEQZKCYzu60v+Kg
         AWMA==
X-Forwarded-Encrypted: i=1; AFNElJ8kH5Tn3Sb2YtkBIdAY/UIejS9lCGSLCq+2Tw1bD8Lkj4Ep2jBRrnMYUSjOR3tM7akpc68=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxuf27QFtovitfxPPmr6pVOciT6qCChTAMTJx4i2Zjujx0M10Pe
	bVm/C7FKKS3GeceC/PrDkcdxYI72o1va2to5HC5HPgA+zgx/qozmoVlq8xfCgqlIrQo=
X-Gm-Gg: Acq92OHwe00LOg6YTEEBPDRU7Us6G6Zkxc/cW+z9y/9HRAwt15hY0SpgZvkfsHYJ8wq
	RR1OBwPOfmbNJpzzTnc4ASwq671NHgC/+pkUSWQRb1Qu7jKScT1lzQmt21WnYUydEfqKTE/tO8j
	YHQXYeUjhURsTW6pvgcuphnFLtdRsFc99xXemY4EXbOS17v4WnhysJQ77cDCDv2OmK5q20TNaXa
	rS/m4QPPPH1r6g7BPxBAPS03P+kGv/3ToTSV4EZbOAiYY7fxOmIbmxQC6ZwMOmUYeOJd+06WzA7
	rjIgH7SBAfjHR2ve5Xuz2NWIa7Gh/gi6ob9ja7qwLMYawR3cU7hyaSjkzMd1g4BfO/MB7Cla/3+
	I1G1aXnspbRggJ8+XIM8z0AzUyKQa2zJTX0oxNDi8DvJrNx3U1t4QtSp9eemDI0MEN8zTxWa9Br
	mYQz2iCe9CkC44FtmsHHOYqlVg/fqXSBuQYWC8Lw==
X-Received: by 2002:a17:90b:4e84:b0:369:946d:32fa with SMTP id 98e67ed59e1d1-36a676ee27amr23018294a91.5.1779893466401;
        Wed, 27 May 2026 07:51:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b24d2feeasm1410665a91.1.2026.05.27.07.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:51:05 -0700 (PDT)
Date: Wed, 27 May 2026 08:51:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, geert+renesas@glider.be, magnus.damm@gmail.com,
	patrice.chotard@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, tanmay.shah@amd.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/5] remoteproc: add common wc-ioremap carveout
 callbacks
Message-ID: <ahcE1ixlIXJ6wJ7B@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-2-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-2-ben.levinsky@amd.com>

On Thu, May 14, 2026 at 09:21:25AM -0700, Ben Levinsky wrote:
> Several remoteproc drivers open-code the same ioremap_wc() and
> iounmap() callbacks for carveout mappings. Add subsystem-private
> helpers in remoteproc_internal.h so those drivers can share the same
> implementation.
> 
> Keep this change behavior-neutral. The helper now emits a common error
> message on ioremap_wc() failure, but leaves mem->is_iomem handling to a
> follow-on patch so that the behavioral change can be justified
> separately.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/remoteproc_internal.h | 28 +++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 0a5e15744b1d..f5b34aabed5b 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -12,8 +12,9 @@
>  #ifndef REMOTEPROC_INTERNAL_H
>  #define REMOTEPROC_INTERNAL_H
>  
> -#include <linux/irqreturn.h>
>  #include <linux/firmware.h>
> +#include <linux/io.h>
> +#include <linux/irqreturn.h>

Why was this header moved down here?

>  
>  struct rproc;
>  
> @@ -122,6 +123,31 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
>  void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
>  void rproc_remove_rvdev(struct rproc_vdev *rvdev);
>  
> +static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> +					     struct rproc_mem_entry *mem)
> +{
> +	void __iomem *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (!va) {
> +		dev_err(&rproc->dev, "Unable to map memory region: %pa+%zx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	mem->va = (__force void *)va;
> +
> +	return 0;
> +}
> +
> +static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
> +					  struct rproc_mem_entry *mem)
> +{
> +	iounmap((__force __iomem void *)mem->va);
> +
> +	return 0;
> +}
> +
>  static inline int rproc_prepare_device(struct rproc *rproc)
>  {
>  	if (rproc->ops->prepare)
> -- 
> 2.34.1
> 
