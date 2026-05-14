Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5BC37D127
	for <imx@lists.linux.dev>; Thu, 14 May 2026 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778796896; cv=none; b=P0Ff8Yqb3Vmw8giqKvFtEpPj7AQ+bS4XEaToZVeqMGnz9o0tBQ2FKShSR9sHUSH/1QnK/vClBBu2GMUKMzlW3R/VFqih6egG9XEDbCGeTUUOjQgW0AoeFdexOQEqUqvvhUgB2LpTKy3Wn85mPfbXT6N1qdzaPXEmyoEnRtFLcP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778796896; c=relaxed/simple;
	bh=lGFd8Es/0dPFbNGbeDfQ/j5GBkR7gPCexFMeifuH/FQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nkTAPxsqW/1oCbGuBV+917Nne7ctyzHH/hYQmHrqGXX/7ficA0OY5DmPmP9W7G9GlxhRwiMo0e1XhP6vYG7hjDvXvHyKFbXQ4C7IheyZkBBw+UZxFdTQPVy8rZH5HEDPtNXYLOtXnezPwaFuh5ESSe0WjLEVFLlsYv+/Os5OoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zqc8TBbu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zqc8TBbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97F1C2BCB3;
	Thu, 14 May 2026 22:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778796895;
	bh=lGFd8Es/0dPFbNGbeDfQ/j5GBkR7gPCexFMeifuH/FQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Zqc8TBburXw9hde8nHB6Pu6s51wpiNSAZzZxUAsjODM+2/Jf3p21UuE7y1xaAd9RE
	 HvHb8FHHTmaqzu4ZfjOGmcDZBrwQoNQdec4fAx9g6/5wys4f6ASo1S1dVgrtXGC4Df
	 pFkWhbp6mWK5QFs0B17DJwoXE9CC6VCTOWOhYeOdaQG+TBBni3NFm7/sbr/QXmWx0X
	 na1+wGbj0YwtJmXOLKNQJet4s+Dv1ue/0DrIh5HH/xThiRUM6kcVDQcDExVKnA73yB
	 cLqrz3CJ6rbbRhYNXi6sRFkfD1WxKfWPxsDkVU4ZRY3qg2Z/To/Iu95DW6QXEuge2e
	 vrhiPls1yBspA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] remoteproc: switch drivers to optional
 resource-table helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: imx@lists.linux.dev, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
In-Reply-To: <20260514162129.1504162-6-ben.levinsky@amd.com>
References: <20260514162129.1504162-6-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 22:14:55 +0000
Message-Id: <20260514221455.A97F1C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] This problem wasn't introduced by this patch, but an integer overf=
low in ELF segment bounds checking in `imx_dsp_rproc_elf_load_segments()` a=
llows an attacker to bypass validations and perform an out-of-bounds read. =
`offset` and `filesz` are 64-bit values (`u64`) parsed directly from ELF pr=
ogram headers. The boundary check `if (offset + filesz > fw->size)` lacks p=
rotection against integer overflow. A malicious or corrupted firmware can s=
upply a massive `offset` (e.g., 0xFFFFFFFFFFFFFFFE) and a small `filesz` (e=
.g., 0x10), causing `offset + filesz` to wrap around to a small integer (0x=
0E). This bypasses the `> fw->size` check. The code then executes `imx_dsp_=
rproc_memcpy(ptr, elf_data + offset, filesz);`, where pointer arithmetic on=
 `elf_data + offset` resolves outside the firmware buffer, resulting in an =
out-of-bounds read that leaks kernel memory or causes a kernel panic.
--

commit 71c8dfba5336b57c340ad4c8970a2211c5b78f4f
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: switch drivers to optional resource-table helper

This commit switches several remoteproc drivers to use the shared optional
resource-table helper for firmware that treats a missing resource table as
non-fatal. It retains local parse_fw() wrappers to manage return-value
logging and severity.

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_=
dsp_rproc.c
> index 2d9f14fbef1da..2ff74f7938f61 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -954,14 +954,6 @@ static int imx_dsp_rproc_elf_load_segments(struct rp=
roc *rproc, const struct fir
>  	return ret;
>  }

This problem wasn't introduced by this patch, but while reviewing
imx_dsp_rproc_elf_load_segments(), I noticed a potential integer overflow
in the ELF segment bounds checking.

Since offset and filesz are 64-bit values (u64) parsed directly from the
ELF program headers, does this code overflow offset + filesz?

drivers/remoteproc/imx_dsp_rproc.c:imx_dsp_rproc_elf_load_segments() {
        ...
        if (offset + filesz > fw->size) {
                dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
                        offset + filesz, fw->size);
                ret =3D -EINVAL;
                break;
        }
        ...
        if (filesz) {
                ret =3D imx_dsp_rproc_memcpy(ptr, elf_data + offset, filesz=
);
        ...
}

A malicious or corrupted firmware could supply a massive offset
(e.g., 0xFFFFFFFFFFFFFFFE) and a small filesz (e.g., 0x10).
This would cause offset + filesz to wrap around to a small integer (0x0E),
bypassing the bounds check.

Could this lead to pointer arithmetic on elf_data + offset resolving
outside the firmware buffer, resulting in an out-of-bounds read during
the memcpy?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514162129.1504=
162-1-ben.levinsky@amd.com?part=3D5
