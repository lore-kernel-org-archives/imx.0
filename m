Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A94149C6F
	for <imx@lists.linux.dev>; Sat, 25 Jul 2026 20:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785010548; cv=none; b=FCrLpsgzgMrlN96/LiX18vZEJ/i5CZHc5lFL2eKGx0gZ94n909xBJnNwqDUUvVGLcRWWmO2Olvt1ZKNmKUFqYrSQr01Se6Ni0qD0F91V80UJGjIgDNU3x+fc7eg59tPXOpyjaH3WvMjDsowink/6lxeGMm3yiw3nWQXg5xhnkl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785010548; c=relaxed/simple;
	bh=L6T6BGUstnyGuF/7hebstedSlMxJBHXjwMGyJx8FJfg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ujp05Qw3rzQmaNsRgBQ6fCLWxCE2ervNJvBookiyE0Lj13k4HHdxkEzCK95Sw8/B4VxP2UF51vorLIiuPT8XyKeTQDHwAQrTF0MP2HElvhHPK2DwaAB5AYwVEso/7V16MXQgoncoNTZznH3yS5ZeCRsH0X4oatWhxTUeTM+1RKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=0m0LNkJ2; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="0m0LNkJ2"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wniOs-00000001A2n-1h64
	for imx@lists.linux.dev;
	Sat, 25 Jul 2026 21:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=mTm1nATyx1+kuh0kObliD7Qus9swVkLqiGdVoLPb13s=; t=1785009070; x=1786218670; 
	b=0m0LNkJ2ExGnMwyclrSYA1t9N4460OOsvpP8OvTJVdaEKd74zfSGm2BKkofwQuOyRjZCsfvZyE6
	ZPk9Lbf0KzFOdTHwx4b1p5oGa4BXF/9P+JzlT/VkgPfJ/aHh0BbwABJWZwmC6bkAGf3JG7jbTLZAk
	mDQ/74itbF/NE7bBD9rq5D2wXFyygcP2A8441GUmTsLhgQG6d+dJ2vIMzweBB9xmFGqgIWP5Ql5+q
	ChiIekwG9phXBefYU7p8bykeCYEWvjLhCOoKuqwKQby85Q6yL994M3NSg+FTTpXAk31fM6aRHk6qH
	0QXS8g1WEgzDQoQkab9yOAS8EzAwWv8C2t+g==;
Date: Sat, 25 Jul 2026 21:50:55 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: robby.cai@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] regulator: fp9931: Fix Runtime PM usage count
 underflow in v3p3 ops
Message-ID: <20260725215055.6239bae6@akphone>
In-Reply-To: <20260724103441.800522-3-robby.cai@oss.nxp.com>
References: <20260724103441.800522-1-robby.cai@oss.nxp.com>
	<20260724103441.800522-3-robby.cai@oss.nxp.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-alpine-linux-musl)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 18:34:41 +0800
robby.cai@oss.nxp.com wrote:

> From: Robby Cai <robby.cai@nxp.com>
> 
> The fp9931_v3p3_enable() callback acquires a Runtime PM reference
> which remains held until fp9931_v3p3_disable() releases it.
> 
> Device-level Runtime PM lifetime is also managed through the shared
> VCOM enable path: fp9931_set_enable() acquires a reference and
> fp9931_clear_enable() releases it.
> 
> As a result, the Runtime PM usage count may already have reached 0
> before fp9931_v3p3_disable() is invoked. In that case,
> fp9931_v3p3_disable() calls pm_runtime_put_autosuspend() on an
> already-zero count, triggering:
> 
>   fp9931 1-0018: Runtime PM usage count underflow!
> 
> Holding a Runtime PM reference across the V3P3 regulator lifetime is
> unnecessary. V3P3 only needs the device to be runtime-active for the
> duration of the register access.
> 
> Fix this by scoping the Runtime PM reference lifetime to the register
> access itself, pairing pm_runtime_resume_and_get() and
> pm_runtime_put_autosuspend() within each callback.
> 
> Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  drivers/regulator/fp9931.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> index ff743a8b0dfe..0d926546221a 100644
> --- a/drivers/regulator/fp9931.c
> +++ b/drivers/regulator/fp9931.c
> @@ -214,8 +214,7 @@ static int fp9931_v3p3_enable(struct
> regulator_dev *rdev) return ret;
>  
>  	ret = regulator_enable_regmap(rdev);
> -	if (ret < 0)
> -		pm_runtime_put_autosuspend(data->dev);
> +	pm_runtime_put_autosuspend(data->dev);
>  
if autosuspend kicks in, the whole chip will
be powered off, so if no vcom/vposneg is enabled, v3p3 will  also be
disabled. 

Regards,
Andreas
