Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76735481FD2
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497961; cv=none; b=hBtLcZ1ZgRFTwUZGOwdBn8fFDnL2K7O/25pBj0ymXENJQlmQAh1ystbyml8NNJosFiP8zvshnPz8MIWtRTjXqu0O3kq51jLTuj/WXgEQATmWc2wDR0lCdqdEiAqLXkJULJJt1mkoMuXC/AByt+uEB6sqQ4bAXYLophSKkWqiuvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497961; c=relaxed/simple;
	bh=aenZWCOW1E5WQoxgEm0OKJPAbZiDeDOLU+cPMI6yyD4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sJ85T9DUVIEbWpJSffhoAyS/o38XaGIhZKsyjI88cTc4Qn0BN7oejwdKSwOykyoxV43NusKrap1UFBCwPq+aqexpKWXz5UPzTTkIhfckQmIbdYxCP6ucwvkC74lR0TFGpt1FtbXtKWiuxJ8D0fnacLpMQKyz5E+Lzm98ggrI8QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avAPKiV2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avAPKiV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E433F1F0089C;
	Wed,  3 Jun 2026 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497959;
	bh=6P1zOEJ1iw+A8YvHlLav7KNrvAfjS4QWPQNPgxmdXto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=avAPKiV2V1jovJ8LdItbF2SQ4cMmpbpz7HkGEDE9V3e01iaWG/ZWzudFUQhf0qPMc
	 r9yZWv1nGapmZgs2D2T3F55KC4qJkso1rnfDYvdzEqjynYzp0rkOYTbnxy4JPa1BGZ
	 iQGOG/Vb6fL/clq9AKD4Y6CJzz1M0TNnMBO/JPbR5A7TnPoPrmfsZBhUyoyogxu2fv
	 as1mrXnzmxHkvUCJZv0mOFCP8ghSULl9YRSGd25MDJ6QGJFunpikdMeLHjRlXq4jW8
	 xQ7bpUwgUjZaByce1WkqPBfcJtf8F+/p0GJ1JZSl3zYSONMKLHJBm+DYc80zQtIF3x
	 zRU2eZ9BGOGkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 9/9] remoteproc: imx_rproc: Invoke the callback
 directly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260603-imx_mbox_rproc-v2-9-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-9-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:45:58 +0000
Message-Id: <20260603144558.E433F1F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing RCU read lock around `idr_for_each()` executing in a preem=
ptible context, leading to potential use-after-free.
- [High] Error paths in mailbox initialization leave `ERR_PTR` or dangling =
pointers in the channel pointers, leading to a kernel panic during cleanup.
--

commit 4d44a5db67113dd38271bbfd5c93e988c06b7cf5
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

remoteproc: imx_rproc: Invoke the callback directly

The imx-mailbox driver moved the callback invocation into the threaded
IRQ handler. This means the callback is invoked in preemptible context
and there is no need to schedule the kworker for the
imx_rproc_notified_idr_cb() invocation.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 0dd80e688b0ea..c97bc1c401655 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c

[ ... ]

> @@ -835,21 +832,11 @@ static int imx_rproc_notified_idr_cb(int id, void *=
ptr, void *data)
>  	return 0;
>  }
> =20
> -static void imx_rproc_vq_work(struct work_struct *work)
> -{
> -	struct imx_rproc *priv =3D container_of(work, struct imx_rproc,
> -					      rproc_work);
> -	struct rproc *rproc =3D priv->rproc;
> -
> -	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
> -}
> -
>  static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
>  {
>  	struct rproc *rproc =3D dev_get_drvdata(cl->dev);
> -	struct imx_rproc *priv =3D rproc->priv;
> =20
> -	queue_work(priv->workqueue, &priv->rproc_work);
> +	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);

[Severity: High]
This is a pre-existing issue, but does this idr_for_each() loop require RCU
read protection in drivers/remoteproc/imx_rproc.c?

Since imx_rproc_rx_callback() now runs in a preemptible threaded IRQ handler
(and previously ran in a preemptible kworker), it executes without holding =
an
RCU read lock.

If a concurrent unbind of the rproc-virtio driver removes an IDR entry via:

rproc_virtio_remove()
  rproc_free_vring()
    idr_remove()

The radix tree nodes could be scheduled for delayed RCU freeing. If the
threaded IRQ handler is preempted during the idr_for_each() iteration and t=
he
RCU grace period expires, could the iteration traverse freed memory upon
resuming and cause a use-after-free crash?

>  }

[ ... ]

> @@ -1249,17 +1229,6 @@ static int imx_rproc_probe(struct platform_device =
*pdev)
>  		priv->ops =3D dcfg->ops;
> =20
>  	dev_set_drvdata(dev, rproc);
> -	priv->workqueue =3D create_workqueue(dev_name(dev));
> -	if (!priv->workqueue) {
> -		dev_err(dev, "cannot create workqueue\n");
> -		return -ENOMEM;
> -	}
> -
> -	ret =3D devm_add_action_or_reset(dev, imx_rproc_destroy_workqueue, priv=
->workqueue);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to add devm destroy workqueue a=
ction\n");
> -
> -	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
> =20
>  	ret =3D imx_rproc_xtr_mbox_init(rproc, true);
>  	if (ret)

[Severity: High]
This is a pre-existing issue, but can the mailbox initialization error path=
s in
imx_rproc_xtr_mbox_init() lead to a use-after-free or panic during cleanup?

If mbox_request_channel_byname() fails for the "tx" channel, it returns an
error but assigns an ERR_PTR to priv->tx_ch:

drivers/remoteproc/imx_rproc.c:imx_rproc_xtr_mbox_init() {
    ...
	priv->tx_ch =3D mbox_request_channel_byname(cl, "tx");
	if (IS_ERR(priv->tx_ch))
		return dev_err_probe(cl->dev, PTR_ERR(priv->tx_ch),
				     "failed to request tx mailbox channel\n");
    ...
}

If the "rx" channel fails, it leaves the ERR_PTR in priv->rx_ch and calls
mbox_free_channel(priv->tx_ch) but does not reset priv->tx_ch to NULL,
leaving it dangling:

drivers/remoteproc/imx_rproc.c:imx_rproc_xtr_mbox_init() {
    ...
	priv->rx_ch =3D mbox_request_channel_byname(cl, "rx");
	if (IS_ERR(priv->rx_ch)) {
		mbox_free_channel(priv->tx_ch);
		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
				     "failed to request rx mailbox channel\n");
	}
    ...
}

When the device is later unbound, the devm cleanup action imx_rproc_free_mb=
ox()
runs. It checks if the pointers are true, which they will be for an ERR_PTR
or dangling pointer:

drivers/remoteproc/imx_rproc.c:imx_rproc_free_mbox() {
    ...
	if (priv->tx_ch) {
		mbox_free_channel(priv->tx_ch);
		priv->tx_ch =3D NULL;
	}

	if (priv->rx_ch) {
		mbox_free_channel(priv->rx_ch);
		priv->rx_ch =3D NULL;
	}
    ...
}

Since mbox_free_channel() does not check IS_ERR(), will it attempt to
dereference these invalid pointers and cause a kernel panic or a double-fre=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-imx_mbox_r=
proc-v2-0-a0059dc3b69a@linutronix.de?part=3D9
