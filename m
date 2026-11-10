Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303604;
	b=Wlzney8NxB9uCJu46FCxbagkJbcEOLGvqzj2/MLemRhJC1rWAkJbuEEb7VBBWSj2wNyz
	 rEIA85VDw6H/QevtKMyx3ektZ1xSwtmb7E5cwWrcRQydN0G/zmtejWEMpblWQ53tLj1dP
	 yvCvqCKIF2AWI/FFB5kLx77zWHRkWxZ//7RFi0B8wWVe0/+EA8InxJ9wAY1hNZZVZHmH5
	 bVJ9qhCUO4qr/T89SYQD3HHpMyXOMTLMWl67eJJ4eusttLyPjpZ1jko/nVWH/AEY8qdaq
	 tcsWF0pAs6IGp8qEjTivz0UgeMiATl+GgeyhdRzRP8jxpxb4zkVXlQ97G9o3d1oYzkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303604;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=+Xt+00HyDSv8lfLDiJMZJ5tz6uCFKhBO+O40JYLBMWQ=;
	b=SsWNtetmEQsn58zD7LTMS4pcA8Gmo9Lo+juDwYXaqHXn4lbPnxEV7S+rLRll/vePQG/n
	 KfCJ8aZYR8g9XfVOH2/5MeLW0dX8zDAhP61X6+6r4c92vqhysWjaSEnsWKOBsguJMjM/h
	 FJu1u0sNHf3M2GIMAO55JaPSEj0k5t2dsKCZOLGZYGMrPTTgyBAoMpCxVsflsqeD71+Lo
	 pflx8wLwXtZ7LTXeiASJqZ1g737LjwI2OlUHPeeS24itIRWrrbMpkefA5EswWbl1hNWDf
	 HqtGOGkY6Mxwi8RuTydwVqAuoz6/riDAhbfq3zZTDu24opkvBJ0ADBZk4AGBhGyH9Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=Fw8kpcc3;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485C6606A93D
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 09:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 485C6606A93D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=Fw8kpcc3
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id DCB0B1F95E;
	Tue, 10 Nov 2026 10:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794303598;
	bh=+Xt+00HyDSv8lfLDiJMZJ5tz6uCFKhBO+O40JYLBMWQ=; h=From:To:Subject;
	b=Fw8kpcc3XmOIRHdtW8NnUakw65Bkjhu+jVrQIWqOdFl0d29N8bgJ06Scm/I7bY6t6
	 xPyvtuvJsHmgt2bViYIg04BxNryQH9rdlwx+1Gz+XVHY+NJsJniC/6p6yJxFKyGdlA
	 sPh4AB2028tzkTcLQDrihIQng02DwbxfkSMed6hMUdgKoPAUg+zb83nmQjFsTHXlc5
	 v9dROSzWIz/pL52XnPxmBHqBEd13CeqfV4fy9CjFHsm7I6CGj2smSIql7OgnQNEj3d
	 YR4Ss/EML5b/XUc3BkidpZoIfT9FvG0EqtFztE70iSVWNzfupUVmZSmVPyChZqwLYN
	 8XqAiJrlUbAng==
Date: Tue, 10 Nov 2026 10:39:54 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: freescale: Add Verdin iMX8M OV5640
 camera overlays
Message-ID: <20261110093954.GA129290@francesco-nb>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>

Hello all,

On Thu, Oct 22, 2026 at 04:31:24PM +0200, Ernest Van Hoecke wrote:
> Following feedback on the Verdin iMX8M Mini series, introduce a binding
> for the connector's sideband GPIO nexus. Add connector mappings to the
> carrier descriptions and stable labels for the SoM-specific CSI media
> nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
> and all three carrier boards.
> 
> The binding intentionally covers only the connector's GPIO signals.
> MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
> existing bindings and are connected through stable labels in the Verdin
> device trees.

We have now an official page documenting this connector

Link: https://developer.toradex.com/hardware/hardware-resources/peripherals/toradex-camera-connector/

Ernest: if there is a new patch series, I would mention it.
Kieran: the danger note in the page is for you ;-)

Francesco

