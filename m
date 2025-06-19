Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235321C9F5
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 04:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305745; cv=none; b=a2hIim0ctxu3iXBREmtRWbIkWK0Nx0wEc3e9DumNEysBh/mrhKuvO0pj/1MTPjDcIpk5mCRqx2q1tCylvk73ux8b9imLJ561GWTROMGPtlg8a4Ug9NDaElWkNSPZBfexpq3SGQHOYPQROupvMunOc2R7pFLYmBB4yw2oYvpfB1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305745; c=relaxed/simple;
	bh=dGXn9HsikZoPeqGXMzGHbrPCQh8SVD69TaCtUZdgaTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=et1AbDAIWvdh3WGdOyogbOhLDsDlEVbtCqbrcchve+sDFbRRQ9rwYWXcyxNgYS8r7vGbtu8MBhCznHol6+VkadUleCfff3EoH7JQQYRMNm1iS5HSumucFh6wgtJ2yOKyiuI1/6C4X6ijtBG057gqxu4499hIZlsJXoOQAyRNibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HsAkH6o7; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HsAkH6o7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=quvcjZIyZdHXE2r5su/BoIFtXlfUorFHohW6xpcB5B0=;
	b=HsAkH6o7CAehFoLWGauWTIMSs9aU+tPr6b4AO3hzKV+m/HV3WbbWoAYQgC2Ff/
	CC8AbNo32cE/q7bzmRTjRNzWgKj+hN4hjlAfrSnC5RhpTMv18cfGlAuiiiQ2iKsQ
	6BsnaF+zvMqplGN1/zwXCx9X3bsySvbSWPFm8CK5Wps0M=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX_zq0i1Noom_2AA--.60308S3;
	Thu, 19 Jun 2025 12:01:58 +0800 (CST)
Date: Thu, 19 Jun 2025 12:01:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 2/8] arm64: dts: imx8mp: Add pinctrl config definitions
Message-ID: <aFOLtHeAMaCLLDdL@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-2-a8f0195420aa@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-2-a8f0195420aa@gocontroll.com>
X-CM-TRANSID:M88vCgDX_zq0i1Noom_2AA--.60308S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0EfOUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQJxZWhTi3sBCwAAse

On Tue, May 20, 2025 at 08:34:51AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!

