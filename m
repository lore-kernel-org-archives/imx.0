Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC63890F3
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910334; cv=none; b=XXQgev0vryR2UeSqudwNtBTKKIjZST3aR1Vhhrr8dhb9lguxNL31Dbz2DYmTLvuUrL5qnZex8+iMfV/JwI5/wkZwDsc/ijc0yFTcWIdbaoKBj1wYPVfXD+oyEJK9VF6xHX2/SFXLnZiEaAai0d4T5QNEllpmEbKMqKHL6Fe900s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910334; c=relaxed/simple;
	bh=Mv0/TpRJAE90sNXNjoP0UOuNaH5S17CcfhZxqAUPnwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LehUhxuP0ZoKe0Cc9Gr38ZFXDMOYx7OVNYgJrFndGogVO/llFYQ5DitVhYTpFxGZR0ZVsDPBUMDZf2PkkATJ/sRkeNDrZ9jDmsR3v4ewnLpakZfHZU2QbxJ4a2/JWIA1JSx8jp0xGOOXJRQX9zYvdaT6fj14Ay7rf2KKxkOqHDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgnNL8bP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgnNL8bP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF4B1F000E9;
	Fri, 28 Aug 2026 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787910331;
	bh=PtIyX6Bmh5s3scqSL630kIINGoe7UvkiUzSnNo55qdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dgnNL8bP+yA3UUrQeRxp4VL/pyRRus7xN+ZI+9ZJ47UuHyi6PQKYnbeWIb5ZZnoAE
	 sfIJ5crTh90MNFIj8eOdrs2aspATGvKWCfhX1TGWmu2cypDrPoebvm7SewZj/NG0dh
	 rdCBMQg506yXA0h0u3BPKTEJ+t5nbijasgqj2Gp8Yp5inzrdq8ZVYsMq58UaD+GuuF
	 eKuF6NL/tEPPEXnDuhBm68Mc9TLE5yyIFycZIPQOyB9pKU1oDM+LaqaaocMG6Y7GQ/
	 9Nqe7jigVBvQgRXOANV2/TCtvtJ0jVTNSD6JIhEMMBabbT696jMITdEk3m8qQV8zuK
	 r8HoZ5CR/f1TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] crypto: mxs-dcp: handle zero-length skcipher requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linmao Li" <lilinmao@kylinos.cn>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260828093209.3179074-1-lilinmao@kylinos.cn>
References: <20260828093209.3179074-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 09:45:30 +0000
Message-Id: <20260828094530.DEF4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch prevents an IV pointer underflow for 0-length skcipher r=
equests, but the exact same underflow still occurs for certain non-zero len=
gth requests if the payload triggers a 0-byte hardware flush.
- [High] DMA mapping for `desc_phys` is leaked in `mxs_dcp_start_dma()` on =
hardware timeout or error paths.
--

commit d4942ea53ae872751299af5195d892f7af73d2e1
Author: Linmao Li <lilinmao@kylinos.cn>
crypto: mxs-dcp: handle zero-length skcipher requests

This patch returns success early for zero-length skcipher requests in
mxs_dcp_aes_enqueue() to prevent an invalid source access and IV pointer
underflow.

> diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
> index 133ebc9982362..60794b4d49fac 100644
> --- a/drivers/crypto/mxs-dcp.c
> +++ b/drivers/crypto/mxs-dcp.c
> @@ -473,6 +473,9 @@ static int mxs_dcp_aes_enqueue(struct skcipher_reques=
t *req, int enc, int ecb)
>  	struct dcp_aes_req_ctx *rctx =3D skcipher_request_ctx(req);
>  	int ret;
> =20
> +	if (!req->cryptlen)
> +		return 0;
> +

[Severity: High]
This is a pre-existing issue, but while this patch prevents an IV pointer
underflow for 0-length requests, does the exact same underflow still occur
for certain non-zero length requests if the payload triggers a 0-byte
hardware flush?

If req->cryptlen is a non-zero multiple of 4096 bytes and the scatterlist
contains trailing extra data, limit_hit evaluates to true. Because the data
perfectly filled the bounce buffer on the previous iteration, actx->fill was
reset to 0.

In mxs_dcp_aes_block_crypt(), the do-while loop would execute once with len
clamped to 0:

    if (limit_hit)
            len =3D req->cryptlen - (tlen - len);

    do {
            ...
            if (actx->fill =3D=3D out_off || sg_is_last(src) ||
                limit_hit) {
                    ret =3D mxs_dcp_run_aes(actx, req, init);

This unconditionally submits the buffer with actx->fill =3D=3D 0. Then
last_out_len is overwritten to 0:

            last_out_len =3D actx->fill;

Causing an out-of-bounds read when calculating the IV offset:

    memcpy(req->iv, out_buf+(last_out_len-AES_BLOCK_SIZE),
            AES_BLOCK_SIZE);

Could this allow a kernel oops or a leak of up to 16 bytes of adjacent slab
memory to userspace via the updated IV?

[Severity: High]
This is a pre-existing issue, but if the hardware rejects the 0-byte flush
caused by the edge case above, does mxs_dcp_start_dma() leak the DMA
mapping for desc_phys?

In mxs_dcp_start_dma(), if the channel times out or reports an error, it
returns without calling dma_unmap_single() for the descriptor:

    if (!ret) {
            dev_err(sdcp->dev, "Channel %i timeout (DCP_STAT=3D0x%08x)\n",
                    chan, readl(sdcp->base + MXS_DCP_STAT));
            return -ETIMEDOUT;
    }

    if (stat & 0xff) {
            dev_err(sdcp->dev, "Channel %i error (CH_STAT=3D0x%08x)\n",
                    chan, stat);
            return -EINVAL;
    }

Could this resource leak be triggered repeatedly by untrusted input to
exhaust IOMMU or swiotlb space, leading to a denial of service?

>  	if (unlikely(actx->key_len !=3D AES_KEYSIZE_128 && !actx->key_reference=
d))
>  		return mxs_dcp_block_fallback(req, enc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828093209.3179=
074-1-lilinmao@kylinos.cn?part=3D1
