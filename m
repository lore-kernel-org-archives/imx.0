Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E0937C0FB
	for <imx@lists.linux.dev>; Fri, 29 May 2026 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780081736; cv=none; b=cpWdsr+8NSZb2riUglR6qvqnryOJ1vF9G3TJbvGnG7ZfvPi76GcuWNSQae1d+uB0jPHCsP/4lfLM00I0xXZpkR889U8MxnrrOdESiRfDpgsfa4QuzWWw8vX/1D7szczB7p4gxxj8TTlWaSC9db+mk8qFfU2csskNBSINBX8r9x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780081736; c=relaxed/simple;
	bh=+omHxVlHyiuap8EGsMfnW4pvJmI/gptsgLuT/craBoQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aTace6KNejtwkZgEdBby6Ur+3bEXylqpGZtbNFu6phYqw212kh6jdfizTlJAIoTb2r5hZkwESWKsgKmj6eRlGN2fFSTi9af5C2/2CU2QOqVp/t+4/hhPnYfk3eNHCbM1LpSmK1RxyBdt69yBbRR5HYlpfQTQucHZ35ORu63eoCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsJfZdXe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsJfZdXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1680E1F00893;
	Fri, 29 May 2026 19:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780081734;
	bh=nNrt0HjxJbFJSm6qvm2ZrcbHApgrICvpzRk+xPduH/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CsJfZdXes1yFZNo9+pyftd2ml6A7LaquXFmy2b1gdL1iZQIrxtjtHKOcQa0nm1KP7
	 zaLpiZEtmE8tfNZJUUbTG8FamhUmqEOicZCy4DLpUTVJgw4KfKYhfK08YzWbnPtvMf
	 NY+8neC306iSCqm44s4VuJn8Hy0yciM2tBFn03wP1gjqxKBLym5OsyKyOWEXs2uByX
	 xZ2Rd701lrg8kTgM6NkWR6xBCZyOaIP+85m7nALBrtKgQ50jU3dojbHe9m1DneEsKR
	 TP8wm+6zmzUFzGrejR6U91ct1SnRG/xk8NLez3Z3OL4n4bPv8rdlyTO2sJ19O7/zQs
	 JQpZwPHcfHMvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] remoteproc: imx_rproc: Invoke the callback directly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260529-imx_mbox_rproc-v1-5-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-5-b8ffc36e11e5@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 19:08:53 +0000
Message-Id: <20260529190854.1680E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unprotected access to `rproc->notifyids` in `imx_rproc_rx_callback=
` via `idr_for_each` without `rcu_read_lock()` can race with `idr_remove` d=
uring `rproc-virtio` unbind, leading to Use-After-Free.
--

commit 54541ad2eee46e430bd395ed2d5711955d46ef22
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

remoteproc: imx_rproc: Invoke the callback directly

The imx-mailbox driver moved callback invocation into the threaded IRQ
handler, making it run in a preemptible context. This patch removes the
workqueue and invokes the imx_rproc_notified_idr_cb() callback directly
from the RX callback.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 0dd80e688b0ea..c97bc1c401655 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c

[ ... ]

>  static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
>  {
>  	struct rproc *rproc =3D dev_get_drvdata(cl->dev);
> -	struct imx_rproc *priv =3D rproc->priv;
> =20
> -	queue_work(priv->workqueue, &priv->rproc_work);
> +	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);

[Severity: High]
This is a pre-existing issue, but does this idr_for_each() call require
rcu_read_lock() protection?

Looking at the call chain, it also performs an idr_find() in
rproc_vq_interrupt() without rcu_read_lock():

imx_rproc_rx_callback()
  -> idr_for_each()
     -> imx_rproc_notified_idr_cb()
        -> rproc_vq_interrupt()
           -> idr_find()

If a user unbinds the rproc-virtio driver via sysfs concurrently,
rproc_virtio_remove() calls rproc_free_vring() which executes idr_remove().

Since idr_for_each() and idr_find() rely on RCU internally to protect radix
tree nodes, could running this in a preemptible context without
rcu_read_lock() race with idr_remove() and lead to a use-after-free of the
IDR nodes or the rvring structure?

>  }
> =20
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-imx_mbox_r=
proc-v1-0-b8ffc36e11e5@linutronix.de?part=3D5
