Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771061D5CD4;
	Tue, 30 Dec 2025 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767099824; cv=none; b=iwdiuGKt1Ss2tDVZceAxBxh16mRDr9KEJgLELbhxbsRbwlvP/uJXf53W3Moc2+Z9IozlfIXFRrTIJD+kubKvG4IRSjaCaUYaTjdou3A7WU8eTErAJi/G8z0WE02TqJov7deEHgIMIRIR5ZqjXuPfI7QRBk0IwsSeXrpgI2Z19oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767099824; c=relaxed/simple;
	bh=FA+7C0106/GPLstG+xuWAqAY5KHNYGoVkH57M2wUGCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1NSzzd+4SPjEUkwZwMtbmW5ro45yQImPYg7jGUNZkWuXF18gX10Am6Z5IXu17ns7Aqk7cJVdrQA9KjCXznDfDpkGkYS0Prf066nhQcKkdD6TiNNJh5NutDXGX9rUOyPFZL/6yZR7euYu8Zq+dOwiaxSpDaxLGhDLsjVgyAkvFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4NoalH0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4NoalH0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEA0C4CEFB;
	Tue, 30 Dec 2025 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767099824;
	bh=FA+7C0106/GPLstG+xuWAqAY5KHNYGoVkH57M2wUGCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4NoalH0144Y8uww34o0txkZL6Id5giljjwplRU8W2z3Cn8Z0SCKfsRzj5encJynJ
	 QVqniprtLfLmF6OtgZOquzwM+GWimeDfh+5S1D5QLC8WEEDvrJNFaWH1XWWzXpv+kh
	 RaDHx0CO0fRJhWeqCT9B36xKgCqxaTvPd0q+j0NMPoJgAja0ZIK65+xMcHF3vnnelU
	 KDHgq8G//YB+GSVcEMacH9pZ80Vz5fsn683htAwb8iG2kHxEaqqUXLoaRWqTcPCb0D
	 Lkqb3qRDsrhXLe4eNfWrw2J1MebWg72cajecD95l/bOe6C+BYdQ99uWfVvPQ6a0wny
	 FfkoNI3u+7Tkg==
Date: Tue, 30 Dec 2025 21:03:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: Initial support for i.MX952
Message-ID: <aVPNqQtzz-C-bvCb@dragon>
References: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com>

On Mon, Dec 22, 2025 at 09:42:13AM +0800, Peng Fan (OSS) wrote:
> Peng Fan (3):
>       dt-bindings: arm: fsl: add i.MX952 EVK board
>       arm64: dts: freescale: Add initial device tree for i.MX952
>       arm64: dts: freescale: Add i.MX952 EVK basic device tree

Applied all, thanks!
