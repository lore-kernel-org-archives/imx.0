Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAE72D8376
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784567199; cv=none; b=EFeHVpqXoZasJUW1UBNgEnzd31LDFRiRFX5+0/wsqXmhJtbAeGMLTiA//TChJuMscke4a5bS0xuxGG+RoLMaLKo01ZTtG03wWFWj3ZV40SZcvj16vot+MoFLkAjQSg0/MLVQp+0qoNk8fTZuUNDPv+unRmF7BW5tZGfrTAUlNnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784567199; c=relaxed/simple;
	bh=KmFigFmefZabsxaRB3B6z37SPB1Q+zApMfm6Cfoi8Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXc5U/dDsMtEbVsgkuSKfuoV5G1p7kzgCHrIUmwgLj0IL9T0qnzBY7cMfks7Ph8o2n6yPzyaWuBNH8Leq3BxVB/u0NpyMG7otxbYGSBq6lboo6/za3ywo1D9Rm0QLNz5J+YCVFVXA9lHeVSBsp6v9gvki1Wn1MPKjeEyqjVVLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pOeKkpga; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pOeKkpga"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27721289;
	Mon, 20 Jul 2026 19:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784567135;
	bh=KmFigFmefZabsxaRB3B6z37SPB1Q+zApMfm6Cfoi8Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOeKkpgaavsNGQCRaQNloByoF9qSI80Y6od7hHv9kkeVLXu8YW2/vQz3GV5h8vHHl
	 FvfsnB1UKxBV9CZqTx/hbR8RNyjNV00+knrTSexHs1fm7s6lnbHtd9hbmzUJM4dk8O
	 76L0NSmdbTcxEgkzat2+akwfREvbN+ZBAllUJsFw=
Date: Mon, 20 Jul 2026 20:06:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] media: nxp: imx8-isi: Add virtual
 channel and frame descriptor support
Message-ID: <20260720170632.GD42426@killaraus.ideasonboard.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <178276214766.2429861.1950641421457268519.b4-ty@b4>
 <20260629202302.GK3054459@killaraus.ideasonboard.com>
 <akPsxPgLNgu3YsEV@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <akPsxPgLNgu3YsEV@SMW015318>

On Tue, Jun 30, 2026 at 11:20:20AM -0500, Frank Li wrote:
> On Mon, Jun 29, 2026 at 11:23:02PM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 29, 2026 at 03:42:31PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > >
> > > On Thu, 21 May 2026 17:10:03 +0800, Guoniu Zhou wrote:
> > > > This patch series enhances the i.MX ISI driver's with virtual channel
> > > > support and adds frame descriptor capabilities to the crossbar subdevice.
> > >
> > > Applied, thanks!
> > >
> > > [1/2] media: imx8-isi: crossbar: Add get_frame_desc operation
> > >       commit: 3e15a3510908c990ee352aa206d5f9c23d4b216e
> >
> > Is this a mistake ? Patch 1/2 has no R-b tag, and you're not listed as
> > maintainer for this driver.
> 
> Sorry, I missed checking Maintainer files, in media summit, agree on I pick
> imx's media drivers, but forget finalize the file\dir list. Can you help
> summery which files\dir I should take care?
> 
> If you have concern about this patch, I can drop it.

I would appreciate if you did. I'm collecting ISI patches for the next
merge window, I'd like to avoid conflicts.

-- 
Regards,

Laurent Pinchart
