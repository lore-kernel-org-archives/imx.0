Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A61E343D7B
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 06:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783923448; cv=none; b=XWf7BEPSey/3PwuCp7BuXt8rJhsa5UH13QmLPLnB7a8NCJfYrRyjfmIFSSHdqK/H92Qfxgeqdhly+X+J4DX+dLT555VGsmLBTGZvIXMNd04bvGguT87ZoCI5blgNtDu8hS0BQi3D4RhYEZHDgQbpVcG1ziNNHthNJ8vO902/rF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783923448; c=relaxed/simple;
	bh=sT6rCSlHK7bKcvX3d3Ja+TS6aprdXwElafVIje/ap2M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oy0fHuwlzdlVJ5X1ZZR13IO7yUp4iQqTGGQsXfm7ZEQBnAm5aWo1vxE/mrrJgurH7xCUwBY5vNBB0L95bZQT86t7nzGRpvK9SDPCK6Dh/5GR7BVxCLa+gOcjodPSRXlFe4c+gbYftOP/acdXyhetMf/VwoXP+fMfB5lvAfQ41J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+zRXczU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+zRXczU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DD31F000E9;
	Mon, 13 Jul 2026 06:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783923446;
	bh=BvexV58Y49MtI61nSiy5YNQxEQ5dPbxFbfRoR8cthfw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N+zRXczUUR2AiZ0RkRcqjIRpCdck/bh6T2o7zcrwQYYf0UXk6sMoq1WW9cS21v9Mx
	 H4Mo4sznY/CMCnYpgREPB51RnAWqnbs1SA/FBWu01dkCrnujbtHlqYtHgozD6JjbgT
	 aSukY/caHNpMTv/2C9kEnTX0fjERmzi+mHeY5MZWrymu/nli8jYxb7EyXRiWXQj9Xw
	 dzbOMZgNBjggX7UANS1gP3TPrDIR7szHo7oA3QiK/yIvtc4tzRAMpMuV5a3AsehcN8
	 QzalIGWLhViOld2zpRi5knB6YFu5EvPfeZ/p6B5eLXjsrmh8BZqzqAHHCNRBcurQSD
	 LlaVgD7ieXt0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: remove broken string
 configfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260713060845.3759673-1-xu.yang_2@oss.nxp.com>
References: <20260713060845.3759673-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 06:17:26 +0000
Message-Id: <20260713061726.A7DD31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds checking on integer configfs attributes leads to ZE=
RO_SIZE_PTR dereference and kernel crash.
- [High] Permanent memory and request leak when the USB host changes altern=
ate settings.
--

--- Patch [1]: [PATCH v2] usb: gadget: f_uac1_legacy: remove broken string =
configfs attributes ---
commit 4b8c64c0b84575a689f911f2adeef96bb30cecea
Author: Xu Yang <xu.yang_2@nxp.com>

usb: gadget: f_uac1_legacy: remove broken string configfs attributes

The UAC1_STR_ATTRIBUTE macro defines configfs show/store handlers for
the fn_play, fn_cap, and fn_cntl string options. The store function
contains an inverted null check on the kstrndup() return value. This
patch removes the UAC1_STR_ATTRIBUTE macro and the three attributes it
generated, as they have been broken and unused for many years.

Link: https://lore.kernel.org/linux-usb/20260625113154.1954813-1-xu.yang_2@=
oss.nxp.com/

> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/ga=
dget/function/f_uac1_legacy.c
> index 5d201a2e30e7f..3f52099a4fdd5 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -888,60 +888,10 @@ UAC1_INT_ATTRIBUTE(req_buf_size);
>  UAC1_INT_ATTRIBUTE(req_count);
>  UAC1_INT_ATTRIBUTE(audio_buf_size);

[Severity: High]
This isn't a bug introduced by this patch, but does this lack of bounds
checking allow audio_buf_size to be set to 0?

If a user with configfs access sets audio_buf_size to 0, it appears
f_audio_buffer_alloc() will call kzalloc(0) which returns ZERO_SIZE_PTR:

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_buffer_alloc() {
	...
	copy_buf->buf =3D kzalloc(buf_size, GFP_ATOMIC);
	if (!copy_buf->buf) {
	...
}

This bypasses the NULL check. Later, when an audio out packet is received,
f_audio_out_ep_complete() attempts to memcpy the incoming data:

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_out_ep_complete() {
	...
	memcpy(copy_buf->buf + copy_buf->actual, req->buf, req->actual);
	...
}

Can this copy into the ZERO_SIZE_PTR address cause an immediate kernel pani=
c?

> -#define UAC1_STR_ATTRIBUTE(name)					\
> -static ssize_t f_uac1_opts_##name##_show(struct config_item *item,	\

[ ... ]

> @@ -956,12 +906,6 @@ static void f_audio_free_inst(struct usb_function_in=
stance *f)
>  	struct f_uac1_legacy_opts *opts;
> =20
>  	opts =3D container_of(f, struct f_uac1_legacy_opts, func_inst);
> -	if (opts->fn_play_alloc)
> -		kfree(opts->fn_play);
> -	if (opts->fn_cap_alloc)
> -		kfree(opts->fn_cap);
> -	if (opts->fn_cntl_alloc)
> -		kfree(opts->fn_cntl);
>  	kfree(opts);
>  }

[Severity: High]
This is a pre-existing issue, but does f_audio_disable() leak memory and USB
requests when the host changes alternate settings?

When the USB host selects alternate setting 1, f_audio_set_alt() allocates
requests and buffers:

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
	...
	req =3D usb_ep_alloc_request(out_ep, GFP_ATOMIC);
	if (req) {
		req->buf =3D kzalloc(req_buf_size, GFP_ATOMIC);
	...
}

However, the disable callback appears to be empty and fails to free these
resources:

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_disable() {
	return;
}

Could an untrusted USB host trigger this repeatedly by changing the alterna=
te
setting back and forth, exhausting device memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713060845.3759=
673-1-xu.yang_2@oss.nxp.com?part=3D1
