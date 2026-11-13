Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572362;
	b=Ist4X1VDt3NSXiuo4ghUr0iDEvvwGAEYApl4QdMSkUS+j7+p6rp3DwWKzydHjyvhwpML
	 fX4MLGI0SQQx+PsEwT3lSj7pv4E8CzWV3OwMsQJh9N7Yuon7JzseCzDj1UEADQEnCkY/2
	 5vwPX92W5x3djMMygj4ZZzWsevntOxbvLovRJI4G30xk9EIRl2pa0uCbhdb1VWXFY4CMJ
	 K+qsLvSXUMdc2m7DxkW3kZBMGw63yV4Be3RBgyOLQmcwUAmUWqvOj30KF1NYAy/fqBZNV
	 69KzLyRJ2Z98cwr1iCDb1nZTO8N/+Snz6wTuOCAmFGIc3WEhQ8p7UtNBQVunl/1PFRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=NInaYM5/ulsk78/rKQK71fJZph826pB2bolPCV0acww=;
	b=dRQrF8F3G3oaIYvtdTyuCjnvrzkO2SFFlUfWlX1enJ09cwA8t+SaHFiXRycX836Uj0IJ
	 z/1c5kN+z6QnM4vX/VTAgU2yzNATfY6u1tqlwdqcHTWvESGIV0QwEz+W7czB6ck+Rqk65
	 qOf8qyC7yL7PIQkIny0nYrzUa6YpFHssExxUpLZ1QZ+EDMzevxrlAkmQO9fCYieunL5ff
	 090SApKmZTKTM9eRU+iM5k76IH5Lw9qIv7dvUxJC6PhQ7V4U8LYk17k5SHKBIB3pMKfv+
	 0LwfpLa1Gt2HeIvi2kA2X5Co4j1oolxzRoeLBqCJ/lVMq5Qa/lEW9jk5jvkZTFZdroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=(null) smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=E1IES2KV;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A55F606A327
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 12:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A55F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=E1IES2KV
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 58E4F14C2D6;
	Fri, 13 Nov 2026 13:19:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1794572351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NInaYM5/ulsk78/rKQK71fJZph826pB2bolPCV0acww=;
	b=E1IES2KVgYEB6pOuIqY3HGLBMX1AFtAm0XtC08mfjPnUlijVCi7/vHqpOvEHcBDRZ3KJQa
	iDJ7mpQjjNoha05y5p1VK+S57OcLA5AR9x9zV+6jd3rt96pj1iKJljZctBdaI2kEduObrJ
	k3hlUmlXS+nfzkShN13dZgVlh9kAv3NyLsP1zhNc1iPysCy0w/U4l1f+YR88lvVOZ6XLId
	TEThieEH4us11BfqoC9CRavIV2DKviKArlyArxIVgtDvhIozTenJ3eOtH9RbchW9cp7tVp
	Jcsd8U4GkSck9wq3bkWB3nCoj4RdiNf86lspYpMTy15LOQ3N3plt1lKa4JEB4Q==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 284c54b0;
	Fri, 13 Nov 2026 12:19:04 +0000 (UTC)
Date: Fri, 13 Nov 2026 21:18:49 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Jiawen Liu <1298662399@qq.com>
Cc: broonie@kernel.org, cl634@andestech.com, william.zhang@broadcom.com,
	kursad.oney@broadcom.com, jonas.gorski@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com,
	f.fainelli@gmail.com, rafal@milecki.pl, olteanv@gmail.com,
	han.xu@nxp.com, haibo.chen@nxp.com, yogeshgaur.83@gmail.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/4] spi: nxp-fspi: disable runtime PM on probe failures
Message-ID: <avcAKdwmS3nZ2Uk_@codewreck.org>
References: <20260620083931.1120616-1-1298662399@qq.com>
 <tencent_8FC0B8DFAF4AE67AEBA20548045D53A77707@qq.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_8FC0B8DFAF4AE67AEBA20548045D53A77707@qq.com>

Jiawen Liu wrote on Sat, Jun 20, 2026 at 12:39:31PM +0400:
> @@ -1389,6 +1397,11 @@ static int nxp_fspi_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	return devm_spi_register_controller(&pdev->dev, ctlr);

Should failures in devm_spi_register_controller() also go through the
error path, or is the current code as intended?
e.g. something like
---
ret = devm_spi_register_controller(&pdev->dev, ctlr);
if (ret)
	goto err_disable_pm;
return 0;
---

> +
> +err_disable_pm:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +	return ret;
>  }
>  
>  static int nxp_fspi_runtime_suspend(struct device *dev)

-- 
Dominique Martinet | Asmadeus
