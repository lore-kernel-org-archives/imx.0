Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1976E480DFD
	for <imx@lists.linux.dev>; Tue, 12 May 2026 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572288; cv=none; b=gGmBM+Ji3qw9OuN905bgAoF1ComPoscszt6UIuLoOcbk/CocFsHpfRzm9jOjE1NbzeCHi7wIM4QF6noyfKditSiOm7DOpSnCrIkxE0SjCjYhvEKqODtygsgSG2JnPvJB9sF4BoCDNlem+eS0UL84Qh9lHRA/5/LCslG1z2JUcPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572288; c=relaxed/simple;
	bh=QzOERDsu01teqRpJ/12Op6SVSFHMvsDpCuNgtRTgCpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmIY82kfGRA9Iizw7cweo6B4kYNHHzu4VuM+KjydvpTZPRwoD3k8OpWlg6aI60Y9u65Fvy64Ze1o844B2hejLYrUuQiXVA1Lnc8Gtlg4jC3ETqEzrqsDvkCiSgaq62kzEC04hNtcAAC4+Pzqpjy7iZKiPPxzjWdrH2+pgScQ9LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ukOLU+jn; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ukOLU+jn"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5B3A11F92A;
	Tue, 12 May 2026 09:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778572282;
	bh=UMQBXrU9FT0dD0+vFXxYp0huKRYdo7AaaqC5mS/KqME=; h=From:To:Subject;
	b=ukOLU+jnyf7tyziG+vS3l59YEiSDEnBB6kbfjmmR5Eoqhn5yE+U9LSKtp347Wv2ta
	 yMeANjw/xMVlYN5GTOyZyGlokPO5HopM7zXZJl98uAw4JyQq7IyrrzBmseeauDoUoq
	 YB5F/1sCQat7R27vo1y3SLaZs0NVfLCSNKtIUCIdpJxoczRC1OkFbMRAiQV0UlnYcO
	 iLV4reulN618GIUUifmQPvFf0wh4ZsqWkynriFRN1qoKLW0qHqLLZwDhbmcfdQoKn1
	 O4yZfIHSx2REDx6U2KaZu4otYWbBXSIhqV9BtDCbmn9fkPx29jNlNy7ju40L6bWqbH
	 uPYPsr6QDjB3A==
Date: Tue, 12 May 2026 09:51:20 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
Message-ID: <20260512075120.GB5820@francesco-nb>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>

On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY that
> is connected to the station management entity via the mechanical interface
> defined in 22.6 shall always respond to transactions addressed to PHY
> Address zero <00000>.
> 
> Use address 0 is safe because only one MDIO phy under mdio bus.

I do not think this is generally safe.

Not all ethernet phy answer to the 0 broadcast address. The one that I
have personally worked with consider 0 a unicast address.

Francesco

