Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031C1AA7BF
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742888372; cv=none; b=fJ/9vfNZdElFipAz8hHGyvtLngkVmBQ1lHI4Bn972XcCgNCTyjxQqkZSERb6poIoXYt8yBIGMdBEHD4KfV3JSx887d+MEyV9+ltfPE+2HzdgJb6a4WaBdw6gRX3xlHznvmQfdN2HYGyuRbEREAf2wdF/ywfc75i+GlvPs/VwdWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742888372; c=relaxed/simple;
	bh=batQneF++31YVzS6+Hca1+5CRWmi5MUZXOpSbDnq0wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWZ7dwd73Up1z42eMEqqyDZVd4bqevGI0HKP8u5z1eMQ4YoyGlcna8rk27f9LcpNsgb0AIKvTSTiJ1MkznajtSxTmZBVfNTQ0jCJTcXjXtDFuOx2uc37W9D4xMqW6b2OpiG2O19+rZMbdfL8+GNlyICZYOAUNnxtXIna4USt9xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ysemAN5y; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ysemAN5y"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 40E451F83F;
	Tue, 25 Mar 2025 08:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1742888360;
	bh=/HGvvkUO5PI2lhLwqNWFUyi3tDt6/UQpdwEBa8XWbrc=; h=From:To:Subject;
	b=ysemAN5y7zQf5M11vmEarU5i9KubasQV2MDpOX7Etq22Ey3B8M4DrC8roLpD84+5P
	 Q6E/n07U+wQJvlhMnnPVBDaPCOLgoXbBazpDYXwr+MdRtZGVWoDDBkzEMCk9pYZZpy
	 bbQUBaPIZhWPjEyUZLpZWTAK8wz93QqDlmMjCBlnBcCTxHrxXX/9qE7pMxk7Ha7ZaU
	 Q+pu8nOlCjYMudptUbckwwzk8K+sPYOvmCWMpauakoC8yDOQ+c2hWJ/pREKRl6GpVY
	 yMt+pgdozStgO3CYDDGvmfP42f11NKVMKeu4edkMV81hsbxEhQBhqTKG6lR5nxQYTX
	 /edp9QyvweNNQ==
Date: Tue, 25 Mar 2025 08:39:16 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Joao Goncalves <joao.goncalves@toradex.com>,
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: imx: document i.MX 95 Verdin
 Evaluation Kit (EVK)
Message-ID: <20250325073916.GA4684@francesco-nb>
References: <20250324234013.140440-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324234013.140440-1-marex@denx.de>

On Tue, Mar 25, 2025 at 12:40:01AM +0100, Marek Vasut wrote:
> Document support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK.
> 
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
> 
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95-evaluation-kit
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Francesco

