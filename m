Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0721255F2D
	for <imx@lists.linux.dev>; Sat, 21 Mar 2026 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774109150; cv=none; b=o6Rgw4M3Tt2KvhSbb1pbljs0AEjO9UgCzNIR7YkDxvC7a6lFtaIwUmvPBlpxv0wvQbBEHhlGcIpdUUsmeYzwH++7y+Xn3yD0ftJnnSCxfG65WJAbjmUCGY53FPpaEdjyxdxA0umCBpin78cfjo8snkMz3J4pB8161cdJMAuOwZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774109150; c=relaxed/simple;
	bh=gyLPzHFjpcZvY5yUbkGLDxlWa/8E3W4swHcKJUzvh/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mol2nLvleJcK+v5ZaRK90CVCFth+6wcgZemn3Eh+D1HSdUNkqh5EyT6+Y12aVNVoLQyqO6YWnK1qBBynqOe0OL7AkR0O3m00nQ95ClxciUrCvtnNofceClHkYpbduWxlLtjOfgeTJ+40tRi7PiskJxGncit1wE2gFdAaV5h8yMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=BWh1uIUt; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="BWh1uIUt"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 28CC91F9AE;
	Sat, 21 Mar 2026 17:05:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774109139;
	bh=gyLPzHFjpcZvY5yUbkGLDxlWa/8E3W4swHcKJUzvh/4=; h=From:To:Subject;
	b=BWh1uIUtTNVHairbLOoWq2TpO/GD603aoSYt0EJD0EEFiM5TkQ5xAMLNNVA0zWnjn
	 5z3eYZylaqjpKA6kk/zl87ICTt+UJHdVXBF02vm7YE3FNP+EleJC/dQzrryzsxO+Ud
	 XEI62VQJ67EU6dxy5k94g1kFm/sLT1edfRpXvqG4SJ9MNx/dnTKmHYSR3mbA0O/AUs
	 hVWNmjvQT+ioEPgx27JBW7tuQvLR9AKh+rbm9xt/C0pUcZSHrZfoGS7pPIXd9/BvU1
	 qtBnJWPWe2ojsMbzsQ7VSAHxWGKvXZmTPkCqhlwHSesIvaViCqPvq+danB+PM1wRMY
	 fCxIAeNqj3PqQ==
Date: Sat, 21 Mar 2026 17:05:34 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: add initial device tree for
 TQMa93xx/MBa93xxLA-MINI
Message-ID: <20260321160534.GA6345@francesco-nb>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
 <abwBoB29cns28PWl@lizhi-Precision-Tower-5810>
 <3410122.44csPzL39Z@steina-w>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3410122.44csPzL39Z@steina-w>

On Thu, Mar 19, 2026 at 03:20:30PM +0100, Alexander Stein wrote:
> Am Donnerstag, 19. März 2026, 15:01:04 CET schrieb Frank Li:
> > iomux is not necessary at last one.
> AFAIK iomux being the last node is/was a common pattern for imx based platforms.

Correct, same understanding here.

Francesco

