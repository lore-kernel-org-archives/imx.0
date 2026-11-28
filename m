Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837167;
	b=fFmcdB9WbB3v8NO0zaK1iRDVGGx8ciwj2eV2vq2FO5xn6jsebPS2+X6krPQ8du3KFmeg
	 HPvtXqdIaVMQ/VZZ5/9Ddi+A+NxEYc3IAqI6yxMFy2LfdOU9fOAZ1Z0mTYlIsqmVpKtsT
	 WGXjFvv2WxtSRwey8dVWOWYAd2yiYulw2ynhDW72HltN8gfkrNRNQ4f6+YHlDtYLSFoRr
	 AJ3CNzdDrsJ1ZftdQS7/f/IV04aQyfZLwv3clUDL+Z1un84TiSzlci6/kBNjcQaQf6g3d
	 c68lzO1jY7O/Jcz7ujmksvzIXVM/GiAsnKJAs8b4F9NnhRpDHjHqipcjhlZb7TsSL3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837167;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iwpb/ANF2gyhXeCfrpbIKpWjvjcwHB43qdfvqOWVk0Q=;
	b=oByjeNh+meEkDs3fdSOZEPhp4UYH9mgOpMtmstVJqwRHSSZtb7gowet+t1Oan0B0XLeb
	 YRHltsrm8zaCIvGMU5PeD89hurxjUKOAE5uoAmNKw2KLAYBBze/yRwoA5/hpdkEnzHKjh
	 zeI8BleugfWzTRQHY1lahbF8bWwMcjBMb8p/RkPPMVMngNKejhJRhr2UQvTVR2equc8JA
	 Qj5jWtznFeqpar7j4ZgCgxlnQhhx+krUIdvT9Tp5xQyEQxPErLAkZh1kLfRQgh84knuer
	 bGEdvaIb7TjhU5Wk41ut0VgbEm8QDZK/ODBYp8AAhxX9gubv66NREWGh0mzugavB93Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cXosV9qL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DF1606A31C
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 03:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cXosV9qL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA99A1F00893;
	Sat, 28 Nov 2026 03:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795837166;
	bh=iwpb/ANF2gyhXeCfrpbIKpWjvjcwHB43qdfvqOWVk0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cXosV9qL8YBxRsbctyJyTIcjyOgFzo1fU1+/2vxHoGpc1LjMA4V1zFGbzq6teZ2oM
	 +sizqhfunX3ZtnDHSfYVaVUwIshXYSpH3oIY5QMTMEn6KelzdkqbXYLBP/cucLpBN/
	 vYrZitZYvi4ozMnaiFKcwzvSMmgREHaxP8JXg9J0+gIncxlWVaX9UD52XaoNImSLs+
	 screPr+eeqBrcaymUfirVSGNAFMG6uPvFoW7nh5dKT1vqQVMvcXkKtbFg2FmKmw5sJ
	 2WOY2Xg9lXroRZu4QJPYBR0QST/jhUO2vYekpeErfxyrc4jd//cndpqicS9X5DpwG+
	 kIKZBIdOli3/g==
Message-ID: <sashiko-outbox-238437@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: fec: fix TSO DMA mapping failure handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Keisuke Tsukuda" <tkdkei@outlook.jp>
Cc: =?utf-8?b?aW14QGxpc3RzLmxpbnV4LmRldg==?= <imx@lists.linux.dev>, Frank.Li@kernel.org
In-Reply-To: <20261127033906.9561-1-tkdkei@outlook.jp>
References: <20261127033906.9561-1-tkdkei@outlook.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 03:39:26 +0000
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
- [Critical] net: fec: use-after-free in fec_enet_txq_submit_frag_skb()
  [1]
--

commit 456fe9a775ff2f95a222a719c8b31ab3edda1c33
Author: Keisuke Tsukuda <tkdkei@outlook.jp>

net: fec: fix TSO DMA mapping failure handling

This commit fixes TSO DMA mapping error handling by returning -ENOMEM from
the descriptor helpers, keeping the first descriptor unready until all
mappings succeed, and preserving BD_ENET_TX_WRAP during descriptor cleanup.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index f7636f23d1ebb..a2c760218e839 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c

[ ... ]

> @@ -922,7 +927,7 @@ static int fec_enet_txq_submit_tso(struct fec_enet_pr=
iv_tx_q *txq,
>  					 DMA_TO_DEVICE);
> =20
>  		/* Clear standard buffer descriptor fields */
> -		tmp_bdp->cbd_sc =3D 0;
> +		tmp_bdp->cbd_sc &=3D cpu_to_fec16(BD_ENET_TX_WRAP);
>  		tmp_bdp->cbd_datlen =3D 0;
>  		tmp_bdp->cbd_bufaddr =3D 0;
> =20

[Severity: Critical]
This problem wasn't introduced by this patch, but does
fec_enet_txq_submit_frag_skb() leave BD_ENET_TX_READY set on unmapped
fragment descriptors on DMA mapping failure [1]?

drivers/net/ethernet/freescale/fec_main.c:fec_enet_txq_submit_frag_skb() {
	...
		bdp->cbd_sc =3D cpu_to_fec16(status);
	}

	return bdp;
dma_mapping_error:
	bdp =3D txq->bd.cur;
	for (i =3D 0; i < frag; i++) {
		bdp =3D fec_enet_get_nextdesc(bdp, &txq->bd);
		dma_unmap_single(&fep->pdev->dev, fec32_to_cpu(bdp->cbd_bufaddr),
				 fec16_to_cpu(bdp->cbd_datlen), DMA_TO_DEVICE);
	}
	return ERR_PTR(-ENOMEM);
}

Each mapped fragment writes status with BD_ENET_TX_READY to bdp->cbd_sc,
and dma_mapping_error unmaps earlier fragments without clearing
BD_ENET_TX_READY or advancing txq->bd.cur.  If the next transmitted packet
uses fewer descriptors than the aborted one, the trailing stale descriptors
remain marked ready and the MAC can DMA-read from the unmapped addresses.

[1] https://sashiko.dev/#/bug/linux-ad99904c-d478-49a5-bb3b-e4124919a833

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127033906.9561=
-1-tkdkei@outlook.jp?part=3D1
