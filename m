Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D67416872
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373634; cv=none; b=qTwX97WEmP1eXtXlpAGYgqskUOQaKWAXmgfoHd0vQiLsMu1CYa5/8cfqWVft+31AchNzsiC+QNEFJ7j9UWLoec5l+AwovqqB2YaVNcB0caTOMkHOG63GkaYjFpbp88Q6G6Nb0aPwox5+dHuqwaLK8ruBVCTiGpMLZronLn+OWw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373634; c=relaxed/simple;
	bh=B9LQgQMizP+fya2lUXNzY3fLDpvw1cVEV7tcGkNgAKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2iK2rsYB14O7rKNhSikbjCRrIRAi3qGK6JpSzJMhtWiMVH1JbYi9hQCEHIPUoDDfBMuSJ5WoTvxtK9Q77TibDEWpSuQMTDO6r0aO3ghvPl3K9yIKTkyKt26MRhX8CXdP0vAYg5agfQdsrvdee6+Xq7Gc88pgCkvmd6Kp3GtPNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=D75cIULQ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="D75cIULQ"
Received: from francesco-nb (93-35-5-212.ip52.fastwebnet.it [93.35.5.212])
	by mail11.truemail.it (Postfix) with ESMTPA id 5FD451F984;
	Mon, 10 Aug 2026 16:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786373629;
	bh=MBAEe+UU9sXt1mvWPEutfdPd4IyZkVpv9j0uHiyaduk=; h=From:To:Subject;
	b=D75cIULQ0Rp3v1r6vpLPeYGJO9yd7yOg0JwOVTpZOUo9s7BNTQxXZsID72rXGPmnK
	 PSct2MRsC/CbqERvtCHgT1+XGTC9Sltogr0RccCVTTQchnZRdANhrYREUI0e3OKsWz
	 uL+W1VCh/SQ8L3ZAafBIvp9JDMMdw+5f6A015pgZk3lih0jWIz4QIW0o7jnO/AKuMo
	 gvS15TFZHBoJuSyoL1fWx++YPplmef0KeaHJU/DCig8KTeaJeLPn6llsC3naRzJits
	 upBsMzju5GjriFbRU2A3iIZMyn18soM/pV9rMPnVSabfJA60W/bvLL/O/SmO621vlX
	 /A4wMJ0xfhaFg==
Date: Mon, 10 Aug 2026 16:53:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] ARM: dts: imx7d-colibri-emmc: Add Toradex
 Displays 7" Parallel
Message-ID: <20260810145346.GB81453@francesco-nb>
References: <20260723105225.194366-1-francesco@dolcini.it>
 <178604616242.431490.2877142775301570674.b4-ty@b4>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178604616242.431490.2877142775301570674.b4-ty@b4>

Hello Frank,

On Thu, Aug 06, 2026 at 03:56:41PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> 
> On Thu, 23 Jul 2026 12:52:16 +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > This series adds device tree overlays to support the Toradex 7" DPI displays to
> > the Toradex Colibri iMX7 SoM (eMMC variant).
> >
> > Francesco Dolcini (3):
> >   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
> >     Parallel
> >   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
> >     Parallel with Touch Adapter
> >   ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7"
> >     Parallel
> >
> > [...]
> 
> Applied to imx/dt-indend, thanks!

What's the status of this? I do not see them in linux-next.

Francesco

