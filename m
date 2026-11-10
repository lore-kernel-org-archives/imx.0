Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314783;
	b=2BZmuwCE35Zk2rjgx6WFZO6Dnek4efkrWhgfMost4EFpauPjhuqtWbxLegJKvLWlKc2R
	 ke6pNoiLl2EmlNnNAW/3aPM6SiQJuWL0VGugC5pRTx4eIQXy0i9LHLAh+h1nOHJV/r6/z
	 O6LXT/KPmVSWvWV5vkWTJvxWqiaMZtPzOlNGbpxoppNJIVfSmO1qPao0S+6jQ7JNQfcR9
	 OzwKgCWQjJuHZy5sR4OjHGenJGY8lmSifiCycVonDStSqkcaPvHD/oBVvFdgUrH5yyGyk
	 l5l9eDKVNb3ea1nVfDsU+/ThBqfhqyw7SGdZW7+995qQKLIhW6qoFMcVBhe2Z62YeaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314783;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5Kffbx+1fFZkn7Q2YHCKDQwwKLO8zV+8NrN8w075Raw=;
	b=hYaFOBgWk1cax2FZ132UugB5sZ7wIQfesiR14BbiCSWZERosvniH/BSIP5jC6Ap5EO0d
	 +0VPTpWN2gwgfRYnMh5QozHtgbH+y9g7Cdnqq+/cg7sEMX50F7r4kXz7GyuUR4T2BIl8+
	 qEAond8fXnGCyOSC6Z5y+L0etJpYsHL3A2n3QjiObpwRC3KC98brQRAo0c43UNDiBFEeX
	 HbgNKSEsQJOzb6IbMiOdWFl+CHbgXj2E1PiJc3EOvxhF1UN47LhyE9JX+gvny9mUzJ6UD
	 EJ+a3DxLbOFP0fwYYZMS3KPd0AnaP3lb5P8St01xlb2d3nkxF31k4O0r3vKwg6esyqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9JW7Oys;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38427606A31C
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9JW7Oys
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CD51F008A4;
	Tue, 10 Nov 2026 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314783;
	bh=5Kffbx+1fFZkn7Q2YHCKDQwwKLO8zV+8NrN8w075Raw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k9JW7OysJl2CC9BtQ4c+joH7zqwkrQeDPagfBtRozFeK3lRmlWmzSmD0oW1NMXCYw
	 NTkM/AdiiNrkQZJ3HHLTi3nmxJF83xwwRdhil6ax9kgmhzu4beAhU6bQWaKm4xhddW
	 zfh3l53h/i1+Ce4mccwHyLNaxgMlSAxL2/nbRsP8gy19K3U2RpNfM/1IR56DnOiw5P
	 99T4zhfxjshohg+15WbBrPZQi6b+Jbikm2cxAbkQLd+DyRUGW9yFY4bzf9GjYdt68B
	 vz5UWj5Eds5DATjDzzKlhNIqLxd6DwbhxzwAYC9naIfVQv7mCt+gCHjvL9SnfvRaqm
	 YKYuTt6zWQ9gQ==
Message-ID: <sashiko-outbox-207041@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] remoteproc: imx_rproc: revert channel freeing order in
 imx_rproc_free_mbox
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Leitner" <richard.leitner@linux.dev>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261110-imx-rproc-free-mbox-v1-1-3e33ff98570d@linux.dev>
References: <20261110-imx-rproc-free-mbox-v1-1-3e33ff98570d@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:46:22 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] remoteproc: imx_rproc: dangling pointers in
  imx_rproc_xtr_mbox_init() [1]
--

commit 47b24cc41389cd2e5e7dc88e20cee4c1d32a5d30
Author: Richard Leitner <richard.leitner@linux.dev>

remoteproc: imx_rproc: revert channel freeing order in imx_rproc_free_mbox

This commit frees the rx mailbox channel before the tx channel in
imx_rproc_free_mbox() to prevent an rx callback from kicking virtqueues
through a freed tx channel during shutdown.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 581bb07f5893f..232da31a56ebe 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -920,15 +920,16 @@ static void imx_rproc_free_mbox(void *data)
>  	struct rproc *rproc =3D data;
>  	struct imx_rproc *priv =3D rproc->priv;
> =20
> -	if (priv->tx_ch) {
> -		mbox_free_channel(priv->tx_ch);
> -		priv->tx_ch =3D NULL;
> -	}
> -
> +	/* First release rx channel as its callback may kick vqs via tx_ch. */
>  	if (priv->rx_ch) {
>  		mbox_free_channel(priv->rx_ch);
>  		priv->rx_ch =3D NULL;
>  	}
> +
> +	if (priv->tx_ch) {
> +		mbox_free_channel(priv->tx_ch);
> +		priv->tx_ch =3D NULL;
> +	}
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but can imx_rproc_free_mbox()
pass an ERR_PTR and a dangling pointer to mbox_free_channel() [1] if
requesting the rx channel fails in imx_rproc_xtr_mbox_init()?

drivers/remoteproc/imx_rproc.c:imx_rproc_xtr_mbox_init() {
    ...
	if (priv->tx_ch && priv->rx_ch)
		return 0;
    ...
	priv->rx_ch =3D mbox_request_channel_byname(cl, "rx");
	if (IS_ERR(priv->rx_ch)) {
		mbox_free_channel(priv->tx_ch);
		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
				     "failed to request rx mailbox channel\n");
	}
}

When mbox_request_channel_byname(cl, "rx") fails during rproc start or
attach, priv->tx_ch is freed without being cleared and priv->rx_ch is left
holding an ERR_PTR.  Because both fields remain non-NULL, a subsequent start
retry passes the (priv->tx_ch && priv->rx_ch) check without initializing the
channels and later causes a use-after-free on priv->tx_ch in
imx_rproc_kick(), while unbinding the device causes the devm action
imx_rproc_free_mbox() to call mbox_free_channel() on both invalid pointers.

[1] https://sashiko.dev/#/bug/linux-ac0f248a-bdfd-41da-95f8-44b8f1f7091d

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-imx-rproc-=
free-mbox-v1-1-3e33ff98570d@linux.dev?part=3D1
