Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9E4BD37F
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640096; cv=none; b=PStI2A0z+CnnIJPOmcJtUpfnqoIalhtOFNCgn7l8giR3nbWqphrDL+QBbQuuOj38JkfOMnyHRQBFcfHMmYFroOQT5TesqjNgy9muklZucd/h+Te2ZRNUjJrRwuPHaKho8NcE+JukHRkE3XSNVFdL9AgGAu+PW//ZoHYXX1nqoq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640096; c=relaxed/simple;
	bh=1fm/d1aRnwpTbGxkYjOMLQ4BF8Pg5rVXwMoLdO0HfTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2S1j6vEXlNiCsVPRk61ufFx+XMDy7QsGA9CvS9TZ0qhM5CnmkivhNcAgLUk9qoGKb4xOBEj2XPtdeUNt1dN/buhm2fWXk2x3ID6/+5zZH+JO3thbhzZXnSMYraa9TiYTtDv3dVPjzLPLcK9+nbgtMNSm+uX25cLGcyIkL/D57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=L5YAVrBy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="L5YAVrBy"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 2ABB01FE13;
	Thu, 17 Sep 2026 12:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789640087;
	bh=nGPRaq4S9vBbBXygDE+rIZJwB2PXwdT9MJwWrz7C/kg=; h=From:To:Subject;
	b=L5YAVrBy9vjQK79Gcib6ggUlUrgChHV4fbdQYS/TYijiWzWWXK330qxETGm7RjHLw
	 EGOg9v+Xpp0BPGr39yYAw6UWI9fmaXt0wMhRau8GLwNAkfRzdfBLEay+V2+C/PUPa5
	 8/xaXTJJWwZXs46VI0syXJrFobp7khqPbwHmhJI8d0I4vXGe5MYqNtViwx8KkHmOCn
	 wYA4RN7BbO0OPcr8zV/czEGeHyu93zbia7Otyfo/cZHyS1S3VgPbeD4dpKeplbJgpI
	 hxlfkQT97EoN3Ebk7XpGWM36RdnYYtP0/dwEn9q6w73dOk52dSzhWWskZ0ckQQYnXr
	 +gL2ZacWde6Bg==
Date: Thu, 17 Sep 2026 12:14:39 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: Add Toradex OSM iMX95
Message-ID: <20260917101439.GA67500@francesco-nb>
References: <20260917094217.59508-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917094217.59508-1-francesco@dolcini.it>

On Thu, Sep 17, 2026 at 11:42:13AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This patch series adds support for the Toradex OSM iMX95 SoM and its OSM
> Development Board.

please ignore, I'll send a v2 shortly :-/
