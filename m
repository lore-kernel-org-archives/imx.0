Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199A838E8BC
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250703; cv=none; b=F6BFTJzZe1eGDOow2eLg0GGke/NTVKKDUc3zBX9zddJ6DsnrC/CPYMHn+mqSuR63/dS0kCNpU+sDPcPy92GaAW46Rfpw1bywwVoRPw83znPbLblg6yDeiX43KJGlnx8x70FEei9WL41mSNYNrCijDWoUH6OoCI+wDzqEGw/Ryxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250703; c=relaxed/simple;
	bh=6zjAsIjDCedAzti0XanoZtxnrdKOXrarH3OH0NMCDJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyHZicupX9NuxgPCWnwRf3tpwTj+l0ZJOz8S3GmuzRbsCb+XfdnsxS57+5tb76DkHBtJ+bcGDE4xyM92xZVIbKGs02YcJyD2UNI6ZWC24aujsFK6sRFhrwbB/q+CRKMo/llg9zg1NYbAT0pqdxRx8xl2xOpj5sRAzHN10RBV6g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1wXwfs-00079h-O1; Fri, 12 Jun 2026 09:51:32 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <pza@pengutronix.de>)
	id 1wXwfs-002LSa-1J;
	Fri, 12 Jun 2026 09:51:32 +0200
Received: from pza by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <pza@pengutronix.de>)
	id 1wXwfs-0000000GiV9-1DfP;
	Fri, 12 Jun 2026 09:51:32 +0200
Date: Fri, 12 Jun 2026 09:51:32 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl
Message-ID: <aiu6hDIMskukbb5q@pengutronix.de>
References: <20260611-imx8mp-frdm-hdmi-ddc-v1-1-b4e4c9bb0729@pengutronix.de>
 <airL0l3pgGRaPFVt@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <airL0l3pgGRaPFVt@lizhi-Precision-Tower-5810>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Thu, Jun 11, 2026 at 10:53:06AM -0400, Frank Li wrote:
> On Thu, Jun 11, 2026 at 10:18:59AM +0200, Philipp Zabel wrote:
> > Configure HDMI DDC SCL/SDA pins to support reading EDID.
> >
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> 
> Fix tags here?

Fixes: 95d7d7d2ad27 ("arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support")

regards
Philipp
