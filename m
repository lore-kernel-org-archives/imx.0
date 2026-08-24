Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0280936B928
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577338; cv=none; b=P48lVzy8qRHK+jeGHFPJt9JA9JrmuSSzPYldVhZgbAOEzymFSHI+IRLotfp1o3PgKPktiZ/9/cvYQy3rSY9NNoHuQnKuGaVn7p74ZUTblkaV7VJBzH2JQg6cSjjbgaTFhbdi4oDzuWFXrHhA4AbYd7KsTVruqedRMs3Y8Ztls9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577338; c=relaxed/simple;
	bh=xu6YOcOWUBosY162fqI8wR2m/f4r2kHKyQ4LgFRs438=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqsVHIgJdqoKn65PmignkRGHqm/n1w331WzCg/o3QSomARLz2qEI11AboC2Hueipv6rpWGaBfPtMb9kUJTNAcCrtw5euuzbagonZ/tXvTD/JHx6Z19dr5GPb1+/SWB/eg1/P93dSYcvLLucdDcc9/PJrzSb21VhzmOL6bCYMnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=tE4EsFIy; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="tE4EsFIy"
Received: from L30177.local (unknown [46.193.67.97])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1AADF2003C3;
	Mon, 24 Aug 2026 15:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787577333;
	bh=xu6YOcOWUBosY162fqI8wR2m/f4r2kHKyQ4LgFRs438=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tE4EsFIyKBG0hbwT2YlOyTcRsEht1e52R4KqWyfTanay+mfqAwtAkoG1w1cFurfZt
	 SkfaeudBWXGjB+X7+h+60FuCj/T8LrPiPMLS4KAwanudCZE7zsTm+F5LHD4LUZmRXF
	 8+ILdE3Xgf8lis1SoejHi23/R3aXAwFve2c8WXX0IEknqv3X1GKhTxZQbRHX8j8qaj
	 z8ZQ4QVPmV815FF5Cgi0JRxLH7rJoI3nuWvsDD0vlcWQwQgckip9KTQuv826hjRINh
	 u0fFBGgouNOHIuLfOlMnTuJpTfhtiYbEx3Rly44yQKf0kAf63ZCY3TwUsjM5gH7wDS
	 yTu6KM+L5RDdQ==
Date: Mon, 24 Aug 2026 15:15:18 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Josua Mayer <josua@solid-run.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: lx2160a: fix incorrect pinmux
Message-ID: <aoxD5mwdBCU5Gnfg@L30177.local>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr>
 <3d4fe161-895e-4820-a99d-8cd5fd6d9ad2@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d4fe161-895e-4820-a99d-8cd5fd6d9ad2@solid-run.com>

Hi Josua,

> Reviewed-by: Josua Mayer <josua@solid-run.com>

Sorry, I did miss your review while doing a v2 based on the Bot's comments.
Please, can you resubmit your reviewed by on this serie:
  https://lore.kernel.org/all/20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr/
?

thank you,
  Vincent
