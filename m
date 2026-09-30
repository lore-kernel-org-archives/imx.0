Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE9C50B40E
	for <imx@lists.linux.dev>; Wed, 30 Sep 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777438; cv=none; b=QwVCwi+KKSYSUk2SGF7EwnTHPsPkLO7oDpehh7+160SegSRApMk7mTfPQPEwaNazg2ih4Ak2199QKMjttEvjosWVL+iODc7Ty7S4zqiZlfY0sDCZNwRQ0eBo/j8nV+e0lR5eAIIkwDdtd7ZTJsFAV/zr3HvJy5RFbciI5g/OSJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777438; c=relaxed/simple;
	bh=4z5DRRT+pZ+6ZV1WDPhibmUGCJCgdXfnOASSgu8zP2M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IvlF3xhbH2rWZbbgM4Ua6f8aMYImzjzHuRMNUyzXlvqQFBnzx6AlqJhWx0K4B9iqDeRGwG6Af7rkCs55T1AIksBk1QDVGZ2RpYbPe389ZRF4oABWBZZwnsFCI9dXF1pwlHsUcZmvJ+Uwgdy7a//5YOnLVJxvnWnNs/R7f/0rL4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bre92Seg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bre92Seg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22091F0089E;
	Wed, 30 Sep 2026 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790777419;
	bh=YumjLi/jtot4Ie2d3Q5bBsZoM9ylqoXFSe8WzFfNTOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bre92SegYKdg7bBfVv3KGz70zwyIIx5slIouZDGsyDxiQtXP/ZT0Mj1Fp4hVaslJ5
	 AJJQg1IvRvxxhecVFODbQutI1irqdU3H28LgpKU2b7HycffaAj4yKRg0lXFsz3USiV
	 qotVFMJOIbx6gb1/0bhMCqAQJ2b46CHUA6FIJGDOgb6j6r1pSJpYmvvATG6AsIQO1B
	 YaMGf20/m9RpUQJrc6rv9IUBJeI7PJcO2etyI3bwOyDIYzFxF5EbaBMfDvwddMXVAM
	 Hf8Z1uRCoyw+23ls7lT2pSZuEI7+ufcg8wWkVjbIabQp91rYHPpLqmjDHk5kx3lpBr
	 2Xp8G4eU/cnRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] spi: use dmaengine public API instead of raw ops
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260930140257.490019-1-Frank.Li@oss.nxp.com>
References: <20260930140257.490019-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:10:18 +0000
Message-Id: <20260930141018.C22091F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: commit message falsely claims dma_async_issue_pending=
 provides locking and debug checks
--

commit c24ebb64bdaa5d560933be18b6d65ba2f18df08e
Author: Frank Li <Frank.Li@nxp.com>

spi: use dmaengine public API instead of raw ops

This patch replaces direct calls to the internal DMA device ops
with the public dma_async_issue_pending() wrapper in the at91-usart
and atmel SPI drivers.

> Replace direct calls to the internal DMA device ops
> device->device_issue_pending() with the proper public DMA engine wrappers:
> dma_async_issue_pending().
>=20
> Drivers must not call device ops directly; the wrappers provide locking,
> debug checks, and a stable interface that hides internal implementation
> details of the DMA controller driver.

[Severity: Medium]
Is this description of the wrapper accurate?

Looking at the implementation of dma_async_issue_pending() in
include/linux/dmaengine.h, it appears to be a direct inline call:

static inline void dma_async_issue_pending(struct dma_chan *chan)
{
        chan->device->device_issue_pending(chan);
}

Since this function directly calls the device ops without taking any locks
or performing additional debug checks, could the commit message be updated
to accurately reflect the actual semantics of the wrapper?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930140257.4900=
19-1-Frank.Li@oss.nxp.com?part=3D1
