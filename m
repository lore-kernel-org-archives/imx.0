Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12373F4847
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226894; cv=none; b=r0uf+67fT4jJyMeYgF4KzP/Z/7JN08Sk/ImMTj24Lp+5Le8sRi77Wdj3IhnM8+/bgey3Sm3zi4sswU+fqsslmUzHdKuWHLizDVaan0eqAECdd0Jc/JQNYFg0xIDxLpqKeDtpRLDgeq/HM3X7aJFYD5pFZ2OVAloh98U+RXWiu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226894; c=relaxed/simple;
	bh=Al1sfcHlsp7R5ndyshUbLJVKc5dC9/9uVgWApRCxPvY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UEM1JjVKPZT2HlHj0BDgstaSXUFaG+mJb+Nc7ZX7b6XrZ8fsN/xU9UlCv/AMhamJlj9WdlGMUV71jwaAC+Yd8XRAnhl3yekMq6/gH9JR58FzXTZEZWR7TFub6+7SU4oJHmYn1lVyKEpvRXGtd8p5dsS8gu58IGYrChzL/nrFfZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG4hAzh6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG4hAzh6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C72B1F00A3A;
	Tue, 28 Jul 2026 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785226892;
	bh=IPhaT9ws46ZJzhHzDD/wJVuKyeKy4BO4OUi5LrAziN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PG4hAzh6/EjnXdgv8qDdHY6iWiWrIcXL22pf0UGqb30dpj7yCc2oxwzQptIqBepjW
	 puEbhmvgKqNWmFH8PwxgQIM/qk1ABEA+4kH1k3LfPnMh+8ykckbsJ5pXpN5yowwtVy
	 BtM3Gi+w3vzFpKDihZRaPfMswrnfpXd/YF7kEAJ744bhhth2LWdhos9fGzCMOIpoJa
	 lC5SHhkv7dxH8nIt9gtYm4JxXHouh2Y+2kSOXpEzMi9nkYIpRAxb0hqml8VBvsK5G1
	 utAnHtVXMzpv8ws3EGGpbmyWjpq+Z48doAjHeQK0VndhSigcVBtV+m9+GD5BUafNzl
	 YFbxQ2j24TMUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] spi: nxp-fspi: check runtime PM get in cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_9A37C7A91DB0EF57A552A99EAC881CD24605@qq.com>
References: <20260728080443.153827-1-1298662399@qq.com>
 <tencent_9A37C7A91DB0EF57A552A99EAC881CD24605@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:21:30 +0000
Message-Id: <20260728082131.9C72B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Asynchronous runtime PM put in cleanup path causes a race conditio=
n leading to double clock disable.
--

--- Patch [3]: [PATCH v2 3/3] spi: nxp-fspi: check runtime PM get in cleanu=
p ---
commit 7a9a4bc911b3e8e33c657c1f4c72809d1937328c
Author: Jiawen Liu <1298662399@qq.com>

spi: nxp-fspi: check runtime PM get in cleanup

This commit updates nxp_fspi_cleanup() to use PM_RUNTIME_ACQUIRE() to
safely check the result of the runtime PM get operation. If the device
fails to resume, it skips the MMIO write that disables the hardware.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 3f1c3ed748eba..2671ffb490968 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -1268,14 +1268,21 @@ static void nxp_fspi_cleanup(void *data)
>  {
>  	struct nxp_fspi *f =3D data;
> +	int ret;
> =20
> -	/* enable clock first since there is register access */
> -	pm_runtime_get_sync(f->dev);
> +	{
> +		/* enable clock first since there is register access */
> +		PM_RUNTIME_ACQUIRE(f->dev, pm);
> =20
> -	/* disable the hardware */
> -	fspi_writel(f, FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
> +		ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +		if (ret < 0) {
> +			dev_warn(f->dev, "Failed to enable clock for cleanup: %d\n", ret);
> +		} else {
> +			/* disable the hardware */
> +			fspi_writel(f, FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
> +		}
> +	}

[Severity: High]
Could this scope-based PM_RUNTIME_ACQUIRE() introduce a race condition?

The PM_RUNTIME_ACQUIRE() macro acts as a guard that calls an asynchronous
pm_runtime_put() when it goes out of scope at the end of this block.

Because it is asynchronous, the queued suspend could execute concurrently
and call nxp_fspi_runtime_suspend(), which disables the clocks.

Meanwhile, the cleanup thread immediately proceeds to explicitly call
nxp_fspi_clk_disable_unprep(f), which could result in a concurrent double
clock disable and trigger a common clock framework warning.

Additionally, using an asynchronous put just before device removal or
pm_runtime_disable() means the pending suspend work might be cancelled
by __pm_runtime_barrier(). Does this leave the PM core thinking the device
is active while its hardware clocks have been manually turned off?

> -	pm_runtime_put_noidle(f->dev);
>  	nxp_fspi_clk_disable_unprep(f);
> =20
>  	if (f->ahb_addr)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728080443.1538=
27-1-1298662399@qq.com?part=3D3
