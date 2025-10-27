Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867733F9
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561085; cv=none; b=lzUcrjszFMdksDnx3c3B9hJjPbB1M485oPJCGJs9c4+RWFPz1vrO5hvnt1T7WFXmOM/5+SUF/1C7mkO7GJ3Zplqg4+izH53VPHLHwXwVZKzcRnX+Tb6MpNer0GPafh4Q2/eMHgRVkklmyWfSYfKprVjBAOZghBKxHhPDXP24To8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561085; c=relaxed/simple;
	bh=woR0YkWOLoOVnkusOQvb+uOUj+GPQRpu6GLsFacG4SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXdSQhuZMB1JIc9/8wabRQovSNW2nwDfrKUztkBhHkH6ov+GhuWy+GNURtPou91tKzhOM/DblEI+zhEIf7hkFkCuXR6embTfovRmV/Qu7mtrKLJTP/4byKD5UDJYgXbKRPrwvP8vlpofgy0LPMRm9/sxYwgrYFOoi3aT3VP45UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sbnFY7w1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sbnFY7w1"
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 05415E1F;
	Mon, 27 Oct 2025 11:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761560973;
	bh=woR0YkWOLoOVnkusOQvb+uOUj+GPQRpu6GLsFacG4SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbnFY7w1nY83x7Yfrg65qDDjoOFXFj29h8KBE/qIKqEQ2DR3hTiOM4IIhnH8GQB8f
	 LXqClKaF1LarrQ6Mpd7Ekda+u/bgkFr7pkBrFVM1rxJTD1wL7Z8IYxLG9LcIBlMnsM
	 FaNVPYUv0Mj0/7F9HRMlQYSQnRaetAbKQpjllrnQ=
Date: Mon, 27 Oct 2025 12:31:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <rmk+kernel@armlinux.org.uk>,
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
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251027103107.GF1544@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <20251027100227.GE1544@pendragon.ideasonboard.com>
 <aP9IB4y5_gyfJGMW@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP9IB4y5_gyfJGMW@pengutronix.de>

On Mon, Oct 27, 2025 at 11:23:03AM +0100, Oleksij Rempel wrote:
> On Mon, Oct 27, 2025 at 12:02:27PM +0200, Laurent Pinchart wrote:
> > Hi Oleksij,
> > > Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
> > > It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> > > monitoring RGMII TX and MDI lines with oscilloscope and changing
> > > tx-timer configurations. I also confirmed this information from other
> > > source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> > > is needed.
> > 
> > That's useful information, thank you. Would you by any chance to know if
> > such NDA would allow contributing the feature upstream ?
> 
> Good question, but the NDA process was actually aborted. We didn't move
> forward due to a lack of time and ultimately, a lack of commercial
> interest from any projects or customers for this PHY.

Fair enough. I've tried :-)

If we can't disable SmartEEE in the PHY, does it mean we need to somehow
disable EEE in the MAC, but still program the PHY to advertise EEE to
the link partner ?

-- 
Regards,

Laurent Pinchart
