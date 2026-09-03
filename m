Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47CA4772A1
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 11:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435481; cv=none; b=MVJOalnrye5YE6SZvcCFyAHshYa25TOkVxkNijlmiPAaSXKWSYfV1h6KwBOCbt2ceNSOCKZoHkYXdiPOELCpYk1HXDWWyYA885rsgUfTFYBthvVlFUH4hzDk2Tdb/Wew6i28ho9Kx+p9jm3SwZ88H51dfmDQMQJ99qIS/ngvhe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435481; c=relaxed/simple;
	bh=U2NBV6ooqrUwegMZerC6qGql0NvISJGX8k+YjrkTGo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=glEBAzQ5ubOLPgds6vyasAvArwBQyxJSJJ/I5VdCVz09mMG8gFKYZZovG2aRSkoqH8fZdLBQm1JHSxMJDjM5vlrLtc5ERkVXcHlSyS4uFpYjHUkfE1noLgcjh3Mqurm0oWuGkufxyveRBl40Qr/Pi9vH1gGJdxH79k8jHdquHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mh7/aHji; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mh7/aHji"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28281F000E9;
	Thu,  3 Sep 2026 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788435470;
	bh=lFVaLwXymsVSYG+aLoKK4ugnot/plBs43vP3RMecoUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mh7/aHjiDMYKdkdmsl/pBWk+X9oGAg3X48eLoiPNW2ZfSBEYovC3bqzFkX1yO2GWn
	 z90aAcXHy7IHl5t07zzmsfoZYOvzKMofqYyaDF+mcbqDnGKmFE36UgYPTG6UlR6xYp
	 xP4t8Xu9IzQoaOwcdiCvxEsam128AwTvEhbINxtgkKaF7QwPPwUIUDhZZbmBMw19OC
	 8g0sqrRQOqSz7+dX2nSXSd17+OcfEQhusj5Dt5Z0Q4AZZ2V7lhhTf53DcU4xzUQOVb
	 XTdr+wqeWphC6BAAOD66TzWcGVaDittc+E7vLr4/wokgEBnp55Wqs800Ic7sAzp8uu
	 mj+hxy5Lv03bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/13] media: nxp: imx8-isi: Don't use GFP_DMA when
 calling dma_alloc_coherent()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baoquan He" <hebaoquan@kylinos.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260903111836.1777265-12-hebaoquan@kylinos.cn>
References: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
 <20260903111836.1777265-12-hebaoquan@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 11:37:49 +0000
Message-Id: <20260903113749.E28281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Teardown symmetry violation in `mxc_isi_remove()` causing a NULL p=
ointer dereference / Use-After-Free.
--

commit 846491721093e7e929fd40da0be5709669dc9e9f
Author: Baoquan He <hebaoquan@kylinos.cn>

media: nxp: imx8-isi: Don't use GFP_DMA when calling dma_alloc_coherent()

dma_alloc_coherent() allocates the DMA buffer with the device's
addressing limitation in mind. The DMA core picks the zone from the
device's coherent DMA mask and ignores GFP_DMA passed by the caller.
This commit removes the redundant GFP_DMA flag.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index f45c2aae59ce9..fc907d357149e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -773,7 +773,7 @@ static int mxc_isi_video_alloc_discard_buffers(struct=
 mxc_isi_video *video)
> =20
>  		buf->size =3D PAGE_ALIGN(video->pix.plane_fmt[i].sizeimage);
>  		buf->addr =3D dma_alloc_coherent(video->pipe->isi->dev, buf->size,
> -					       &buf->dma, GFP_DMA | GFP_KERNEL);
> +					       &buf->dma, GFP_KERNEL);
>  		if (!buf->addr) {
>  			mxc_isi_video_free_discard_buffers(video);
>  			return -ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but looking at the teardown
sequence in drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c:

drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c:mxc_isi_remove() {
	...
	for (i =3D 0; i < isi->pdata->num_channels; ++i) {
		struct mxc_isi_pipe *pipe =3D &isi->pipes[i];

		mxc_isi_pipe_cleanup(pipe);
	}

	mxc_isi_v4l2_cleanup(isi);
	...
}

Does this code have a teardown symmetry violation causing a use-after-free =
or
NULL pointer dereference?

mxc_isi_pipe_cleanup(pipe) is called before mxc_isi_v4l2_cleanup(isi), free=
ing
the subdevice active state and setting it to NULL before the user-space
interfaces are unregistered.

Because mxc_isi_v4l2_cleanup() has not yet run, the video device nodes are
still fully registered.

Could a concurrent ioctl from user-space, such as VIDIOC_STREAMON, call
mxc_isi_vb2_prepare_streaming() -> mxc_isi_pipe_acquire() ->
v4l2_subdev_lock_and_get_active_state() and dereference the now-NULL
active_state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903111836.1777=
265-1-hebaoquan@kylinos.cn?part=3D11
