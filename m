Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D00101C8
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110878; cv=none; b=HB5ZO77Rmh4cHuiSWue29ko0P0ETSfvSZ7te0wDL706oQ27XPxA/mArcYyBeWqzuWExCMSiUFkgUYf6zFb1FN4g4mJ41NzmJdYCNGwZx2eBL9USbkFZyeB2k2ajgBjBPlEoHMV6pKQNMQ198CMJMnO1Shm7dD6Sne9DTlPrGPLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110878; c=relaxed/simple;
	bh=5q0ek88M+T6JZH8g+NZGmnjowcQExSxi4Q1g79p6TBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8dzHc4Snci+Z9rg5NS8r4Q8dpHHG2phCFacfOQjxzZOmJeU6VLMNf3MDGUE90JOrTrX7OLnxDpWTZx2JK4IHKA+Atr9i3WtRDvE3jM138M+xkNwbHVvhJ6wEbw0fvL3L34kdHtmUDiM/ho++zJ2l8a1WMzpNrCGl01I11BqCKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=aDjM/wn/; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="aDjM/wn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=C3VeFlTothnBfPCiZFyi21ZpxR9C9WPeO95qW/uOlv8=;
	b=aDjM/wn/xpCGVUkdZaC1rWeB1pHboDz8Gxc/Ec+VYAxF7ZYyRe2cx315zMnk7v
	jLaxmz7XdePHO6gspDrJdbzPESAu5wjoG4LWv00JGfGQpcJaQG2mHI/1TrG1Yfl0
	0s1YN3Junb6p5ccl19HVWz1HBw5y1p1jgCb5vCT/5aMas=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3P082GtNm7cA7AA--.11280S3;
	Sat, 31 Aug 2024 21:27:20 +0800 (CST)
Date: Sat, 31 Aug 2024 21:27:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Message-ID: <ZtMaNn4W/ZG8gqCS@dragon>
References: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com>
X-CM-TRANSID:Ms8vCgC3P082GtNm7cA7AA--.11280S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUTF1vUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBtMZWbS+PA-ywAAs+

On Wed, Aug 14, 2024 at 07:14:51PM +0300, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
> 
> The ISP supports both CSI and parallel interfaces, where port 0
> corresponds to the former and port 1 corresponds to the latter. Since
> the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> receiver, set them both to port 1.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!

