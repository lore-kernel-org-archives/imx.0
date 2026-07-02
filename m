Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D333A4F46
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783016367; cv=none; b=IO8sQeAkWHgXwvamvlN/CEjcK5ppeWXyURxEd2p4VF8E3a0YDtzJXgyXCXsXFCdShuWRRpmlzi6+hGinB0mId2VPGQBdfTHGyaW2syInS1/RqfQIbzNAiDLxidweB5fjlePeFW35IRXWBtXxPl9LOflwYyyfcjYVEFOCgLvhMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783016367; c=relaxed/simple;
	bh=iMO17iTJWoMt5HRqYvRyCxPEU2GVfSbOr9hY4SHBp+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q38be65v5ys4NBHsqRhSHXp5UWURQLwdy6++xNpT6Avw3CEOIPy1UQqCGCyrPPiB+SkP13ooC/sUvjxS6Yuk/LqYFqzjlJH0T5FjnM+/PIvPhD6cAccIGHu1qZhs81jWlR0l7/4MCG8JxcwcaCSkUHuxlm95EDmjqVybsZHQmAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tPBG9AD5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tPBG9AD5"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58B7F22B;
	Thu,  2 Jul 2026 20:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783016316;
	bh=iMO17iTJWoMt5HRqYvRyCxPEU2GVfSbOr9hY4SHBp+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tPBG9AD57PqMUbbV4c8F5rp5Dxrl9hEWI7znN6ivnuTxoP6cW1ENk5f3fXliUt63a
	 dep90ED20b45Z/eJfJHwHeb7IDRe7zMtvjNtjnQYHegXsWKAzK+0ZABu6pdBr6L4y7
	 dqc7sSKTDHBcNBd8iRFCrABCrH+2RpnDW3noPK34=
Date: Thu, 2 Jul 2026 21:19:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/8] media: subdev: Add media_async_register_subdev()
 helper
Message-ID: <20260702181920.GJ3534761@killaraus.ideasonboard.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
 <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>
 <20260702161519.GI3534761@killaraus.ideasonboard.com>
 <akapt6v_DBJSAnj0@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <akapt6v_DBJSAnj0@SMW015318>

On Thu, Jul 02, 2026 at 01:11:03PM -0500, Frank Li wrote:
> On Thu, Jul 02, 2026 at 07:15:19PM +0300, Laurent Pinchart wrote:
> > Hi Frank,
> >
> > Have you missed the comment in v6 ?
> >
> > https://lore.kernel.org/all/20260629084654.GB3054459@killaraus.ideasonboard.com/
> 
> Sorry, I forget emphased it in change log.
> 
> "For the reason stated by Sakari in patch 1/9 (dependency from MC to
> V4L2), I don't think a "media_async_register_subdev()" function is a
> good idea."
> 
> The reason already NOT existed in v7, I removed v4l2_fwnode_endpoint from
> media_pad. So MC will not depdent to V4L2.
> 
> So this comments is not suit for this version.

media_async_register_subdev(), with its "media_" prefix, appears part of
the MC API, but it operates on a subdev. At least the function name
should be changed in my opinion.

-- 
Regards,

Laurent Pinchart
