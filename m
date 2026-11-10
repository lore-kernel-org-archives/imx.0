Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308890;
	b=i89ScRAqWxP1hBqQCMozGKmibMZGZG1j5Ok5V02Cw/fKxRYvHzA3G08/b56dFBGxZ5/Z
	 VXd13g5YNY8G2CNUz9GzFoajE6sftE7y+C8ozjrecICYBiNxSIniG6KefbTrP+hUE+ez6
	 SjKpcOdC0qNziN9vmDE9hCuiNxXHB20pEZlF7QVJEre9h0HB+ns0JaaiZ8YzOXHbgWg7F
	 d8+yWCyGDNBGwOAyPD/hdahqxLKsYU6ijaJkWz5G57kbbVp4HObcBtCxQ4a6MAk0h+rFQ
	 UhXNdeEtQZ72cYObWrCLGX0u77rhLkG+l7plhG6pWLXbD9XlB6my5B/1Bgx9BIlUWIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308890;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WtMHmjUCEUwqqQ/+rWPbGLjO3wgktfNeslMON7EWwXs=;
	b=oEPxC4J4NBMVCN88wS2B+QFo2/WJpAMn1jk06waILw3xpseq2IEMrvQcSotwiOgz6vJb
	 BBK9JwCs0IRPOW32UKSdX+/En4C5x5ANQb4X875F5diPE0/wQRAU+v/QaokyK7xEBarOB
	 RakrX9FHDsOSpzYl6jQ2pX0OLjMuSVdp0CrEVdAjnJceqv9ZTOglWkW4mM++0PFVvJd1l
	 gkpdZYvpo0qCn0hrq8NFYQ+I2yn8uv7vmCLlQ8E9ljzGr8Juj/dhLtKLMtwRqvfpnIwi9
	 /F80rr/I4ELc1waS/hX2ziy6hWgVRl+HSAMfhgVQ32j3gUJVXM69oNpiBLsNbvt5TZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3gATdQi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21067606A321
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3gATdQi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D711F0089F;
	Tue, 10 Nov 2026 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794308889;
	bh=WtMHmjUCEUwqqQ/+rWPbGLjO3wgktfNeslMON7EWwXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G3gATdQikpVvlLlKsNx7hacoU7PY1J/FClL97pWFMAJt1J/EWTwU81GCcocbW9vz7
	 mJFeuYUyF11kE7kYyQyli+eMhjtlRXkPc1z3jU/dMEzTSkKN7eXIsl+95j9nseovUK
	 PZY3Ie9RqaJN4l6grTIj0I3r/xXSb84mUnXc+/n6u3VEoFv0zmBNu+pK6xvKkBYIjf
	 iPj7+qsaf1j5osOqMQ5l3MSikVKo9LjPIvnP07GbFA9LHpAplggQxMT2UA251YN7rS
	 jsgW1Yt6IdopNZhmw1lk8f8QUvBenHbto2PFYbSUx1Jm1PA9pglsbC0kmVN4Y39nW1
	 FrPKa58pHuTMg==
Message-ID: <sashiko-outbox-206921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: drain the vq work before
 freeing the mailbox
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261110105436.2487822-1-hj351016@gmail.com>
References: <20261110105436.2487822-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 11:08:09 +0000
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
- [High] remoteproc: imx_dsp_rproc: AB-BA deadlock in
  imx_dsp_rproc_free_mbox()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] remoteproc: imx_dsp_rproc: use-after-free and resource
  leaks on unbind [1]
--

commit 17e3fec9a8c6e436afd532f653405b5a78e316af
Author: Hyunjung Ko <hj351016@gmail.com>

remoteproc: imx_dsp_rproc: drain the vq work before freeing the mailbox

This commit calls cancel_work_sync(&priv->rproc_work) in
imx_dsp_rproc_free_mbox() after freeing the mailbox channels to drain any
pending virtqueue work item.

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_=
dsp_rproc.c
> index 96d619daf3f5b..89c72d916b1e4 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -642,6 +642,13 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_r=
proc *priv)
>  	mbox_free_channel(priv->tx_ch);
>  	mbox_free_channel(priv->rx_ch);
>  	mbox_free_channel(priv->rxdb_ch);
> +
> +	/*
> +	 * The mailbox rx callback schedules rproc_work; the channels are now
> +	 * freed, so no new work can be queued. Drain any pending work before
> +	 * the rproc (which the work dereferences) can be freed.
> +	 */
> +	cancel_work_sync(&priv->rproc_work);
>  }

[Severity: High]
Can calling cancel_work_sync(&priv->rproc_work) in imx_dsp_rproc_free_mbox()
cause an ABBA deadlock with rproc->lock?

CPU0                              CPU1
----                              ----
mutex_lock(&rproc->lock)
                                  imx_dsp_rproc_vq_work()
cancel_work_sync(&priv->rproc_work)
                                    mutex_lock(&rproc->lock)

 *** DEADLOCK ***

CPU0: __rproc_shutdown() -> rproc_unprepare_device() ->
      imx_dsp_rproc_unprepare() -> pm_runtime_put_sync() ->
      imx_dsp_runtime_suspend() -> imx_dsp_rproc_free_mbox()
CPU1: process_one_work() -> imx_dsp_rproc_vq_work()

Because priv->rx_ch remains active until mbox_free_channel(priv->rx_ch) runs
inside imx_dsp_rproc_free_mbox(), an inbound mailbox interrupt before or
during shutdown can queue priv->rproc_work while __rproc_shutdown() holds
rproc->lock.  imx_dsp_rproc_vq_work() then blocks on rproc->lock while
imx_dsp_rproc_free_mbox() waits in cancel_work_sync(&priv->rproc_work).

[Severity: Critical]
This problem wasn't introduced by this patch, but can unbinding an active
DSP remoteproc device skip imx_dsp_rproc_free_mbox() entirely [1] and
leave both the mailbox channels and priv->rproc_work active when the rproc =
is
freed?

drivers/remoteproc/imx_dsp_rproc.c:imx_dsp_rproc_probe() {
	...
	ret =3D devm_rproc_add(dev, rproc);
	if (ret)
		return dev_err_probe(dev, ret, "rproc_add failed\n");

	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);

	return devm_pm_runtime_enable(dev);
}

Because devm_rproc_add() is registered before devm_pm_runtime_enable(),
devres teardown disables runtime PM before devm_rproc_remove() calls
rproc_del() and __rproc_shutdown().  When imx_dsp_rproc_unprepare() then
calls pm_runtime_put_sync(), rpm_suspend() fails with -EACCES without
calling imx_dsp_runtime_suspend() or imx_dsp_rproc_free_mbox(), leaving
priv->clks enabled and the mailbox channels and priv->rproc_work able to
dereference the freed rproc and imx_dsp_rproc structures.

[1] https://sashiko.dev/#/bug/linux-a6e902ee-9958-4d44-96cc-d854c6256124

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110105436.2487=
822-1-hj351016@gmail.com?part=3D1
