Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEE836E489
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209402; cv=none; b=eL+BA+6mL8P5Iy4V3TufbEQYxbJYHFyAb8grOb6GbfWLV39KV1jS3KD2phq631lybNWv1eq8PY1J5mOsYieR/kQUEyCLLVUVRYdFDI2+TLB94bdliHdMx5nJYcmV6HN+muA/nMBycxfmXItaAXo6LEXH4ICTrjJ0ysWL6CmC/7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209402; c=relaxed/simple;
	bh=XaZyNjNSff/6JZ8+NcSIwLAUQ2HjS1PxHNHR355IhPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XfyjdxEa4PsrRQGpVLT8VazH62s3Tess2T5lIn1Mz2iTNUKt5dXy2Kvo59hfGkFHM1FP8kCm0083rfkJBGRTrgaqnEtyduTVvyLTeBHtppc4Z6gnLoplguCGXqbMgiw+muS6wbBWGPmqRop5pumt5F+nuoSrAEyb9jyCpqjMkrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej8R7Xlg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej8R7Xlg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98F71F000E9;
	Tue, 23 Jun 2026 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782209400;
	bh=eQO9Riw+1FPnSGRBNxRMmevWyp3hnGtzPg1j8QmS6y4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ej8R7Xlg/pWniz4tPXFJzdu9jpQAGPD6b+qje1L0CS9o3uVz26L6pOWRUGTbnfqfs
	 DKeIQRw+aaaoWdzHLk5S6gmeRTvFme704ASC01cMww/YeJtMrSDuFV+dZ0KXFy6zaL
	 w5hUVsRhPtDKlt50s3+6jNWoCA0c0Rr5WyhVB2B1Xm/0uKkiG35YOIZiW8RffVejNm
	 WQX+QKPJAS9rvBYv2a/6y4lNHrHPQ9n4dlQZvNvWqKcMHT/9v8a1q35mjZ1SN1A81B
	 Q8NaEpnc7I2W8z/ti6jpaRuJUfncmIVQSwp9Hjy1OqfOqdiiApJrxrICJKwtbINN+h
	 2kJgf9zfK1OmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and
 rename to imx8mp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Dooks" <ben.dooks@codethink.co.uk>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
References: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 10:09:59 +0000
Message-Id: <20260623101000.A98F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The keyword `static` is misspelled as `statc`, causing a compilatio=
n syntax error.
- [Low] The struct is initialized with the undeclared function `dwc3_imx8mp=
_pre_set_role`.
--

commit 7c7aefb84ba9dd8d7379b9aae197107a91b20ee1
Author: Ben Dooks <ben.dooks@codethink.co.uk>

usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and rename to imx8mp

This commit makes the dwc3_imx_glue_ops structure static to resolve a missi=
ng
declaration warning. It also renames the structure to dwc3_imx8mp_glue_ops =
to
distinguish it from other drivers.

> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8m=
p.c
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, e=
num usb_role role)
>  		pm_runtime_use_autosuspend(dwc->dev);
>  }
> =20
> -struct dwc3_glue_ops dwc3_imx_glue_ops =3D {
> -	.pre_set_role   =3D dwc3_imx_pre_set_role,
> +statc struct dwc3_glue_ops dwc3_imx8mp_glue_ops =3D {

[Severity: Low]
Does this cause a compilation error? It looks like the static keyword is
misspelled as statc here.

> +	.pre_set_role   =3D dwc3_imx8mp_pre_set_role,

[Severity: Low]
Will this initialization also fail to compile? The structure is pointing to
dwc3_imx8mp_pre_set_role, but earlier in the file the function remains named
dwc3_imx_pre_set_role:

static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
{
        ...

It seems the function renaming might have been left out of this patch.

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623100554.7350=
80-1-ben.dooks@codethink.co.uk?part=3D1
