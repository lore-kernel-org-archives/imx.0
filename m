Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14B51F1315;
	Mon, 29 Dec 2025 03:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766980347; cv=none; b=eckjI01jI1DfKaMU1Asr98ohJ5flxIIGMex6rq6C6ttWQkIpJBT9eGKIMFptvXcZFe2fU0/L3nuSO+EdjvL7WingYJOeH+K7+SRkCidvtW58yRX5n0dT5m9qZXQk+lOcdJVyg2vU25oM2nTQe673U7ejMdhDtaR9yEKncAR2H74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766980347; c=relaxed/simple;
	bh=ezn1FFAVejcWb2Ph+OCNWvgeCdNaFxMYoOlGpUhfphE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ym68rrcIUfCD9J/KOeZViSp6P8ktsJAcf+mK1zNl3uv7Tky2LqeJohfsha6XfB4fVN7wbfEg2q/ZTCOLkT9zWGhLr/HiP00xpSQwBKsAR8Y29oE5uAwNa5RAeXQymLEv31s9rNQfAMYPtqCKQc/We5FdraRIrVveOPCVmhEcrmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRlMsGCX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRlMsGCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15266C4CEF7;
	Mon, 29 Dec 2025 03:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766980346;
	bh=ezn1FFAVejcWb2Ph+OCNWvgeCdNaFxMYoOlGpUhfphE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRlMsGCXC/tjL32XLZnb3pNElbygxoxMHznflI0/0QMgnfvPRyyji521sr50KYqDF
	 02+oKfiy+WNZOljdk6EvTFlT8euSi52T6zRfEsopFGouniDFgtrQSX0UmP8wcWnVp7
	 Q27BSMz9a32mY7ydDXchmh76sbG0TgbXeKRzAvojUJAC1xRDwcrIv7qDzKCTesz+ne
	 +v0gtfUG6jriDPLv+ybNySuYp4le6sn3hOtnscZX4PVvSmUgAu6oKOXOscz7jZURQ0
	 w8ZZVfPWQXivFDEAxt4IXH2r3Tm6hs9Ejq8AK8ve3bDMOY3YjXQExMsaJoBBcCJsi+
	 8iXEpX8fBeHJg==
Date: Mon, 29 Dec 2025 11:52:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Yashwanth Varakala <y.varakala@phytec.de>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de, peng.fan@nxp.com
Subject: Re: [PATCH v2 0/2] Add and Update display overlays for libra
Message-ID: <aVH69fio_tx5XR2f@dragon>
References: <20251117124515.26675-1-y.varakala@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117124515.26675-1-y.varakala@phytec.de>

On Mon, Nov 17, 2025 at 01:45:13PM +0100, Yashwanth Varakala wrote:
> Add ph128800t006-zhc01 multimedia dispaly overlay for the onboard imx8mp
> libra. Update panel node naming style in etml1010g3dra onboard dispaly
> overlay.
> 
> Also add the PEB-AV-10 expansion board overlay that can support audio
> without the display.
> 
> Update panel and backlight node naming style of the i.MX8MP Libra RDK
> devicetree.
> 
> Yashwanth Varakala (2):
>   arm64: dts: imx8mp libra: add and update display overlays
>   arm64: dts: imx8mp libra: add peb-av-10 expansion board overlay

Applied both, thanks!
