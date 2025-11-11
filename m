Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637F22538F
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845947; cv=none; b=Kyq7Q3U1oizfUi6ZyA4CdTG4lP4Vtq1VbLEK+UaaEq5BhlgQk2Yhjst2B22sEqC/4tFcphl86MwlYQZjbv65v7NiAd5YmbDapz5qiZ/Tv3MFjx7GQqSBHLVMszZTEm3VlkuPQn4o9bIFsCmhrbl//f0aES2c7zhAT4ZSOUQijJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845947; c=relaxed/simple;
	bh=mIuHHzikhcqxzo0qmM5Y2Ye5IRQ2X29fODs7frPKlNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB44rgWzRQfXkrnCEE/FotrJmzPoPfrlK+6IzhMeNg90e1+inJsdjYujUtpospsAP7DQwyVnZrNAovnv280ldFLzGOh66q/q/xZfIXGa3INocflzqO9c4hoT6nxhwT6soWUte2cFzsDLLbiGvA1ILUXFV4WH8luh/BO2b0GnpM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kuZ/33BO; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kuZ/33BO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DXSbtNa/8HGcN26NDfFmNPbrsVA0ceNG7FgLoJ6Ziys=;
	b=kuZ/33BO1A5NZNYEaLRHjhouKPLdrH7xX6pZHYgBgZKhpT/Q5SoGP8/CZTh+SM
	R81shMTV6w0+O/8jxL4woap2+7cqN9vGzsuIal3uN0f9yT8voCbd+dX7O+mHUhZs
	eUon3+QD+qriOHSny9y3lZ2pD8SGBR6HLIFbjaAp3h1VM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHhmfi5BJp+fTBAQ--.5059S3;
	Tue, 11 Nov 2025 15:25:24 +0800 (CST)
Date: Tue, 11 Nov 2025 15:25:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 0/8] arm64: dts: imx8dxl related fix and minor update
Message-ID: <aRLk4uAnXFyMAzEf@dragon>
References: <20251022-dxl_dts-v1-0-8159dfdef8c5@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-dxl_dts-v1-0-8159dfdef8c5@nxp.com>
X-CM-TRANSID:M88vCgAHhmfi5BJp+fTBAQ--.5059S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw1rJF45trWfAF15XFWrXwb_yoWxKFg_u3
	90gF1ku3yUtr4fJw42van5u34UKw48Ar1DWryFg397X343XF15ua4vv395W3yxXFW3Zr1D
	CFyUJw1xXa15WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbzVbPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOQVRtmkS5OUapgAA3d

On Wed, Oct 22, 2025 at 12:50:20PM -0400, Frank Li wrote:
> imx8dxl dts some fixes and minor update.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (7):
>       arm64: dts: imx8dxl: Correct pcie-ep interrupt number
>       arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos
>       arm64: dts: imx8dxl-evk: add bt information for lpuart1
>       arm64: dts: imx8dxl-evk: add state_100mhz and state_200mhz for usdhc
>       arm64: dts: imx8-ss-conn: add fsl,tuning-step for usdhc1 and usdhc2
>       arm64: dts: imx8-ss-conn: add missed clock enet_2x_txclk for fec[1,2]
>       arm64: dts: imx8dxl-ss-conn: delete usb3_lpcg node
> 
> Shenwei Wang (1):
>       arm64: dts: imx8: add default clock rate for usdhc

Applied all, thanks!

