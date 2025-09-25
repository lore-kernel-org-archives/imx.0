Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988D235950
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758820677; cv=none; b=SYyFNCV8wujGVrTNryHeh8LQP9J8WS1V9cfm5/KMamDjkRYxgsuX3lCgRgxdVo9c503qrRNpMR9o7QCkzngLKAmjZmz3KzcDUfqozjSSwpJ3i8SyXQnL3qdGAa2Cfs7n0409CyjUlnEBxlQFb6JMB7SNknXvc63EXmnFCfcbeF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758820677; c=relaxed/simple;
	bh=ixPSXTmwhZtRkACpF9LlTsgH7Qo2qNi66hork6y/MU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBUnH1RsVBy7wPrCnO7w2eWiYddxdUq5+nU4dCRc6yM8IUzcl/H72FBq54sC6Zog3ia7EOHjzJ38e2ce6QLG1UCUz6LZw8nQ+YWppPVGDrosVCzgc5t6xDlLDj0uu6MOGhhg/2p3X7w+MNRJwFVnnuaOUSYTOIEyIv7PNLzYfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1v1pbF-0002bj-8T; Thu, 25 Sep 2025 19:17:45 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1v1pbE-000SHH-2w;
	Thu, 25 Sep 2025 19:17:44 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1v1pbE-00CgJl-2T;
	Thu, 25 Sep 2025 19:17:44 +0200
Date: Thu, 25 Sep 2025 19:17:44 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: freescale: debix-som-a-bmb-08: Enable HDMI
 output
Message-ID: <20250925171744.5eyhqjlqp7skesqi@pengutronix.de>
References: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25-09-16, Kieran Bingham wrote:
> Enable the HDMI output on the Debix SOM A board, using the HDMI encoder
> present in the i.MX8MP SoC.
> 
> Enable and configure all nodes required for the HDMI port usage.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
