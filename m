Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE512566
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 02:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717382454; cv=none; b=pYQl5s8v1973aptxWTwA+e0d8+7JucUS7reT3Vq6qO0FbwqMAmfVTtoTUpa69cIkwi8b/VY8fHGBbNzK8c8ZBFOJogHlUc1IWFhccUQagjKRqEbL0x0Ex/ynOUGphjjvON0GrFNzM744bMGXXfYQ7WxoWTrmZUXsXWku35mlr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717382454; c=relaxed/simple;
	bh=f/LNo8wZ1TxjZ6NHh1Ki8vmUnMpxjFitkOVr7lruCUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItxBVj0188zpuFKhImuFAiYGwvpzmIDn6tGSCMlgoWcnNwpS6PIKTlaCFbePvIsBuarvUBnOxK5Zl8Y/BZ+Q8q2UUknPJ8hhfReJELBw1glOaDKFucJO426wEN1iiIjPIGQc/duUMfybpMMiblAknA4o+GGD3bJydn/Lo49Zb7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=YkomyI/n; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="YkomyI/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=HQ5RWTQSwYYSKe8sFZkPkiko6uKlUYaB9AsbqDpjXYM=;
	b=YkomyI/nMAH6avSV5SU/KY8r3qJ2N0C1lM8TcoQGfdwQcOo8sB+Qvq2EoU8/I2
	A/KYvItF6btX84Wd7j5e2gHu0jzi8a+oVhk2SYSLPyZIcC6Uva7mySFRbPP19Pfs
	1l8pC0r/vDNv/feIOWip2DfqIQJQWcRHXBC2cMSLUvGfs=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrACH7xgULV1mDyXtBw--.58598S3;
	Mon, 03 Jun 2024 10:40:22 +0800 (CST)
Date: Mon, 3 Jun 2024 10:40:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Gmeiner <cgmeiner@igalia.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8qm: Add GPU nodes
Message-ID: <Zl0tFA0vUoDBxLbN@dragon>
References: <20240503212249.3102288-1-christian.gmeiner@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503212249.3102288-1-christian.gmeiner@gmail.com>
X-CM-TRANSID:C1UQrACH7xgULV1mDyXtBw--.58598S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3oGQUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDRbyZVszXjZcnQAAsN

On Fri, May 03, 2024 at 11:22:48PM +0200, Christian Gmeiner wrote:
> From: Christian Gmeiner <cgmeiner@igalia.com>
> 
> Add the DT node for the GPU core found on the i.MX8QM.
> 
> etnaviv-gpu 53100000.gpu: model: GC7000, revision: 6009
> [drm] Initialized etnaviv 1.4.0 20151214 for etnaviv on minor 0
> 
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>

Applied, thanks!

