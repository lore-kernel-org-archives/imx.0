Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BBD1427A;
	Tue, 30 Dec 2025 02:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767063594; cv=none; b=GE1H7mfszIj8O7sAZtxYTA0kbgR97GotQ6d0RB2lQnAiQZVaHnPAUyNGCr3/nM5e9mRUvzHsbTSopaBh2VNOIUUxfLI/i3Orb5U+n7GjsM6lH/y3xtS5mkNRZfhdwCC/M6oI4GC0TiXRqF+AfuFwvnhXW1+THg4SPZaUiLvrVy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767063594; c=relaxed/simple;
	bh=+BmXUEiiyeVcTdYDhJWiItwNydOodkCcStv+E5cUu+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEGgoaPOpARtz6a1s/xhPQ4obK9CKiJyAno1ZF2UppjNbhR5KXNF9/yMdFJe2DwIEOTLn7J+VnUlaMkTTtzia9QS5ESCCnv2lth5T0Jci/vrmNPRPZpFtrlqURHURTi+ELO0YHx1AfbcgwQmEIL2rPsz4CXlwAc264MkHDp4Rps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6ZGAiJr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6ZGAiJr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5F5C4CEF7;
	Tue, 30 Dec 2025 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767063593;
	bh=+BmXUEiiyeVcTdYDhJWiItwNydOodkCcStv+E5cUu+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6ZGAiJrPHrIhhO4g4V1dz5F2Gww7i1mwBejaUoWSNhAvt9sbFb441e49xcEjLGK1
	 leNRQPlBzQr8aeRVJ4sDm6/bZX86e+GoSZpeCc1cnX4dVeDqSzxW6c1Ug8Vpa+7Ro0
	 M641v/KT0Qg9OrB6lVC676Vye6SzwZYcmX8ZkMDx6QUHOuGMI93uClOay+FxOLDt3i
	 NNNeylg0ae+c5c2aytrnGj9QlU9ImKfqLUBhrQ/hGDA5mBR4Zq6Qrnl26112BR2Na4
	 JgEpC0cMuXtkKOd+THjC2xSyu0hdJjVvB3d0dDyN4uIaFLtEQtJEnFNKD/xt8FMuY5
	 O/IR7Z0IH9DiQ==
Date: Tue, 30 Dec 2025 10:59:48 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8-apalis: Add ethernet alias
Message-ID: <aVNAJDTkBihpsmi8@dragon>
References: <20251209085747.39009-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209085747.39009-1-francesco@dolcini.it>

On Tue, Dec 09, 2025 at 09:57:46AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add alias for the apalis first ethernet interface, this ensures
> consistent interface naming (e.g. `end0`) and this is used by the
> firmware to correctly set the MAC address.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Applied, thanks!
