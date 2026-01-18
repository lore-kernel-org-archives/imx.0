Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71805238C29
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768756804; cv=none; b=VJ9aD0uGNxFcElVzvhPbTwim4+JVVVEgoNsyYYfqAqvDKsCraEt1rbsIr4sP0+dy3PsWnq3op6dYdnPY/uoPrdQLUZLtAJsAnAc7xkg4Ch0oj9gpmAhwtpIQ7oBztXT4Hy889msOrTa+C1u7KgUFQgi5a7x71zq3EDlHQxPn83I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768756804; c=relaxed/simple;
	bh=Co/mdZebVFw/9MBPgbhiUUXCnAJjdptNKvXWGl6t8p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtWntA43ooPIDyJ2n1k/mul7Xv9wr4kY6g3juuSe7fbAZqc1vTXmCgDiCvB0csjozgDrIfuhr9lGTA01LV6fGzFnRom7IKiACyS+lEzXe8/8l/Wa6O1BFVKK+XRzwIzlv2DQ364d0+uOnh3rYFMzTFLdeteQMMPK3CAur5se49Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWRF-0005qo-4W; Sun, 18 Jan 2026 18:19:45 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWRF-001HIK-13;
	Sun, 18 Jan 2026 18:19:44 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWRE-001bB5-1j;
	Sun, 18 Jan 2026 18:19:44 +0100
Date: Sun, 18 Jan 2026 18:19:44 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/9] arm64: dts: imx8mm-evk: correct the spdif
 compatible string
Message-ID: <20260118171944.5s65i7z4zxyx45wd@pengutronix.de>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-2-0f319c7e9b55@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-misc_dts-v2-2-0f319c7e9b55@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-01-17, Frank Li wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Correct the spdif compatible string to "fsl,imx8mm-spdif".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
