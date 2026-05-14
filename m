Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECD438F939
	for <imx@lists.linux.dev>; Thu, 14 May 2026 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795309; cv=none; b=Uc0A397yj3+9Owxo2jLw34ajh7tHCtqwaZGj+rP5LVIBYPBuPWEXUFaFC53ArayHrdT1kMjXnyD/fwvi141ScIHO52wLrG7w1b/YZlVByA+VfBTVzaCF+PNHMAdfMGBFl+SHJlKjBJkrn+ob/ogokAvVQeq/IXK/hR2FXJ0fV9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795309; c=relaxed/simple;
	bh=jZ6W70kI18ldbRxuNsyyhbpjx3jDVyUk3ue5otGuTh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n2lpAvZDfRLetBFfUMUWIao8gkUHf878FJ0gxAvfBk+elXLYW74e9PBZT5MGucBuMQKE0MkmsDvi5kROBa+hidR+H8TQ5ZAfb4iT/WZUJOp5BlGP2ijm5Px69HcSjfh+VrAny1vnTNv4+PTMEGiCMvQGo62F+7Gk4NKesq+YIeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3Oqwe0M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3Oqwe0M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE5AC2BCB3;
	Thu, 14 May 2026 21:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778795309;
	bh=jZ6W70kI18ldbRxuNsyyhbpjx3jDVyUk3ue5otGuTh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=M3Oqwe0MQ7It3dlWBOmDsxQaESoaj670eLl9Yub+ZeCwoQB4FXl0kAYbxI2FzoCpt
	 8jZuHsVdE+YjJZCopHmZBDUh30wKgUxwiMwbKOnk4q1D3+x//v4uFNLpbk2TBtrqKS
	 e1378H08gXzMJW7GxUc8F7KfDnnyGgMSU+H0BoiGdduA9FcRz6ImktMBLF+4fe/fY5
	 grnxPsZbfRd2RedyopgEOd0/pYuvXYKwHI+n6D0R8hu0DlJ96bbN9zvCFeFAiMDbeb
	 NL7Iv6gzBH/NmcxXCb5RheylTTm4nIodRzM9r74gNVmzIbqn5of+7er7OjakUVNP/L
	 1OflLh19yA6ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] remoteproc: mark wc-ioremap carveouts as iomem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: imx@lists.linux.dev, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
In-Reply-To: <20260514162129.1504162-4-ben.levinsky@amd.com>
References: <20260514162129.1504162-4-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:48:28 +0000
Message-Id: <20260514214829.3DE5AC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Integer Overflow in `rproc_elf_load_segments` allowing Out-of-=
Bounds Read.
- [Critical] Integer Overflow in `rproc_da_to_va` bounds check allowing Out=
-of-Bounds Write.
- [High] The patch correctly fixes the generic `rproc_mem_entry_ioremap_wc(=
)` helper but overlooks driver-specific allocators and `da_to_va` callbacks=
 that exhibit the exact same bug.
- [High] Debugfs interface `rproc_trace_read` performs standard memory acce=
sses on I/O memory, triggering panics.
--

commit 185669571331faa11cc44eacd2568b0e202bcf9d
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: mark wc-ioremap carveouts as iomem

This commit marks shared wc-ioremap carveouts as iomem in the generic
rproc_mem_entry_ioremap_wc() helper. This ensures the remoteproc ELF loader
uses the proper I/O memory accessors instead of falling back to standard
memcpy() and memset().

> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remotepro=
c/remoteproc_internal.h
> index f5b34aabed5bb..9955e512f073d 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -136,6 +136,7 @@ static inline int rproc_mem_entry_ioremap_wc(struct r=
proc *rproc,
>  	}
> =20
>  	mem->va =3D (__force void *)va;
> +	mem->is_iomem =3D true;

Does this change also need to be applied to driver-specific allocators and
da_to_va callbacks?

For example, in drivers/remoteproc/xlnx_r5_remoteproc.c, tcm_mem_map() maps
memory via ioremap_wc() but does not set is_iomem to true.

Similarly, keystone_rproc_da_to_va() and omap_rproc_da_to_va() appear to
ignore the is_iomem pointer despite returning devm_ioremap_resource mapped
memory. In imx_rproc_da_to_sys(), is_iomem is left false for regions mapped
via devm_ioremap_wc() when ATT_IOMEM is not set.

> =20
>  	return 0;
>  }

Are there potential integer overflows in rproc_elf_load_segments() when
parsing ELF headers?

If offset and filesz are parsed directly from 64-bit ELF program headers,
could their sum wrap around:

rproc_elf_load_segments() {
    ...
    if (offset + filesz > fw->size)
    ...
        memcpy(ptr, elf_data + offset, filesz);
    ...
}

If offset is near the maximum 64-bit value and filesz is small, the bounds
check could be bypassed, resulting in an out-of-bounds read.

Is there a similar overflow risk in the bounds check within rproc_da_to_va(=
)?

rproc_da_to_va() {
    ...
    if (offset + len > carveout->len)
    ...
}

If len is a size_t and offset is an int, could an ELF segment with a memsz
near the maximum size_t value cause the sum to wrap around and bypass the
bounds check?

This could affect rproc_elf_load_segments() if it executes a memset using
the large memsz value, resulting in an out-of-bounds write.

Does the debugfs interface have a related regression with I/O memory access?

In rproc_trace_read(), the memory type is ignored by passing NULL for the
is_iomem flag to rproc_da_to_va():

rproc_trace_read() {
    ...
    va =3D rproc_da_to_va(rproc, trace->da, trace->len, NULL);
    ...
}

If the returned virtual address is mapped as device memory, such as via
devm_ioremap_resource() in keystone_remoteproc.c, could passing it directly
to strnlen() and simple_read_from_buffer() trigger alignment faults on
strict architectures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514162129.1504=
162-1-ben.levinsky@amd.com?part=3D3
