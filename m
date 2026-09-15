Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B810E471CFC
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467630; cv=none; b=bICdNczYVKqkIF/+4JIxqnTxNcsr+G3yiRWVS1saVQnu0csYrzUF+rBF9DELksq/sDbzVYjVkknXjS7FezUMokmQJWQNm5q2w9NmEWAv1ii3KLfn/soezGNlH2yshvrceIRTv+Rrmp04hX9fQnopD6jHd0o3vSdRaaO9mkaKV6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467630; c=relaxed/simple;
	bh=SVBNiUfjC3qIU35Hpc6DkNx5NXgEKObAstCkzBxB6w0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tDeZZOFLnfxKz4Ta5LBR5NIp2WXPVoEtxwRZBzveuSaXHJxKmP8teRkQdH+mdqp5KLdjEyBafkIdl/UaahccJUjT2HQd8AWPOhAq0IGvibFyioNqfdn+lhXRvWWf4HP9DwsB9MuaH/+6fXiVeh+FGDwomb8FXMyHAFTZ28ev5SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcfrX7yr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcfrX7yr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFFD1F000FF;
	Tue, 15 Sep 2026 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467628;
	bh=DmIfsIQJlaa+VncQYWYkiWqvCpty7mvqlhMR10JRiFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KcfrX7yrf7I4LOk4kjapsEhmMSn0AUWNk8nSqaxY+z1Vp05wsUVwuVhnWye5xNTad
	 /xERbJec+xSqq4TVZOMV7ebGHd6aapbCTfEDpa2LOnqxYD0Iors8FOol8lTNiOS8FZ
	 fuNvqpA5P8yghIQZTYkrlOW0EfdanC0EGr7Tzsav1XB22xfg0R38IL2v+jt7JsSZRt
	 Fa8qSG5z/t2bwM/8EJIe/p8iVGFwEqueROwvwVwjOrGXjSqqDHB0HecmR5vY7Z7bwh
	 TxB2M0R/T1sT3PDyOVVb8k1rRPim2wm4gRnvrMy4B2/ZSuUO8CAYYFlC51MdkrUS6T
	 97JZIqwgRl7NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pmdomain: imx8m-blk-ctrl: Serialize power on/off across
 sibling domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ming Qian" <ming.qian@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260915-imx8mp-blk-ctrl-v1-1-b3b4e6e7e676@oss.nxp.com>
References: <20260915-imx8mp-blk-ctrl-v1-1-b3b4e6e7e676@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:20:27 +0000
Message-Id: <20260915102028.2CFFD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] cleanup: mixing goto-based error handling with guard()
--

commit f6256896fe23aa6a79fb250eed1b63a79f67a19e
Author: Ming Qian <ming.qian@oss.nxp.com>

pmdomain: imx8m-blk-ctrl: Serialize power on/off across sibling domains

This commit adds a per-blk-ctrl mutex to serialize the blk-ctrl register
and reset sequence across sibling domains in the i.MX8MP VPU. This fixes
a defect where concurrent power transitions disturb shared clock timings,
leaving a VPU stuck in reset.

> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 479789009c7f4..f8105e87ea3c0 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -98,6 +105,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_d=
omain *genpd)
>  	struct imx8m_blk_ctrl *bc =3D domain->bc;
>  	int ret;
> =20
> +	guard(mutex)(&bc->power_lock);
> +

[Severity: Low]
Does this mix the guard macro with legacy goto-based error handling in
imx8m_blk_ctrl_power_on()?

Later in this function, there are goto statements for error handling:

    ret =3D clk_bulk_prepare_enable(data->num_clks, domain->clks);
    if (ret) {
        ...
        goto bus_put;
    }

According to the cleanup subsystem guidelines (include/linux/cleanup.h),
using goto and scope-based cleanup helpers shouldn't be mixed in the same
function.=20

While this specific instance doesn't introduce a functional runtime bug rig=
ht
now (since there are no other scope-based variables causing LIFO ordering
conflicts), it violates the subsystem policy and might lead to confusing
ownership semantics or regressions during future refactoring.

Could this function be fully converted to scope-based cleanup, or should it
stick entirely to standard lock/unlock calls with goto-based cleanup?

>  	/* make sure bus domain is awake */
>  	ret =3D pm_runtime_get_sync(bc->bus_power_dev);
>  	if (ret < 0) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-imx8mp-blk=
-ctrl-v1-1-b3b4e6e7e676@oss.nxp.com?part=3D1
