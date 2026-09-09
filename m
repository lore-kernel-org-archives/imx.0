Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046FB58596E
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 20:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987002; cv=none; b=KqZ5mWgbv7HCRc2cg/tp+XIS47cD3hcYv7VJB5M4+iCdCY+EnOTsYSqvmPjEshM2Gi52jNqKhqrLM+l8Rj+XV1M+4k1hyphb6AixM/po5Ne0GUKY0zzr3ufzUs6QwCSdbJVvWnqcjMDQrL1En44F11/NhDju/3dTOs6Dlorv/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987002; c=relaxed/simple;
	bh=kJ1muZ09zCsINi1Dz1xcXmIm6tYbH0D1fasWJzU50V8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ma12chYxYEu3RHaMwOVmZyQ4VIK37zoAs7VVt2sS4Gjy3xG0xwcWz/+qvxXM0ZNcC1Bf+ebRBBEAonSQf/Z9tiMwzdQrn/NQqXfgEKANrVwlAVS4yVmYeTYT/ymJJZSgAvOvR+aCMzCDcTwBml4wMVevWgei2HODQT6sZulh2WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSYJXPQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSYJXPQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8669D1F000FF;
	Wed,  9 Sep 2026 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788986993;
	bh=0lcB0zgMIXXJMp1QTxYyfjAbYrAFC8welcZjU9LRw60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VSYJXPQVJKRk27crUGhspR14QDdKg/Wi1PYgZ8UC9btsSEIVPUIi2gs67bHNdlDi9
	 EceF4ayc6u6AOf5cd/wi8nexDpgR2m9N7iOOPfan6cxNjn9WMWo7wXApHBO6v6y0lE
	 QgNiLTo0ug5L1GSJbhTY+AQ+zYdRb2lsnNQH/1bUJQjyE9/WypGoEfT88cQob5j45q
	 Q6XeNgIOJxdigvSKF6rNML4e/GPH8rVHOXvj9Xc68UfAI3fWiiAHOVE/oCZJqGT7Lz
	 Skqgf/Xq8G2+3dADj145RDBVXXNeGXbo8Ndn/0AsX6SfgnxcQAzAKrwCevU7+fKqnk
	 JqaEb8BrkRHtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: SOF: Bound the panic filename print to its array
 size
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260909204042.46656-1-stefanghetu9@gmail.com>
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 20:49:53 +0000
Message-Id: <20260909204953.8669D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized kernel stack memory (infoleak) is printed to the ker=
nel log due to early returns in DSP get_registers functions on malformed fi=
rmware data.
--

commit 912b1c487de64ea505751942c78c4e99b655cbf5
Author: =C8=98tefan Ghe=C8=9Bu <stefanghetu9@gmail.com>

ASoC: SOF: Bound the panic filename print to its array size

This commit limits the printk format specifier for the panic filename
to SOF_TRACE_FILENAME_SIZE to avoid over-reading a non-null-terminated
string array.

> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 2d394389c945b..9b0850e87bf60 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -152,7 +152,8 @@ void sof_print_oops_and_stack(struct snd_sof_dev *sde=
v, const char *level,
>  	dev_printk(level, sdev->dev, "trace point: %#010x\n", tracep_code);
> =20
>  out:
> -	dev_printk(level, sdev->dev, "panic at %s:%d\n", panic_info->filename,
> +	dev_printk(level, sdev->dev, "panic at %.*s:%d\n",
> +		   SOF_TRACE_FILENAME_SIZE, panic_info->filename,

[Severity: High]
This isn't a bug introduced by this patch, but does this function leak
uninitialized kernel stack memory if the DSP firmware sends a malformed oops
header?

Looking at caller sequences like hda_dsp_dump(), the panic_info and stack
variables are allocated on the stack without zero-initialization:

sound/soc/sof/intel/hda-dsp.c:hda_dsp_dump() {
	struct sof_ipc_panic_info panic_info;
	u32 stack[HDA_DSP_STACK_DUMP_SIZE];
	...
	hda_dsp_get_registers(sdev, &xoops, &panic_info, stack, ...);
	sof_print_oops_and_stack(..., &panic_info, stack, ...);
}

However, architecture-specific register getters like hda_dsp_get_registers()
and atom_get_registers() can return early without initializing this memory
if the header size is invalid:

sound/soc/sof/intel/hda-dsp.c:hda_dsp_get_registers() {
	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
		dev_err(sdev->dev, "invalid header size 0x%x. FW oops is bogus\n", ...);
		return;
	}
	...
}

Because these getter functions return void rather than an error code, the
callers continue unconditionally and pass the uninitialized variables to
sof_print_oops_and_stack().

This function then logs panic_info->filename, panic_info->linenum, and
loops through the uninitialized stack array via sof_stack(). Could this
allow a buggy or compromised firmware to trigger a dump of uninitialized
kernel stack memory into the kernel log?

>  		   panic_info->linenum);
>  	sof_oops(sdev, level, oops);
>  	sof_stack(sdev, level, oops, stack, stack_words);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909204042.4665=
6-1-stefanghetu9@gmail.com?part=3D1
