Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4D86331;
	Tue, 30 Dec 2025 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100207; cv=none; b=m4Mhh+TBB7XYfzuNLnMH1E+1KCcxx7wm055xE8DL18nzAHKuvopVKtU1T5rsRY7JWeUOi4xTpmbQBYY6yJe3XzKYnf0XQMK8GI7iyFdwbhRs0I9XNOyjqrKe+DOGErTOdHg/EfZofD1VU5beK4qZndnCK7wYg9V66xtvd1/6xU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100207; c=relaxed/simple;
	bh=Eo5dgsZGwV6/FmS4NlK+vYQcotnOhMl1jME6+5g/4OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTxo8Lzst5N/MpD1RgcdsDT3+mP+INNNoVfDYceEnE/HX+HdILGCsVTds8FUlfZRfiVpWeCKGcXfK7Qk+RTArlMZ5r18bPZHatKkWK6cK298xmwK6K/mNqIVQaULXJuAEtW49LdeZwu6q18jLlUfFqQH3EGehvIewRy9P+JBYY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLGe3lq+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLGe3lq+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D409C4CEFB;
	Tue, 30 Dec 2025 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767100205;
	bh=Eo5dgsZGwV6/FmS4NlK+vYQcotnOhMl1jME6+5g/4OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLGe3lq+mKTna7dbEhpE8X2VteRD0ym7ko2g8q+vAhQsnHl9moaxDk4ucw5U4a0Na
	 h3azPiH9r9v20bl9Oj7/EJWo9FsGmcJ7oEDoyrn6Q9uGL6VZG5z43c0znmZghlYscs
	 R5NB19XRF9FX7QwStCMa+Swuc/7feSh2ag20HGOXn13tRq4LEGSJhm2lUUlz+kOofQ
	 PTlvxaUSLbblmwNdkdqsLQ5eP4fN85exy2Wfkdi+anCKcGzw6Juze3OhfPwpRGA90u
	 OwkVYRoST3kZq9Xm09cpR1Fm40I9oRsW26bwG/zuqZSj0KQc8Lchm1VCGbO8Pw+YFq
	 8mjTMYuKUrhIw==
Date: Tue, 30 Dec 2025 21:09:59 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add xspi device node and mt35xu512aba spi nor device
 support on imx943-evk board
Message-ID: <aVPPJxWuJl74zoez@dragon>
References: <20251223-imx943-xspi-dts-v1-0-7c18e5b4f97a@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-imx943-xspi-dts-v1-0-7c18e5b4f97a@nxp.com>

On Tue, Dec 23, 2025 at 05:05:55PM +0800, Haibo Chen wrote:
> Haibo Chen (2):
>       arm64: dts: imx94: add xspi device node
>       arm64: dts: imx94: add mt35xu512aba spi nor support

Applied both, thanks!
