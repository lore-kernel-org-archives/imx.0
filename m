Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271268;
	b=UxsBQstrOtNUwwX75ifPyVH4EIQtMxhtSPfeI0wJvaHutFX+npznIjmCvL0guicy9kvo
	 jRBu7+ACeY2s2v8U+OYX4P+klkAE8g+jxDWuzXPcSqTuxbhkSw9EMRpKpZ5KDM8xFiHwH
	 n7St7yMkeVm9lET1v9sJ/nkN+Y1XrEMez977FufbjsO/IcuJtCb4aGqsq8SWwsKjHZ1il
	 FZiOGE2FG7t5gn2j/0Fl53ONavaujq6RyfOyOKyqiaDPylHF6saLT3BgyPy0T8Er5ggCs
	 hg67HCSVLiqWZ4RC30v075YCgamGWcuhCKdqlo2jQ2XEJz2mAClPTOq5woX0RIIhIHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271268;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mMFJaldSTi9Bd2Zf/rrrPVu+rb2375GYY8kXTt+HDGQ=;
	b=42iWBltUpP/oyRB2rK31xl/vU7pCAuVB1ypUoiu3VIxMka4hY6oYtD/ZImcl6n6CFRBm
	 ivi+i+P/rH8GV++9GR0DZpmRnsSMAXapCD6gyEA/Pubujja71pY/RZ2lV+TwJGf8XsmLt
	 PEj86wdSVlWX3o318B1Pb1Zs1PUsS1idU/LhM4lbOWclIps5rx75SsBdHukyi6ni8xcUA
	 VXmoEHfubbqsZinHcoNX3i31IKZWcQp+N/5uz+39mFbbz7iR8n/+10ESVGFx2qRymNInA
	 GMVNNdNgPf8o8QfQf5s2pg45ct2nHrQfh4rcxfeKliRNa6TF7rLKaAh+w1M3vvOwoww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8WZNMGJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA6606A320
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8WZNMGJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CEE1F000C4;
	Sat, 21 Nov 2026 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271268;
	bh=mMFJaldSTi9Bd2Zf/rrrPVu+rb2375GYY8kXTt+HDGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X8WZNMGJ3lojARAksLjF7Y/AA6HbOVOm7Po4Yl/gYB1pcQ12ttx4uaR3IuJrrd/Gg
	 I9mQewNPZP2UO9AfyopAc1naBWDYTT5SZPzn0m7aPA66ilEaMmt6fHI8ALEdf24x2a
	 hzCID5BN4RTjvc74vdXzWuMJTzgpvgngaDa0HmAiY/fjoPD/+owvC/CE0/7Kq472Nz
	 +gb4K+y+aZ4esI4km5T9xplBDZGZYOMvea9j5r6bsaFnCWmZ3qMKs/t0tsmyGk9LpF
	 7b74vgSc9HmkDn1I1f0cSFYeEmEWnoRDtC4Jn8uTsAPQvSwiYyqsoAfQQzEFSgzh6O
	 QsX5x4kcCoSbQ==
Message-ID: <sashiko-outbox-227095@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] media: v4l2-core: add frame interval monitor helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121141412.319802-3-shijiaqi_develop@163.com>
References: <20261121141412.319802-1-shijiaqi_develop@163.com>
 <20261121141412.319802-3-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:27:47 +0000
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
- [Medium] media: v4l2-fim: cross-cluster ctrl->val read in reset_fim()
--

commit 4ee73622d4ea40f9f5507b8b2948de21bfddfccc
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: v4l2-core: add frame interval monitor helper

This commit extracts the frame interval monitoring helper from the i.MX
staging driver into v4l2-core while keeping the input capture controls in
imx-media-fim.c.

> diff --git a/drivers/media/v4l2-core/v4l2-fim.c b/drivers/media/v4l2-core=
/v4l2-fim.c
> new file mode 100644
> index 0000000000000..57d595196663b
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-fim.c
> @@ -0,0 +1,324 @@

[ ... ]

> +static void reset_fim(struct v4l2_fim *fim, bool curval)
> +{
> +	struct v4l2_ctrl *en =3D fim->ctrl[FIM_CL_ENABLE];
> +	struct v4l2_ctrl *num =3D fim->ctrl[FIM_CL_NUM];
> +	struct v4l2_ctrl *skip =3D fim->ctrl[FIM_CL_NUM_SKIP];
> +	struct v4l2_ctrl *tol_min =3D fim->ctrl[FIM_CL_TOLERANCE_MIN];
> +	struct v4l2_ctrl *tol_max =3D fim->ctrl[FIM_CL_TOLERANCE_MAX];
> +
> +	if (fim->config.external_timestamp)
> +		fim->external_timestamp =3D
> +			fim->config.external_timestamp(fim->config.priv, curval);
> +
> +	if (curval) {
> +		fim->enabled =3D en->cur.val;
> +		fim->num_avg =3D num->cur.val;
> +		fim->num_skip =3D skip->cur.val;
> +		fim->tolerance_min =3D tol_min->cur.val;
> +		fim->tolerance_max =3D tol_max->cur.val;
> +	} else {
> +		fim->enabled =3D en->val;
> +		fim->num_avg =3D num->val;
> +		fim->num_skip =3D skip->val;
> +		fim->tolerance_min =3D tol_min->val;
> +		fim->tolerance_max =3D tol_max->val;
> +	}

[Severity: Medium]
Can reset_fim() and fim->config.external_timestamp() read uncommitted
ctrl->val values across separate control clusters when curval is false?

v4l2_fim_init() clusters the five core FIM controls into fim->ctrl, while
imx_media_fim_init() clusters the two input capture controls separately
into fim->icap_ctrl.  The V4L2 control framework only synchronizes
ctrl->val with ctrl->cur.val for the cluster currently being tried or set,
and leaves trial or rejected values in ctrl->val after VIDIOC_TRY_EXT_CTRLS
or a failed s_ctrl.

If setting V4L2_CID_IMX_FIM_ICAP_EDGE while streaming fails with -EBUSY
(or is tried via VIDIOC_TRY_EXT_CTRLS), icap_edge->val retains the
uncommitted value.  A subsequent update to any core FIM control calls
fim_s_ctrl() -> reset_fim(fim, false) ->
imx_fim_external_timestamp(..., false), which reads icap_edge->val and
enables external_timestamp mode during active streaming, disabling EOF
monitoring.  Conversely, updating fim->icap_ctrl calls
v4l2_fim_reset(fim->core, false), causing reset_fim() to read uncommitted
->val fields from the core fim->ctrl cluster.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121141412.3198=
02-1-shijiaqi_develop@163.com?part=3D2
