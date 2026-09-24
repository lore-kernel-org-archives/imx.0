Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286583B841C
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282286; cv=none; b=DWm7Shw06oeAj1NH2gsv2Ci0jfWfuJjWG7du0DjcYzx2gwwj+vYSD8PBBcSJuPeBKnd218byidFUFBzfVqmeq7tBFQFNH6GuqoxRAefSgljsWL2yESBG/dj1MsYh8DZ2qdl+QY2VpEgtUlbNEcFGDJSAif6dSxd0AiE2j5Yznbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282286; c=relaxed/simple;
	bh=g4AxYBijSMnM9A9zstfIgrZiQFpzPE+08C3SWB0zFKw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E4Mr99mvTD/AxOpc9Q7aOEYWp5o77YiWUeWO3v2JP3cE+11FGruIuOwGwgeEtFZcWcJUOrRRn+w+XoCYt1BtbOpbaZ4e5QuiyU4z+fagTY/peck9BE8QkMqUkMaTZltkPlLhwvhuZ/vVaWvKDhECYLMa8iq50NZP1C1BiiVrVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/8Ytj+y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/8Ytj+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFF71F000FF;
	Thu, 24 Sep 2026 20:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790282284;
	bh=z3lLazzzka9HN9Qx2Mb6rp+ExcefkL5742hJO8+ii4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F/8Ytj+y4w4yMmS52S4TkME6tQ2mCGK0sN3HT+w0Ms8EOe3spla/WWQqlgX4xwFjx
	 7P3BbuPrO44DUBmHsRi2fZk+kX1Mvcb6QDbMUnIEtFrCd4iWQm8fFZnAxHcwEhUixW
	 96BYDn00fm8H5vSZ34bob5F9XqOuGRVl605LLfnGKdVdHnQfcis5q/u+UVWk2DqIdZ
	 yXOmxCl7/k3maafDRmsms1ZwNLhDJ/Tdgt+VYzAmRk4Idvs6xvO8+qYOv8osUcEuqv
	 68l7gPJFM2ZnJp0gXfzqw5wszhhPeHQI+I/1Xw54hgBa0ZD+JO0pftxtw7x5FMjxh4
	 esVHNYhKZ2ZyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: fec: reject oversized fragments before
 bounce-buffer memcpy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aldo Ariel Panzardo" <qwe.aldo@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260923203738.1583735-1-qwe.aldo@gmail.com>
References: <20260923203738.1583735-1-qwe.aldo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 20:38:04 +0000
Message-Id: <20260924203804.9AFF71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] net: fec: build failure due to undefined label release
--

commit 07a88506b223c9e67d1b8c1a1dfa027140cd954a
Author: Aldo Ariel Panzardo <qwe.aldo@gmail.com>

net: fec: reject oversized fragments before bounce-buffer memcpy

This patch adds length checks before bounce-buffer copies in
fec_enet_txq_submit_frag_skb() and fec_enet_txq_submit_skb(). It aims to
prevent buffer overflows by jumping to the error path when the data exceeds
the bounce buffer capacity.

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
Does the label 'release' exist in fec_enet_txq_submit_skb()? It looks like
this might cause a build failure due to an undefined label.

Additionally, if a release path is added, would we also need to ensure the
skb is freed (for example, via dev_kfree_skb_any) to avoid a memory leak?

>  		memcpy(txq->tx_bounce[index], skb->data, buflen);
>  		bufaddr =3D txq->tx_bounce[index];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923203738.1583=
735-1-qwe.aldo@gmail.com?part=3D1
