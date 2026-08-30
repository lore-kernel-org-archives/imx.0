Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0CF3F1045
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788097429; cv=none; b=WmmkT3f83lMtJl3dW6+gAHSKJumJqijsYW5zTtor939jRvbji+WamE9/zssSFIMmWtmIZLD8BDD0M9ln+74An/9UkGULpsN+U0ul6SaLtcDMOKYGLTTR2B5uAj/LePmOUvwyCf+AjjiMVO+PyPx+0yf1cP7CNArtazlVm3RlQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788097429; c=relaxed/simple;
	bh=zPKIB6qwZLjTtTToQutlpfT7HPlYN/Vw05PRZ2nmDJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PNiOe2j1lYLQ84AgicKdm0Aj5a1L6/efrb6n5Zvq7RKI1Ax1ewngn2b0jnu2heDmsmVc71Vv6dLpkeVv6kNBqt4yTSTXZgPpQ8Itb005wcV3q7DCysKFdi4soEJLXcfi3Yu5PXpGu8lZz74lnQO5tbAWJHqptsFwqS7neN9Riz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O11xDCif; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O11xDCif"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140621F00A3D;
	Sun, 30 Aug 2026 13:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788097428;
	bh=T7cSTjQzHaabvTM1E8w09lxs5v2Pm4Xs9rln/Cr8rLY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O11xDCifSMImx6l20NVRxJUVrH3WXnvkpR8fnjJX8DRK7P51YjEAXXo/XARCHS+wk
	 efpZLo0IzVxMep8OEymJmxKD+J1KvFWo/TnmzkN23JiltwhisAemnxb56KrZTzZpbj
	 MFT7hdCZN6tsbcBmyiCGtyooVyTuG1SWcVIjT/S1vpHzco+R4Ul+iokI2QaTi88nAk
	 YTeQ7chVCnMiMB6aqwAHFrv8kqqClMuE9/gDXP97Ph73v6wki/mBGr0n1h7yAr+VcT
	 w7OcVFp6dK1wYLileNcZtchdUoIwWfweU9sftST4VFjXw4StjUvCvUNADsvEFcErJR
	 ySOft7DmTENKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] remoteproc: imx_dsp: acquire runtime PM before adding
 carveouts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260830133310.6926-1-pengpeng@iscas.ac.cn>
References: <20260830133310.6926-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 13:43:47 +0000
Message-Id: <20260830134348.140621F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `imx_dsp_rproc_add_carveout()` fails during its iteration, or i=
f later stages like firmware parsing fail after a successful prepare, previ=
ously added carveouts and coredump segments are permanently leaked on the r=
emoteproc lists.
- [High] Mailbox channels allocated during runtime resume are leaked if clo=
ck enable fails in `imx_dsp_runtime_resume()`.
--

commit 1aa0eaf53776f4fb1deb0e079f298b5ed6746813
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

remoteproc: imx_dsp: acquire runtime PM before adding carveouts

This commit fixes the prepare callback by acquiring the runtime-PM
reference before publishing DSP carveouts. This ensures that if the PM
resume fails, the transaction is not partially published.

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_=
dsp_rproc.c
> index fd60c67ba8a9f..96d619daf3f5b 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -726,14 +726,17 @@ static int imx_dsp_rproc_prepare(struct rproc *rpro=
c)
>  	struct device *dev =3D rproc->dev.parent;
>  	int ret;
> =20
> +	ret =3D pm_runtime_resume_and_get(dev);

[Severity: High]
This isn't a bug introduced by this patch, but looking at what happens duri=
ng
this runtime resume, if clk_bulk_prepare_enable() fails in
imx_dsp_runtime_resume(), it returns directly:

drivers/remoteproc/imx_dsp_rproc.c:imx_dsp_runtime_resume() {
	...
	ret =3D clk_bulk_prepare_enable(DSP_RPROC_CLK_MAX, priv->clks);
	if (ret) {
		dev_err(dev, "failed on clk_bulk_prepare_enable\n");
		return ret;
	}
	...
}

Does this bypass imx_dsp_rproc_free_mbox() and permanently leak the exclusi=
ve
mailbox channels allocated just above it via imx_dsp_rproc_mbox_init()?

Subsequent runtime resume attempts might fail with -EBUSY when
mbox_request_channel_byname() is called again for the same channels, breaki=
ng
device functionality.

> +	if (ret < 0)
> +		return ret;
> +
>  	ret =3D imx_dsp_rproc_add_carveout(priv);
>  	if (ret) {
>  		dev_err(dev, "failed on imx_dsp_rproc_add_carveout\n");
> +		pm_runtime_put_sync(dev);
>  		return ret;

[Severity: High]
This is a pre-existing issue, but if imx_dsp_rproc_add_carveout() fails
midway through its loop (e.g., returning -ENOMEM or -EINVAL), it returns an
error without freeing earlier allocations.

Furthermore, if this prepare callback fully succeeds but rproc_parse_fw()
subsequently fails in the remoteproc core, the core jumps to the
unprepare_rproc label (which calls imx_dsp_rproc_unprepare) and completely
bypasses rproc_resource_cleanup().

Does this permanently leak the previously added rproc_mem_entry and
rproc_dump_segment objects on the remoteproc lists?

Repeated boot failures could continually append memory to these lists,
eventually causing an out-of-memory condition.

>  	}
> =20
> -	pm_runtime_get_sync(dev);
> -
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830133310.6926=
-1-pengpeng@iscas.ac.cn?part=3D1
