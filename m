Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079649;
	b=bL/2mw5b2UGExMHA2XhCY8UvIgV3qsatvyMa6D/nYX+AJZWgA0nw9z3itzxGAfqZmgXF
	 Q4T4tC1iXdIwjBVr12FCMNReNE7P/zb9IytCVN0jN4KGtqJbPlX23GzqEZO4lNPrDMDNX
	 hTg6kz9KqpJ0qD14BIFEJt4Tg9/NR0Yn1HB4wUyX1T8P1qeFJIdjfEmdxZrzYkNQo3oPz
	 72IOFkGd42Xe+xamkCgM9lOYHuq4RrqsnEn6dIzn4Hp8bUrr7ySvwXkoEyZOd08sGqfee
	 SCc78iPq8gdfpXRcvGiWiyO0zkvUail59YOEaNFcQbL6DrJ0fSUJp9q0FXAkhcy+Tqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079649;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XIeZm2yU4XBw7tXpjsTdDiSAWc3DBRGYJFQJ0pDwJ+g=;
	b=CKsNlv/oCrucxmT6v3tWK8TFZ3wvJRryl3mK8YwrhrIoUBlNsGTWel9cMIYNkaxk3sJR
	 C34BRNO8e+okvb2n5wZvDhsJ9de9MoSlCy4ptsxC6BneEAmCj0EQPCNjX6uouyg7DIPZ1
	 DWt2pWCYNLdV6uE02WDbeD1/4Vd9AllwO/7f0J6bxakzt7wASN9oBPCyc7/172PmQph8G
	 utwXKmk4KyPHsulft6gNOzEQC7wz6prxAd2JAbtFxK6ruhaTTidTf6HKnScEDFK25eEgG
	 grPafsB3lp9sQmh5PGlF/j8n+WhDnh80x9mmgVvXA+Ut0ifVQd/5YXaztX3ahQhUULg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J91C9+cX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCA6606A324;
	Thu, 19 Nov 2026 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J91C9+cX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923A71F000C4;
	Thu, 19 Nov 2026 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079649;
	bh=XIeZm2yU4XBw7tXpjsTdDiSAWc3DBRGYJFQJ0pDwJ+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J91C9+cXhIB05VCnH3FC3g2+ssaoCfGTbmyGfZHTDBzzOy2snILcAAn9Zs1BJIfpO
	 S/RCCERfSENoGIYNxJmFWHYc0H2a0JVTuO5F4FWh80YnXONNmoXojvCpg5ghIkg1SM
	 t3HJFoxHI2+ahsB/17M5BH4YtgkMP5uyXBmjOzx2j5gZB0fzKSJpc6CgM2z1lV84wL
	 rguLZuhp03au+HnF3uCMToL4tkofRuZOntORnbjLH8h/0bSu4qRaPsrd6IZKUVVL39
	 SFft3aghv3vnG+GcKE5xg7vMVe6ta/osNBjO+le2dMD6ZtovFksxMJBOHcdJfuSpcJ
	 2WEqvD/vM8dlQ==
Message-ID: <sashiko-outbox-222800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/11] media: chips-media: wave6: Add trace and
 debugfs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <761d894fbe7d4696719e8c8afd1deba3fc591c62.1795075581.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <761d894fbe7d4696719e8c8afd1deba3fc591c62.1795075581.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:14:08 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: wave6: debugfs directory leak in
  wave6_vpu_core_probe() on teardown
--

commit 5ece419bea0b582239e058aa46da23a997a50915
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add trace and debugfs

This commit adds tracepoints, per-instance debugfs entries, and readable
firmware error messages to the Wave6 VPU driver.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/=
drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> index aad4023d66a44..12efa3afebf7a 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
[ ... ]
> @@ -285,6 +293,12 @@ static int wave6_vpu_core_probe(struct platform_devi=
ce *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	core->debugfs =3D debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +	if (!IS_ERR_OR_NULL(core->debugfs))
> +		dput(core->debugfs);
> +	else
> +		core->debugfs =3D debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +
>  	ret =3D devm_pm_runtime_enable(&pdev->dev);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Does this leak the wave6 debugfs directory on probe failure or module
unload?  Every other resource in wave6_vpu_core_probe() registers a
devm_add_action_or_reset() cleanup callback because wave6_vpu_core_driver
has no .remove callback, and wave6_vpu_remove_dbgfs_file() only removes
the per-instance file, so nothing ever calls debugfs_remove() on
core->debugfs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D8
