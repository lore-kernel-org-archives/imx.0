Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079419;
	b=WSrRym++wRRwqAlWfBreltB3ws1CyQ3MrYp+rdZ8ngDUBiJVAvVMd/6PCQHDhlRFWOE9
	 +2pL9VQktqmXSy9zaKnHoZQsrKXtBIkV7D7Klwu/BjlGAMw20g6sEw216IPoq7WQV/sbw
	 pHZoQQHTiv5m4h6VSFwvLHGmXfu1YHIahdotDph0MpDyUTZy9jv4Sjf9uXDYFR75vw8J/
	 rt8ru3AZ3kMIj5djqrs94sqtDDvUSbkG3Mrk5IdNrO0uilg9x7jbHIHFuOfX9Ar+hpYC1
	 XmnHHEmh8PYoHIJc/6si49WQFoPdw1+msJePXtSt5e0qYJUSjQaD72i0WwaNMbksyMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079419;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IY9v5voMoqbpkuw94TFUrSadrFvCUDNpGXTCRmuvkWA=;
	b=Pp06fCfqdKh3rvxdZQ5VqccOFVjdOCPSJ0kuE2aLIpci5hKx4tw7FQp1Ml3Yu5+pO/n0
	 vYlxb60i3seyt9ROwuzO7HMKehezQIMc9UaTcd70FXZ3auDH7GVh5N1FErt/K1TCxg0bj
	 fTMGBdbdbwt78yDqXQD8gERmdRT7qNim4kAjc6yTbZtQRm/N+ZZkvC+u5M1q2ryxpJnrT
	 6Qx9ZwocFQTh4N3GANRHoO3iVK7aePBa0zhWKDQZcTq68zsWTINP2DMIcWOgEx1HSbeo0
	 80X3ZiPHhXiNzofvCZC/CGdg0VchwBEbSpg/BxcWXk4NuUwtIbO43qh+6EDPLVW5WCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdamdoWd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5E60A2604;
	Thu, 19 Nov 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdamdoWd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14B31F000C4;
	Thu, 19 Nov 2026 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079419;
	bh=IY9v5voMoqbpkuw94TFUrSadrFvCUDNpGXTCRmuvkWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IdamdoWdy8apwSxIEkqS2mEr2MapSWCXG5IVQ5qZU3X6Nm5H+n5l0/ckj356OzYv/
	 KrPhssHS5H6XFmtrQLsJ7TBTNW6da8ie7OykH0JVzLgIHRPpbFw+YBzan8q/usDvkl
	 6NUgLNjt09sbu0AA4K7hZo4HhDdznr707hF1TTJicMXwhudeZKGtcHJJiG8URHnop1
	 C3lqdmC6d8PA8DuGV3B+fX7AoA6SnYRMlSfjdDf6Otor4TJnzFc7CcR7KjCnAhB8Ds
	 AKIUjtxa0IGbJtcuuMd9c8NkWkBkrO51hpQR3VQlYF9hvlB2XH+bRceQAElPI51PMh
	 uQxPyAkE23I3Q==
Message-ID: <sashiko-outbox-222793@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/11] media: chips-media: wave6: Add Wave6 encoder
 firmware interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <85ce28c44e167aa05ffc19dc02ce2be26dd99893.1795075581.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <85ce28c44e167aa05ffc19dc02ce2be26dd99893.1795075581.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:10:18 +0000
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
- [Medium] media: wave6: avoid large struct copies on stack in
  wave6_gen_enc_pic_reg()
--

commit 0c77c50267143f16a1d2daf6f5d24a657e85b50e
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 encoder firmware interface

This commit adds the firmware interface and MMIO register configuration
helpers for Wave6 video encoding operations.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/driver=
s/media/platform/chips-media/wave6/wave6-hw.c
> index 872a540df0218..171391f797cb8 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-hw.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
[ ... ]
> +static void wave6_update_enc_info(struct enc_info *p_enc_info)
> +{
> +	struct enc_open_param op =3D p_enc_info->open_param;
> +
> +	p_enc_info->width =3D op.pic_width;
> +	p_enc_info->height =3D op.pic_height;
> +	p_enc_info->c_fmt_idc =3D get_chroma_format_idc(op.out_fmt);
> +}
[ ... ]
> +static void wave6_gen_enc_pic_reg(struct enc_info *p_enc_info, bool cbcr=
_interleave, bool nv21,
> +				  struct enc_param *opt, struct enc_cmd_enc_pic_reg *reg)
> +{
> +	struct enc_open_param open =3D p_enc_info->open_param;
> +	struct enc_codec_param param =3D open.codec_param;
> +	u32 stride_c =3D opt->source_frame->stride_c;
> +	u32 c_fmt_idc;
[ ... ]
> +int wave6_vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_=
param *param,
> +				  u32 *fail_res)
> +{
> +	struct enc_cmd_enc_pic_reg reg =3D {};
> +	struct enc_info *p_enc_info;
> +	int ret;
> +
> +	guard(mutex)(&inst->dev->hw_lock);
> +
> +	p_enc_info =3D &inst->codec_info->enc_info;
> +
> +	wave6_gen_enc_pic_reg(p_enc_info, inst->cbcr_interleave,
> +			      inst->nv21, param, &reg);

[Severity: Medium]
Should wave6_gen_enc_pic_reg() and wave6_update_enc_info() take pointers
to p_enc_info->open_param and its codec_param instead of copying them by
value onto the stack?

struct enc_open_param is around 824 bytes and struct enc_codec_param is
around 772 bytes.  When wave6_gen_enc_pic_reg() is inlined into
wave6_vpu_enc_start_one_frame() alongside struct enc_cmd_enc_pic_reg, the
local structures alone consume roughly 1,700 bytes of stack space (and
over 1,220 bytes in wave6_vpu_enc_issue_seq_init() via
wave6_update_enc_info()), exceeding the 1,280-byte CONFIG_FRAME_WARN
threshold on 32-bit builds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D6
