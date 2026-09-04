Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A213CCFB8;
	Fri,  4 Sep 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508820; cv=none; b=QrNOrqXSptTV8nEWltjA1249mx08nYIu1vZH7C4BaGU5j2OPtNKv0HwYCtJ9H8aIM2t8Ee8+UGcV6cvg6RzNkziBjgqoHDdQMpGCJ3r2000agK61EJHjwOpn2QG8cpovKx2wBTBwwOqDEF+26qsSqAdx8CkKBJYnlXNdKRW7HH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508820; c=relaxed/simple;
	bh=lidQSovl5CVR4HYmDhW3eI/lWyxTWMAnZASRsCB7H9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c9VN7rgaenxRpzMJImNRz2CI5ungSIq8pArdOI4+Hf2o+VD0CF1sLkmtHvhmlbcT0elaZhLFktvIx1Qe6v2V8G6CgD9PpKq1yg1TXAj/8v1VMle5M8u2tRx97bqC7YXne1SqB4PIC7TrojVXgBRnBF6CKeTZhVo5Ngm7KYfNGe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5b7Kfzw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5b7Kfzw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42201F00A3D;
	Fri,  4 Sep 2026 08:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788508819;
	bh=gnMRJOPorYuSrO6WlisXJyMFIp5ictKcxkqTaoQmHvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k5b7Kfzw8jNhn6NdGlhTX3t27sceDSdeBuftinVJB7pBvj1rZikkWJRjGc5h2jj4D
	 0CfU95p+R7WsviRwTujmjVqkVYgwpLPeognwmO6+dA5NdoGbWokCgsK0qdVaJpN2iv
	 ZRXsQvC4UzhUd6r5EBUZSHcJ2XUdFIMts+Yl209WXV4UFtPNRmbw/hLm5y4KY7qrpJ
	 0w2bNJAjAMg0KRefk0WwNF5/vMYzhsgXWNrMZ+0IjsDHtWzemS3PuD/wAJkyyRJ3Nz
	 4uPdutufHTNFdaGf4TXJ+ZHVS+dDEFAOyXwNzll5D7zfKA94akGj0u9zaog58eNz+0
	 /aTb86EFe2gRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/13] drm/imx: dc-ed: Support getting source
 selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-imx8-dc-prefetch-v6-8-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-0-26643e3f6cb7@nxp.com>
 <20260904-imx8-dc-prefetch-v6-8-26643e3f6cb7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 08:00:18 +0000
Message-Id: <20260904080018.B42201F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing error check for regmap_read() leads to potential use of =
uninitialized variable 'val'.
--

commit 9ce4a83e3feed66ffe4fb2913d0e30db41ffaf27
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc-ed: Support getting source selection

This commit adds a helper to get ExtDst source selection. This functionalit=
y is
intended to support disabling CRTC at boot in a subsequent commit.

> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-e=
d.c
> index de1b71315eabd..b8ab41271bb40 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -149,6 +149,32 @@ void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_lin=
k_id src)
>  	}
>  }
> =20
> +int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src)
> +{
> +	u32 val;
> +
> +	regmap_read(ed->reg_pec, PIXENGCFG_DYNAMIC, &val);

[Severity: Medium]
If regmap_read() fails due to an underlying I/O or bus error, it will return
a negative error code and leave the stack variable 'val' uninitialized. The
subsequent switch statement would then evaluate this uninitialized memory.

If 'val' happens to randomly match one of the LINK_ID_* cases, the function
could return success (0) and pass back a garbage source selection,
potentially causing incorrect display configuration or state corruption.

Should this code check the return value of regmap_read() to avoid using an
uninitialized 'val'?

> +
> +	switch (val) {
> +	case LINK_ID_NONE:
> +	case LINK_ID_CONSTFRAME0:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-imx8-dc-pr=
efetch-v6-0-26643e3f6cb7@nxp.com?part=3D8
