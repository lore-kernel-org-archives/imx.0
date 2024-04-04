Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A84642A
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712216533; cv=none; b=obo3hj9cdtPqjMjm2VCep5EiU72qtOtODuPNJxARqM22rq20Cd+lSkXtdgC5m9W6tgJhL0NWFsndZqJhWQFag88TCy5vNc3Petit0e6z6IvZfBTllYe1v2PdkHbO+2K+wrP2RyaOA7OVj+wgoMUqyvrtcOrfywoyHJzrIseMmN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712216533; c=relaxed/simple;
	bh=hX6JK6er6fFCHrNRhlT81DbGBJ8B7GLUNJShhMPNfxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVwTSox3sXgZotJC+xKk3Xyx8VVj29HkBId3N3lHhtR6vJNU7DLhfQ0eLIN5mwpx4Mpbs9roiNf/duPJrKeZ70wG5Gp5Z47SszDjsnD7VFAL0Ez73Xem1dO1XBBGLjfK1AI3NUAjHQ2Xk0gfmWk8EEp3rT1BqnLVK7E61eXkhfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1rsHjd-00006N-R4; Thu, 04 Apr 2024 09:42:09 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1rsHjd-00AKII-15; Thu, 04 Apr 2024 09:42:09 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1rsHjc-00DyHw-31;
	Thu, 04 Apr 2024 09:42:08 +0200
Date: Thu, 4 Apr 2024 09:42:08 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: debix-a: Disable i2c2 in base .dts
Message-ID: <20240404074208.dhe7izddorno7ylh@pengutronix.de>
References: <20240404002009.10052-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404002009.10052-1-laurent.pinchart@ideasonboard.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 24-04-04, Laurent Pinchart wrote:
> From: Jacopo Mondi <jacopo@jmondi.org>
> 
> The I2C2 bus is used for the CSI and DSI connectors only, no devices are
> connected to it on neither the Debix Model A nor its IO board. Disable
> the bus in the board's .dts and remove its clock frequency settings, as
> the value depends solely on the devices conncted to the CSI and DSI
> connectors. Display panel or camera sensor overlays will configure and
> enable the bus when necessary.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
