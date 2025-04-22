Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1761F7569
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289370; cv=none; b=SBvnFhUCh+D9J/KYSIsAEy/aMNCBjsgx/deP9V7bmWFK/BNI6w6IvrStB+XCpbglOLbh3IRKpVHVpQUvdLYuB4umWAFIibiVIBsWZ4TH3I5EUcxZNzEaref+pcUykxcLcqf4HSYKFKa8/uQJPGb9Dxop3SA43xySiKmBdjwy4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289370; c=relaxed/simple;
	bh=sy8nvk+QMiViOJVzrlQUtLzfbrfwKTxt9ooWUhfWmjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9lpHL0mgQtl663mAvdNgCQz447J8wvD6uqy3nBwM7Y4A3n2XQV5d9n6o9oPBbUDWZMnRZP7U9ccPz24LOnEM8TuUV/q8iQRqfCVS6/GhJm6bKOGeHFvp602W6CEHIoukdeQbFuqx/3vHCZ/br8iu9uGY44TPIAYT0f+UYHIL7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hLFzrcJG; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hLFzrcJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ogTeyXmoSTch7ya0UA4kCFgEAyEUHB4VR6ZsyBwApbw=;
	b=hLFzrcJG/rzJJsH0xEpswY7/MqSL5zPrsEGhsBPRw6X8KrUza5SLenNi3OQONt
	wUz55311x2ssR7OUqYuXd6zqCeDYUVXxMV+ApH8Vj836JSGvwilbIE6nABYZZGam
	D5ub2n8RZ0oU01NYuedeJZaHCMK45YzVLU9DwuRvAn+gc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnT_qBAAdoUeSqAw--.61882S3;
	Tue, 22 Apr 2025 10:35:46 +0800 (CST)
Date: Tue, 22 Apr 2025 10:35:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx95: Correct the range of PCIe app-reg
 region
Message-ID: <aAcAgIwdlCGIRzcB@dragon>
References: <20250314060104.390065-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314060104.390065-1-hongxing.zhu@nxp.com>
X-CM-TRANSID:Mc8vCgCnT_qBAAdoUeSqAw--.61882S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa0tCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERs3ZWgG8sFBngAAsa

On Fri, Mar 14, 2025 at 02:01:04PM +0800, Richard Zhu wrote:
> Correct the range of PCIe app-reg region from 0x2000 to 0x4000 refer to
> SerDes_SS memory map of i.MX95 Rerference Manual.
> 
> Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Applied, thanks!

