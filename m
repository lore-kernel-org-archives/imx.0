Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EFE14A60C
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761635916; cv=none; b=bsIeM+1bxND0AHuyLUPLoDta9p49goS57bbr611zR7Kq4PD9+QEsHyD3Gby7v9yU7tvrkPUlLeqzR4NkVOpVH9CNa7YnNqKxG5L8wSJ9A02V1pvKF9BaVaShXBP69NKP/mt4tR9hbCKkBBloOZh69EP+spSDjURgL0X3IXWuxts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761635916; c=relaxed/simple;
	bh=uwl4S+0VVmxOF+41YWBs/pcpifL5J3z3aL5XY8xuVBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dun56Z0GSAfRhdGani8KyU2edm8rUGZWlSPptuIONlQA714YvnH8W3pFpRJkdZjRNjUu7v2ZJEWr5wWPdTWRRPLCPRoqiNxsJLTTWTlAvYkGrLgTnJ/037RQSybSj2SgGLNsS2xamW2QCgm9YXuRVJFiOJ09mD7c98103PEEfnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AfcXcfvk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AfcXcfvk"
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3FEB713BE;
	Tue, 28 Oct 2025 08:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761635802;
	bh=uwl4S+0VVmxOF+41YWBs/pcpifL5J3z3aL5XY8xuVBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfcXcfvk823pXMB/CidGYHN1+aUyWZMHnwW+YXHN7FtGrmtU7EpVsZ8we+lcYbbDT
	 FlZGTyDd5lcEsVTYojCsUFJAhGR/5nAoG6nIL5u6Y+Ab8HFNd0e5xzzr/3/qkhz4P+
	 QdnRfbLjLaCVJ/fb+VmHF6JC8R8x/Yiuq+45APwU=
Date: Tue, 28 Oct 2025 09:18:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251028071817.GX13023@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
 <20251027234648.GC24987@pendragon.ideasonboard.com>
 <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aQAVE96NAD4Z4lgt@shell.armlinux.org.uk>

(CC'ing Catalin)

On Tue, Oct 28, 2025 at 12:57:55AM +0000, Russell King (Oracle) wrote:
> On Tue, Oct 28, 2025 at 01:46:48AM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 27, 2025 at 03:13:51PM +0000, Russell King (Oracle) wrote:
> > > On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> > > > Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> > > > (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> > > > devices produces an interrupts storm. Disable EEE support to fix it.
> > > 
> > > We've finally got to the bottom of what's going on here. Please try
> > > this patch (it's building locally, but will take some time because
> > > I'd wound the tree back to 6.13 and 6.14, so it's going to be a full
> > > rebuild.) Thus, there may be compile bugs remaining.
> > 
> > I've applied it on top of 
> > 
> > I've started with a branch based on v6.18-rc3 plus "[PATCH net-next 0/5]
> > net: stmmac: more cleanups" ([1]) and "[PATCH net-next v2 0/6] net: add
> > phylink managed WoL and convert stmmac" ([2]) to make the patch apply
> > cleanly.
> > 
> > [1] https://lore.kernel.org/all/aO_HIwT_YvxkDS8D@shell.armlinux.org.uk/
> > [2] https://lore.kernel.org/all/aPnyW54J80h9DmhB@shell.armlinux.org.uk/
> > 
> > The base branch exhibits the interrupt storm issue. The patch
> > unfortunately doesn't fix it.
> 
> So it's highly unlikely that your problem is the same as Emanuele's.
> 
> Do you know when the interrupt storm behaviour started? If not, I'd
> suggest testing 6.13 and 6.14 as a starting point to see whether
> the phylink-managed EEE conversion is involved.

I can't test it right now (no access to hardware during daytime for this
week), but if I recall correctly my colleague Stefan Klug bisected the
issue to

commit dda1bc1d8ad13672c2728eedee0dd02d27a5314a
Author: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Date:   Mon Oct 7 15:44:24 2024 +0200

    arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"

    So far, only WFI is supported on i.MX8mp platform. Add support for
    deeper cpuidle state "cpu-pd-wait" that would allow for better power
    usage during runtime. This is a port from NXP downstream kernel.

    Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
    Signed-off-by: Shawn Guo <shawnguo@kernel.org>

I didn't notice it at the time because my board was connected to a
switch that didn't support EEE.

-- 
Regards,

Laurent Pinchart
