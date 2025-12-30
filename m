Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403957E0E4;
	Tue, 30 Dec 2025 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767064746; cv=none; b=P0jy3QMkr66lDHFdYq5Ld+dhWUdkkiM7quhUoLNfI28uhIohUp5DmlEvAV/Z85y0TsYYyUl+MHoYUM0W+fHMy6XwvNCEm4qXMlggtYrB0pAffW5iiLxP3uH8DhAo8hfh9uLu0gaSoD02vwMrs8zlZHXFwwjct/5fYJruTqaNXYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767064746; c=relaxed/simple;
	bh=O2r1KwYYSDALwqUvU7r3CqahDZShCtKWBjve35FT1yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDu3CfXo5VbWsv5O8xYazmTHny9VnVu49JA76G7ilCpnyo4ZA3IEMf0awkAKNEhBNDhsOPlPZiS+47M73Fi/5IJoWbViTVHo9MuvC8iq5r84YIjn63qp85ydVaTasygmQtczkIBSaktXlJLzrcH1LQiru/TDaGQawooqn2RkA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGYeLxOW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGYeLxOW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495F8C4CEF7;
	Tue, 30 Dec 2025 03:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767064746;
	bh=O2r1KwYYSDALwqUvU7r3CqahDZShCtKWBjve35FT1yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MGYeLxOWYN/Zq1UplbA7ORcLUNaZVqIbkVkof0sen7rRVF20HpmHevaE3Whe96Ixi
	 6cwDUlwvfx/blUnoiWJYgseAEoeHysqVB3+bFYSTAMEIqDUG9muoDiiOPJAX/AkEKi
	 GspB300ck4WjNDWmvMp407nnK/YRUjaLKadyNVbJBDR1/rEGbAL5rsANgFJERG6SuQ
	 0KlLoUbkEBKvJkoLb6GCVTMY9359U7qNpYDKMNG8XmPzwr1O9l6EErDPPR9PD7Z4Q8
	 wQtP8WVpfkTrtE5bCqhJfLhFmJWOKRVwh+WvCwBkyWuoQisO/Yz/IFsvs4tQleVOJe
	 2COgC16X2L2Og==
Date: Tue, 30 Dec 2025 11:19:01 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8m{m,p}-venice-gw71xx: Add Magetometer
Message-ID: <aVNEpXM3XG8Dfczl@dragon>
References: <20251209205828.689999-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205828.689999-1-tharvey@gateworks.com>

On Tue, Dec 09, 2025 at 12:58:28PM -0800, Tim Harvey wrote:
> Add support for the optional LIS2MDL magnetometer on GW71xx baseboards.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!
