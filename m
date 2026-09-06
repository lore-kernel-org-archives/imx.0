Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A13C13E6
	for <imx@lists.linux.dev>; Sun,  6 Sep 2026 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666629; cv=none; b=G+1LaTsFA0trIhFkXX0l2w2pIZEbQSjS8BQYo25Tj7COltU28tcQquxHJQogpyQ7uOpthWkU03osMOzhGv7gFz6mpJpmxxK13rCZMzvn64IILRUOs+qzcHBHxjEr7sHPS4EgI6PPonLSYibnSgdCbM+NCD/yD2HvMCsx32gGf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666629; c=relaxed/simple;
	bh=WkLAqk2c+85zeu7Y+YtsBz7BxoPwAsqCeW7RmBWA2Pg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HUlvu7POzKKwAS1gwct9Aon3ghvlW8+Ax1JlF1gkMaOfDR6oo+hsSDcJ4vlDwJ09Z03hap5R1Zdq28VdEmMvPo/3LuoeFL2igmuCuqZ6FMhwoEGzhQYzS+/Zr8seCv1air3pA/If30PTnRo9nknuT9lWM0COhLWFpq8g7Hj6wh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1PdNaAb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1PdNaAb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27331F00A3D;
	Sun,  6 Sep 2026 03:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788666627;
	bh=YJcU9H021T1PuRhMCo4Q6b+VHO1hWRwhSbCYptGXsNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1PdNaAbYDURpCiq0ovMSFgT1+C4vJN/2IBKnciKiuMnE/YMLq0TaQ95yf8GbWP9V
	 BihTKWBorZWn7o/P7uimtrEfwCT/oEhWRoxmYO4vwtz/fG57wGBOVcOKeo1stjoSnw
	 KrEh9uumcl8zSvqnoz7stgcwj4DqdYYfsybys8npdgNpVjNstg2uGoYWPVgO0eqGDv
	 ysuRA5NToH+jrvJ34+N/Cu+jDuAJigh5EfNasj69OvgbzJg5nDgQs+wXgNTK0hnEk1
	 IK1e8KEMSfs1eu3Av2IfgLDABtckIKmUASnZ1VIwmpG+ajJkKkeJRZpKDQirciexDG
	 Yigr1gEcrt1Jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pmdomain: imx: Propagate SCU provider registration
 failures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <hppiscas@163.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260906033806.84671-1-hppiscas@163.com>
References: <20260906033806.84671-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 03:50:26 +0000
Message-Id: <20260906035026.C27331F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Silent ignoring of memory allocation failures (-ENOMEM) during PM =
domain initialization.
- [Medium] imx_sc_get_pd_power() returns garbage union data on RPC failure.
- [Medium] Uninitialized kernel stack memory is sent to the SCU firmware vi=
a IPC messages, leaking 1-2 bytes of kernel stack memory per call.
--

commit 0f88257985e0a31b74141d36afa67a7454eaca5c
Author: Pengpeng Hou <hppiscas@163.com>

pmdomain: imx: Propagate SCU provider registration failures

imx_scu_init_pm_domains() ignores of_genpd_add_provider_onecell() and
returns success even when none of the initialized domains are published to
DT consumers.

Return the provider error and remove the initialized domains in reverse
order before devm releases their backing storage on probe failure.

> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> index e3f9e741daf76..05d4364f34be9 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
[ ... ]
> @@ -503,7 +503,13 @@ static int imx_scu_init_pm_domains(struct device *de=
v,
>  	pd_data->num_domains =3D count;
>  	pd_data->xlate =3D imx_scu_pd_xlate;
> =20
> -	of_genpd_add_provider_onecell(dev->of_node, pd_data);
> +	ret =3D of_genpd_add_provider_onecell(dev->of_node, pd_data);
> +	if (ret) {
> +		while (count)
> +			pm_genpd_remove(domains[--count]);
> +
> +		return ret;
> +	}
> =20
>  	return 0;
>  }

While reviewing this patch, I noticed a few pre-existing issues in this fil=
e.

drivers/pmdomain/imx/scu-pd.c:imx_sc_get_pd_power() {
    ...
	struct imx_sc_msg_req_get_resource_power_mode msg;
    ...
	msg.data.req.resource =3D rsrc;

	ret =3D imx_scu_call_rpc(pm_ipc_handle, &msg, true);
    ...
}

[Severity: Medium]
This is a pre-existing issue, but does this leak uninitialized kernel stack
memory to the firmware? The msg structure is allocated on the stack and only
partially initialized. Due to padding, some bytes remain uninitialized befo=
re
the full structure is transmitted via imx_scu_call_rpc(). A similar situati=
on
occurs with struct imx_sc_msg_req_set_resource_power_mode msg in
imx_sc_pd_power().


drivers/pmdomain/imx/scu-pd.c:imx_sc_get_pd_power() {
    ...
	ret =3D imx_scu_call_rpc(pm_ipc_handle, &msg, true);
	if (ret)
		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
			rsrc, ret);

	return msg.data.resp.mode;
}

[Severity: Medium]
This is a pre-existing issue, but when imx_scu_call_rpc() fails, does this
return uninitialized or overlapped union data instead of propagating the er=
ror
code? The returned garbage data might randomly match IMX_SC_PM_PW_MODE_ON,
leading to incorrect power state initialization.


drivers/pmdomain/imx/scu-pd.c:imx_scu_init_pm_domains() {
    ...
	for (i =3D 0; i < pd_soc->num_ranges; i++) {
		for (j =3D 0; j < pd_ranges[i].num; j++) {
			sc_pd =3D imx_scu_add_pm_domain(dev, j, &pd_ranges[i]);
			if (IS_ERR_OR_NULL(sc_pd))
				continue;
    ...
}

[Severity: High]
This is a pre-existing issue, but are memory allocation failures silently
ignored here? If devm_kzalloc() inside imx_scu_add_pm_domain() returns
ERR_PTR(-ENOMEM), catching this with IS_ERR_OR_NULL(sc_pd) and continuing
the loop fails to propagate the resource management error, which could leave
dependent devices broken.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906033806.8467=
1-1-hppiscas@163.com?part=3D1
