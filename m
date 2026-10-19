Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD2928C009
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 07:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394247; cv=none; b=h3IkUP7RsqcZ/9Caf4tyK8mkk7a0UO9RIHq5Mqvom2xzxIO1hS55NOCvocDEMV/8LtzQZnqg8BKlXKpDBFCiukwupRTfj64oJu+FZBr0LkE83WV3Ub2V0370lXlaDt+tXbH6k+leg+kX0F8ucUUstLrkjLJPzAxeeOdd10Bzzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394247; c=relaxed/simple;
	bh=AhNp0XvG4Nx8L5xxMJ/XrWV/WxIKdNlr8/ZaJD8P4RE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HLU98/fIfBkPxyBdEPHV7zCif8Lt/OEsaD55cvIWQUDVXgMRjrqnsXrexLX9FkncD8EfFMfd5aGSeljiBnHYS+qV5TpXSMyNRzn4gHmqcfdpi7SGsXk1LsonNtLzlpkLZnErczGr1I1HS/jUvlcfYSB6Ap2r/XvW21TLuYRSUCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z09I1A7C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z09I1A7C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4435B1F000C4;
	Mon, 19 Oct 2026 07:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792394246;
	bh=2Lw6vJq3Otlg3YwYvyCurIkYqlpAYVZnQt3TD+TtdKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z09I1A7C9UdkRMTXkPp5zN5vjlVTNTH8kWmgQR4FBXbdCcv0nqlRo316rEtt+RA7J
	 sArn8MhJ/W6xTAzMV7ZTfakxkdNJ4fulY72oQAuDah3tf87Bvc/MUxzx2oMxbVT/Jd
	 f+BVSL0XraDmKhljhvN7NcQZ+zUZvFW6gHAb+tS3/qNCAz7MW6xNZNdPQhnjH9+Ali
	 NEVvoA1hII/An6mfgZww38yRxLFHQhz3JyQen6mxlvUuoJbl63b9rWnpnFHvO/REw0
	 Co/CKcqvnh9qJXMpob312zsAyxrz6cyy6KgqyQmiflt9n7naSTeVeSKhsBRJnPLis7
	 sIuyYedHdB8uA==
Message-ID: <sashiko-outbox-176736@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
References: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 07:17:25 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: imx-pcm-rpmsg: unstopped timer in imx_rpmsg_pcm_hw_free() ra=
ces with hw_free and close
- [Medium] ASoC: imx-pcm-rpmsg: missing .sync_stop races TERMINATE work wit=
h hw_params
--

commit 9ebe6dce779f3a2f344611c3f847f58528684b1b
Author: Chancel Liu <chancel.liu@nxp.com>

ASoC: imx-pcm-rpmsg: Flush pending work in hw_free

This commit moves the flush_workqueue() call from imx_rpmsg_pcm_close() into
a new imx_rpmsg_pcm_hw_free() component callback so that queued TERMINATE
work completes before the DAI hw_free() gates the shared audio clock.

> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
> index 85b7c929a28a4..6a0174d6c78df 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -178,6 +178,16 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_co=
mponent *component,
>  	return 0;
>  }
> =20
> +static int imx_rpmsg_pcm_hw_free(struct snd_soc_component *component,
> +				 struct snd_pcm_substream *substream)
> +{
> +	struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
> +
> +	flush_workqueue(info->rpmsg_wq);
> +
> +	return 0;
> +}
> +
>  static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component =
*component,
>  					       struct snd_pcm_substream *substream)
>  {
> @@ -285,9 +295,6 @@ static int imx_rpmsg_pcm_close(struct snd_soc_compone=
nt *component,
>  	struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
>  	struct rpmsg_msg *msg;
> =20
> -	/* Flush work in workqueue to make TX_CLOSE is the last message */
> -	flush_workqueue(info->rpmsg_wq);
> -
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>  		msg =3D &info->msg[TX_CLOSE];
>  		msg->s_msg.header.cmd =3D TX_CLOSE;

[Severity: High]
Can info->stream_timer[substream->stream].timer still fire and queue work to
info->rpmsg_wq after imx_rpmsg_pcm_hw_free() flushes the workqueue?

On an LPA-enabled stream where rpmsg->force_lpa is set in
imx_rpmsg_pcm_prepare(), advancing appl_ptr while in SNDRV_PCM_STATE_PREPAR=
ED
(for example via write before start_threshold is reached, snd_pcm_forward(),
or snd_pcm_sync_ptr()) invokes pcm_lib_apply_appl_ptr() -> imx_rpmsg_pcm_ac=
k(),
which arms the stream timer:

sound/soc/fsl/imx-pcm-rpmsg.c:imx_rpmsg_pcm_ack() {
	...
		if ((avail - written_num * period_size) <=3D period_size) {
			imx_rpmsg_insert_workqueue(substream, msg, info);
		} else if (rpmsg->force_lpa && !timer_pending(timer)) {
			int time_msec;

			time_msec =3D (int)(runtime->period_size * 1000 / runtime->rate);
			mod_timer(timer, jiffies + msecs_to_jiffies(time_msec));
		}
	...
}

If the substream is then freed via SNDRV_PCM_IOCTL_HW_FREE or closed via
snd_pcm_release_substream() without having entered SNDRV_PCM_STATE_RUNNING
(or if closed from SNDRV_PCM_STATE_SUSPENDED), snd_pcm_do_stop() skips the
SNDRV_PCM_TRIGGER_STOP trigger because snd_pcm_running(substream) is false:

sound/core/pcm_native.c:snd_pcm_do_stop() {
	if (substream->runtime->trigger_master =3D=3D substream &&
	    snd_pcm_running(substream)) {
		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
		substream->runtime->stop_operating =3D true;
	}
	return 0;
}

In that case, imx_rpmsg_terminate_all() is never called, so stream_timer
remains armed across imx_rpmsg_pcm_hw_free(). Even when the stream was
running, imx_rpmsg_terminate_all() runs in atomic trigger context and only
calls non-synchronous timer_delete(), which does not wait if
imx_rpmsg_timer_callback() is already running on another CPU and has not yet
called imx_rpmsg_insert_workqueue(). In addition, SNDRV_PCM_IOCTL_SYNC_PTR
can still invoke imx_rpmsg_pcm_ack() after hw_free while rpmsg->force_lpa
remains set.

Because flush_workqueue() was removed from imx_rpmsg_pcm_close() and
timer_delete() is only called after info->send_message(msg, info) in
imx_rpmsg_pcm_close(), any TX_PERIOD_DONE or RX_PERIOD_DONE work queued aft=
er
imx_rpmsg_pcm_hw_free() can run concurrently with fsl_rpmsg_hw_free() gating
rpmsg->mclk and can also be sent after TX_CLOSE or RX_CLOSE.

Should imx_rpmsg_pcm_hw_free() synchronously stop the timer with
timer_delete_sync() and clear rpmsg->force_lpa before calling
flush_workqueue(info->rpmsg_wq)?

> @@ -624,6 +631,7 @@ static const struct snd_soc_component_driver imx_rpms=
g_soc_component =3D {
>  	.open		=3D imx_rpmsg_pcm_open,
>  	.close		=3D imx_rpmsg_pcm_close,
>  	.hw_params	=3D imx_rpmsg_pcm_hw_params,
> +	.hw_free	=3D imx_rpmsg_pcm_hw_free,
>  	.trigger	=3D imx_rpmsg_pcm_trigger,
>  	.pointer	=3D imx_rpmsg_pcm_pointer,
>  	.ack		=3D imx_rpmsg_pcm_ack,

[Severity: Medium]
What happens if userspace stops a running stream via SNDRV_PCM_IOCTL_DROP
(or drain) and then calls SNDRV_PCM_IOCTL_HW_PARAMS or
SNDRV_PCM_IOCTL_PREPARE without calling hw_free() in between?

When snd_pcm_drop() stops a running stream, imx_rpmsg_pcm_trigger() calls
imx_rpmsg_terminate_all(), which queues TX_TERMINATE or RX_TERMINATE to
info->rpmsg_wq and leaves the substream in SNDRV_PCM_STATE_SETUP. When
snd_pcm_hw_params() or snd_pcm_prepare() is called from SNDRV_PCM_STATE_SET=
UP,
ALSA does not call .hw_free; instead it relies on snd_pcm_sync_stop() to wa=
it
for asynchronous stop operations:

sound/core/pcm_native.c:snd_pcm_hw_params() {
	...
	snd_pcm_sync_stop(substream, true);
	...
	if (substream->ops->hw_params !=3D NULL) {
		err =3D substream->ops->hw_params(substream, params);
		if (err < 0)
			goto _error;
	}
	...
}

Because imx_rpmsg_soc_component hooks .hw_free rather than .sync_stop:

1. In snd_pcm_hw_params() -> __soc_pcm_hw_params(), fsl_rpmsg_hw_params()
re-parents the shared audio clock via clk_set_parent() while TX_TERMINATE or
RX_TERMINATE work may still be pending or executing in info->rpmsg_wq, and
imx_rpmsg_pcm_hw_params() synchronously calls info->send_message() for
TX_HW_PARAM or RX_HW_PARAM, which can overtake the queued TERMINATE message.

2. During system suspend, snd_pcm_suspend_all() triggers
SNDRV_PCM_TRIGGER_SUSPEND (queueing PAUSE or TERMINATE work to info->rpmsg_=
wq)
and calls snd_pcm_sync_stop(substream, false) without calling .hw_free,
allowing imx_rpmsg_pcm_suspend() to synchronously send TX_SUSPEND or
RX_SUSPEND before the workqueue is flushed.

3. In do_hw_free(), snd_pcm_sync_stop() runs before soc_pcm_hw_clean(),
whereas component .hw_free runs only after snd_soc_dai_digital_mute() and
snd_soc_dapm_stream_stop().

Would hooking .sync_stop in imx_rpmsg_soc_component (or in addition to
.hw_free) ensure the workqueue is flushed across all stop transitions before
clock reconfiguration, suspend, or hw_free cleanup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-b4-imx-pcm=
-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com?part=3D1
