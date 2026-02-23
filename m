Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F4521CFF6
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854121; cv=none; b=VLWW8Zo3SsjudyGVI35/xBL9PxFZMBjKy+KDAtzvJn9rFuSAE1FUX5cvPFyrH1mK7owNR6tMMZXs9VYM4pcv+KCsRDpRVlXUmZKBkrbM2QDT+6kbVGjKqC5bmjeZR2UsBYkVyxbf64O+EoIUnRCvh17dJBZtU2Xf0mpjetUruaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854121; c=relaxed/simple;
	bh=xEBoMOJ2UfUkI3gm8CBgEjEdhJluBDxtNLuYWCqt0LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQuJ5A+nrmpAGUWnQ22b7xzxGIF9kmZapo25knr2PHPREWGRdcdi1i0yPeW+DhZKQ6wfcuEPe2i6a0Hj7HYMSHosmjot76CdMFYphdU6tiFGisyy28inEKNGFfPiw2cmChXDfFjVOCsXkpwzSdFhTIrezMn9/dn4Z5VddNwJei4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 82BD71A14BA;
	Mon, 23 Feb 2026 14:34:44 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B0901A11FC;
	Mon, 23 Feb 2026 14:34:44 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id BBBA1202AE;
	Mon, 23 Feb 2026 14:34:43 +0100 (CET)
Date: Mon, 23 Feb 2026 14:34:44 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: edumazet@google.com, shawnguo@kernel.org, kernel@pengutronix.de,
	krzk+dt@kernel.org, robh@kernel.org, andrew+netdev@lunn.ch,
	mbrugger@suse.com, davem@davemloft.net, pabeni@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com, s.hauer@pengutronix.de,
	conor+dt@kernel.org, chester62515@gmail.com, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, ghennadi.procopciuc@oss.nxp.com,
	devicetree@vger.kernel.org, alexandre.torgue@foss.st.com
Subject: Re: [v4,4/4] stmmac: s32: enable support for Multi-IRQ mode
Message-ID: <aZxXdNQGRcG6LeHS@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260128-dwmac_multi_irq-v4-4-82fa34fcf2f2@oss.nxp.com>
 <20260129051004.375682-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129051004.375682-1-kuba@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Jan 28, 2026 at 09:10:04PM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> stmmac: s32: enable support for Multi-IRQ mode
> 
> Enables Multi-IRQ mode for the S32 GMAC driver when per-queue IRQs
> are present and more than one RX queue is configured.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > index 5a485ee98fa7..37a5b7b46973 100644
> 
> [ ... ]
> 
> > @@ -149,6 +149,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
> >  	plat->core_type = DWMAC_CORE_GMAC4;
> >  	plat->pmt = 1;
> >  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> > +
> > +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
>                                                    ^^^^^^^^^^
> 
> This isn't a bug, but "symetrical" should be "symmetrical".

I will fix it in v5.

Thanks.
/Jan
