Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB2296BA2
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 01:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762912726; cv=none; b=eb8GYFJhLjUkpF/EPxN510gk2ZERYQZowkv3sE24+IsPcpjYEgU0FSTCXROBLncAm7uHJBGI5hzI7C6o6O8gw0vVjrlz/rcWvFhgxNk8iR5Ebn3bDmFJGGGPPH8ehuBduW/eqpxG2grwTgsE/Yz0hv4ckeKeHbZmNWkxYKcZZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762912726; c=relaxed/simple;
	bh=APAKyQvFVIBcKOgb0uEOcq1Ddyo8JI5mya0p3PDa9LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tR+EpCc+brpcDHwZMxylfmw8WMuL8wrquQkpsA0eqQBxCaepuuCLBAo6Jwpe7Rnv7tdLEAM4HCKFerUhkleQoJUw3cj8Gg+KuJ4qvgb6+pmlI72peef5rlaT2+1EZ2y13hZQ++QSpI/aGkq89MdDsyzaTD4cjslsrgbiAEoGluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HLILyDSY; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HLILyDSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=APAKyQvFVIBcKOgb0uEOcq1Ddyo8JI5mya0p3PDa9LQ=;
	b=HLILyDSYnDXEUpkIEhUHcKPLevgW3I2zFhuK/HL7Op8/kgiF1TT70cO9sH9gJ8
	P4lmLuTlJrjVrgOthd7OJo8MYTLp/XCKjpUOBxGUV/2/k2yB2VV6CKUHbKopoM2x
	XYuRz4WJ34IO4oXGvWtuL3aHMASNXoZiM5nwMgXPHyVec=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnLZPA6RNpuzvPAQ--.5587S3;
	Wed, 12 Nov 2025 09:58:25 +0800 (CST)
Date: Wed, 12 Nov 2025 09:58:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/7] Add vpcie3v3aux regulator for i.MX PCIe M.2
 connector
Message-ID: <aRPpvy2TtCyCCegm@dragon>
References: <20251024073152.902735-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024073152.902735-1-hongxing.zhu@nxp.com>
X-CM-TRANSID:M88vCgAnLZPA6RNpuzvPAQ--.5587S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0EfOUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNgLJL2kT6cJyogAA3T

On Fri, Oct 24, 2025 at 03:31:45PM +0800, Richard Zhu wrote:
> [PATCH v1 1/7] arm64: dts: imx8dxl-evk: Add vpcie3v3aux regulator for
> [PATCH v1 2/7] arm64: dts: imx8mp-evk: Add vpcie3v3aux regulator for
> [PATCH v1 3/7] arm64: dts: imx8mq-evk: Add vpcie3v3aux regulator for
> [PATCH v1 4/7] arm64: dts: imx8qm-mek: Add vpcie3v3aux regulator for
> [PATCH v1 5/7] arm64: dts: imx8qxp-mek: Add vpcie3v3aux regulator for
> [PATCH v1 6/7] arm64: dts: imx95-15x15-evk: Add vpcie3v3aux regulator
> [PATCH v1 7/7] arm64: dts: imx95-19x19-evk: Add vpcie3v3aux regulator

Applied all, thanks!

