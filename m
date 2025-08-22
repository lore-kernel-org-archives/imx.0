Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86EB21ADB9
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755853297; cv=none; b=GgtkVXIVPLokSvr2JOGMIQnzBrfTWflS13v3hnFTZXcQ1l5IPMFx9dHY3oxoNNIgLzGAXs/U6CScYj3iZ+qJsjn1eTSf3ORMlpH+0f3054Xr/kfkJHeHi/IxqnQKVv6Yetvonc3OG8xBifFNchcZ6Wy4Hi70SafaDKhQe0ce1q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755853297; c=relaxed/simple;
	bh=9ge1KhfR4GPontv0mr0iYuisXbmPgCbvoZHfhrs08jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hL1yMgveOvr72GL+cFgHeJnYGAY62iJ1mCAL6cskRFype0ydBcrPkmPSVAstkmC4Y2EWb1aFDoArkNSJtYPUyXryjMqa2ezdl9g0g6fGOpw0KCL2Cg9rbyEm/XO1HfGRP47rhYp+LSc1hR2Pj4AoZ7N/D0bti3p1VMLLFVJHStQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=d5WraUMZ; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="d5WraUMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=szsFJQd7FpONlwOm+0H1IEbNubvgFFPa2+Vofeysjbs=;
	b=d5WraUMZ95QQRPkROwQ+DJ10P6fMlQcaMqqvkrYcaC/eItrxon8v3z4g0R4o6c
	tKl8zjkrKgYXpRmu3VT7nhgMDiZwIYAAqifwv6nWO0t5uFl2jeNidrBtao33Oljz
	cQp1nV2sa0bJzLlxaJYFKZmFsHVu/9w7rWF7KQID7148I=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3H9PLMahoWSkcAw--.15940S3;
	Fri, 22 Aug 2025 17:01:01 +0800 (CST)
Date: Fri, 22 Aug 2025 17:00:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix missing microSD slot vqmmc on DH
 electronics i.MX8M Plus DHCOM
Message-ID: <aKgxy6tmlw28awes@dragon>
References: <20250810160340.10042-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810160340.10042-1-marek.vasut@mailbox.org>
X-CM-TRANSID:Mc8vCgD3H9PLMahoWSkcAw--.15940S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeLvtDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQ3DKWioMc2g0gAA3c

On Sun, Aug 10, 2025 at 06:03:07PM +0200, Marek Vasut wrote:
> Add missing microSD slot vqmmc-supply property, otherwise the kernel
> might shut down LDO5 regulator and that would power off the microSD
> card slot, possibly while it is in use. Add the property to make sure
> the kernel is aware of the LDO5 regulator which supplies the microSD
> slot and keeps the LDO5 enabled.
> 
> Fixes: 8d6712695bc8 ("arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM and PDK2")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!

