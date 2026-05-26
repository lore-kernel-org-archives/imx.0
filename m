Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5883D2FF5
	for <imx@lists.linux.dev>; Tue, 26 May 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786467; cv=none; b=MybEyB5R9rV4FnsM/s8up6W9nXFcQwT7eox5xal1VRZ4lTBz9ond0bNna0+vhd72j71vvq9FjOysCCYb6+w2Ha8v+OwKHHOtSl4AK5Ickj5j/YE0tsPfByR4NtUbwV2AZM/DY+QzQs/GSpBBvIT8nOUHr2UiFmCwjUfoGBS59Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786467; c=relaxed/simple;
	bh=Cw7qQeQQxNP9gaYhviwuBr+M6AaX6BcV/cXZTwzw9zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPXfDHiDHQYhiZW1RApD4huY0CCWHHVdeyU52QQISn9wJVfE7g1s5ffclUoBzVusyzkhL0BTIIuV3uuXbJfwlfW8+0WdDji3//7GhTMS4nyxpwCEPUFkFqFwp4IKn/9EilvTu9/DTnWn8Akk2HwIv3+AqntjLejPlqSsLb+7pVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d7GcO/Dm; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d7GcO/Dm"
Date: Tue, 26 May 2026 11:07:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779786463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SnG9nY6P1Yh9vQhr0dwhBTn5IOyza6Sao0bVURL65+0=;
	b=d7GcO/Dmcz+576lhHN37w5VUXKPBU2A7QH8LEUj+15/ls81EcMx+intCC4nmrIbPOYys//
	rWk5kQ9+MBUqKLQ6wzo7Zf5LRugt9CYWOaPDRMEOuRB/+eqBPMLuWzGiiBT+7uHymsXPup
	tXRNf9/UR7YRcVCNP5rmV1G/4qGVZFo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rob Herring (Arm)" <robh@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] soc: imx8m: Fix match data lookup for soc device
Message-ID: <ahViAThsYgcmaxuB@bombadil>
References: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Apr 27, 2026 at 09:01:48AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX8M soc device is registered via platform_device_register_simple(),
> so it is not associated with a Device Tree node and the imx8m_soc_driver
> has no of_match_table.
> 
> As a result, device_get_match_data() always returns NULL when probing
> the soc device.
> 
> Retrieve the match data directly from the machine compatible using
> of_machine_get_match_data(imx8_soc_match), which provides the correct SoC
> data.
> 
> Fixes: 2524b293a59e5 ("soc: imx8m: don't access of_root directly")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for that fix!

Tested-by: Richard Leitner <richard.leitner@linux.dev> # i.MX8MP

regards;rl

> ---
>  drivers/soc/imx/soc-imx8m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 77763a107edbd11302017e3f61ecb4369fda1ab0..fc080e56f50d423b88a673181a6bc986eb4c1691 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -247,7 +247,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	data = device_get_match_data(dev);
> +	data = of_machine_get_match_data(imx8_soc_match);
>  	if (data) {
>  		soc_dev_attr->soc_id = data->name;
>  		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);
> 
> ---
> base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
> change-id: 20260424-soc-imx8m-fix-90d7ce2397f5
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 
> 
