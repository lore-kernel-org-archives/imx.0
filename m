Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061B3A1E99;
	Tue, 30 Dec 2025 02:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061904; cv=none; b=cOteG+SEqXA/inWvtI3QVuGFiXcBFOCRHeFBcp4oG9qw0c1mdYhCmin2NCQe4S6nqNuQ1lRAZWJLgF06Vb+ta8ts4wdF98kVqLy4cabtSv/ynhF1pN4rUEFhWdAbmyyTKFkD/mnh0hA9aJrfOusduonXJXJ0j2r4cKu7JToYWQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061904; c=relaxed/simple;
	bh=PpmZYSJZUmcJSLVio/K5CzQLpAMxvk8XXs1hZULmZo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOZGuwbghHLCd7EWh6zkZPsfHadJg+t9zodvrnzx41YCWIDsAgbSTi31U7nV+3zv6FE7scRZq1LT4685UgJ6TYugDY3hmMOoyINgqhmfjjqoRduYlBGybfrmbjQTK34QsEQkZS7EP5Hva2y4WV7nezasAdbMoip4SZTbprcfT4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnZqKccp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnZqKccp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE71C4CEF7;
	Tue, 30 Dec 2025 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061903;
	bh=PpmZYSJZUmcJSLVio/K5CzQLpAMxvk8XXs1hZULmZo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnZqKccpeffYdpN549CTIEwOOmr1YyKa4QV/+pvBpPl4QbVUh1LKPjgmHlt1Il1Zy
	 lxJplZMJRYpYQF3V6/l5QuoR/wch0lVTElbukOBOwao0OOZ9es1nxcyB9YMd5IALlS
	 Ljp9nFLloazOIC0cMR73R5GpfIjC0mjp/n8SU8eVsCWRbc+ub+ZikFKDiiAnNFflJ9
	 6PsOHyRqJXRBRAKfY6nTR6lz7oCKxN0pAX44YTbd3/mb9QY+0UgiX713XuFfBRvtoG
	 kNbKXCLfIjqKKrsiA7WALxwPLKD4qbO+FEw3As3lKwyzbi9ZI8oXha82NQEDdY33Nz
	 NE0UTKWCpIvfQ==
Date: Tue, 30 Dec 2025 10:31:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on
 DH electronics i.MX8M Plus DHCOM
Message-ID: <aVM5iadHU5ipnQ0M@dragon>
References: <20251202134200.8397-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202134200.8397-1-marek.vasut@mailbox.org>

On Tue, Dec 02, 2025 at 02:41:51PM +0100, Marek Vasut wrote:
> Add missing 'clocks' property to LAN8740Ai PHY node, to allow the PHY driver
> to manage LAN8740Ai CLKIN reference clock supply. This fixes sporadic link
> bouncing caused by interruptions on the PHY reference clock, by letting the
> PHY driver manage the reference clock and assure there are no interruptions.
> 
> This follows the matching PHY driver recommendation described in commit
> bedd8d78aba3 ("net: phy: smsc: LAN8710/20: add phy refclk in support")
> 
> Fixes: 8d6712695bc8 ("arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK2")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!
