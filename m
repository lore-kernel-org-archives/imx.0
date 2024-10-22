Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AA514D2A0
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729582856; cv=none; b=FVy17WFrg7ebrQ4YoTloofsx8iXVxwjKcnII3BeIonqyHGn63VNKMZPECBwnTUtW50RA0zit5VMs0XPZv15i668Hos16oyegN/uc6rlxvSiudvty1kttVtIVJ2wXKriO/a+kqRrGlM2wHv7MZ6ygxy4fe0euGRlhw+0INdhqKPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729582856; c=relaxed/simple;
	bh=JY1gQe2qU5WzF3U30yMucXyRWlD4ph5p3fQk0wzpWzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsbDfwuqRYZ+4BfkHMHRFecdmroOI7CKraT1hcWSiOzwXjXpJIrhHOAopPNMVO6f9cznuA2gfVBB5063aDr+MdPFKgrdOFra0GnzCrz1rFOi+rL1Pme82rAxV6ZF8hMjbLaoHiPFVTeZuPRtbGhapKcnBCfbZ434j38N+wg+Vrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SA3kOMqn; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SA3kOMqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ujdnPlLm1QpvvQSMXgl2euqF7OZl5+ZMrRT1eVvKES0=;
	b=SA3kOMqnA4rc3ZgL6I8o+qMYsmySax+YWJmCgf3Or32WVRQF5/bKCl/Mm8/lTU
	fNvDXIcRCK+1Nqje9HbGH2ohCkWakgIw3B/zozdtBFaTsEI46BuT8CA0qU4ymEHp
	OcATretRJm2+pSQSl+sXideGM9rOkSW7NauEcbNMUOGyM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnvHjqVhdnKL2aAA--.5517S3;
	Tue, 22 Oct 2024 15:40:28 +0800 (CST)
Date: Tue, 22 Oct 2024 15:40:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: imx8qxp-mek: add bluetooth audio codec
Message-ID: <ZxdW6stftIQd4WDP@dragon>
References: <20241021163437.1007507-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021163437.1007507-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgDnvHjqVhdnKL2aAA--.5517S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaeHqUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBqAZWcXEdrRoQAAsw

On Mon, Oct 21, 2024 at 12:34:32PM -0400, Frank Li wrote:
> Add bluetooth audio codec.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

