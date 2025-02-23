Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12AF1FC7D0
	for <imx@lists.linux.dev>; Sun, 23 Feb 2025 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740297515; cv=none; b=GVw7LUGDrk/qmgeYJjRHcIMG+KP9rCVAxMCzRbxUkHqicK0qj7EPi5Jou/EF8xNk1GKz/Wci2V1HHEX7Dc60qaEGcRtrDwiAlP7KcxP14GirWDDutlsRJprzpboryl/kLC5MRTuemUG2RrJtKb4TAgrf2vh+n6Q9CpyANjXUjGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740297515; c=relaxed/simple;
	bh=Oz3P9N3xl5usKcUKWWwm/yarUuwrPLqlOqj5lKlurM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIIy+0fdVtDYQLUJj2y77IEnbRMj6l1F7/ZTod94pYK2ejFUESF6a2RpTn8C1K7OTnJhOnxbpI6s/eX9UcIV4V4wLl/0cD5LHtwEg2ZHG4wU1b0mfB0OCsOLHJEXxSMYe7eb8gjhLsHO6SQl4VgyhvS4sOdspoAOTux1oGDgrYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VeBopwtz; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VeBopwtz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zf7C3JIfy4ywsPNZ0w+h08cIa2jemMKNKRi45EogFjg=;
	b=VeBopwtzBAgZy9FqVI+FAMxjeG5ieI31VYLCgb2v/zrFjuYWIIvqlauDw9+YCF
	yZEp9wPhsQtTJPHloc2sWQGyxf7AnGbYJiDwMk/v9z45cU5QyDQNM8oRE/sgj5pb
	FEA7LhpSk+mWbYxEbpiEOpzynHr7sJEepifNpCHXX9/Xo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBXXvcK1bpnD5KfCQ--.23112S3;
	Sun, 23 Feb 2025 15:58:04 +0800 (CST)
Date: Sun, 23 Feb 2025 15:58:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: Remove LVDS
 panel and backlight
Message-ID: <Z7rVCnypQW1wpyAW@dragon>
References: <20250214092634.12414-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214092634.12414-1-francesco@dolcini.it>
X-CM-TRANSID:Mc8vCgBXXvcK1bpnD5KfCQ--.23112S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsku4UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhD8ZWe6kuHc6AAAsB

On Fri, Feb 14, 2025 at 10:26:34AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Remove LVDS panel and backlight nodes from the Verdin iMX8M Mini SoM
> dtsi file, those two hardware components are not part of the SoM,
> therefore they should not be present in this file.
> 
> This is solving a dtb checker warning about panel-lvds compatible.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Applied, thanks!

