Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C60249F113
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160317; cv=none; b=YEbd81+2qhENrMa7IEyCp1KoFxjrbIchxIYaLMQ5odsIjNtFwamuyZ51g+rm+nO8G5nJheB/y7LByxiUFsxmXyumxl/ZC679bBMaYmRY2K+4mmZmIOno0yQ8UNApk4k+bOT65vpp3uBLcBNiBnXzicNpwlfDgJlYwhHyMwSnK4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160317; c=relaxed/simple;
	bh=gNo/KteOl9HZbAOs4dDG73Bs1QOzVspMGfxF/5Qjn30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eXuZ4mVi/oWb5qPvM/eu/yJOyDWPtOxL1PNYu5W5M3t4AahIw9aarXHQOzXJRZBawZfJobUfsugBXQhjZIqNkTIpPVxKyAQTliJU5aACIMnvVHS9d7/VD7m3G2IUvKEyOV/socle6EgquZ+mZkDgsWpaAYdbFpI9KI8hl8Rp7b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgcWrwK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgcWrwK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAD41F00893;
	Wed, 23 Sep 2026 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790160302;
	bh=lW9rj8awZ1oniYGOXY+Lmztn+ICJOWckgW/HTbYLi1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mgcWrwK/lzt15vAU/Xotval4j6kkNAVoTV/pPvyikQIlegUcy1th//yv977rC7muB
	 h4dIylmA3NP35QrMPgZEap+ML1M8MXa0lZCJVchZAUkVXy/xBe5BM5DxHIS8HNivpb
	 vcsjGjMggDZoJav00xF3haP/WQFZfrB9vJ29xdjVxd9RJwwr02KfLMCbUHfaNbsiyE
	 vCKf0T06MWzl4oOR2MJK8DYoYyZecSNikRuq6JXZ51/RazcL9ZL0DourYYICCk/3Ko
	 oTRVp3OmVJjZKdg3XEY2keIEodqFt4USKtr76jDwWvqcQOidaiaMhuseKi/W6+4Zpc
	 bY5qONISjJcyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: gadget: uvc: replace mutex lock/unlock with
 scoped_guard in uvc_function_bind()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260923-usb-uvc-fixes-v2-1-844e04a4a4b7@nxp.com>
References: <20260923-usb-uvc-fixes-v2-0-844e04a4a4b7@nxp.com>
 <20260923-usb-uvc-fixes-v2-1-844e04a4a4b7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 10:45:02 +0000
Message-Id: <20260923104502.7AAD41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] usb: uvc: architectural violation by mixing goto with scoped_guard =
cleanup
--

commit 7b1d83604fdc69bbda123c4e57da835730d015cb
Author: Xu Yang <xu.yang_2@nxp.com>

usb: gadget: uvc: replace mutex lock/unlock with scoped_guard in uvc_functi=
on_bind()

This patch replaces manual mutex locking and unlocking with scoped_guard()
to resolve a label fallthrough bug on failure paths.

> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fun=
ction/f_uvc.c
> index d1bf3ea751973..a4fb2790f4ffe 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
[ ... ]
> @@ -809,50 +803,50 @@ uvc_function_bind(struct usb_configuration *c, stru=
ct usb_function *f)
[ ... ]
>  	/* Copy descriptors */
> -	f->fs_descriptors =3D uvc_copy_descriptors(uvc, USB_SPEED_FULL);
> -	if (IS_ERR(f->fs_descriptors)) {
> -		ret =3D PTR_ERR(f->fs_descriptors);
> -		f->fs_descriptors =3D NULL;
> -		goto error_unlock;
> -	}
> +	scoped_guard(mutex, &opts->lock) {
> +		f->fs_descriptors =3D uvc_copy_descriptors(uvc, USB_SPEED_FULL);
> +		if (IS_ERR(f->fs_descriptors)) {
> +			ret =3D PTR_ERR(f->fs_descriptors);
> +			f->fs_descriptors =3D NULL;
> +			goto error;
> +		}

[Severity: Low]
Does this code violate the kernel cleanup subsystem guidelines?

The documentation in include/linux/cleanup.h explicitly states that usage
of "goto" and scope-based cleanup helpers should never be mixed in the same
function to avoid confusing ownership semantics.

Here we jump out of the scoped_guard block to the legacy error label. While
this correctly releases the mutex lock and doesn't appear to cause a
functional issue, would it be better to convert the rest of the resources
in uvc_function_bind() to scope-based cleanup, or use manual locking if
goto error handling must be retained?

[ ... ]
> @@ -884,8 +878,6 @@ uvc_function_bind(struct usb_configuration *c, struct=
 usb_function *f)
> =20
>  	return 0;
> =20
> -error_unlock:
> -	mutex_unlock(&opts->lock);
>  v4l2_error:
>  	v4l2_device_unregister(&uvc->v4l2_dev);
>  error:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-usb-uvc-fi=
xes-v2-0-844e04a4a4b7@nxp.com?part=3D1
