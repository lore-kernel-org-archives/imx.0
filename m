Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC49770E4
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729580103; cv=none; b=fdv8YvX5jfXuFRAb7XdBj71jjV2PYiIp9fUyRNmUtqZoFNZ+PjDkFtNdASWtiqZLUhzvFuLIDRooFOllI8TlRm6cGeQVv1x4j9iVPr+6/xqybrQX6DzTKIMPIS6qHsnlZ2dWJIfaq+FV2654X6J9+0NLFiOYAxPtVASfmksiq+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729580103; c=relaxed/simple;
	bh=ZjJ0Wt+Xa8mdkho0L0ET8P20sj6XnC50OAY4+l6RbdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SW+lCr1hrrUDoGwigV50VdsxpI6QZ9sp/rc68Ch0yNagQT/MMP4OKb3yy0gU6smUWXlrfIlj5G6+QAnib+g+zKh57IHVcjqG0h879AxOgACSmvq2EZWmCslEaQsiG6sZPcuspNVm8sMpeCFst0ERyp8/dLMHQFOs4yCeXh+Y2As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IYmD2TNR; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IYmD2TNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/vhDuQYV5YlG5L+yjAZnN1ic7CiXa7VdGmu2Q0f6FIw=;
	b=IYmD2TNR1wsqfGawVh70PfnIw+hNoJoHeYNvmz9yWqu5fFv5LmT2IpLLFz4ZP/
	GQjy8n3MgJJpKMe8EVeGahTH0FhMEwTP1aRi3fp6Rt3Rg/hJhyPj95sC7mVdnm7g
	XmVCCn/cMx+6VVR84Nst+UeQFAa4d77qKCM5OgSuUKhfo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnpczwSxdnar+XAA--.5492S3;
	Tue, 22 Oct 2024 14:53:38 +0800 (CST)
Date: Tue, 22 Oct 2024 14:53:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: imx8m*-venice-gw75xx: add Accelerometer
 device
Message-ID: <ZxdL8PxrmT3X+aTV@dragon>
References: <20241018173608.810073-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018173608.810073-1-tharvey@gateworks.com>
X-CM-TRANSID:Mc8vCgAnpczwSxdnar+XAA--.5492S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsPfHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQqAZWcXFF+d1QABsU

On Fri, Oct 18, 2024 at 10:36:08AM -0700, Tim Harvey wrote:
> The GW75xx has a LIS2DE12TR 3-axis accelerometer on the I2C bus with an
> interrupt pin. Add it to the device-tree.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!

