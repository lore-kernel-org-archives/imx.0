Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A333932C2
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 08:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301339; cv=none; b=CSvULS90f7T9PplCp4zHrtJtIon7LTUDM7Y86GyKoVjxC9Sn1JZZ/BeP6bm6gLbP//Tim0P5cKk+3ROVJT3DjLUowjv6PM/ZgccpyNk3wWLTEF95ppRiQ3QsJdROfzfWMIeUdNskffWk+8ZEfAOvAdTzMGE2FH4lMAvHoUmDWYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301339; c=relaxed/simple;
	bh=1d7g3YtoaQFlSBBkXs2+6QXYJhtMFd3F1hUa5oOLAQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VL7hu5iLHigmOXCq3VBkpLtdOlN0e1ZoI9sesLSewzlFDuNVusuA2O4VYfe4z4YJ6oLvHS38cAdNeGyQJszW0LgaDbU5bA1ZDN261Mfu5plmffUf1NyDpIlkKRJusqitnMErJgBlFvl1JptATCu7tSjYLL54YqKulr0QaYuQen8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaSGwfjL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaSGwfjL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F5A1F00A3A;
	Fri, 21 Aug 2026 08:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787301337;
	bh=T+kz3XFQ9S+cCWivH7x9N8W+bsqeu0zqCNdmKgZUeqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gaSGwfjLNL7ONsVJOxp7xbAE7U5cxTYkCg9WoqD7idNiLBag7PBSzyo6b+Xfubu2w
	 UX7SqWyeUWiBG+3/l0WPmfEmQV2rb4h4RlyOhsmgnAb1Crov7ddE7eMmaURW7MFjPh
	 rlbbayrUiRehgRVcb2I4mnuJJiC4DAL/L6tAtEp9irczyJHgNSIiDxA/fft49aZbnl
	 /gBoj5bGMjXQ3F5Ozy8cGbNcvRs6u4GZeE/lYWClRBFTIGmt0Hvbh3Ffae4vb/TDMI
	 DQe1cKnFfJku5GhSkyHox5NcvUUA1ZWkv5f3dtcEncXLI6NByRYFbiq+xR+u9dqCS+
	 JdOhtaoFql7wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: uvc: replace mutex lock/unlock with
 scoped_guard in uvc_function_bind()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260821-usb-uvc-fixes-v1-1-80e6e279523d@nxp.com>
References: <20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com>
 <20260821-usb-uvc-fixes-v1-1-80e6e279523d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 08:35:37 +0000
Message-Id: <20260821083537.81F5A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] The function mixes `goto`-based error handling with scope-based =
cleanup (`scoped_guard`), violating subsystem rules.

Pre-existing issues:
- [High] `uvc_function_bind()` fails to catch OOM conditions from `uvc_copy=
_descriptors()` because it checks for `IS_ERR()` instead of `NULL`.
- [High] Integer overflow in `xu->desc.bLength` calculation leads to under-=
allocation and an OOB write in `uvc_copy_descriptors()`.
- [High] If `v4l2_device_register()` fails, `uvc_function_bind()` returns a=
 positive success code despite freeing its resources, leading to a Use-Afte=
r-Free.
- [High] Concurrent modification of statically allocated global string arra=
y `uvc_en_us_strings` leads to a dangling pointer and Use-After-Free.
--

--- Patch [1]: [PATCH 1/2] usb: gadget: uvc: replace mutex lock/unlock with=
 scoped_guard in uvc_function_bind() ---
commit ab6a04018ad2f28e486890d53690fb679bf7a633
Author: Xu Yang <xu.yang_2@nxp.com>

usb: gadget: uvc: replace mutex lock/unlock with scoped_guard in uvc_functi=
on_bind()

This patch replaces the manual mutex_lock and error_unlock label with
scoped_guard(mutex) in uvc_function_bind(). This removes the need for
explicit lock cleanup on error paths.

> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fun=
ction/f_uvc.c
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -768,23 +768,17 @@ uvc_function_bind(struct usb_configuration *c, stru=
ct usb_function *f)

[ ... ]

