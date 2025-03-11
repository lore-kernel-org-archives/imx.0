Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2293C1DE2DF
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 02:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741661837; cv=none; b=C9G/hcQprMwQCyRXPQdnbGqCLi/Vc3ygGOSQUYUaS6Nx2XNfJN7WMXUI0BBbHf5U8nYauaQw6GeUbDfU1QUe/AWHaH9lcV/2xVc0p1y/0bYpCNwop6iqX0PCMV+L//+Tp8CxJumrWOXKWB5JRAVnUEx+7MIJjhN6XMy+a6nGmgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741661837; c=relaxed/simple;
	bh=rwQqyDcDc+bMra20ugcrb8veDxxTFzOfBpewMmM2OsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRAw0bGVy4mk34EfES4sMF98TFJS1/c2xE6pcVU8XP2XTmZj/TP+1xRoyujm5dCF+XGnTFtVhlmI6yD/N7wcJ2ieY2UUVi5Sw08fc9ZoRxe8kPlD4dZj0nvwXti2PuiWREGge+1iM5o2UNr7f4gg1ARGV0onpp0EAgP3pCnOK4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bZN/HkxA; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bZN/HkxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2UT5JWESlIqMK88Qm0fZJYn8VJFoNxpbvjgrdMRXN5E=;
	b=bZN/HkxAw8pLxgZlkQiT5Uevk+4WAvRTFDqPITaWXNqhsjzQM27BtnVpAqTS+O
	tUKdb3R6e3galk+evy/LBZmavjIEHvB6B55Z2DriV8CjulaoOsj2Hy3xklw0zMQJ
	liWMaEFT+JF4XsDbDQ5vF/y3RqtwkOsdXEdJBeTRBDhX4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXbUZxps9nP+awAA--.43587S3;
	Tue, 11 Mar 2025 10:56:51 +0800 (CST)
Date: Tue, 11 Mar 2025 10:56:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH resend v3 1/1] arm64: dts: imx93: add ddr edac support
Message-ID: <Z8+mcZw9yjOr3m/y@dragon>
References: <20250225192159.2907320-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225192159.2907320-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgCXbUZxps9nP+awAA--.43587S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVvedUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNROT+GfPpnP3ogAA3l

On Tue, Feb 25, 2025 at 02:21:58PM -0500, Frank Li wrote:
> Add ddr edac support for imx93.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

