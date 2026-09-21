Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69645C704
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985468; cv=none; b=YH4RJFz5kBL85fXR7KTn/CnVdrmxlsBf07RYmmtXkjR3eMdaAvOra4psjm3hjSk7DAUWjBpTwU7cKrfoiN3cE6OZ5jMf8zWGl3fzeb7l+lvgI6OjCLmyHZH5T69GLFLNCeerx6JxmdIhrYOLwSpx8MQrvNhZ0KeSyg4xWbF2Mfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985468; c=relaxed/simple;
	bh=G/AV/AlhQS3ZPkQ56h1rjHlOLmWHBAYZTMYFPzC9vFs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eDFAqoRnDZY8cPKUt7mNLK9uZ5DfuIDPnlDJDgn2DvoL+wTCKIVSRSRtHm6UX2nZQV2mUU6DPiDGaDHj1y+m3qy/cUb7nL2qaOMgaffg4pJl3X7imVc5InuiHu81tBIxAtEUqREkZS2/5eZUpn5FTxWKWkWlbwdPeXevy3TL0ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCjt6kFl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCjt6kFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E811F000FF;
	Mon, 21 Sep 2026 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789985467;
	bh=fS0rmqbeiI2pwvX3MYu/tCrLQBsXc3w0Fgcw9tABY+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UCjt6kFllkEzP5duNNetxiN8sgoomN6KNzf4bkH/IfSyPLAgY7fU3qRjB2Pkhn9ap
	 UWYjwbbe6iowm2PzI31J/WNfArU+OMv5yJ3zeZRlEBl84wfp/LiRXrjWQFTuVI9qss
	 L3YASTkNd725h766XUP+kgJyxQ1hGDLcnqMk8X/TPS+pDc+wCuMSXOh9oR3jd6TVU9
	 dctFY95HyQVt0J4zwR4/kn9EPjbGiFwZ2uHmLTkPcAmDGYhNKTyTL4WIHZetFtWeqn
	 rUaKvfAbiyjT3WdZggnj29jCV5ENRrp9O/EgPXaOVXdXE/wrXIvM4ItqrKLggb+o6B
	 rrXtMECtSyKQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] pmdomain: imx8m-blk-ctrl: Serialize power on/off
 across sibling domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ming Qian" <ming.qian@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260921-imx8mp-blk-ctrl-v3-1-c86b0a9d4781@oss.nxp.com>
References: <20260921-imx8mp-blk-ctrl-v3-1-c86b0a9d4781@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:11:06 +0000
Message-Id: <20260921101106.D8E811F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] cleanup: mixing goto-based cleanup with guard() in imx8m_blk_ctrl_p=
ower_on
--

commit 3b7233b47967e5b29603c44328524d995a2c4def
Author: Ming Qian <ming.qian@oss.nxp.com>

pmdomain: imx8m-blk-ctrl: Serialize power on/off across sibling domains

On i.MX8MP the VPU blk-ctrl exposes G1, G2 and VC8000E as three separate
genpds, each serialized only by its own genpd lock, so their power_on and
power_off callbacks can run concurrently on SMP. Serialize the blk-ctrl
reset sequence with a per-blk-ctrl mutex to prevent sibling transitions
from disturbing shared clock and handshake timing.

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
>  	/* make sure bus domain is awake */
>  	ret =3D pm_runtime_get_sync(bc->bus_power_dev);
>  	if (ret < 0) {

[Severity: Low]
This isn't a bug, but does this mix goto-based cleanup with guard() in the
same function?

The subsystem guidelines in include/linux/cleanup.h state that goto and
cleanup helpers should never be mixed in the same function.

imx8m_blk_ctrl_power_on() still has goto labels for manual unwinding:

	/* power up upstream GPC domain */
	ret =3D pm_runtime_get_sync(domain->power_dev);
	if (ret < 0) {
		dev_err(bc->dev, "failed to power up peripheral domain\n");
		goto clk_disable;
	}

	...

clk_disable:
	clk_bulk_disable_unprepare(data->num_clks, domain->clks);
bus_put:
	pm_runtime_put(bc->bus_power_dev);

	return ret;

Should the existing resources be converted to scope-based cleanup, or should
this lock be managed manually to avoid mixing the two patterns?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-imx8mp-blk=
-ctrl-v3-1-c86b0a9d4781@oss.nxp.com?part=3D1
