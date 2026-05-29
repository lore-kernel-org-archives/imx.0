Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08122E739A
	for <imx@lists.linux.dev>; Fri, 29 May 2026 04:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780028162; cv=none; b=BMYfG3gOdCqoxXA00qMZ/pm95eBsLdIYcLo/fna9x81KtsGXPW6f/PIGkTV4hbWXrtOgv7p2GMszSTgA8LIcJymItv199tCcB1g9uFBxo6vcP2cxIwtxPpdejV0GXNXBkLzG96JXdHP2zvZfThRaZaq33Lc2/oAMO82Gs9GOqOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780028162; c=relaxed/simple;
	bh=/Lvxz2ymH0YRXlsDxIxkz9wm9RBB+AGRx0n3j7gtxFo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M5sIK31G2Jr/DiK9pM6BwAPFhvT96XOcMuXJf0D7E1+4G4wFfOO0i1k0GJsnFtVFkhFqncfL18guw1+uG+92FhPAO278dCTg82uNbwJXDOwq4kSQ9cRSss99TUz6B0oqw30NH0ef3yWzFB5v1+BlUWHenX0iXEYLr8fosfWZaCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkx23uq9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkx23uq9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A891F00893;
	Fri, 29 May 2026 04:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780028161;
	bh=8TwYH+6NhGweHn59u2jFwgRKLYeawQO1tx6Y95o58Mc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fkx23uq9ptfBQo+zLqnWOaz2pp/5dFd/xjsZkM0WTDLTGVO8EAmzzRLjKEZIvnlqr
	 xPJ2VEhnya2uMHTSyVtQcXFg4Bx4W/CzOc1dJeJg4isCjMaxkgvCdv4RdZ3wZiRJzM
	 xA5UroH8kssuLiOwFi2g4wAem/0CbYvSmdrItXXfoTxDFkh7Dj6zO/jNbUBToh6hLG
	 nO9gSJpHeNdu+p+fbTxJA0LHsk9EEVr5hANMiOO/+aUL4oAbZeAvHKGRTXSeg+fcfz
	 3tPiLNCrRM+1jOTK7Vhw427AGTRIZX9bZ8AmhjbDalp5oDVrtCI9KJml/gKKblqHhv
	 ot/0WqxhPc4Lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] remoteproc: mark wc-ioremap carveouts as iomem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com
In-Reply-To: <20260529021637.2077602-4-ben.levinsky@amd.com>
References: <20260529021637.2077602-4-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 04:16:00 +0000
Message-Id: <20260529041600.D5A891F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] An integer overflow in `rproc_da_to_va()` allows a bounds-chec=
k bypass, leading to potential out-of-bounds reads and writes.
- [High] The `rproc->crash_handler` work item is not properly cancelled dur=
ing remoteproc teardown, leading to a Use-After-Free if a crash is reported=
 concurrently with device removal.
- [High] The debugfs interfaces for carveout memories and resource tables l=
ack proper locking, allowing them to race with device shutdown and access f=
reed memory.
--

commit b14fc453ddda30168961d2bedbde273d3521e254
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: mark wc-ioremap carveouts as iomem

Carveouts registered through the shared wc-ioremap helper are backed by
I/O memory, but rproc_da_to_va() only reports that to its callers when
mem->is_iomem is set on the carveout. This patch marks shared wc-ioremap
carveouts as iomem so the framework uses the proper I/O memory accessors.

> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remotepro=
c/remoteproc_internal.h
> index 46080c1c030e8..9afda697271de 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -136,6 +136,7 @@ static inline int rproc_mem_entry_ioremap_wc(struct r=
proc *rproc,
>  	}
> =20
>  	mem->va =3D (__force void *)va;
> +	mem->is_iomem =3D true;
> =20
>  	return 0;
>  }

While reviewing this, I noticed a few pre-existing issues in the remoteproc
core.

drivers/remoteproc/remoteproc_core.c:rproc_alloc() {
...
	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
...
}

[Severity: High]
This is a pre-existing issue, but is there a missing cancellation for the
crash_handler work item during teardown?

During device removal, rproc_del() and rproc_free() are called, ultimately
triggering rproc_type_release() to free the rproc object via kfree(rproc).

The framework does not appear to call cancel_work_sync(&rproc->crash_handle=
r)
during this teardown sequence.

If a hardware interrupt reports a crash right before or during device
unbinding, could the pending work item execute rproc_crash_handler_work()
after the rproc struct has been freed, resulting in a use-after-free?


drivers/remoteproc/remoteproc_debugfs.c:rproc_carveouts_show() {
	struct rproc *rproc =3D seq->private;
	struct rproc_mem_entry *carveout;

	list_for_each_entry(carveout, &rproc->carveouts, node) {
		seq_puts(seq, "Carveout memory entry:\n");
...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this list traversal lack
proper locking?

The rproc_carveouts_show() function traverses the rproc->carveouts list
without holding rproc->lock or using RCU primitives.

Concurrently, rproc_shutdown() can be triggered (e.g., via a sysfs write
to the state file), which executes rproc_resource_cleanup(). This removes
entries from the rproc->carveouts list and calls kfree() on them.

If a user reads the debugfs file while a shutdown is in progress, could the
concurrent list mutation cause the debugfs read to dereference a freed
pointer, leading to a use-after-free?


drivers/remoteproc/remoteproc_core.c:rproc_da_to_va() {
...
	list_for_each_entry(carveout, &rproc->carveouts, node) {
		int offset =3D da - carveout->da;
...
		/* try next carveout if da is too large */
		if (offset + len > carveout->len)
			continue;
...
}

[Severity: Critical]
This is a pre-existing issue, but does this bounds check protect against
integer overflow?

Since offset is an int and len is a size_t, could an extremely large len
(e.g., SIZE_MAX) provided by malformed firmware cause offset + len to
overflow the size_t type and wrap around to a small value?

This could cause the bounds check to evaluate to false, bypassing the
protection and returning a valid pointer inside the carveout.

When rproc_elf_load_segments() uses this returned pointer, could it execute
memcpy() or memset() with massively overflowed lengths, resulting in an
out-of-bounds write?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529021637.2077=
602-1-ben.levinsky@amd.com?part=3D3
