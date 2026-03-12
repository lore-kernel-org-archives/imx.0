Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB13FB7D2
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773340566; cv=none; b=IczijsCVHfiF8iMtsCQQFMa32/esC/5qPMjcAuCnmxN7ukzrOFE6FZQnBiCacUEe2LcT7ddvSHIrbX8nzFkYkfNrFf+j8zuJjl7dNg8EefkP+jkP81m4gGtiTWukCzlyihukx4J7z2k2C3oHlqlcKIJWin0EPhfymXn34w909WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773340566; c=relaxed/simple;
	bh=yBqKKMqeIBu59iWlGfEU+INdGteO/IZPziJ8BAbkLSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QqCHf2h9P5AV7jHcRvlS/e/zscmuGakMpQNJvqDA9/7jsIB/2jzhbCGAHc00jb7WVp4DYYTeOLDawL6FS5SqblDkZjt+JOXVfO8DaG1BXDAs9r12ppAQzxz+wzcDimrep0iZeCaKjlKYjkaETLFfZeLJXy3R5+WrBf7gBn21mo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Ic9kF2wi; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Ic9kF2wi"
Received: from mail.andi.de1.cc ([178.238.236.174])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1w0kLS-0000000B0Ta-0ZYM
	for imx@lists.linux.dev;
	Thu, 12 Mar 2026 19:01:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Nbwsy40PmXOadyRc7MITbgYnEQv+lI4eQWK0od+1Taw=; b=Ic9kF2wiCpYjiNtwbkAr6hbfv0
	FRAEMDyuOe5lRiMBmUmX/cyCXepgPBO5xl3AAUH9fFqd+Di8v+Wpc4pwXQM70kPGyei/Ep+wN/CF8
	y1bLfiKuJxA1eQhpHlnHoN19PWddvXzrlXtXv7UgHEFil3q7cW2RwF2HU3ZsmR/WZJICkGgMSbiKJ
	Kb/YxMCN65cbtvZdK/+hvc2vv6ZqCo2c/T7XLjPk0djyAwr4C/w+nApx6InwcLyZm8YwCjt/9fe6X
	G+yCDSgX40WeNxUxuGXSjLjQN1yHvT9BThdabVYiHuc8TGkGrvoiakV8VQKLvb71omQg5set+twZo
	f1LHFGtw==;
Date: Thu, 12 Mar 2026 18:58:54 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Robby Cai <robby.cai@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: fp9931: Fix error handling for optional
 regulator
Message-ID: <20260312185854.75e7a7be@kemnade.info>
In-Reply-To: <20260312040148.GA4007088@shlinux88>
References: <20260312040148.GA4007088@shlinux88>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Mar 2026 12:01:48 +0800
Robby Cai <robby.cai@nxp.com> wrote:

> If "vin" reg does not exist in the device tree, the regulator framework
> returns -ENODEV, which is normal for an optional supply. But the current
> code treats -ENODEV as a fatal error, causing the driver probe to fail.
> This patch fixes that by handling -ENODEV correctly for optional regulator.
> 
> Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  drivers/regulator/fp9931.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> index 7fbcc6327cc63..fa7f32adfb666 100644
> --- a/drivers/regulator/fp9931.c
> +++ b/drivers/regulator/fp9931.c
> @@ -448,9 +448,13 @@ static int fp9931_probe(struct i2c_client *client)
>  				     "failed to allocate regmap!\n");
>  
>  	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");

looking at that thing again. I think I have abused the optional api.
Of course this chip needs a supply. It may be hardwired so something
not switchable. But that needs to be wired to something... So I think
rather the _optional is wrong here.

Regards,
Andreas
