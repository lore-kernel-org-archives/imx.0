Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D523278D
	for <imx@lists.linux.dev>; Sat, 24 Jan 2026 20:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769287084; cv=none; b=XO5CMVQ+awi9wW8j6nGwNSHoLlDEVqomGK3xynju8bXgJoT0g5CdpOo7Rm9Uy7UiFWJvEZ8oJAR4sFkMrMu5AXp/MMbCKotEU86qfju8hvts4Ty8+rILes0igN8vvKPT+Sn1sBjSP5GrLDcoUpT30mkhFP/1ZVQAhVYc+obpSaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769287084; c=relaxed/simple;
	bh=UpuXN4rtw45SwqTWFeSLCViITzp5P4EXGS1hzE+jbGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJOFT8wS8wk04X6oGJ7UsnkSCtTPtS7c779QsuTcJ2pz48HVqJVhWieGLApbUqZ8ckYQZmDQJ7crePHeYdYikHrUxTf54p94WPakiCAWl19dCiDmFbeSNx5VbUK9Exl3zUxkfweHR7NpFqn9RIT6+/hUwKRs6BaHieHhMs9E5v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1vjkO3-0005Oc-09; Sat, 24 Jan 2026 21:37:39 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <pza@pengutronix.de>)
	id 1vjkO2-002JL1-0a;
	Sat, 24 Jan 2026 21:37:37 +0100
Received: from pza by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <pza@pengutronix.de>)
	id 1vjkO1-00CvHY-1B;
	Sat, 24 Jan 2026 21:37:37 +0100
Date: Sat, 24 Jan 2026 21:37:37 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jacky Bai <ping.bai@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
Message-ID: <aXUtkR0J0cK98ZQQ@pengutronix.de>
References: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Fri, Jan 23, 2026 at 10:51:26AM +0800, Jacky Bai wrote:
> On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> also triggers a reset of the GPUMIX domain, including its ADB400 port.
> However, the ADB400 interface must always be placed into power‑down mode
> before being reset.
> 
> Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> handle dependency ordering. In some corner cases, the GPUMIX power off
> sequence is skipped, leaving the ADB400 port active when GPU2D/3D reset.
> This causes the GPUMIX ADB400 port to be reset while still active,
> leading to unpredictable bus behavior and GPU hangs.
> 
> To avoid this, refine the power‑domain control logic so that the GPUMIX
> ADB400 port is explicitly powered down and powered up as part of the GPU
> power domain on/off sequence. This ensures proper ordering and prevents
> incorrect ADB400 reset.
> 
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

This fixes a sporadic system freeze after a few hours of alternating
between GPU activity and GPU runtime suspend that I could reproduce on
i.MX8MM since commit 055467378bf1 ("driver core: Enable fw_devlink=rpm
by default").

regards
Philipp
