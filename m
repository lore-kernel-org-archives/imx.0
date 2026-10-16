Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793F3803D1
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124069; cv=none; b=iUPMTK/AkoroAnIZ1nvh4oa+PV1oK71QGsOPox1UlkCa7oUA83Haxny3sVvioQU0CB1gpiqoEpqP5AcMPXpDLlVHqzkRdFf4fC1i9Bu8AsR2LBDhnHeRGBmEHNR3185Q30SGV5BO/IacyZjYh+YZMD3mN/H1rNCmcxHv+pDHqp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124069; c=relaxed/simple;
	bh=1qShpWkrIk8ai5vN3ZG4QhRWYLqN9LSi2vc6ZeUDvQA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SJyX0Udmb4sWgCNEb14cvyxBsW01gfr6IDrbnj9duoSmjivhihn9r43HblHSBXG7+xfGzIYzV8m5rHdRF22ruibUxKmt4eCqAz8zQK3irN3M8bu3yp7PzknZshoEXLhQnrZ9FExyBVjUvmaNZ8yz1pLDlT6n0N2FQCEywOnsFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/govUBy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/govUBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055CA1F000C4;
	Fri, 16 Oct 2026 04:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792124068;
	bh=kGf/hKMC6+KNN0JIxshZbAzsrcin4zRS95zIJoBdN9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i/govUBysJyOkFt2am1lIWU39JsegEy10JMPQY+qQAf5BwtvSUflwWFyfaiddM7cK
	 ZWXSOHJwdQJko4rSM7IPOBoWft8vR5XyggpgeAWg0YcMku2CUenkLhvVOTSP/DMwTq
	 hOre3b8yrjFqShMEYeo/AlRdmcHwtqr9XhU2fITt1vFffNBDiXfi8sgi8YRKkAF2uo
	 IJNWJ6eLaXdkChu7idkyKVE4FyFYYMwfsLrp1PKb/di2Vu2wyF4tP+t/zuOUTJ9ST5
	 GDvYbCU20DM9BTXxmseCdjAbRgBd+JSOfzzYnPpfMp0hsnF8ZzAk5v5RVVP4VhkrLQ
	 uSmSU5lgev8wg==
Message-ID: <sashiko-outbox-173747@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/25] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261015014324.5569-19-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
 <20261015014324.5569-19-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:14:27 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: fsl: rpmsg: remote state leak on hw_constraint error
--

commit e67c435f012ba584c1ab6a6bd485da78b988ac05
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on rollback

This commit fixes an issue where the close callback was being skipped
when snd_pcm_hw_constraint_integer() returned a positive value. It ensures
the component is properly marked as opened by explicitly returning 0 on suc=
cess.

> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
> index 7086fb7fc1eba..85b7c929a28a4 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -269,7 +269,13 @@ static int imx_rpmsg_pcm_open(struct snd_soc_compone=
nt *component,
>  	info->stream_timer[substream->stream].substream =3D substream;
>  	timer_setup(&info->stream_timer[substream->stream].timer,
>  		    imx_rpmsg_timer_callback, 0);
> -	return ret;
> +
> +	/*
> +	 * ASoC only marks the component as opened when .open() returns 0.
> +	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
> +	 * return 0 to ensure .close() is not skipped on rollback.
> +	 */
> +	return 0;
>  }

[Severity: Medium]
If snd_pcm_hw_constraint_integer() returns an error, can this still leave t=
he
remote DSP in a leaked state?

Earlier in imx_rpmsg_pcm_open(), an open message is successfully sent to the
remote DSP:

sound/soc/fsl/imx-pcm-rpmsg.c:imx_rpmsg_pcm_open() {
	...
	info->send_message(msg, info);
	...
	ret =3D snd_pcm_hw_constraint_integer(substream->runtime,
					    SNDRV_PCM_HW_PARAM_PERIODS);
	if (ret < 0)
		return ret;
	...
}

Because returning a negative error code prevents ASoC from marking the
component as opened, snd_soc_component_close() will skip calling the close
callback on error rollback.=20

Does the driver need to manually send a close message before returning the
error, or is there another way to ensure the remote DSP state is cleaned up
on this failure path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015014324.5569=
-1-phucduc.bui@gmail.com?part=3D18
