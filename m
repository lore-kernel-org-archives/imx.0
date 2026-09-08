Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A493AA1BF
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861427; cv=none; b=d2kE6R8s33MTmOarm5it29fybf6aUv0viAAMipzo4TYIBRdLzWn5Si4ew0M8jlP/OFsXPlbSJQ6IwCOleWXTwG05ES3l1sukT22DSX9IqAgLIrXR31dBqqXRRw9TtG9X8vQTJ3aiKFQy7g5mp7P+iH2khI5iRFjBI/7yYm4PNr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861427; c=relaxed/simple;
	bh=0wXUMktihooh4atg6zvvLY9rA9IyMpNMlLSopQ05CGg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CdN86y59gAeRl7MPKw1SBNVTW/9a5h8gLXJhoLHvorN85zcEGjtl4rVL0zO1qeJmW+acUugWVIxG9u8AFxzCztxFb9JKNrbDt8REvUs1hfwYdm5iy5a6CI0h7zq1+9hrM5z+bJJl2RUaGDxTjChm57jznkUz4NyttXPGI6KffKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwVq0VNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwVq0VNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA061F00A3A;
	Tue,  8 Sep 2026 09:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861426;
	bh=WcAJVViw32frKz3AYBJN86W2kZowjxU1XOAHLaOmh6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nwVq0VNaB/Ewi+E4gGs16RiXu9tvk7ry7MHGmyqO5ykdXlULop1P38EZQw5LYzj7T
	 tvEtRE5oHCIiQUngXVxDFkA6KpSrRYtwdLx9/vbR6I0fO7gckIVvQKDYHU/Cf9VwHS
	 mv9DS6/aS49GYMexK3t/TM+JxoCgJZ0SxrwwQl7RdM8lDXy+Xg+cPgCNPcNFs7DtG3
	 JRtvNzgCCtbzvmzUO9NldPs5/kPL2W0i+xVWKkd23vFiqsTYblNOEX3hoj4nCloD7g
	 9egnR4S8M44tnkvSc2Ds0d1d2rHbXVh+3Ey2cohBvREA6UNZvZFTh0Mr2Ldmgl7TD7
	 zv7QQRIqW0niQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] crypto: mxs-dcp: handle zero-length skcipher
 requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linmao Li" <lilinmao@kylinos.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260908094437.1548278-1-lilinmao@kylinos.cn>
References: <20260908094437.1548278-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:57:05 +0000
Message-Id: <20260908095705.DBA061F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds read and 0-length hardware submission due to imprope=
r scatterlist trailing data handling.
- [High] Potential deadlock due to using spin_lock() instead of spin_lock_b=
h() in queue management.
- [High] Invalid memory access and API violation using sg_virt() and sg_dma=
_len() on unmapped scatterlists.
- [High] DMA channel is not halted or reset on timeout, risking memory corr=
uption.
--

commit e69f94141c2ba5f872a9844bc79817c711aedefd
Author: Linmao Li <lilinmao@kylinos.cn>

crypto: mxs-dcp: handle zero-length skcipher requests

The generic ECB and CBC implementations return success for zero-length
requests, but MXS-DCP queues them anyway. When such a request reaches the
worker, the CBC completion path subtracts AES_BLOCK_SIZE from last_out_len,
causing the offset to underflow. This commit returns success before
enqueueing zero-length requests to avoid the invalid source access.

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
>  	if (unlikely(actx->key_len !=3D AES_KEYSIZE_128 && !actx->key_reference=
d))
>  		return mxs_dcp_block_fallback(req, enc);

[Severity: High]
This isn't a bug introduced by this patch, but since this patch modifies
mxs_dcp_aes_enqueue(), could there be a deadlock here due to spin_lock()
usage?

The AES and SHA worker kthreads (dcp_chan_thread_aes and dcp_chan_thread_sh=
a)
take the channel lock in process context:

drivers/crypto/mxs-dcp.c:dcp_chan_thread_aes() {
    ...
    spin_lock(&sdcp->lock[chan]);
    ...
}

However, the enqueue functions take the same lock without disabling softirq=
s:

drivers/crypto/mxs-dcp.c:mxs_dcp_aes_enqueue() {
    ...
    spin_lock(&sdcp->lock[actx->chan]);
    ret =3D crypto_enqueue_request(&sdcp->queue[actx->chan], &req->base);
    spin_unlock(&sdcp->lock[actx->chan]);
    ...
}

If a softirq (like IPsec network traffic) preempts the worker thread while =
the
lock is held, and attempts to enqueue a request, will it spin forever waiti=
ng
for the preempted kthread to release the lock? Should this use spin_lock_bh=
()
instead?

[Severity: High]
This is a pre-existing issue, but I noticed a potential out-of-bounds read
in mxs_dcp_aes_block_crypt() related to how scatterlist trailing data is
handled.

If a decryption request has a cryptlen that is a multiple of 4096 and the
scatterlist contains trailing data, the first 4096 bytes are processed,
making actx->fill =3D 4096. After submission, actx->fill becomes 0. For the
next element, limit_hit is true, and clen is 0.

Could this cause a 0-length hardware submission and an out-of-bounds read?

drivers/crypto/mxs-dcp.c:mxs_dcp_aes_block_crypt() {
    ...
    if (actx->fill =3D=3D out_off || sg_is_last(src) || limit_hit) {
    ...
        last_out_len =3D actx->fill;
        actx->fill =3D 0;
    ...
        memcpy(req->iv, in_buf + (last_out_len - AES_BLOCK_SIZE),
               AES_BLOCK_SIZE);
    ...
}

With last_out_len =3D 0, does the memcpy underflow the pointer (0 - 16) and=
 read
16 bytes before the in_buf array?

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential invalid
memory access in mxs_dcp_aes_block_crypt() when handling scatterlists.

The code extracts virtual addresses and DMA lengths directly from the unmap=
ped
scatterlist:

drivers/crypto/mxs-dcp.c:mxs_dcp_aes_block_crypt() {
    ...
    src_buf =3D sg_virt(src);
    len =3D sg_dma_len(src);
    ...
}

Since the scatterlist is not mapped first, wouldn't sg_virt() return a NULL
pointer for HIGHMEM pages, leading to a panic during the subsequent memcpy?
Additionally, is it safe to read sg_dma_len() before a DMA mapping has
occurred, especially on platforms that require CONFIG_NEED_SG_DMA_LENGTH?

[Severity: High]
This is a pre-existing issue, but I see a risk of memory corruption in
mxs_dcp_start_dma() when handling timeouts.

When wait_for_completion_timeout() expires, the function simply returns:

drivers/crypto/mxs-dcp.c:mxs_dcp_start_dma() {
    ...
    if (!wait_for_completion_timeout(&sdcp->completion[chan],
                                     msecs_to_jiffies(1000)))
        return -ETIMEDOUT;
    ...
}

Since the active DMA transfer is abandoned without halting the hardware
channel, could the hardware resume the transaction later? If the caller unm=
aps
the buffers and the worker reuses the shared bounce buffers (aes_in_buf,
aes_out_buf) for the next request, wouldn't a delayed DMA completion overwr=
ite
these buffers while they are in use?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908094437.1548=
278-1-lilinmao@kylinos.cn?part=3D1
