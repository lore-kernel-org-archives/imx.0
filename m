Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079D74A32
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786178848; cv=none; b=naWw/4ONgDybse8bpV9yFKJbj1XntQDnTaNThv2QXwCveZH72aCTpbSf5/IhNjRIvIEiHCEz6d1nKB3/3mfBWV5WfhpdBOMMZh4w+lw6eQEf8z8UUuefEhXz/eN214AywNkLMqVO+mn8zGLwaE2fDA1ciA5ykaamIZLP7ZLbYrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786178848; c=relaxed/simple;
	bh=iv69zXkdaRf6tFHwuTDzMr6GwPMC/jO181ZfNzbyC8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LmuXhWoXGu2OUVys4MCDjhdeV+kOaD99X6eLf020wkGilNibsDngBb9/ZH5seVyyRvBFJ1Yb7/0z4OnTzHzXSC+Xp8daIyTw1JTkmDatYkPvYhh32G21jD9r3DHrjt+rt8TJwaWPqunz9LdL0O16If0oMFKi5vPTKfvKh9ZFkW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpytLpyW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpytLpyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608471F000E9;
	Sat,  8 Aug 2026 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786178846;
	bh=aP1+Lmnnh2xNPa9QR9rt9r3U2SV7I3t96IbuPcPoCuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GpytLpyWf1L1RN5OPbpEF63GVbg2N47vkAdNcpysLQwcofUbsN+vuBqNT7bVJ9aRy
	 S+Nsu/FO2WSCJdtMbZjHuB5ToRZV7YYJxOy2GyIMJaJIj2NeK2JP3mRNuUXvJcdcZ0
	 znuRA7QZrivms4THvB2cADUerlwLIGfdPTQvJxBinT2lzwkdZmGa2FuIiIAxV6XXjJ
	 ZsESwg+hE2VXro5WY2jk4FS2hfDg6fh3RAbYUDd2qswj/yIlKO6iBGJVLE7UkwYzHs
	 GrfLDWZK9m7onjXjvCbFmNZRiA4egExDzX4saBBuA+zyi4E+tn8KMqFMAFOwV9GQeX
	 7hAATLVmeBGzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: imx: scu: fix autosuspend cleanup on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260808082933.2692878-1-lgs201920130244@gmail.com>
References: <20260808082933.2692878-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 08:47:25 +0000
Message-Id: <20260808084726.608471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete error path cleanup: usage counter leak and unbalanced r=
untime PM disable
--

--- Patch [1]: [PATCH] clk: imx: scu: fix autosuspend cleanup on probe fail=
ure ---
commit be1da3e608e79b11e6b956430089bc533d7bfdbd
Author: Guangshuo Li <lgs201920130244@gmail.com>

clk: imx: scu: fix autosuspend cleanup on probe failure

This commit adds missing calls to pm_runtime_dont_use_autosuspend in the
probe failure paths of the imx-scu clock driver. This prevents an unbalanced
usage counter when the autosuspend delay is set to a negative value.

> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index 9b33df9967ece..6d29fcc2306d8 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c

[ ... ]

> @@ -542,6 +542,7 @@ static int imx_clk_scu_probe(struct platform_device *=
pdev)
>  		ret =3D pm_runtime_resume_and_get(dev);
>  		if (ret) {
>  			pm_genpd_remove_device(dev);
> +			pm_runtime_dont_use_autosuspend(dev);
>  			pm_runtime_disable(dev);
>  			return ret;
>  		}
> @@ -550,6 +551,9 @@ static int imx_clk_scu_probe(struct platform_device *=
pdev)
>  	hw =3D __imx_clk_scu(dev, clk->name, clk->parents, clk->num_parents,
>  			   clk->rsrc, clk->clk_type);
>  	if (IS_ERR(hw)) {
> +		if (!(clk->rsrc =3D=3D IMX_SC_R_A35 || clk->rsrc =3D=3D IMX_SC_R_A53 ||
> +		      clk->rsrc =3D=3D IMX_SC_R_A72))
> +			pm_runtime_dont_use_autosuspend(dev);
>  		pm_runtime_disable(dev);
>  		return PTR_ERR(hw);
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but since this modifies the error
path, is there a missing call to pm_runtime_put_noidle here?

Earlier in imx_clk_scu_probe, for non-CPU clocks, pm_runtime_resume_and_get
is called and increments the usage counter on success. If __imx_clk_scu
subsequently fails, it appears the usage count is leaked, which would
prevent the device and its power domain from ever suspending.

Also, pm_runtime_disable is called unconditionally here, but
pm_runtime_enable was only called if the clock was a non-CPU clock. Does
this cause an unbalanced runtime PM disable depth for CPU clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808082933.2692=
878-1-lgs201920130244@gmail.com?part=3D1
