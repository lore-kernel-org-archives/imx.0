Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E193D6478
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 20:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986965; cv=none; b=QPFNW1ESDzOP+kw1TkBsNWzokp3gs+hT0mjG5nfXIHFHeHGXHNsaCq4gemQ+5uIhKANht58Jol+hz4vpfsUyGHpepHsnUzTbnGEsJlbqMCLHFxmx2SN8q3cSEzOLCGOp79xdunupqzIJTickVEoJmIqGpDxRBnFZ5IYRQN3pF4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986965; c=relaxed/simple;
	bh=DOkjFvWl2S2dI7nTY98/lIdw/BGjUrQ+DkWV+fvMiPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mz0jpFgapA33gofer0QvkdHWenZGZvXZKq8kP3yIYpnzk1v5wMjA2WCLxaf8PYdRzWrdj7DL+DcmzPV7YJp1P6A/3Q8F1bbNoUZTnT6qMYfMNa9s8FE7SktwCwTHSaP9vSXTwPm6fH0M9xlmStO/l0yY6bHzYgwOCpUbg3hyKww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSV3KaXv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSV3KaXv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911C71F00893;
	Wed,  9 Sep 2026 20:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788986957;
	bh=2lIFF1tWeK+5bpogEK43Wu8N9CUQv2SMYlNVsrTnErA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KSV3KaXvLe90uFPKgS82YYbJ6cUNCON6Nnv1O+s9ciX81b4xwlr52jiq8hi62cWTl
	 73gKVLCPWqkXpNY6BDhCsVZDXFc2q9muCPylltN8doZ5dU5AyjVBh3fmpKY35su/dI
	 Wffn0rtuqlp6Cd07BiVEB56tQm+vnY4PdH1V/LptNB5/KE4SCuabHEVTZykkL1Vo+u
	 cSSmtKX2UW5Xbj1/uRRa9T7bf58+tavHOKr644YNLH8JEsToFugRPzk2iwyQKNZ+wt
	 es5ladTJQ6AXvEVNaXiBp5adM8TH0Csg+N+5SpP9AGgFE5ZdrXOz0JrhdTtyCQN7hU
	 Ly7OUMBrc0qRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic
 dump
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260909204042.46656-2-stefanghetu9@gmail.com>
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
 <20260909204042.46656-2-stefanghetu9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 20:49:17 +0000
Message-Id: <20260909204917.911C71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch provid=
es an incomplete fix: a stack out-of-bounds read vulnerability in DSP oops =
dump remains unpatched in multiple other SOF platform drivers (Intel, AMD, =
MediaTek).
--

commit 9725b087f0cb0d8ed0af1f47cb1ea7c073221581
Author: =C8=98tefan Ghe=C8=9Bu <stefanghetu9@gmail.com>

ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
   =20
This commit addresses a stack out-of-bounds read vulnerability during DSP
panic dumps on i.MX by clearing `numaregs` to 0 after reading the oops
message into a stack-allocated struct.

> diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-commo=
n.c
> index 7a03c8cc5dd47..436fe49246ba8 100644
> --- a/sound/soc/sof/imx/imx-common.c
> +++ b/sound/soc/sof/imx/imx-common.c
> @@ -34,6 +34,7 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
> =20
>  	/* first read registers */
>  	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
> +	xoops->plat_hdr.numaregs =3D 0;

[Severity: High]
This isn't a bug introduced by this patch, but does this leave the same sta=
ck
out-of-bounds read vulnerability unpatched in other SOF platform drivers?

It looks like several other platform drivers read the oops message into a
stack-allocated struct without clearing or validating `numaregs`:

sound/soc/sof/intel/hda-dsp.c:hda_dsp_get_registers()
sound/soc/sof/intel/bdw.c:bdw_get_registers()
sound/soc/sof/intel/atom.c:atom_get_registers()
sound/soc/sof/amd/acp-common.c:amd_get_registers()
sound/soc/sof/mediatek/mtk-adsp-common.c:mtk_adsp_get_registers()

If a compromised or malfunctioning DSP sends a panic IPC with a non-zero or
artificially large `numaregs` value in its header, could it still cause an
out-of-bounds stack read in these drivers when the shared Xtensa helper loo=
ps
over the unallocated `xoops->ar[]` flexible array?

> =20
>  	/* then get panic info */
>  	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909204042.4665=
6-2-stefanghetu9@gmail.com?part=3D1
