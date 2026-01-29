Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892C3876BE
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 12:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688879; cv=none; b=Q00yVMylh1x7ZEFzN5elSgPkOd2hzlUMvieZm56zOaAaQ0XtmNDxXNUo69gd6JMejHloO6QVeyNMoCG0RMQbP5QA+SlBOEEppQN+t6fOUFLGW067rHJ6KZYe61sInztf2uPk1YxJg4VkMnPKa6jlKBMWFL3vi7L1FZLxMH502wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688879; c=relaxed/simple;
	bh=gzV+eprp4opxNtIjgCSC3QCQKTk2X/SC3XMREsRvzIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+BSDkamWptEvCzV8pFxtiys1sOE8kIf4tVxBsjbGHUkDU4fIO+EaXlgTXAA8JnX7djjS/a8oXj627fVcoIN4LxHaSGOVs3XicmYjnS2LgMLu8ipkAcsPs6tZpn/sIJsbB7CZ4jZThip6vShj0DicJ7XJhi2TARk2RHuGVuKEpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=BhH3P1uE; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="BhH3P1uE"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3E79D1FAE4;
	Thu, 29 Jan 2026 13:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1769688873;
	bh=0ruMiEbmatRyLdSDU9GVneVebQsohFEEnNshrzJh1VY=; h=From:To:Subject;
	b=BhH3P1uENX1AHobeYn21cwlej1jQLIsuatEdT5bQZUR+fyoaAqWKraICisiVuVLYd
	 7E7EPHtiHF0SJO0nsobENn5ARO0YuwkOtdcPwgwR6E/q3qMXkiUXbzN28eFUuUCweb
	 ovcjzThPnDCuj+GLnDn80uK77br0MybuL5a5uGi7XgMv+JEyGQEvu4OccH2HKCXSWm
	 7H9Fl2LSp9wgTDdL5+/CHwESdcT+mZaKbIvt7v0Q4L2hkClvsnB83460tMVoGlbnrW
	 E1cJqmgCsundDNxd82UVUwAGh5y9IP2FTDJvm1EsI1VfvqK81L172ocgnrQ1LPtw/F
	 Kh037EDHemXPg==
Date: Thu, 29 Jan 2026 13:14:29 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: fix
 PMIC_SD2_VSEL label position
Message-ID: <20260129121414.GA57679@francesco-nb>
References: <20260129104741.888670-1-ghidoliemanuele@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129104741.888670-1-ghidoliemanuele@gmail.com>

On Thu, Jan 29, 2026 at 11:47:35AM +0100, Emanuele Ghidoli wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Fix the PMIC_SD2_VSEL gpio-line-name position. It should be on line 19
> of gpio3, not line 20.
> 
> Fixes: 90bbe88e0ea6 ("arm64: dts: freescale: add Toradex SMARC iMX95")
> Cc: stable@vger.kernel.org
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


