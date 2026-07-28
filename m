Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7493C6A5C
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222632; cv=none; b=fFECmyHHiG1uCbIIMWR/ER1Yt+i6ySua1d+BR/o8VdKssXCMfjLGQ45hVN8UdXWc5MbCMH6lyW3rKLqjRlOgmhRPvskHKh5CvbXc1eXJzq4EX+485J9kA1R/Sh8PWM1q5zATMogCu2Sj7lBlpMjoplZMWI4E//WN3aG8dqLigTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222632; c=relaxed/simple;
	bh=FKY8pge4sd8Kcao4H5k9NGgJVZVcOtbLlZgxnwkRQVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fY/lktb1cktR4CaEqRb2f90fulRqd0LrN69j8eafoWKNiQFo+XCuDdkICyStjNe3Sj4yl17KTSRctCbzF6My1DiSSS2Vi9y3aAIif8Qtkfe/fZ1H/eVEFpeSxiPb3oasdeBjfKJLeikok2EydokhHisMNOVF3RdfG8TUH9CX/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdgh7bU/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdgh7bU/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961E71F000E9;
	Tue, 28 Jul 2026 07:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785222630;
	bh=3i4LpoTaSzvqTlTJ4CRzgpDCuyxAup7XF4p6M1L59i8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jdgh7bU/X4Mennm5ogxRYVHW5cKYfH1YRXayVdn/2YtyWbaB4FCowV2WpeHHCi04E
	 w2IkieOZFdDOL2iRYuhxP4DdERjQyvbeqNDx0wshe4Jb/uBkfH+C+r3MMuDn0FN6bs
	 K+e26spuNmlZbKWHZi2a7hbQgOOUb6IG1B8Uudvwk7a9b3UxmGcTyKVBt3Ysbogo+d
	 Q07imVafqjGmZ8JgMt23JuQwE1AhJ/AP9D+IFvLr1Ag0bZpw+j9d562YNb3Euv5WM4
	 OWjA8Z/hEMyty64WH4ahh6ClIP+raI5It11+smeDyrQlV4/mq8jGBHaa7J3zpDfi/R
	 2EsIwR0zdXHcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] media: nxp: imx8-isi: Use BIT_ULL() for 64-bit
 stream masks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
 <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:10:30 +0000
Message-Id: <20260728071030.961E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Routing validation checks the old routing state instead of the new=
ly requested routing.
- [High] Stream translation silently overwrites sink pad and mixes streams =
from different inputs, violating hardware assumptions.
--

--- Patch [1]: [PATCH v5 1/4] media: nxp: imx8-isi: Use BIT_ULL() for 64-bi=
t stream masks ---
commit 4ed3fcf5e835032b4860a0f0d335cd63bb0bee70
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: nxp: imx8-isi: Use BIT_ULL() for 64-bit stream masks

This commit replaces BIT() with BIT_ULL() for 64-bit stream masks to avoid
incorrect results on 32-bit architectures when stream IDs are 32 or greater.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -145,10 +145,10 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_cross=
bar *xbar,
>  	 */
>  	for_each_active_route(&state->routing, route) {
>  		if (route->source_pad !=3D source_pad ||
> -		    !(source_streams & BIT(route->source_stream)))
> +		    !(source_streams & BIT_ULL(route->source_stream)))
>  			continue;
> =20
> -		sink_streams |=3D BIT(route->sink_stream);
> +		sink_streams |=3D BIT_ULL(route->sink_stream);
>  		sink_pad =3D route->sink_pad;

[Severity: High]
This isn't a regression introduced by this patch, but a pre-existing issue.
Could this stream translation silently overwrite the sink pad and mix strea=
ms
from different inputs?

In mxc_isi_crossbar_xlate_streams(), the loop iterates over all routes matc=
hing
the source pad and source_streams mask. It appears to blindly overwrite
sink_pad and bitwise-OR the sink_streams without checking if they originate
from the same sink pad.

If userspace sets up routing where streams from different sink pads are rou=
ted
to the same source pad on different stream ids, could this cause only the l=
ast
overwritten sink_pad to be returned?

This might lead to only one remote subdevice being enabled while abandoning
others, passing an invalidly mixed stream mask to the enabled device.

>  	}
> =20

As an additional observation in this file:

[Severity: High]
This isn't a regression introduced by this patch, but a pre-existing issue.
Is the old routing state checked instead of the newly requested routing dur=
ing
validation?

In __mxc_isi_crossbar_set_routing():

    for_each_active_route(&state->routing, route) {

When userspace calls VIDIOC_SUBDEV_S_ROUTING with an invalid route mapping =
the
memory input to a pipeline other than the first, does this validate the
request against the old routing table (&state->routing) rather than the new
routing array passed as a parameter?

Since the old table does not contain the invalid route yet, it appears this
check might pass incorrectly and allow impossible hardware configurations to
be accepted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-isi-v5-0-1=
d22ab91602a@oss.nxp.com?part=3D1
