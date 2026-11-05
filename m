Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898980;
	b=n21ADHvb6k/E190oA/4C9vdj9pwFiKzwys+HenoN2NTk2aAlb4vBF5zoDJhqnPyDu1Rc
	 UBuP0VerGvYv87ssdwI2m+jT80iLqkD5t23R12TC8tQndyfn0xsCHR6xGUsJrFivLRwKZ
	 CPwV3yCbujz8muFMSeC6KRYIU76tqnEUdQCD2Fb3zcAvbkOgDAoQIK60ecrlMKWR3GbbR
	 jDJGJZ6NndFIojcF6g9Liiw6Tf29FGI1B1mRHF6vwJMV+SK9iK9sa3E1d2jJWN+s7J80x
	 TtGEmh1GTCbOo6tZItYchrpR0EBGt0MhbZY53A68b7x05CAq+U4PYQjnwEuRvIvFHKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898980;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P8LqfIwykYfwrQVuhcASvwi/E/RV2z2N6A+8BphF4JA=;
	b=A4O7zPxyvtwWAUrdlXHbv1WHfzYzNYBu/k8emiLSL/E5luESc6OqnmO6kxyBSv2zwgUb
	 +WATZ4MCb7t2pvlc0p/dTQsVGQQfkQ5rTQ6HqZuAN9PZ3YsUknmNg0Ccgoj4YEsZilJgU
	 b7FH3Lr7QgmomVlCWJsftkadOKeFMDBgZ9DFtYZQCkcManFeuMgbx0JLQlLA0BlAV7qXz
	 AALf7BHUH+xBXTNeXyZRiyrIKNx+X3pdt389rKbetax9Ev2k8FXJ0CMFTNSPbjbx0Tpte
	 vSYNDw4bFOyFrKuMjitpatHNFdDxR+llmL5rLnxRs6Cmm3zq9IyuhNThh6PnAW3JMYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqRJPCMw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D75606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqRJPCMw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16D81F000C1;
	Thu,  5 Nov 2026 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793898980;
	bh=P8LqfIwykYfwrQVuhcASvwi/E/RV2z2N6A+8BphF4JA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nqRJPCMwTPX1jCyqXemjKkrQbMGwCUpPHtiSH1FHD1tMeR+XIQrHhVtCOobIl+rzg
	 SNYDuDlccRHJZaxesH5fNeqGI5mW3GPN+bvj27uKJJ819CtK2mokTC1nx1C8ep1IVS
	 2tiB51U2rGIWPHHQ6DWm+0DRLYvRRRq5olNq9U0017pJnMUzYdI1U+zO8oOUArUOVv
	 RF2BsnDLRrNUZOHfTL0omQFvFa6WVAnS1AHJvsCUCXmQ/XoLjiQHOliaEVJQw7m4O4
	 XFmslf47stjAz4i7yqt7rP9uprOTdzXtjkABaAT1I+C39utUrEbw3DzUk8uwHouf54
	 XCaBajalBYtaw==
Message-ID: <sashiko-outbox-199587@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] rapidio/tsi721: include dmaengine private header
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261105170511.1262005-1-Frank.Li@oss.nxp.com>
References: <20261105170511.1262005-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:16:19 +0000
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
- [Low] rapidio/tsi721: ineffective dmaengine.h include after linux/rio.h
--

commit 74c6f7d411b15b0789cd2ddd5bc0e36eadfcaa9a
Author: Frank Li <Frank.Li@nxp.com>

rapidio/tsi721: include dmaengine private header

This commit includes the internal DMA engine header ../../dma/dmaengine.h in
drivers/rapidio/devices/tsi721.c in preparation for making struct dma_device
private to the DMA engine provider header.

> diff --git a/drivers/rapidio/devices/tsi721.c b/drivers/rapidio/devices/t=
si721.c
> index 71b87bf8c31d8..0953a39459584 100644
> --- a/drivers/rapidio/devices/tsi721.c
> +++ b/drivers/rapidio/devices/tsi721.c
> @@ -21,6 +21,7 @@
>  #include <linux/kfifo.h>
>  #include <linux/delay.h>
> =20
> +#include "../../dma/dmaengine.h"

[Severity: Low]
Will including ../../dma/dmaengine.h here actually work once struct dma_dev=
ice
is moved out of include/linux/dmaengine.h?

Neither drivers/rapidio/devices/tsi721.c nor drivers/rapidio/devices/tsi721=
.h
directly references struct dma_device or any other symbol from
drivers/dma/dmaengine.h (all DMA engine provider code is in
drivers/rapidio/devices/tsi721_dma.c). Instead, struct tsi721_device embeds
struct rio_mport, which embeds struct dma_device by value in
include/linux/rio.h when CONFIG_RAPIDIO_DMA_ENGINE is enabled:

include/linux/rio.h:
struct rio_mport {
	...
#ifdef CONFIG_RAPIDIO_DMA_ENGINE
	struct dma_device	dma;
#endif
	...
};

In drivers/rapidio/devices/tsi721.c (as well as in
drivers/rapidio/devices/tsi721_dma.c), linux/rio.h is included before
../../dma/dmaengine.h:

drivers/rapidio/devices/tsi721.c:
#include <linux/pci.h>
#include <linux/rio.h>
#include <linux/rio_drv.h>
#include <linux/dma-mapping.h>
#include <linux/interrupt.h>
#include <linux/kfifo.h>
#include <linux/delay.h>

#include "../../dma/dmaengine.h"

If struct dma_device is made private to drivers/dma/dmaengine.h while struct
rio_mport still embeds it by value, wouldn't struct dma_device still be an
incomplete type at the point where include/linux/rio.h is parsed? Conversel=
y,
if struct rio_mport is converted so it no longer embeds struct dma_device by
value, does drivers/rapidio/devices/tsi721.c need to include
../../dma/dmaengine.h at all?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105170511.1262=
005-1-Frank.Li@oss.nxp.com?part=3D1
