Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0978634C
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 00:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757551807; cv=none; b=HDewHi6gOW5hHPnp2qACAjJJRpRrLRnGmVIhfKtuuqdJl2TQtxyDKpFVukP3uQYOa/7IRbZjbGvzW+rugThyjMBrrGjkH4FLk0RGuspOWS+Q4G7swyQ7Vj7rHy4d41bXm0JWrmC/OJ8dtYOg1tNGU05z1EmuUWkTL2w3o22f56w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757551807; c=relaxed/simple;
	bh=APrZJGPv+l+iHtKtFVwV1M4sey/ipAgYWtDMsv/WApE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOEkA6gHeZjfbu+w7GLJY9Czp9y8NbNTFbFOm9BDemvrHZ+LFDI/eJ2GMfgLsIvw6gUSR3DIkG7sG7deV0Q1YsUlUXgGmAk2x/RjNcWVUq6r6ALhTlQKL53VYaRSTtYKq3UlFROkujp8hLfL6Udpwz945lPWytd+ppUE8LKluRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=eMwmFZ7e; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="eMwmFZ7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=e6HRqJKQ35qnhgZrk2aOMpdCfroMKThTD5K3U4AQ0eg=;
	b=eMwmFZ7eTDio4xTLBQVOu0WsaerTWu9389r4tBcwaN+2Fgi41ZMOr4fP10whD9
	OnCZ1HLG+qpChQySgNVXyAa5Sl0LxBlWb/UKHc/aPoZiOq+P7NS3tR5tOzyU0RR2
	uwG1iOzCurK3OCurBwxHmdcmTlgDEYL79DRXGsg6B9gKk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgA3ptuoHMJows1eBA--.50607S3;
	Thu, 11 Sep 2025 08:49:46 +0800 (CST)
Date: Thu, 11 Sep 2025 08:49:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 0/4] ARM: dts: clean up most ls1021a CHECK_DTB warning
Message-ID: <aMIcqBHl74Lhy6Dp@dragon>
References: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
X-CM-TRANSID:Ms8vCgA3ptuoHMJows1eBA--.50607S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1HqcUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAr7YWjCHKpThAAA37

On Fri, Aug 22, 2025 at 10:49:57AM -0400, Frank Li wrote:
> Frank Li (4):
>       ARM: dts: ls1021a: Rename node name nor to flash
>       ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
>       ARM: dts: ls1021a: Rename esdhc@1560000 to mmc@1560000
>       ARM: dts: ls1021a-tsn: Remove redundant #address-cells for ethernet-switch@1

Applied all, thanks!

