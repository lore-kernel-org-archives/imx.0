Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545173563CD;
	Wed, 19 Aug 2026 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157058; cv=none; b=bRLCruCeuKgmSBAO0HgWrWWukk1ti8+DJoP3IMurs6eGkuCP+rY2LMxWIhymNJrk2hygxCwRKRd7UHpNuhNKhvBseIpJ2rqcpKc3laDRZdTMmgq9BULkiVgjexOBbSe5EU+iw5jkWNGztTVgcMDoiQXeRgl5PkjE2RJ7oXou+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157058; c=relaxed/simple;
	bh=nZsPelZGLbrxWiLZowqOpvFYfN+JGYkKEyrm1/uWBGc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RIkRhFdwjxuIjcA6QhwTvE52ZuCC+kkoJLB2FFdV6hRsHKCOUPij6htjQY4s/6mvdpQulwuj8Zw7bxttVB9B2MObB0iWnQPwii5qaxZktvplcWbxS+8TnEuUHzA6RnOrC8znS3yMcB3lno3Jp99DNSeEA13VWDa3KmJfngwQ/7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtyWU6vD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtyWU6vD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010391F000E9;
	Wed, 19 Aug 2026 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787157056;
	bh=+Zpl7Coq0mwV1bC2qHj28NxA+DIWTFkgsLUPDBp4G5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FtyWU6vDhIIYOZjLsztwDicHKWUcE+xh/XPd+Qud8/7re/ynxKXq5C9z7M1IRiTZ5
	 zSknJSvz7Im4cworHnWEAjSru9xFhMtLSYFOLU8VNxSNNWS0y9UjpIVI/gUq1MbiTD
	 B4a4Ay3CvLn7Q9RQ4pTSWdDVf0p3hGbUXIi+JcQCgR+0DCBJPFoKLYmH9CWvUr14iv
	 0fLXY3Dgtuy1PXfuXgemItplzPffgplULQfFRlrhP98kh2QJVU6fPsU8iRsbK/L2UE
	 aAtapfaw5O/+Agke2oQjxyJtvAj90mf5LwNi3LQoWZYCBDhi0DarHFK87/dXEXdBu3
	 zSwP8qMsccbvQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhipeng.wang_1@oss.nxp.com, Marc Zyngier <maz@kernel.org>, Frank Li
 <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/5] irqchip/imx-irqsteer: Allow building as module
In-Reply-To: <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-6-Zhipeng.wang_1@oss.nxp.com>
Date: Wed, 19 Aug 2026 18:30:53 +0200
Message-ID: <87qzjujcn6.ffs@fw13>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 19 2026 at 18:05, Zhipeng wrote:
> From: Jindong Yue <jindong.yue@nxp.com>
>
> Make the driver buildable as a module by turning the Kconfig symbol into
> a tristate and using module_platform_driver() instead of
> builtin_platform_driver().

That's not what the patch does.

>  	/* steer all IRQs into configured channel */
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> @@ -271,12 +266,21 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, data);
>  
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);

All these prerequisite changes to make it possible want to be in a
separate patch and not cobbled together with the module changes.

