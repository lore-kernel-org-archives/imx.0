Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C60572670
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887952; cv=none; b=eXR20ljX7lG9EBdHWVFz0D02Kw5G1PQC4Dd4qKktHzl5LwnrNYL+ADjdAbaBJQqbHkqF0cCJjb2hA+gVq2IJwlp3vCGdl98fUDLv7gTavgiBObDpvT/FwdJdlID1b329E0MZXdiu9WwYoMPSZO+h0YE2ZRBWgk4Zm+rE4IUPJz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887952; c=relaxed/simple;
	bh=6KnREaqCWchLn+Kl1jQKwaetKC/OC+Iq9Mn4RJespOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j4jf68hTSDcojnQ1aWMnsmnEntNTt6wyZtsb5clxA/E6S7x/YoLIPwIVCWv23R+3WbbTMygatO3BdmBJe/h3YDp4+nlD31/P4URdAs9jfpcdjLGLsNosSgowjLVaW14ORL3mkYzLotE4SPIMWDPbVBmdltSsyZroeT2CkhQ+gdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBIg65DU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBIg65DU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28331F00A3D;
	Tue,  8 Sep 2026 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788887950;
	bh=sISPQBZ0MxNs75rM5cYeDDQnOiC2cyWOaALprSJOx98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PBIg65DUTKftiGIVoCekxNzqHUyp4ZQnZJWtpOINr7GaT96LkKrLxZSPvwZblxUSe
	 5+IJy1EYap2PTgwLd5lIQELG8pplxYQD/B2E63TeaOHawGryxfHz7Zn3j/8yA2/PxD
	 8oNATs8qWeEMiEZvXTh/jT9kaLpX8riLzwAkEgF89Rg3i0Xa2C2+slOdkC40VcPxlu
	 HIZQ8G1D+JEmKz+JESGI4U7MZa0dxrH6qnseRNJ9sKyqR9NM3KYZ7AH6d2CxfONfvh
	 j+ri2A3LJONianWVgzTod6NsaVBQATSR5yyPPZS8VR9PHCYhQnCh+nZZC5ypNskQnq
	 gxnJK3GuFVefQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic
 dump
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260908170740.276800-1-stefanghetu9@gmail.com>
References: <20260908170740.276800-1-stefanghetu9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 17:19:10 +0000
Message-Id: <20260908171910.B28331F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes a stack out-of-bounds read in the i.MX DSP panic d=
ump by clearing `numaregs` to 0, but fails to apply this exact same fix to =
5 other platform drivers that share the identical vulnerable code pattern.
- [High] Information leak of kernel stack memory when the firmware oops hea=
der size is invalid due to an early return bypassing the initialization of =
output variables.
- [High] Out-of-bounds string read due to a missing precision specifier for=
 the `filename` array.
--

commit ca4aa4ca867a8171d023c31fffe2fa4cd73d904b
Author: =C8=98tefan Ghe=C8=9Bu <stefanghetu9@gmail.com>

ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump

This patch clears numaregs to 0 in the i.MX DSP oops parser to prevent=20
a stack out-of-bounds read in the shared Xtensa helper. Since the AR block
is not supported on i.MX, this prevents unsafe memory accesses when dumping
a DSP panic.

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
This is a pre-existing issue, but does this fix also need to be applied
to other platform drivers?

The target patch successfully resolves the out-of-bounds read for imx8,
but there appear to be 5 other drivers that share the identical code
pattern where xoops is allocated on the stack without backing the
flexible ar[] array:

- amd_get_registers() in sound/soc/sof/amd/acp-common.c
- atom_get_registers() in sound/soc/sof/intel/atom.c
- bdw_get_registers() in sound/soc/sof/intel/bdw.c
- hda_dsp_get_registers() in sound/soc/sof/intel/hda-dsp.c
- mtk_adsp_get_registers() in sound/soc/sof/mediatek/mtk-adsp-common.c

If a compromised or malfunctioning DSP provides a non-zero numaregs
value in its oops header, could it still cause the kernel to iterate
over unbacked stack memory in xtensa_stack() and leak adjacent stack
contents via hex_dump_to_buffer() on those platforms?

> =20
>  	/* then get panic info */
>  	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {

[Severity: High]
This is a pre-existing issue, but if this header size validation fails,
can it cause an information leak?

When imx8_get_registers() aborts early here, it returns void, leaving
the caller's stack-allocated panic_info and stack arrays uninitialized.

Does the caller (such as imx8_dump()) consume these uninitialized
variables?

imx8_dump()
  imx8_get_registers(..., &panic_info, stack, ...)
  sof_print_oops_and_stack(..., &panic_info, stack, ...)

If the caller unconditionally passes these uninitialized structures to
sof_print_oops_and_stack(), could they be formatted and printed to
dmesg, leaking uninitialized kernel stack memory?

>  		dev_err(sdev->dev, "invalid header size 0x%x. FW oops is bogus\n",
>  			xoops->arch_hdr.totalsize);
>  		return;
>  	}

[Severity: High]
This is a pre-existing issue, but when sof_print_oops_and_stack()
processes the panic_info structure, can it read out of bounds?

struct sof_ipc_panic_info defines filename as an array of 32 bytes.
If the DSP provides a fully filled 32-byte filename string without a
null terminator:

core.c:sof_print_oops_and_stack() {
    ...
    dev_printk(level, sdev->dev, "panic at %s:%d\n", panic_info->filename,
               panic_info->linenum);
    ...
}

Will using the unbounded %s format specifier cause printk to read
past the end of the array into adjacent stack memory (like linenum)
until a null byte is encountered? Should this use the %.*s format
specifier with SOF_TRACE_FILENAME_SIZE?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908170740.2768=
00-1-stefanghetu9@gmail.com?part=3D1
