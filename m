Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C840D58F
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 06:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781765679; cv=none; b=m4Dsla6D3nPbK7zel5kykIiqPllLSwWocYFihNtS6z1rlieYlZM0p8cirigGatPLevFt8SgC5lInCsPOhhOjc3zQ8d6/peT5dPt/4hU6l07ZXZsXOxHHVFuVbyzGEZ8/0iZLdsPFFQcTQpM8uIVGN7nLCE1TVCOGBFZdHBz0kAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781765679; c=relaxed/simple;
	bh=wJFibP1Z405wNXWCFeC+RzcChWJUZNnz3E98NnmEWE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhjX5iFgv4vkaG2p8hqkU9+AmZllbNRp30iV8L1GDFWNFq1gxiz/UF0o1tDEOxPnfixupCK0imjWH/LGRcd95DFoWN6aVnqxZBkeSe0DKI3+WhM4G7MUb0VatuB04AG3zM+nq19VafIzD2vyZuKVAjWdSUF89KjQtqoUPBy1OcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=kIj4SNDw; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="kIj4SNDw"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 16E051F842;
	Thu, 18 Jun 2026 08:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781765673;
	bh=WJHY9gI3Ceqmq2l8dHu0nmhMWgcFjkSLn5OCJmW8oOI=; h=From:To:Subject;
	b=kIj4SNDwklBcBzOEdItPqBtd2cw/FN5wbtbIJKnFN6F/70Kuiz+EDXRq9drLS1e3f
	 P96oP/pUTJwM0PhFuOygHCK7E3pvGgKJ4nnZkDv9d0yLdDhgRd5gASDqNqzCQByZ6e
	 iK7IGdoNf2NFynkUfFFmuzWiceYs5eYjUYZ8LUd3RhoQlzl4ebP5WUccmqaBFM8n3K
	 /3maqrgKgYXEG6irypfGFRCQxYzxE4A8ssH7wQp0LNo56RoqeEIF6nJyWrM7Un55Tj
	 +6Iyk1yPLS17jTJPzNfftAmoNxdxYMUrGWc6P5eAnCsUq/Dy2kN7SoY5VK/DdOZ967
	 AFOAvzYTSXo1g==
Date: Thu, 18 Jun 2026 08:54:29 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: joy.zou@oss.nxp.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Joy Zou <joy.zou@nxp.com>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: pf0900: Modify volatile register range
 definition
Message-ID: <20260618065429.GA18945@francesco-nb>
References: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
 <20260618-b4-regulator-opt-v1-2-c43b1f62aaf6@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-b4-regulator-opt-v1-2-c43b1f62aaf6@oss.nxp.com>

Hello Joy,
thanks for the patch

On Thu, Jun 18, 2026 at 10:03:06AM +0800, joy.zou@oss.nxp.com wrote:
> From: Joy Zou <joy.zou@nxp.com>
> 
> The pf0900_range was incorrectly defined as a single continuous range
> from PF0900_REG_DEV_ID to PF0900_REG_SYS_DIAG, which includes many
> non-volatile registers. This could lead to unnecessary I2C/SPI reads
> and potential performance issues.
> 
> Ensures only volatile registers are read from the device
> on each access, while other registers can be cached by regmap.
> 
> Fixes: 162e23657e53 ("regulator: pf0900: Add PMIC PF0900 support")
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

No empty lines in-between tags. Remove the newline after Fixes:

Francesco
