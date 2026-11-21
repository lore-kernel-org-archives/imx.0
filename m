Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271065;
	b=ck8fEy2p/jJpHhQFvf+1SdE68lrfOpGwRRYukGOs0T3FXexCfQ5mG+3EJ19wk2AQD7L1
	 FRXQ3yUsxO9KByQsi+c7BabYssf1R+i0qTMhKBe3riOkGeDjbBcKxB6JAp7Fbn0OzGWps
	 Q6VNMX+eMirpe3FjUBnQ0wF5KxAuSuWM0jAqeqHbRh+x1k19tQS+XBHOmF3Klh08slA9G
	 izRBNXgMKuAxLQYsXcAniwFviyQ3QCHVJYUMgAKWOVJ1gscNzokzHS6D+j5Yq5/w2wmPX
	 R5xWy+JdQoZs0jPUFu98ZUZ6KKPVFNs91lGBBqI7lZOkQBBbgNiCJNO9y/XtcDbqaGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271065;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V/r7FTatwtWKBOemF11erbn7zDBsSFuVxxQUuV/6DK8=;
	b=LU/j90JWv83FnmpP8rMlr6Y6MwBtDYUxOhnoBYRD0gO7KMKmpzzB+E/6UrFnoLQIxlkw
	 otDCiRDIqQigv71TSof9EmPDGdO2E4m4Ls/VmuErDY03WqAC6IDRUo7JcvBbeXSl1F7F9
	 igQnVHzmDP+hPmsjoKKS4OEYZSAuyubzGGgJ8X8O6FbkmJxcN+pJDi5u/HHbsyQG9jRPJ
	 F+/R3ABpfnBWJoysj+M/n3X7ym1HG8Oxuapdze6idAkFlB7U7WxZ//10B2p5GN1ZPnKYb
	 B02q4hnZ5LsDTe8kI1lLjTj+LMYhbj9jrVy+Rz6+oPWK+z9DmgkC9I021F312/EL31g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9ZztPgQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F316D606A320
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9ZztPgQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4841F000C6;
	Sat, 21 Nov 2026 14:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271064;
	bh=V/r7FTatwtWKBOemF11erbn7zDBsSFuVxxQUuV/6DK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q9ZztPgQWHiZHXDEovw6mHz/5ysCXGy/MtUvRDRa44sMG88pmpiHM8Ogq2fX+bcQb
	 Da6F4DXxJNYDxAvTE/0gTllrybZ6HVeHbFkyZVPCPTGUMKuXlceWKweHCquOwij94/
	 5tEaq4dCCEAywSyd68ZmdIYaxeyukRuv3RbO1ExC+nbrDa28cE9N2I9nTaRepFb18g
	 ElfuDajDEg+SEnnLa127t6bS4PsEUSfA+EyJz7vajZFmDgUA231q1Gys+CjhSRJ4ll
	 B3/Bi3U5qtJTe60w4y99rMNp6hmuR7qhau3bGMTLLblmGft3kHrEG18TLZ5oP8tx0w
	 OmpA+tQSNeAyQ==
Message-ID: <sashiko-outbox-227094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] media: imx: allow setting FIM input capture channel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121141412.319802-4-shijiaqi_develop@163.com>
References: <20261121141412.319802-1-shijiaqi_develop@163.com>
 <20261121141412.319802-4-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:24:24 +0000
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
- [Low] media: imx: unreachable ICAP_CHANNEL case in fim_s_ctrl() due to
  clustering
--

commit 3f6e136c4d9e74ffb8117949ce551b405c749b3a
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: imx: allow setting FIM input capture channel

This commit adds a V4L2_CID_IMX_FIM_ICAP_CHANNEL case to fim_s_ctrl() and
reformats a wait_for_completion_timeout() call.

> diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/=
media/imx/imx-media-fim.c
> index b6467e29ac288..300635a3b5527 100644
> --- a/drivers/staging/media/imx/imx-media-fim.c
> +++ b/drivers/staging/media/imx/imx-media-fim.c
[ ... ]
> @@ -75,6 +74,8 @@ static int fim_s_ctrl(struct v4l2_ctrl *ctrl)
>  		if (v4l2_fim_is_streaming(fim->core))
>  			ret =3D -EBUSY;
>  		break;
> +	case V4L2_CID_IMX_FIM_ICAP_CHANNEL:
> +		break;
>  	default:
>  		ret =3D -EINVAL;
>  		break;

[Severity: Low]
Is this new V4L2_CID_IMX_FIM_ICAP_CHANNEL case reachable?

imx_media_fim_init() clusters fim->icap_ctrl[] via
v4l2_ctrl_cluster(FIM_NUM_ICAP_CONTROLS, fim->icap_ctrl) with
V4L2_CID_IMX_FIM_ICAP_EDGE at index 0 as the cluster master.  When
userspace updates any control in a cluster, try_or_set_cluster() always
invokes s_ctrl on ctrl->cluster[0], so fim_s_ctrl() is always called with
ctrl->id =3D=3D V4L2_CID_IMX_FIM_ICAP_EDGE.  Because v4l2_fim_reset() then
reads both icap_edge->val and icap_chan->val in
imx_fim_external_timestamp(), setting V4L2_CID_IMX_FIM_ICAP_CHANNEL was
not rejected with -EINVAL, and this new case is dead code that also omits
the v4l2_fim_is_streaming(fim->core) check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121141412.3198=
02-1-shijiaqi_develop@163.com?part=3D3
