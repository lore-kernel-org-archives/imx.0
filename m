Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577804;
	b=4e++MhQ2KTmlrRQavFiyeuwQaY9kEZyel5vYpoNj4ZIgzZYeQgqCRTx0KoojBcGe2XIN
	 YoMiVr+2fzrtc7bnHXk6xyNFysK6NbGYxyZRga6pQtWeLIcGN/zIYNYlmYGDLJI7oZXMT
	 Vcp99E//ZV+AeGkmIqs7V1mA2pEz9ox90vKMfC0oNf2LgDYULcY5iCV0uehJNt7YbQ0XD
	 8DTR/FF6NpA/r4/yY9CgHxPkldlv0mCiA++AcdBCQus/VCwkCmHcJAb5A3ISwUTscYgg8
	 A9HlEB/K8E4CqFhuTKa5qy0W+dKLc+LcDiq40WrMPPIZiEK/naQklEuhF01utkoTblQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577804;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XCeJHCdfxtlL4kCbtL9cMT179tZ2PTlgxVA3o7V9peo=;
	b=5G7QG4RkPAmTOCUUK0EcagGERplwsN5rUXi9qILqZOzMhzMoKZSw93+k1daYmJStAfEB
	 BoRvqE+baGqCaec3P4rP0w+gjM462uI/zty2VHWA8UVuvgyBqzXorBIZfAD+i+S/5E7e8
	 l8GonIeKNsbwgn3BkAhZikYc+HdwUjG8eg3KsTd31hTrTcctQ++UWfWhpHRKUtHwHC+Wn
	 i7x2H3ECfFIxcJbgvwMGuPM7tgLWR7l6RcvcAflrrO2JXf3Gn8jsa9PQ1+OAVn+vrhFKP
	 pQRyCs3AYrHU/5nc53OnqKgKL1Y7qO1/ssUcmk471tUmiL8EJzcQsVZlFz3yU44Ln+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2dNbGCw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84841606A324;
	Mon,  2 Nov 2026 00:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2dNbGCw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7931F000C1;
	Mon,  2 Nov 2026 00:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793577804;
	bh=XCeJHCdfxtlL4kCbtL9cMT179tZ2PTlgxVA3o7V9peo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G2dNbGCwFLUQzHFaAMyueWPh2IvW7CMWjVBWdQxwMjzegcLCmqTY5K4BpiA5hPU3l
	 QsmudHhLGAkN0PWckSVtyOiNCGpqSUxiw2gOf4/b6Vr+57GToFeD1SKDuXWhHlca7v
	 PXNVIyR4o8w03nVHXnJ6GHhzwQyH+BV9aiGEX/fHttdQ8Xg675uwW8rzazutnN8FyV
	 wS0yQx5pjzzfLhs9r2RTfXkPt79ZzPdpyaWwthYPCNit1kkICdy/YeiBrWu479vQp9
	 GRv8VPl7xMk372jsaflLkUrdLhUW2t8fiGvb/7DMXHy2vKR6ee80FfrZd/1b2wMUH5
	 J1YymAPZbh0Sw==
Message-ID: <sashiko-outbox-192789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 09/11] remoteproc: imx_rproc: always use
 non-blocking mailboxes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Valla" <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102-remoteproc_virtio_map-v2-9-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-9-26b300e01c62@valla.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 00:03:23 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] remoteproc: imx_rproc: memory leak of mmsg in imx_rproc_kick() on =
mbox abort
--

commit 059fe2437ad2cd1bd7152b14297e2a685bc5d803
Author: Francesco Valla <francesco@valla.it>

remoteproc: imx_rproc: always use non-blocking mailboxes

This commit switches the i.MX remoteproc mailbox client to non-blocking
mode, dynamically allocating and freeing kick messages via the tx_done
callback, and removes the sys_off handler that previously reopened the
mailbox in non-blocking mode during system shutdown and restart.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 581bb07f5893f..a792b9ca5edd1 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c

[ ... ]

> @@ -696,28 +696,45 @@ static void imx_rproc_kick(struct rproc *rproc, int=
 vqid)
