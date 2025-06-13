Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B8219DF60
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 01:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779613; cv=none; b=bm57DgBDbs2tIxKm16ZXgAzLR5lSvFXpjNuGc5Zl/ahau8IeLUDO9IOLoDHahrUUfhn4eD/MCemM8eRhxCqAVOHPkAm4/eDs0UIZWPQUoxuKq20fnRBGhBEkTQLG3zVOLAvyGQiWptQNyxuUygXcx/7OTrJwGptvpnuDl/2jaOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779613; c=relaxed/simple;
	bh=5um7OlRXyxNfArLU1AL8h3ux8D8haG7NSWSfxT0SEGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+RbDbKEesW4pW16nSg9kMQnjWBhsLwpJX6HxslYup+DeU2nP9FXofbOQVah61GIadvOonjqZGor7TxM/D4A+myeaEQz+PtxcdipBDSf4raxObbU/KXkpCnqv8bp84dCnT4b8gFwuciY+onu8f4OUVGZzBdga8FGOGgWvdzQDtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=XjzXugX+; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="XjzXugX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yNSQ64cT373OaCtnIDdjjowAPRVl8grFK8GwPySFH44=;
	b=XjzXugX+Y0L5kDUQGGjBHSbYml6ugiTpJjEekPdIPyky4WzCp7f+UKXTMsm1Sa
	Bd4SxbYcN6a2Iax1T3Fp+GnzoJaHo3Hy7fS9uVAL13rtZEvSUQq4U/4AiJUzKbdp
	AtWsWRfVrsNJfW+u00De/02wxsQCow1Q8oz0/p78dbOkA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3l3xyhEtoHGyLAA--.13454S3;
	Fri, 13 Jun 2025 09:52:52 +0800 (CST)
Date: Fri, 13 Jun 2025 09:52:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit BUCK2
 to 600mV
Message-ID: <aEuEcqW/Na69wfsM@dragon>
References: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgD3l3xyhEtoHGyLAA--.13454S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnHq2DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBdrZWhLgIcJPAABsN

On Wed, May 14, 2025 at 11:41:27AM +0200, Alexander Stein wrote:
> TQMa9352 is only using LPDDR4X, so the BUCK2 regulator should be fixed
> at 600MV.
> 
> Fixes: d2858e6bd36c ("arm64: dts: freescale: imx93-tqma9352: Add PMIC node")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

