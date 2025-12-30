Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B02D29B777;
	Tue, 30 Dec 2025 02:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061713; cv=none; b=AAvO0Jkx9VO8zlNt4lyjEWGMO5ohxekhQAG+AR6kHBff253xLA2vwGuuyoMImVDbagNiu+bpD46brLNu4Jgr+TamAOVdIx1i/B22wYsLsvJrhI+epWfQ/TKIXBmoqr1mLcGww/hniGqFcw9oirdXOX0HnHfCyhvExgQrapg4SZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061713; c=relaxed/simple;
	bh=8+W0fvrS/czvT+s0AJ2IGHiiFjpn43Trh/HJCg0TrkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eshkIHUTuMYLwQdIFv6HMr7rXq0oWwMY/ZDBCmyM0SbJ1LjM6Ma42nnb+L3zNpzcGlXYVq/5W29YQE3FXATfz5VjhAeePpgBcG7KK34pEa4+PehX84JAg+YIj0VMfM4xgvULXqWjin7kmuLMrP7OwXIhDLOQpdFMFd3DwbDWCFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Msge0uHd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Msge0uHd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3841BC4CEF7;
	Tue, 30 Dec 2025 02:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061712;
	bh=8+W0fvrS/czvT+s0AJ2IGHiiFjpn43Trh/HJCg0TrkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Msge0uHdNE00bchjVMUQgCzs1OeC4zALsvwfwzo34n8DPU/bLsWLnvTSZWYHDNrG+
	 M3zzRxp14lz1IjRJmgytWQRGnVBHFhwI5Jdq+nRNyuO1OVgUMlAPW1iQ/zvE0xYyZn
	 rOQQJB3g6O+Hzu5NuyHlE/XP4DO4e2Js7oekQcWVXClki6M5qAxDNe05byUkX8eMA2
	 CiEnTW6+2D39FW7WG5foIGwiYuhRi2DlkBvRGCW9FRZyF8cD4wRrggKW6lT31VFyW1
	 MA2GekNkFcYwsedsggB7mvdNY2GoWRkRMybl6f8y0c4ZJMjmOCJgINph71nqNwgaWE
	 zm+gOPEkovvQw==
Date: Tue, 30 Dec 2025 10:28:27 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, frank.li@nxp.com
Subject: Re: [PATCH v2] arm64: dts: imx93-9x9-qsb: add CAN support overlay
 file
Message-ID: <aVM4ywIkJCsRdy2U@dragon>
References: <20251202-b4-9391-can-dts-v2-1-edab562615a7@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-b4-9391-can-dts-v2-1-edab562615a7@nxp.com>

On Tue, Dec 02, 2025 at 02:04:33PM +0800, Haibo Chen wrote:
> CAN1 and Micfil share pins on imx93-9x9-qsb board, use TMUX1574RSVR
> to control the connection: put sel to high, select CAN1, put sel to
> low, select Micfil. In default, sel keep low.
> 
> To support CAN1, need to put the sel to high. Besides, CAN1 use phy
> TJA1057GT/3.
> 
> ---
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

This line should be above "---".  Otherwise, it gets lost.

Fixed it up and applied the patch.

Shawn

> ---
> Changes in v2:
> - change commit title
> - Keep order by alphabet in Makefile
> - Link to v1: https://lore.kernel.org/r/20251126-b4-9391-can-dts-v1-1-c23145f0d2db@nxp.com
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  2 +
>  .../boot/dts/freescale/imx93-9x9-qsb-can1.dtso     | 63 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
