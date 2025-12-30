Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14322F16E;
	Tue, 30 Dec 2025 02:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767062083; cv=none; b=syZWIABUI/w29HosshDq9kyw5DUwJb3BqGjMsLGk7Qr9NTVGrepFpcw6Ln0wilLgUWcupxWIvDawAwm9CEAzLKH3cPv+B/wPRL+HZOBO9Zj/RZYRo/OI4E+QqXooM7jZ2GvUbKaBgF1GD5Id0Q9ryTGQ+GoaM94ma/FN/QIutXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767062083; c=relaxed/simple;
	bh=wJVGkSrJGS6nKQTsVQJ8xPBvCeoZSgJcaM+oaFSM/jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btDzXUy+YhhfWyzDC69ZVDqMS/uWoTa63LXzAOGx0pa8LfbRK1bvnsL/ZJqmW+AXrZ4g04hKrATgYdkGgEamaWLO7G7UYTy1Y/ys43FzMJJfBuvU4N5GFJOS+cMgwXnP+eeDyWyqKF5ZvwsYn1ASRpeB65W9oc0AzXokTAZeG2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktNMvPaO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktNMvPaO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2685C4CEF7;
	Tue, 30 Dec 2025 02:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767062083;
	bh=wJVGkSrJGS6nKQTsVQJ8xPBvCeoZSgJcaM+oaFSM/jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktNMvPaOCjzqObrT8Wed4EYqEdN6p88QowFBNCc+ZyS9kc6fYv6uXAI3w4KHWd5gS
	 eTVSHihz2u+0N64QWEbFxl8EPUnA20jYo5ibiWosN9S0oZP6ODtFJK5GSpeTTSSeR5
	 elfzsA80ANBeKfYFTaamPDALAyR3aojZkaItz9QXU+r4oFGrOCOHlk8LIXKUZq6Pew
	 4yPxKYhuETrB2pERb5JZnIWPdNfflO8rw+PQwR2tGV7TDi5xw7qwpZjLUhypfj3sbk
	 rXc3Z2XagWu6CsOLAulAgE7ynmoTL6s+Fox1rgh1UpoIaX77B1ty3N+5L+ERL3hPGl
	 XFVGix9gBN8tA==
Date: Tue, 30 Dec 2025 10:34:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	alexander.stein@ew.tq-group.com, frank.li@nxp.com,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] arm64: dts: imx8qm-ss-dma: correct the dma channels
 of lpuart
Message-ID: <aVM6O4OMk0I9F0Cc@dragon>
References: <20251203015956.116364-1-sherry.sun@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203015956.116364-1-sherry.sun@nxp.com>

On Wed, Dec 03, 2025 at 09:59:56AM +0800, Sherry Sun wrote:
> The commit 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
> order") swap uart rx and tx channel at common imx8-ss-dma.dtsi. But miss
> update imx8qm-ss-dma.dtsi.
> 
> The commit 5a8e9b022e569 ("arm64: dts: imx8qm-ss-dma: Pass lpuart
> dma-names") just simple add dma-names as binding doc requirement.
> 
> Correct lpuart0 - lpuart3 dma rx and tx channels, and use defines for
> the FSL_EDMA_RX flag.
> 
> Fixes: 5a8e9b022e56 ("arm64: dts: imx8qm-ss-dma: Pass lpuart dma-names")
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Applied, thanks!
