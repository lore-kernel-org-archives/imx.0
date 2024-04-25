Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3403FBB7
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 06:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714026310; cv=none; b=IZdp5v9konrt6RjlWsr/vt3cbt49j2TdG8j+fBiDMR8cM41c3v6UyWZiUzUIK6jfURZOQhoa0r6FNcqEe84gwCIBiX3tEv2E9O1+zNMmwYnfQAZgt8E0C0s6XUgPvhTZpglXm4RB3xrikYeVeNMPQArObmfG5JTz1EKNIbuZqcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714026310; c=relaxed/simple;
	bh=+KdhJr1P8PvWkYwBV2ck5l3jTNNmFw8B+PBQUUA4d1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjObErEpdTFHDa+t0p9zK0OMCCT0OiJtkRP3IIQNjn7gFOJ4olQ1X23oVPlN9gnb0Q+jQb4QSJafzH9m3acJ3jiOfwPlzXxBIqAiWjALnql/b75UVCvLBdmMBOZW1L/pwPrhBDXBRN5RESwwDrZsGk28S/eMHEWaEgxCNJSMSEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=K1ITDqaB; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="K1ITDqaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+vDVzeVrZ2eMn1LXWqDrH0dDuL+sbBGXy1PppvgvXxY=;
	b=K1ITDqaBC4/NO4bw+s3/dWcKofyc64dDUTeXP2mJRM+Fo44nR9W8HOiZtrNn+s
	6K+XHZcfs6WR7neUlZlVfTvbl2lwBRGXP/oI0gf+uXIN++U1bRcATlT87S++b0s4
	xknkuCTN0rcaZKAgHAZEMCCvFrVBftfiTZdfoBAjrJ924=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrAA3n_sd9ylm0zdsAw--.40856S3;
	Thu, 25 Apr 2024 14:24:30 +0800 (CST)
Date: Thu, 25 Apr 2024 14:24:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Peng Fan <peng.fan@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Align both CSI2 pixel clock
Message-ID: <Zin3HAKVtKsTc9li@dragon>
References: <20240417114231.7044-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417114231.7044-1-marex@denx.de>
X-CM-TRANSID:ClUQrAA3n_sd9ylm0zdsAw--.40856S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2EfOUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDR7LZVszXcHRqQAAsx

On Wed, Apr 17, 2024 at 01:42:06PM +0200, Marek Vasut wrote:
> Configure both CSI2 clock-frequency and assigned-clock-rates
> the same way. There does not seem to be any reason for keeping
> the two CSI2 pixel clock set to different frequencies.
> 
> This also reduces first CSI2 clock from overdrive mode
> frequency which is 500 MHz down below the regular mode
> frequency of 400 MHz.
> 
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

