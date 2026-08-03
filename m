Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D3330DEB8
	for <imx@lists.linux.dev>; Mon,  3 Aug 2026 03:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785728140; cv=none; b=CvlmChAs3iFWCxNqVscGaMLKL38cY6QgBuywz145uuS16Uf9oTyFuVQ7ZVIK4/2KTIuTyeAJUUfW9x2hv83T9Ddz0a90WTg9n7X/Qd6R5fUFVunTVDPf5CrtaEqgZ/ScJUfwBOvYjv1hOBJMRA8YnG2HBhjSqxeLs2QsB+pCggM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785728140; c=relaxed/simple;
	bh=eHtBKrBG7qwHA0EOQSRz5IJevoNHw7VlD03vrZ6efek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B3IJu+kOlb0rAj0Bta+VOcHVPGQfOOmK7y7mZTLPl70ve1Q19j1tlZcq4pd1m4R2Z5trGFew7MdsH1ZGW5tufdAjL7Ly7lLTdSEs28K3jPrPV5A1H1Q1/IRkMnqg3L3RSTHHu0llnXmP/sSEMc+z4YluDtJ78gY/Ir3riO/EJ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Td5yGoqg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Td5yGoqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4269A1F000E9;
	Mon,  3 Aug 2026 03:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785728139;
	bh=Z7LgyAHtULynHK12u/9Oy5mYWKj+xVp7CPo5RCtmpH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Td5yGoqgJs/PXYhqcd/X7OiwL2XwV5CPnZ/At5xkpSNr4hzDpahOdjmSZteiWTizl
	 nlodIPJyEdUkY0ij+8r1to1w1rWdWZ6aePugQGY7CJdCs8soCvSVlJTq/vxdKSfYbs
	 29Gsz6Xd5PELe7u7de7Z1YfbLR3yQlypa8v42IUxAaaCNKNqmsgeygDeGALYeQ3I5y
	 X+eNWe56gwVH3G00qenh1RplSRPfJZ4lOrr+e1hMNleUYqPNGJSvHPtTR9y8gBZApj
	 iY0XreeCEaE/fKQxTL5lFsmMi0Zd/d9rRWuYcuxoWbmiOBgnlpfkp9satR4jN0Sxwn
	 b5HzZmtd4zAdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: avoid accessing target registers on
 master-only controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: carlos.song@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260803032705.2250373-1-carlos.song@oss.nxp.com>
References: <20260803032705.2250373-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 03:35:38 +0000
Message-Id: <20260803033539.4269A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing rollback in `lpi2c_imx_register_target()` when `pm_runtime=
_resume_and_get()` fails, leaving a dangling pointer in `lpi2c_imx->target`.
--

--- Patch [1]: [PATCH] i2c: imx-lpi2c: avoid accessing target registers on =
master-only controllers ---
commit c2a5eb969b33b95968f240043a2bfa7ba6e85caf
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: avoid accessing target registers on master-only controllers

This commit reads the VERID register during probe to check for target mode
support. It prevents accessing target registers on master-only controllers
and rejects target registration requests if unsupported.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
[ ... ]
> @@ -1330,6 +1335,10 @@ static int lpi2c_imx_register_target(struct i2c_cl=
ient *client)
>  	struct lpi2c_imx_struct *lpi2c_imx =3D i2c_get_adapdata(client->adapter=
);
>  	int ret;
> =20
> +	/* Reject target-mode registration on controllers that don't support it=
. */
> +	if (!lpi2c_imx->target_supported)
> +		return -EOPNOTSUPP;
> +
>  	if (lpi2c_imx->target)
>  		return -EBUSY;
> =20
>  	lpi2c_imx->target =3D client;
> =20
>  	ret =3D pm_runtime_resume_and_get(lpi2c_imx->adapter.dev.parent);
>  	if (ret < 0) {
>  		dev_err(&lpi2c_imx->adapter.dev, "failed to resume i2c controller");
>  		return ret;
>  	}

[Severity: High]
This is a pre-existing issue, but does this error path leave a dangling
pointer in the controller data?

If pm_runtime_resume_and_get() fails in lpi2c_imx_register_target(), the
function returns without clearing lpi2c_imx->target. Because the registrati=
on
failed, the target driver probe will fail and the i2c_client memory can be
freed (e.g., if dynamically removed or unbound).

Later, if the system is suspended and resumed, lpi2c_resume_noirq() will see
that lpi2c_imx->target is non-NULL and unconditionally dereference it:

drivers/i2c/busses/i2c-imx-lpi2c.c:lpi2c_resume_noirq() {
    ...
    if (lpi2c_imx->target)
        lpi2c_imx_target_init(lpi2c_imx);
    ...
}

Should lpi2c_imx->target be set back to NULL in this error path to avoid a
potential use-after-free crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803032705.2250=
373-1-carlos.song@oss.nxp.com?part=3D1
