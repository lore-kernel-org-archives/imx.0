Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3591494DB;
	Tue, 30 Dec 2025 02:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767063064; cv=none; b=Vwgz/H4I8lDJZjpqwhHNphiEUqe0KogFCLeQsnbXpRWi5XQvpjY4LhQSkdREPtdDGg0CQ8Pn2XSQnhuv8gCSFnOUiBUOpgooQFZ4hJ1BWfjdc15iFqf9vyEKXFC2bWdEaSVIgAsCUAQShwUv8RT/XJstWtrLND6v7MVse9t635g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767063064; c=relaxed/simple;
	bh=Oaw8zlbEKeCp3Er7YfTJQKyFYMc/kre6qSyFVumm2vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMBJ+OEFjlI1KBHFtG2mGBmANYFn/VtilkfSo0KF0+TVqcXm8DVOkirg0x1a2uNE/+gReK6JtFYmC6XrHqCfEdYb9g3He0SJW/jrXdXN/+Q366EcBJgqU90jnx9EJpKtC+kMg6UIPy1uQ/g0Rk9WfTGXoKgDx2fDB+oaACL0sC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol6ETTKu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol6ETTKu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED9DC4CEF7;
	Tue, 30 Dec 2025 02:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767063064;
	bh=Oaw8zlbEKeCp3Er7YfTJQKyFYMc/kre6qSyFVumm2vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ol6ETTKuuppcnaJb/fk6kB2AseOHnZigYn18blBEr/H+pt4dbJkTUas0IzNtWCzJl
	 Q8QTapWlROn0G5amvtxKGvftdarHO4X/2cdeBSU5iJmyvrYZ+BEev/gJhaLPlFqGDd
	 lPbZubZlGbW+pv9npvF6pb3phFMjBcDnB0qgY+qGvQ632ffNOwnGgkHJMwJTg3YlI9
	 ggRTYZvaK7OXTepkMOJr1yNwUtp/WAKFQPJiJKE9rCzj4oc0Ac6aKMbxid1ZR/6lkc
	 JSZ9AFAyZe6fMITs5HYKBIm6yElMNsYseEqIX3FLLz1mmfUsgK+Npv3E6xREM359RV
	 Iuk1G0Hz58WBQ==
Date: Tue, 30 Dec 2025 10:50:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, upstream@lists.phytec.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>
Subject: Re: [PATCH v2 0/4] arm64: dts: additions for imx8mp-phyboard-pollux
Message-ID: <aVM-EKLH10KzU1ks@dragon>
References: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>

On Fri, Dec 05, 2025 at 10:33:24AM +0100, Yannic Moog wrote:
> This series adds missing miscellaneous hardware description to the
> respective device tree files as well as a bluetooth/wifi expansion
> board.
> 
> - i2c3 (basis for camera overlays)
> - missing supply voltages
> - PEB-WLBT-05 expansion board
> 
> ---
> Changes in v2:
> - improved wording of i2c3 commit description
> - removed regulator-always-on and regulator-boot-on properties
> - rebased
> - Link to v1: https://lore.kernel.org/r/20251020-imx8mp-dts-additions-v1-0-ea9ac5652b8b@phytec.de
> 
> ---
> Stefan Riedmueller (1):
>       arm64: dts: imx8mp-phyboard-pollux: Enable i2c3
> 
> Yannic Moog (3):
>       arm64: dts: imx8mp-phyboard-pollux: add fan-supply
>       arm64: dts: imx8mp-phycore-som: add spi-nor supply vcc
>       arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-05 expansion board

Applied all, thanks!