>  	/*
>  	 * We attach the hard-coded defaults incase the user does not provide
> @@ -795,7 +789,7 @@ uvc_function_bind(struct usb_configuration *c, struct=
 usb_function *f)
>  				 ARRAY_SIZE(uvc_en_us_strings));
>  	if (IS_ERR(us)) {
>  		ret =3D PTR_ERR(us);
> -		goto error_unlock;
> +		goto error;

[Severity: Medium]
Does replacing this manual lock with scoped_guard while keeping the goto
labels violate the subsystem cleanup rules?

The cleanup guidelines state that usage of goto and cleanup helpers should
never be mixed in the same function.

Should all resources in uvc_function_bind() be converted to
scope-based cleanup, or should this function continue using manual
locking instead?

>  	}
> =20
>  	uvc_iad.iFunction =3D opts->iad_index ? cdev->usb_strings[opts->iad_ind=
ex].id :

[ ... ]

> @@ -809,50 +803,50 @@ uvc_function_bind(struct usb_configuration *c, stru=
ct usb_function *f)
> =20
>  	/* Allocate interface IDs. */
>  	if ((ret =3D usb_interface_id(c, f)) < 0)
> -		goto error_unlock;
> +		goto error;
>  	uvc_iad.bFirstInterface =3D ret;
>  	uvc_control_intf.bInterfaceNumber =3D ret;
>  	uvc->control_intf =3D ret;
>  	opts->control_interface =3D ret;

[Severity: High]
This is a pre-existing issue, but can modifying the global statically
allocated uvc_en_us_strings array during initialization lead to a dangling
pointer?

Earlier in this function, the array is modified:

drivers/usb/gadget/function/f_uvc.c:uvc_function_bind() {
    ...
    uvc_en_us_strings[UVC_STRING_CONTROL_IDX].s =3D opts->function_name;
    us =3D usb_gstrings_attach(cdev, uvc_function_strings,
                             ARRAY_SIZE(uvc_en_us_strings));
    ...
}

If two gadgets bind concurrently, they could race to write their
per-instance opts->function_name pointer into the global array at
uvc_en_us_strings[UVC_STRING_CONTROL_IDX].s.

usb_gstrings_attach() then copies this pointer. If Gadget B receives a
pointer to Gadget A's string, and Gadget A is unbound and freed, would
the host dereference a freed pointer when requesting the string
descriptor from Gadget B?

> =20
>  	if ((ret =3D usb_interface_id(c, f)) < 0)
> -		goto error_unlock;
> +		goto error;
>  	uvc_streaming_intf_alt0.bInterfaceNumber =3D ret;
>  	uvc_streaming_intf_alt1.bInterfaceNumber =3D ret;
>  	uvc->streaming_intf =3D ret;
>  	opts->streaming_interface =3D ret;
> =20
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

[Severity: High]
This is a pre-existing issue, but does checking IS_ERR() here fail
to catch out-of-memory conditions?

In uvc_copy_descriptors(), if kmalloc() fails it returns NULL:

drivers/usb/gadget/function/f_uvc.c:uvc_copy_descriptors() {
    ...
    mem =3D kmalloc((n_desc + 1) * sizeof(*src) + bytes, GFP_KERNEL);
    if (mem =3D=3D NULL)
        return NULL;
    ...
}

Since IS_ERR(NULL) evaluates to false, the OOM condition is missed,
and the gadget setup proceeds with a NULL descriptor array. Should
this check IS_ERR_OR_NULL() instead?

[Severity: High]
This is a pre-existing issue, but could an integer overflow in the
extension unit size lead to an out-of-bounds write inside
uvc_copy_descriptors()?

If an attacker configures an extension unit with large bNrInPins and
bControlSize via configfs, the u8 bLength calculation wraps around:

drivers/usb/gadget/function/uvc_configfs.c:uvcg_extension_b_control_size_st=
ore() {
    xu->desc.bLength =3D UVC_DT_EXTENSION_UNIT_SIZE(xu->desc.bNrInPins, xu-=
>desc.bControlSize);
}

Then uvc_copy_descriptors() uses this wrapped bLength to size the kmalloc
buffer, but UVC_COPY_XU_DESCRIPTOR() copies the full unpacked size.

Could this result in a heap buffer overflow?

> +			ret =3D PTR_ERR(f->fs_descriptors);
> +			f->fs_descriptors =3D NULL;
> +			goto error;
> +		}

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

[Severity: High]
This is a pre-existing issue, but if v4l2_device_register() fails earlier
in uvc_function_bind(), does it return a positive success code despite
jumping to this error path?

drivers/usb/gadget/function/f_uvc.c:uvc_function_bind() {
    ...
    if (v4l2_device_register(&cdev->gadget->dev, &uvc->v4l2_dev)) {
        uvcg_err(f, "failed to register V4L2 device\n");
        goto error;
    }
    ...
}

At this point, ret holds a positive interface ID from an earlier
usb_interface_id() call.=20

Since ret is not updated to a negative error code, the framework
treats the positive return as a success. When the host later interacts
with the gadget, will it access the freed uvc->control_req and
uvc->control_buf buffers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-usb-uvc-fi=
xes-v1-0-80e6e279523d@nxp.com?part=3D1
