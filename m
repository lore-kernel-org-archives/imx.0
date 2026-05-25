Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6003C9EFB
	for <imx@lists.linux.dev>; Mon, 25 May 2026 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693335; cv=none; b=VAPZKmRFBl1LATW5H+aVgMesrCTBbHXuTWNgXDsk0V6XSnvsIeF9jDOs/WfpsCI1UNLUUsMPs6d/DQ+MuUAJBMnpneSs4SwnosOYpy2lThSzIAeOb9t2QTIGtvxohOERWEafYzee1/WzPiZD5QF5ReJgdMRLMDTCoorDhlJg49c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693335; c=relaxed/simple;
	bh=k1fOOdJ+we/WSur5tqOGDDTf2sOUEb8R75pBMmDXGzk=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YaGScZtusD5DjZHUuhz6xlDyv9ykL0o/5bwjsDeiXDklX/O5OeSQj5c3kA3hGxaM3//im1Kx/TCQCfvm1aMymP+okElmcOlIRhBOAY3HvAGS5AnaQ61IPwzFY4EEZsPBdVqcnSnaNru5Gd+h/yqJB9tyF99PEywoIMNVgTOEcnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxBXh0/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxBXh0/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FF81F000E9;
	Mon, 25 May 2026 07:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779693334;
	bh=k1fOOdJ+we/WSur5tqOGDDTf2sOUEb8R75pBMmDXGzk=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=cxBXh0/VA7Px2UhhNjEn1tR47TtFJcRDsmcLMfTJGjCysNwkkDJqoZot+vsI88GGP
	 bZDxIvY1wcQukrx7CB0pTGxeEDzJhvI9QGqawxA2ARKhGmx4bu6o7PL71xoWcZ3WIW
	 jdS1QrQO7SuM+O17rcwG4NzWtjj+JsZ4JG770Xj9L7n6kQL14m7T/FOeVxPeiFN5Vs
	 gbFI1oQH/yo/m9mOUjToUJO/op4K6BczjVAl/Vg6dhc+zgF9qYH3Ba3+iIybqOWy2d
	 1gHI93KLO3rviGFgwjjgha/IZb0hH0rACR80QaB8/nge6d66C+nzt3Gvyxh+wKbvkg
	 OA2mzFcEsfXPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] spi: fsl-lpspi: terminate the RX channel on TX
 prepare failure path
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525062357.3191349-3-carlos.song@oss.nxp.com>
References: <20260525062357.3191349-3-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 07:15:33 +0000
Message-Id: <20260525071534.35FF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing hardware reset on DMA error paths leaves peripheral active
- [High] Unsynchronized target abort leads to missed aborts and indefinite =
hangs
--

Note: The format of this report has been altered due to automated recitation
restrictions. The original patch code is not directly quoted below. Instead,
a free-form summary of the findings is provided.

commit d3e3a8a3dfc05ade1f3f99531fe6f7bf65a4fe87
Author: Carlos Song <carlos.song@nxp.com>
spi: fsl-lpspi: terminate the RX channel on TX prepare failure path

This commit fixes a potential memory corruption or use-after-free issue
by terminating the RX DMA channel when dmaengine_prep_slave_sg() fails
for the TX channel. Previously, the RX channel was left running and could
continue writing to unmapped buffers.

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in how
DMA error paths are handled. In fsl_lpspi_transfer_one(), the driver
enables the SPI peripheral and asserts DMA request lines before submitting
the DMA transfer. If the subsequent call to fsl_lpspi_dma_transfer() fails
early, such as during fsl_lpspi_dma_configure() or
dmaengine_prep_slave_sg(), it returns the error immediately.

Since the driver lacks an unprepare_message callback and does not call
fsl_lpspi_reset() on these specific error paths, does this leave the SPI
hardware fully active? The peripheral might remain active with its TX FIFO
empty, constantly asserting its DMA request line, which could lead to
system lockups or interrupt storms depending on the SoC's DMA controller.

[Severity: High]
This isn't a bug introduced by this patch, but looking at the target abort
handling, could there be a race condition that leads to missed aborts?
The fsl_lpspi_target_abort() function modifies the target_aborted driver
state locklessly and signals completions. Since this function is triggered
asynchronously, it could execute concurrently with a new transfer being
initialized in fsl_lpspi_transfer_one().

If the abort occurs just before the driver calls reinit_completion() and
explicitly sets target_aborted to false, are the abort event and the
completion signals completely overwritten and lost? Furthermore, since
fsl_lpspi_target_abort() decides which completion variable to signal based
on the usedma flag, which is updated locklessly per-transfer, could this
result in signaling the wrong waitqueues and cause the driver to hang
indefinitely waiting for an aborted transfer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525062357.3191=
349-1-carlos.song@oss.nxp.com?part=3D2
