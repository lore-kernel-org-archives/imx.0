Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4071E313E21
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259140; cv=none; b=n0v1BJErMwq50NHW9x5/+U3FhZb9Hs7sG2LRdNdKWqFg8MiGsfy7bStfQcq22GEqeLqApDnaBT85Uw94bLZTAbvPuTdvm+T4S9n7t9SgGCkpXryXQnsZKe1mQhXyX9mgVXnTIqInCG7wDRjMabVPqDIjPho+JAxOLS0YJwFFUpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259140; c=relaxed/simple;
	bh=VrwXSeaROhNZCDO+4hnct8DzIkmN/798sbnAp6/V+Lk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VGCYo2pFrfb0yrpzhZkLYfTSS5Qnte5D5vsjeTP3YEfHURFCKivaUpSWvXYiIn3x2eK0eKZ/YiXljBLskagN+GFkxJ87MewcfEFGu9NsY1kZjx9v301TjYkQPyjMDlZh5mqVdt2Crnlyk54FmLNvAZhxjM4HS56bayDuKfvX3kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZQr74T/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZQr74T/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22631F000FF;
	Thu, 24 Sep 2026 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790259138;
	bh=37EVTDRfwTvf3aGX/YNi8F2EPrxmW3c7lb1l4AStzsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZQr74T/erOQwfEZvpUpHhsNJJyGQvcxxmaKQbro9pa89txd1WqWvvVy5Xempe9Aw
	 t/O0kgoaeE1fsP+q034cwr4GruegKyjbGuAh/MRqpUaO5fOE6HFD2IPD5C7RUhf0nl
	 cfTfmAn++KnXR6mE+gw5WJFxKhoc4VmvC2vpfRf21UzySP7Om6IwTdPjfsTlVWvx3r
	 8QbIxoiNHXaPYaCmcu/GHnflNgZWCAD34+5gR+DbJJ9qUXKhEI7lgLs1iHThrUaRUD
	 UZYBPWvXyZfd8QN23af+gKs2+WpADqO/hKFpYNhlSczEo2DSBq0k1itTfme4NpXHZ4
	 0SLyYn9iy0mNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] net: fec: reject oversized fragments before
 bounce-buffer memcpy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aldo Ariel Panzardo" <qwe.aldo@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260923141154.2415545-1-qwe.aldo@gmail.com>
References: <20260923141154.2415545-1-qwe.aldo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 14:12:18 +0000
Message-Id: <20260924141218.B22631F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] net: fec: undefined label 'release' causes build failure
--

commit 6a879b984d90eaab6d6db0210d5b4b63b7aaceff
Author: Aldo Ariel Panzardo <qwe.aldo@gmail.com>

net: fec: reject oversized fragments before bounce-buffer memcpy

This commit adds bounds checks before copying transmit data into the per-ri=
ng
bounce buffer to prevent memory corruption when fragment sizes exceed the
buffer capacity.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index 794ec427b0ee6..861498448fe36 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
[ ... ]
> @@ -634,6 +636,8 @@ static int fec_enet_txq_submit_skb(struct fec_enet_pr=
iv_tx_q *txq,
>  	index =3D fec_enet_get_bd_index(bdp, &txq->bd);
>  	if (((unsigned long) bufaddr) & fep->tx_align ||
>  		fep->quirks & FEC_QUIRK_SWAP_FRAME) {
> +		if (buflen > FEC_ENET_TX_FRSIZE)
> +			goto release;

[Severity: Low]
Does this code introduce a build failure? The label release appears to be
undefined in fec_enet_txq_submit_skb(), which causes compilation to fail
with an undefined label error.

>  		memcpy(txq->tx_bounce[index], skb->data, buflen);
>  		bufaddr =3D txq->tx_bounce[index];
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923141154.2415=
545-1-qwe.aldo@gmail.com?part=3D1
