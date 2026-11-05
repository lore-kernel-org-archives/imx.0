Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880606;
	b=WBmyB8zX80azZa6HH5lsE2TTzaB6Lzrswcee7nSa4RX30GrEa8thA57yVIgk2m/vwanO
	 5kjhTUVWSREqr5mSWC/EmzFzsKOQvCvXeObGWXOd9D0bgxc/zFcnV3rH1SPFMNMxa76aC
	 V/Hp/52bgR2F14V+zP+zhacmGu51vppBj08UkmU/POoqjVUvjQ1X9yIlGAos4EfUB4f7E
	 /ozgeXbSThrAA6axJA8Tmak+ypWfXvFd7F7MfeDMnWLEGjz2Itu39kkCMRIg8npjSlhTP
	 nVL/KBQhGLrreAvp9R8PYJ8gvE37Ty/vP738B2AFkqsRIJWsenCG+NolWLB1zjcJLNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880606;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nUz4Io3obhOg4zcinYJ5zzDlQAYvsWYz128DP6cUtFI=;
	b=HBrTtRMxfyvE99GGfYehQG50AMxDkK3CFHcTNz5fzEuxeISZnN0zcQWgj6qUIBg0e31m
	 vn9QJXjQLUuSfT9Q8FuoHRstT2aQV7+/V/Y28v/lKFsk5xNyPOuFYIeV7b9tL21O3QcuJ
	 eIGf/pjYhw3xPKCrcEuNZPSd09bK8DKasBrPwvJnzHbBJ4rbk5OZO3riidagmwdc4zcKo
	 0y23giWrLUQaRMb1Mg6IAoCWVvlsPnxYR3m6S63l2DfcaTBKaFBzRn5tV1S9bC3UZB8jt
	 GWzTkHJnjAIu7jHFREYEq5KZDvPVXqFbA3KVd5d2NmB8nXj1fAVaLAyqAg5rW1VLP2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Edacfga2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EF0606EE82
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Edacfga2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353F41F00A15;
	Thu,  5 Nov 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880606;
	bh=nUz4Io3obhOg4zcinYJ5zzDlQAYvsWYz128DP6cUtFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Edacfga2G8YFXeBqVoBwNSY0rMWOwonmGn6gw9fcU+XCznLPncDxMJsGh87Ylta4d
	 lf3y4HBbAHnsRTtoGzpcpKJGcXLQYRFdBu9Kbqqpc+C7NNsZA7/bJFTJXWS8cqNzAu
	 mdGWPG7iMh5edh/w8TBSx0+7A5vgVflHyH+fVzzS3TNOy6TfR1EjinI1yoj7xsEj/B
	 FCmMk4rvkMNHRhQD35zKlUn3jC6PNLYLZX7dTEjQA5/6Dpa6nxflmUXNW1l64xDXcq
	 JToAQtbeZuNndKy2WZTH3P9r6AUo6AXkOG2M6TycU0f1u26cb8g6eO9vHKRNDgxF+/
	 WZNm/9p/1wKaQ==
Message-ID: <sashiko-outbox-198999@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
 <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:10:05 +0000
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
- [Low] remoteproc: misleading memcpy_tova callback name and incomplete ker=
nel-doc
--

commit 1f800d9eb3b123f9d100331894730d47e230cc68
Author: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

remoteproc: elf_loader: Create new callback for copying segments to remote =
cpu

This commit introduces a new memcpy_tova callback in struct rproc_ops so
platform drivers with special memory access requirements can override the
default rproc_da_to_va() plus memcpy/memset sequence in
rproc_elf_load_segments().

> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remotep=
roc/remoteproc_elf_loader.c
> index da3cddbe7d4cb..3c749a39e5dad 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, co=
nst struct firmware *fw)
>  			break;
>  		}
> =20
> -		/* grab the kernel address for this device address */
> -		ptr =3D rproc_da_to_va(rproc, da, memsz, &is_iomem);
> -		if (!ptr) {
> -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> -				memsz);
> -			ret =3D -EINVAL;
> -			break;
> -		}
> -
> -		/* put the segment where the remote processor expects it */
> -		if (filesz) {
> -			if (is_iomem)
> -				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
> -			else
> -				memcpy(ptr, elf_data + offset, filesz);
> -		}
> -
> -		/*
> -		 * Zero out remaining memory for this segment.
> -		 *
> -		 * This isn't strictly required since dma_alloc_coherent already
> -		 * did this for us. albeit harmless, we may consider removing
> -		 * this.
> -		 */
> -		if (memsz > filesz) {
> -			if (is_iomem)
> -				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
> -			else
> -				memset(ptr + filesz, 0, memsz - filesz);
> +		if (rproc->ops->memcpy_tova) {
> +			ret =3D rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz,=
 memsz);
> +			if (ret) {
> +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %p=
e\n",
> +					i, da, ERR_PTR(ret));
> +				break;
> +			}

[ ... ]

> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 00019b1895e6e..e750a127cbc4a 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -75,6 +75,7 @@ enum rsc_handling_status {
>   * @detach:	detach from a device, leaving it powered up
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
> + * @memcpy_tova:optional platform hook to copy data into remote memory r=
ange
>   * @parse_fw:	parse firmware to extract information (e.g. resource table)
>   * @handle_rsc:	optional platform hook to handle vendor resources. Shoul=
d return
>   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
> @@ -99,6 +100,9 @@ struct rproc_ops {
>  	int (*detach)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_io=
mem);
> +	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
> +			   size_t filesz, size_t memsz);

[Severity: Low]
This isn't a bug, but is memcpy_tova the best name for this callback in
struct rproc_ops?

Across the remoteproc subsystem (such as in struct rproc_mem_entry and
ops->da_to_va), da denotes a remote processor device address while va denot=
es
a kernel virtual address. Since rproc_elf_load_segments() passes the
untranslated device address da directly to this callback (including for
devices where remote memory is not mapped into CPU virtual address space at
all), calling it memcpy_tova seems somewhat misleading.

In addition, when rproc->ops->memcpy_tova is provided,
rproc_elf_load_segments() skips both the filesz copy and the trailing
memsz - filesz zeroing step. Should the kernel-doc comment for @memcpy_tova=
 in
include/linux/remoteproc.h document that implementations must copy filesz
bytes to da and zero-fill the remaining memsz - filesz bytes when
memsz > filesz?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793879714.gi=
t.u.kleine-koenig@baylibre.com?part=3D1
