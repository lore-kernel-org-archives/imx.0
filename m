Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2392E25A359
	for <imx@lists.linux.dev>; Sun, 21 Jun 2026 19:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782070648; cv=none; b=Ox2q9NeWukCIVdqNcL7r+SVCCSI8oDwk+Rhv6xiFhKm8RnCBv6sWBO6jvg+DNV/PBHsvmTXIvum/jvPWBMECHLq10AxunHEZkU/pUNEImybBBhwl3sDFL37jmCh7CSKzK4oHK+TDQUUTgAMZYpbW4qJShI2scnN3wk6ynK+4kGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782070648; c=relaxed/simple;
	bh=HCDDkn9N8YXt98kXMVvuuZZAv7yRJ1kWGBlcPM32sRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UszDLDamCWx8tvHE9U9g2LHeM/KTQ83h3yGnQF2nglZnIlPefWKw1RW/ILxhDa1tV5IoKchduvJn084fm9vvNiuvIjEdC1iNiDwEnyEZrXli1BXf4Te/po7tundu9/L8xQc+QF8koNxL6x6TA4YlS4XJU0kWQ/d2+VWbqD0CkW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gkz2uJnd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gkz2uJnd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F171F000E9;
	Sun, 21 Jun 2026 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782070646;
	bh=av/ejfvdG4uQ8GCir9aueB5Jxq7Yfqny2hlvUD+hY9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gkz2uJnduhUVKXw79y8nff4katfyjs7pysAn2A2+P1XwevYw+dutktz2bUz2upj64
	 /e6cUa0+AD64gQFMz7G63rsMnVvXNmbGqrn0mQoMMF1XMJf8kpenaxAQWfv6RoR8PD
	 EqV1fJSnyn/DImmnspHlMnWE80ST9NZybv8A68hekoimWag+26/05GlnHk1EG8h2xl
	 VylQjD7lxt0HJDujjVL5gr6ue4H9NceLMCnegOZYUjNO3ypjUxw0PEhVr+Npe/NVF0
	 g5Cx069wJRTHb5rxscPDKUSG/quPZK+0FveKtErMfDjhKfkBy3v4eRG+ikEG8Qlbgi
	 0CaM5M1SvYvBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] crypto: mxs-dcp - fix source scatterlist length access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thorsten Blum" <thorsten.blum@linux.dev>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260621192615.277957-2-thorsten.blum@linux.dev>
References: <20260621192615.277957-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Jun 2026 19:37:26 +0000
Message-Id: <20260621193726.94F171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Processing a 0-length skcipher request in CBC mode causes an i=
nteger underflow and an out-of-bounds memory read when updating the initial=
ization vector (IV), potentially disclosing kernel heap/SLAB memory.
- [High] The driver uses `sg_virt(src)` to access source scatterlist buffer=
s directly, which returns a bad pointer (usually NULL) for pages in high me=
mory (HIGHMEM), leading to a kernel crash during `memcpy()`.
- [High] The DMA descriptor mapping `desc_phys` is leaked on error exit pat=
hs in `mxs_dcp_start_dma()`.
- [High] When the platform device is unbound, active TFMs are not properly =
drained, leading to a Null Pointer Dereference on global_sdcp. Additionally=
, pending requests in the async queues are abandoned and leaked.
--

commit 654ea836acbafd7d2841dcce57671e9d5ef8944d
Author: Thorsten Blum <thorsten.blum@linux.dev>

crypto: mxs-dcp - fix source scatterlist length access

mxs_dcp_aes_block_crypt() uses sg_dma_len() without mapping the source
scatterlist with dma_map_sg() first. Therefore, sg_dma_len() is invalid
and could return zero or a stale DMA length, causing encryption and
decryption to process the wrong number of bytes when
CONFIG_NEED_SG_DMA_LENGTH=3Dy. Use the original scatterlist length instead.

> diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
> index 133ebc9982362..595b2fd84667e 100644
> --- a/drivers/crypto/mxs-dcp.c
> +++ b/drivers/crypto/mxs-dcp.c
> @@ -353,7 +353,7 @@ static int mxs_dcp_aes_block_crypt(struct crypto_asyn=
c_request *arq)
> =20
>  	for_each_sg(req->src, src, sg_nents(req->src), i) {
>  		src_buf =3D sg_virt(src);
> -		len =3D sg_dma_len(src);
> +		len =3D src->length;

[Severity: High]
This is a pre-existing issue, but does using sg_virt() here safely handle h=
igh
memory pages in drivers/crypto/mxs-dcp.c:mxs_dcp_aes_block_crypt()?

If the crypto request originates from userspace (e.g., via AF_ALG) and pass=
es
pages allocated in high memory (HIGHMEM), sg_virt() could return NULL becau=
se
the page isn't mapped into the kernel's linear address space.

Would this lead to a NULL pointer dereference when memcpy() is called later=
 on
src_buf?

>  		tlen +=3D len;
>  		limit_hit =3D tlen > req->cryptlen;

[ ... ]

[Severity: Critical]
This is a pre-existing issue, but I noticed a potential underflow when
computing the IV out-of-bounds offset in
drivers/crypto/mxs-dcp.c:mxs_dcp_aes_block_crypt():

	/* Copy the IV for CBC for chaining */
	if (!rctx->ecb) {
		if (rctx->enc)
			memcpy(req->iv, out_buf+(last_out_len-AES_BLOCK_SIZE),
				AES_BLOCK_SIZE);

If a user submits a 0-length encryption request, the for_each_sg loop may e=
xit
without updating last_out_len, leaving it at 0.

Since last_out_len is an unsigned 32-bit integer, what happens when subtrac=
ting
AES_BLOCK_SIZE (16)? Will it underflow to 0xfffffff0?

If so, this could read 16 bytes before the start of the in_buf or out_buf,
potentially disclosing sensitive memory into the IV.

[Severity: High]
This is a pre-existing issue, but could the DMA mapping desc_phys be leaked
on error paths in drivers/crypto/mxs-dcp.c:mxs_dcp_start_dma()?

	ret =3D wait_for_completion_timeout(&sdcp->completion[chan],
					  msecs_to_jiffies(1000));
	if (!ret) {
		dev_err(sdcp->dev, "Channel %i timeout (DCP_STAT=3D0x%08x)\n",
			chan, readl(sdcp->base + MXS_DCP_STAT));
		return -ETIMEDOUT;
	}

If the DMA operation times out or the channel status indicates a hardware e=
rror,
the function returns directly.

Does this bypass the dma_unmap_single() call at the end of the function,
leaving IOMMU mappings or DMA bounce buffer space allocated?

[Severity: High]
This is a pre-existing issue, but is the driver unbind sequence in
drivers/crypto/mxs-dcp.c:mxs_dcp_remove() properly tearing down active TFMs?

	kthread_stop(sdcp->thread[DCP_CHAN_HASH_SHA]);
	kthread_stop(sdcp->thread[DCP_CHAN_CRYPTO]);

	platform_set_drvdata(pdev, NULL);

	global_sdcp =3D NULL;

If active TFMs are not destroyed (for example, if held open by AF_ALG socke=
ts),
could a new request submitted after unbind cause mxs_dcp_aes_enqueue() to
dereference the now-NULL global_sdcp pointer?

Also, calling kthread_stop() causes the crypto worker threads to exit. Are
requests currently queued in sdcp->queue abandoned, leaving callers waiting
for completions indefinitely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260621192615.2779=
57-2-thorsten.blum@linux.dev?part=3D1
