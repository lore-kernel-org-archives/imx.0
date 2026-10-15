Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E0445AE7
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098998; cv=pass; b=qPGqBKlMfAUWpzdeJaHF7iVZbQfhSL618i/8ARQZ3cFI7nOVmE9JnpJJX7RNfYykCg+i7hYab/iALgQa0Ree7rwWE8Ni6oDWKDnGD97yZxMQQxbfTn/mOjGrPni4Vss8u5LyY1RtWTCfl0L3aRishEPnz0+iiD5YYtc2w1ZsKXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098998; c=relaxed/simple;
	bh=Yj8ej3HBMwylXx0QuhOi40Co/oMLqb7i/qo+mVXTbS8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GoOeLc2MVdEmxaoaa3wb3zwcWKirlyIM/A8gqY50NQnKYpwPGUjJyLpfwjRKMwKJnYR3phABSX2OikkM56Gv+lMDbHtpP2H9cvypwG1t2mhE7H+uhDU5Hi9iMbG+VRfgOct8TcViq7ilvdFu5Txc+qlEe3ab38qIEAYCzt/a7F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=Do35teev; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=IR5/yIam; arc=pass smtp.client-ip=185.56.87.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="Do35teev";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="IR5/yIam"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-jwc0.prod.antispam.mailspamprotection.com; s=arckey; t=1792098993;
	 b=JZx1IbGYmlLohlnXQ53ALwxJReJYResxx9vecNd7EZJo9k12qy4teGF1G+Lzny6yUfRP8RVn72
	  Q1oyrcclHzP/Rp+9N5i2u6TxOpATdwp6SYjffoa7/pAlzcpDAXexutgyFxR7I/ee6bpmEs3qjk
	  x2yuFOjNto0sosXc4hC00PtirURUzfqPNiFHMpGPAnzPt6+F1o1zSMq/V7lETXlpvFHDKXgco0
	  y5hkyO3bz1jvGYJVJw7I2MUhRMHJ2zg1eBxQPZhjqOFEoWk1Sdj0ct+d3gHlgRokfGuO/7ZUjb
	  AUXJtqwFpDWdxGpQblzyk+L80IYe40XfZ1DlrH2WUAAi8A==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-jwc0.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-jwc0.prod.antispam.mailspamprotection.com; s=arckey; t=1792098993;
	bh=Yj8ej3HBMwylXx0QuhOi40Co/oMLqb7i/qo+mVXTbS8=;
	h=Message-ID:Date:References:In-Reply-To:Cc:To:From:Subject:
	  Content-Transfer-Encoding:Content-Type:MIME-Version:DKIM-Signature:
	  DKIM-Signature;
	b=F8rUAOnsCWLJTbX/mciPvs5pv0r59Im20Vt718TyPlnx6H+A6CXAszKGM/LxJziL2Z49ra2m9O
	  NcnxlxwE/dIF6CoBk11pFc96cZolHjBiWssgh3/R+fzUDnkx9DPapNA+nYX5p4ZYQIMJZMLLBM
	  2Yzb+oETylTf0O1l1HZoGv4ANJnM/X+dnguY68AoJ+gdF0+5poSKCTaPe3kEYxEbKM4J4iniSL
	  2JWqP/63RzgzuT27ZIMVHfUbIylR/ZyNWNSq69WeKJO0a53zKdZwBFBk+DLi7B/L4DLHhaQZFO
	  ZgY8+1RgLyLgzEV9ETy5eonB+8FyQOhtsqeRafmieNLyvQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Message-Id:Date:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:List-Unsubscribe;
	bh=9EM0isG1R2tZbZPOEASuzPFyGqzGhpBbd9nur44vny0=; b=Do35teevYF60CrYsvy/ayM9gKZ
	EKvwCXNE/asoLFrzj1Qjfcje0RpklHk4MU62AhBhwRpy7ITp5evIJo0FEk3B1KAz4lik2Yg5xBDMr
	mBN9CLBFz5BT793mHpCFIfVRPkKnIrouW5vJ3B461buY2PYVgQZkDAT8R2pf5xREy+B4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-jwc0.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xHS2r-0000000CZ52-0KWq
	for imx@lists.linux.dev;
	Thu, 15 Oct 2026 20:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Cc:To:From:Subject:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=9EM0isG1R2tZbZPOEASuzPFyGqzGhpBbd9nur44vny0=; b=IR5/yIam9SRLwaZzPBIrk6qjNc
	lw49C0/GBY/dgfo3XEngJyFDBhM1eMrF0dBZYXdjAxHcqYQJhi9vM+v/mf6JqhL/vrCQDRcq4hZzl
	YcC6I3bVytXQj9cNjbe8Nn4zGoNSr7JIgpGmG++y0XtKYweu+9kuPcP0vDCY/3OfhwL4=;
Received: from [82.89.62.246] (port=63238 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xHS2Y-00000000KBz-4A5Q;
	Thu, 15 Oct 2026 20:27:03 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rpoc: use memory-region-names
 to avoid hidden ABI
From: Francesco Valla <francesco@valla.it>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261015-memory-region-name-v5-2-abc358b39a96@nxp.com>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
 <20261015-memory-region-name-v5-2-abc358b39a96@nxp.com>
Date: Thu, 15 Oct 2026 22:26:51 +0200
Message-Id: <179209601177.660553.12335999939165725188.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3455; i=francesco@valla.it;
 h=from:subject:message-id; bh=Yj8ej3HBMwylXx0QuhOi40Co/oMLqb7i/qo+mVXTbS8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkXzQV8zrGv3qFZvuHfdcavcw5JyGvE3t2hvkJCM9fhb
 +PzUNfHHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEek4yMpxxmVPFv+RHypGZ
 qkITFfPtpv8Nsglj8Te+cLinoCd7zQVGhp+Pr93cETK5eUfDuh3JS/e7fTi2Yds144OXmJpNHho
 dMeACAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 4dec76dd51ab44a3b1f0187e7c1cb751
X-AntiAbuse: ID - 4dec76dd51ab44a3b1f0187e7c1cb751
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xHS2r-0000000CZ52-0KWq-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-jwc0.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Frank,

> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 745ce52cd822..ce9bdfc1fa98 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -643,7 +643,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -818,11 +818,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 0d7d48352a10..3632bc375c71 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -7,6 +7,8 @@
>  #ifndef _IMX_RPROC_H
>  #define _IMX_RPROC_H
>  
> +#include <linux/of_reserved_mem.h>
> +
>  /* address translation table */
>  struct imx_rproc_att {
>  	u32 da;	/* device address (From Cortex M4 view)*/
> @@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
>  	u32				reset_vector_mask;
>  };
>  
> +static inline int imx_rproc_rmem_to_resource(struct device_node *np,
> +					     int index,
> +					     struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +

Shouldn't this be a regular function in imx_rproc.c instead of being
defined as inline here? Keeping it in the driver source file would
probably make the logic easier to follow, also considering that the
presence of memory-region-names is evaluated there in
imx_rproc_addr_init().

>  #endif /* _IMX_RPROC_H */

Regards,
Francesco

-- 
Francesco Valla <francesco@valla.it>
