Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADD8272816
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761606933; cv=none; b=dmWrBgLZiUXk5YFnkpCbFM2Ccexq/RUDmUI+7lSqn3VouSO/yYAvdxpPbOHUzdCJdifEnHSF1ZUNIs7lN/tstCrv8RHjjQ9JlcROaTnCqt9lKyyUP4G22L2tmxHNq+0aP63MlvQKaLx8dW/sAEjRcAM27gWEBHHhnGu3mER6SGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761606933; c=relaxed/simple;
	bh=nt74lwe+3Mv9bENcEg2mAYvzZjiiGcAI05M14szMS90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECrcN9b1tXWVIcf4mU5nN5kyHxtbdoBmnglQhiO7umZqcBfB8yTYdvvrU30rQnpNTfe9TjRgB0TyApb7pyM7wYtjk9SdCn+I9e6RSSHuY8y7cJasJ4UTtRbYNtJ3KQuZjPqs71pXGSJXyotn/wxWG+hWwoSfQfZgCojAro2k7KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QMAQtSzh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QMAQtSzh"
Received: from pendragon.ideasonboard.com (85-76-17-108-nat.elisa-mobile.fi [85.76.17.108])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B3E17AB4;
	Tue, 28 Oct 2025 00:13:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761606821;
	bh=nt74lwe+3Mv9bENcEg2mAYvzZjiiGcAI05M14szMS90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMAQtSzhJqi1GityQRMFbCuLdSPNOIqwnMahLMnM+q2zx4fDiQMCBGCm3WRtIP6qy
	 Qx5Wx0gJ7YaOfR6yMiwePVwCBLdX19lg9MQ172RcfDF97QsC1IV8R062Nbsl0PgsFi
	 kJ0mMfmusAmdQlbL4YRk6jmdaHdimuZP7E/NhuI4=
Date: Tue, 28 Oct 2025 01:15:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251027231514.GB24987@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
 <aP9V-zosjg7rY5vZ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP9V-zosjg7rY5vZ@shell.armlinux.org.uk>

On Mon, Oct 27, 2025 at 11:22:35AM +0000, Russell King (Oracle) wrote:
> On Mon, Oct 27, 2025 at 09:27:49AM +0200, Laurent Pinchart wrote:
> > I've tried to diagnose the issue by adding interrupt counters to
> > dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
> > (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
> > interrupts storm, increasing at around 10k per second. However, the
> > corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.
> 
> I'll add to my comments earlier, because it may help you work out
> what's going on.
> 
> RGSMIIS will be set when the LNKSTS bit (bit 19) of 0xf8 changes
> state. RGSMIIS is only cleared by reading this register. So, something
> else to test would be to do a dummy read of this register and see
> whether the interrupt storm still has the RGSMIIS bit set.

It does. I then get

[   22.880935] stmmac: INTS=00000000 INTE=00001030

with the same interrupt storm. This is getting weirder and weirder.

-- 
Regards,

Laurent Pinchart
