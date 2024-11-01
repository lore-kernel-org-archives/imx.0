Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5044314F9F8
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455958; cv=none; b=hn91DTBTVxLesgr0q0UkDlmrE2wiJxcMM3JySp6v+vAL3Jq7jilzrslGJR8p0pEYLky55P5aHI2V3QRek58Cj1QWLXv5o8jVKt3qyzWyvjmw+GqbRHes0WCY7mJRajE8Lbzvc4jxpo7dLFA9984rCuBuj+iPBLcuuxnjHguxEMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455958; c=relaxed/simple;
	bh=yuIiWQIQVIhU7vfDuDnYdPcf5S5DWeWy2H04nw9lRHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JI47zlwrjrMkmkE3SegW55LN07mTPB0/SXrIQWsVp37c74AzFyun4caLA/FNrkRFruILYm11srmYAuy2mtqJ0XaYCWyk8xpViHAYJQ/PZO/idqXOYg4Tk7G4wwmVPwxwdK/vu4WLHvGFNBaAGdRGfSuVJA77tFXc+2QjkHUJj/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CCDA4ecL; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CCDA4ecL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TjoYgVMGF5dHOGsBOaliuNtTt9L/SIwKjdLYdKXPZmA=;
	b=CCDA4ecLAXN5DLV7fWt7bWHSjhTrvGKd2VAwGHgXaTyenV8kpYg98+xIi7+wq0
	OSOKZKjeow0MEcGSd3UqtdnZY4/m5gNvNeZMSsxt6EiTmhj8Cga+FUg2NNgM77kK
	vjNZ3ZZvzOGRGnhaZgmMPyRwDxYHJ+L6zrgoDURa51Xso=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHxFl1qSRnZUphAQ--.13690S3;
	Fri, 01 Nov 2024 18:12:07 +0800 (CST)
Date: Fri, 1 Nov 2024 18:12:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] ARM: dts: imx6sx: Remove incorrect mmc fallback
 compatible
Message-ID: <ZySpdcmTQDjIy5i9@dragon>
References: <20241023192638.1214045-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023192638.1214045-1-festevam@gmail.com>
X-CM-TRANSID:M88vCgBHxFl1qSRnZUphAQ--.13690S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW5tFy8Zw4kXryxGr1xKrg_yoWxArg_Z3
	ZYga1kW3yUZF1DX3ZIyrs3KFWSga1kZrWDW3ZxK3yDWanYkwn0qa4fZ3yDZrWjvrZ0yrZF
	qr1DXryDuF1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8RHq7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwCKZWckj-1HagACs6

On Wed, Oct 23, 2024 at 04:26:36PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Per fsl-imx-esdhc.yaml, the correct compatible string for i.MX6SX is:
> 
> compatible = "fsl,imx6sx-usdhc"
> 
> Remove the undocumented "fsl,imx6sl-usdhc" fallback compatible.
> 
> This fixes the following dt-schema warnings:
> 
> mmc@2198000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too long
> 	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too short
> 	'fsl,imx50-esdhc' was expected
> 	...
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied all, thanks!

