Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC010F2
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 01:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762996654; cv=none; b=r/eT0cJI7YwXfZsjE7VLZUx+XhjhCWO9u9NEexROvcZSaNMDxQwbyP9ntepQa9SCpQ31Wy62cmE3dnLx7aWkpucdqVVn6hilSSYjJG2OLs0/D/1HMIgD6QIB3aC0DZAVWien0VT5TPyqzp7yYl1wLXIh0NDfURyfx7IZ4ysF3b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762996654; c=relaxed/simple;
	bh=RJdzbBhfGhI09u51y8sQG5hOaq5lWDhaLzOTTvMVY8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKLXsipnManxi53sjrYW/ApnH56H3aB82kRVHKnDnL9cq+DjhaACvG8ZTBJd4YGRQZVSz7e8KPdx3QMtf4G1+uJ+3Tv3dcbhtiho/JSQYRybjVZuJwVaIWN+Eou9eYthyCPUtDJ3cC8MBUmQlC+vBSjYkb4Qkwuxev3LszlGEXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q/6xIIdl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q/6xIIdl"
Received: from pendragon.ideasonboard.com (unknown [213.216.211.176])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0737122B;
	Thu, 13 Nov 2025 02:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762996530;
	bh=RJdzbBhfGhI09u51y8sQG5hOaq5lWDhaLzOTTvMVY8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/6xIIdl2+JQnH0b/1SnFhwrRERG4EdyYO4RnR+B+HR25Z9jH8taSNwl4QQxb3AT7
	 i81CKgCdjf4exuXEhe/7ntYCfVL9wpSkHuXN7Pd69iUyYkdJKNhb09OPpUdYx1rsJH
	 a4OKXAShC1CyNyyw8VREt/l66WqeJKDEhOceQXZE=
Date: Thu, 13 Nov 2025 03:17:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251113011719.GD9135@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
 <176295131007.567526.3395425614344577792@ping.linuxembedded.co.uk>
 <aRSD9n_F4aRXAdf3@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aRSD9n_F4aRXAdf3@shell.armlinux.org.uk>

On Wed, Nov 12, 2025 at 12:56:22PM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 12, 2025 at 12:41:50PM +0000, Kieran Bingham wrote:
> > Perhaps further complicating matters.
> > 
> > I have a Debix Model A as well ... I'm in a different office to Laurent
> > - and I believe EEE is enabled on my board/network switch.
> > 
> > I do not get an interrupt storm.
> > 
> > I'm not sure how this helps yet, - I don't know what to debug as I can't
> > reproduce the issue!
> > 
> > I can provide remote access to the board with ssh if that helps anyone
> > who wants to look at something specific about my setup or run anything
> > if anyone has ideas of what to check my side.
> > 
> > Perhaps we can find some subtle difference between a working case and a
> > non-working case...
> 
> Thanks, that's interesting. I guess the next steps would be to try and
> work out what's different between your two setups.
> 
> - same board revision?
> - same firmware/ATF?
> - same kernel/modules?
> - same type of link partner? (I suspect, given the cpu-pd-wait
>    interaction, isn't the problem.)

I've provided the binaries I use for U-Boot (including TF-A) and the
kernel to Kieran, he will test to see if they make a difference. I also
tested replacing mainline TF-A (v2.13) with the downstream NXP version
listed in the U-Boot i.MX8MP EVK documentation, and that didn't appear
to make any difference.

-- 
Regards,

Laurent Pinchart