>  {
>  	struct imx_rproc *priv =3D rproc->priv;
>  	int err;
> -	__u32 mmsg;
> +	__u32 *mmsg;
> =20
>  	if (!priv->tx_ch) {
>  		dev_err(priv->dev, "No initialized mbox tx channel\n");
>  		return;
>  	}
> =20
> +	mmsg =3D kzalloc_obj(*mmsg, GFP_ATOMIC);
> +	if (!mmsg) {
> +		dev_err_ratelimited(priv->dev, "cannot allocate kick message\n");
> +		return;
> +	}
> +
>  	/*
>  	 * Send the index of the triggered virtqueue as the mu payload.
>  	 * Let remote processor know which virtqueue is used.
>  	 */
> -	mmsg =3D vqid << 16;
> +	*mmsg =3D vqid << 16;
> =20
> -	err =3D mbox_send_message(priv->tx_ch, (void *)&mmsg);
> -	if (err < 0)
> +	err =3D mbox_send_message(priv->tx_ch, (void *)mmsg);
> +	if (err < 0) {
>  		dev_err(priv->dev, "%s: failed (%d, err:%d)\n",
>  			__func__, vqid, err);
> +		kfree(mmsg);
> +	}
> +}
> +
> +static void imx_rproc_kick_tx_done(struct mbox_client *cl, void *mmsg, i=
nt r)
> +{
> +	if (r !=3D 0)
> +		dev_err_ratelimited(cl->dev, "failed to kick vqid %u: %d\n",
> +				    *(__u32 *)mmsg >> 16, r);
> +
> +	kfree(mmsg);
>  }

[Severity: High]
Does this leak mmsg when the mailbox channel is freed or when transmission
does not complete with a tx_done callback?

In imx_rproc_kick(), once mbox_send_message() returns a non-negative ring
buffer index, freeing mmsg relies solely on imx_rproc_kick_tx_done() being
called from tx_tick().

However, there are several paths where imx_rproc_kick_tx_done() is never
invoked for a queued or active mmsg:

1. When imx_rproc_free_mbox() calls mbox_free_channel(priv->tx_ch) during
stop, detach, crash recovery, or driver teardown,
mbox_free_channel()->mbox_clean_and_put_channel() aborts the active request
and all queued requests without invoking cl->tx_done:

drivers/mailbox/mailbox.c:mbox_clean_and_put_channel() {
	/* The queued TX requests are simply aborted, no callbacks are made */
	scoped_guard(spinlock_irqsave, &chan->lock) {
		chan->cl =3D NULL;
		chan->active_req =3D MBOX_NO_MSG;
		if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK)
			chan->txdone_method =3D MBOX_TXDONE_BY_POLL;
	}
...
}

Any in-flight kick in chan->active_req (such as kicks sent by virtio
subdevices during rproc_stop_subdevices() right before imx_rproc_stop()) or
queued kicks in chan->msg_data[] (for example, when the remote processor
crashes or stops reading the MU register) will be leaked.

2. In mbox_send_message()->msg_submit(), if chan->mbox->ops->send_data()
returns an error, chan->active_req is not set and mmsg remains in
chan->msg_data[] without tx_done being called, while mbox_send_message()
still returns the non-negative slot index t to imx_rproc_kick().

3. For IMX_MU_TYPE_TXDB_V2 channels, imx_mu_xlate() configures
txdone_method as MBOX_TXDONE_BY_ACK, while imx_rproc_xtr_mbox_init() sets
cl->knows_txdone =3D false and never calls mbox_client_txdone(), so tx_tick=
()
and imx_rproc_kick_tx_done() are never called.

Since mbox_send_message() only stores the void * pointer in
chan->msg_data[] and passes it to send_data(), could vqid (or vqid << 16)
be encoded directly in the pointer via uintptr_t or stored in a preallocated
per-vq/per-device array instead of dynamically allocating mmsg on every
kick?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-remoteproc=
_virtio_map-v2-0-26b300e01c62@valla.it?part=3D9
