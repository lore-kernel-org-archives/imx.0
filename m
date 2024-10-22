Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3150D131BDD
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 03:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729568191; cv=none; b=U6tozpwQNewz4J/EXXQiHUkWKbc0mvl6ENQjvf6JHqwxxW20/y/tViwbjA1VkgUedeXYaxmpLrG1enFGWpp/+ekVKURq7nOxCq34Ij+4rde5de20ziVBK59rzP14A35fI6Ony9mvec9OnJfp9d10JdqHcEEIHDTedhOt+cYaPsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729568191; c=relaxed/simple;
	bh=aDWM3Tsm/QnlSB4T1eEAl53wu1sl3BOYUKQW+rM+Dho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVOAJPIDlpyhzpey68k3N5DnnYvsJZFzHIOMDQ5zlwxu3ePK4UQ5V5dkodBpQHigVFcgtcPYeQsheZxiWmZyoZtB0i91SNLNEV1klwobbPzdY4BZzJ0x5Pj7grZR6DN/qiAPTk6knBqQtBVd7/9qPDLux6BoMwu7oTUJdc3bkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=iyaj3Soq; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="iyaj3Soq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=thn0AY0PIXWYmip1+zVuTvIXO66qKJV0eJxybGA31Cg=;
	b=iyaj3Soqwf93MEBn23OahSPitJyKJkrUWibScwUsGhCEpph17cJ0PmkAMylhuv
	k9ASoVrcwuhXTxceoF0Xv1rPEh5YNsbROyeW8G572iQ6ZlqJCghmpesoLBEKM36s
	jh1+7ewO2ncUZdlHMlRU36cjPjdMkPczHAMwByUAt2Bso=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnb9erHRdnk9aUAA--.5381S3;
	Tue, 22 Oct 2024 11:36:13 +0800 (CST)
Date: Tue, 22 Oct 2024 11:36:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v3 1/4] arm64: dts: imx8-ss-hsio: Add PCIe and SATA
 support
Message-ID: <Zxcdq6HN8n7Ri8xv@dragon>
References: <20241021190602.1056492-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021190602.1056492-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgBnb9erHRdnk9aUAA--.5381S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVOzVUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQqAZWcXARRp3wAAst

On Mon, Oct 21, 2024 at 03:05:59PM -0400, Frank Li wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Add PCIe support for i.MX8QXP, i.MX8QM and i.MX8DXL.
> Add SATA support for i.MX8QM, which is in hsio subsystem and is shared with
> PCIe PHY.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

