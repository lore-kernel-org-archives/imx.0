Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7C94690
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 01:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745286523; cv=none; b=YqN/0BLj9lEK3X6BwT7XRWr07OfvVIRmE02tH9WWs4deaOmUtl9v0WW9KHZ5jMuhX0UGgupzoXRLE5Kz17923l7F/tJTSinPW4rApgQ9qOZxnV6teVzL7p1bzPJOV2+tMTb+kvXiIqjpzuwwikLl3PVcsnLIIlbVf4j/wgxXR7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745286523; c=relaxed/simple;
	bh=kGFnUpUTsJMisKdKVeE9j+sNCS0a1HmuE29YmJa3HAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ew2A6kXwwy/6JNX/9sTpNm2H4Nzb0u6hKezZm2/p3wSfo2PJAhtwHEkbIVpPbS0sTX+K5StXL9EAF1metB1Wx6u6l9a4uJhTHjpDoRJ54RpNkpgbkL/Qcoff9ObE2pF4K+OBIcA0kquipSs7YFz6698n0lEHI2UHUNSuQ5ncieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=RKukL9Iz; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="RKukL9Iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RRd/Mv2IK7FoRUzYMao2nZ0bIVcFKFyPzLBcuxvr7as=;
	b=RKukL9IzXolSfcWHT/VQNZX015mSZ/RCEj3z9FuKbM9pvStmSTiHp2VHmSMMDW
	NBL1zvflI5/YchYfQ0JmCG1P997+lf8Ys5YzjccWS0Bkg/7XtLw0CiZaC/k/Ladi
	szDdIskegADB/l71A4fbymWtrtXR/asSeh5R78DG4CjEQ=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnptJK9QZoN72iAw--.10140S3;
	Tue, 22 Apr 2025 09:47:56 +0800 (CST)
Date: Tue, 22 Apr 2025 09:47:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
	s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mq: Add linux,pci-domain into
 pcie-ep node
Message-ID: <aAb1SlxBsADlglrh@dragon>
References: <20250226024256.1678103-1-hongxing.zhu@nxp.com>
 <20250226024256.1678103-2-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024256.1678103-2-hongxing.zhu@nxp.com>
X-CM-TRANSID:M88vCgDnptJK9QZoN72iAw--.10140S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVf-BDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRI3ZWgGsHT8JwABs5

On Wed, Feb 26, 2025 at 10:42:55AM +0800, Richard Zhu wrote:
> Add linux,pci-domain into pcie-ep node of i.MX8MQ.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Applied, thanks!

