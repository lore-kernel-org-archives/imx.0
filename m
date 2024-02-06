Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5895F487AB
	for <imx@lists.linux.dev>; Tue,  6 Feb 2024 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707216381; cv=none; b=Pj7Hy2ltbbwlJXqEu0s8RZ1rty4nvnTRDzpCT7YD7i9h8zs8THYx+WveP7z6vS7+2zQ/RMWynGRwuFVluG/JxqcA2Vuu/yqJng4j00UO1T8w53gwfoDcBtjUXT26pnos5tJO6Z4lC/XPs9S7ViE06H/COhBqBgieEOtVU1Ud+lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707216381; c=relaxed/simple;
	bh=d+oLW2HRq2Jlm4/vbLTLrkdBUeoGpsDVMVFmfsl3Cyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDGPzEbcH2LWs+eDiyiPYQBNHNDsVLc/Doxjny10GULRuIRVbBqBM47EZpk/k0qvfcFkhMPGPyonr+e/Ew3aow/JWPnTM2uvn1iVMHkfZR7qCN/xGQeJjqAV+TOBKApJCKLeLSD0u0rjiMF176LAL7+zaRkPm34SqhXveatVRGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=k9AYslhg; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="k9AYslhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=upVIgeeDvCGMQGNmqWW5A7mPp1moe3Q63ckC7AaU3Hs=;
	b=k9AYslhgZacAHbADer8Ynlf1o5/o5g+PUMt0499fCj+kOU/edMj7qdlgrPmVmm
	ZC29zRdQ26MjR2NXcw5OTvlJMN1ZpHFs56KUVPuGQZWSenWF83sCcmsWJna6SPLZ
	0oKhUrSCaCTx5mZdk+b8RseqmbYF7w25/5g7rhe6t395g=
Received: from dragon (unknown [183.213.196.254])
	by smtp1 (Coremail) with SMTP id ClUQrAB33xPgDcJlwZr+Ag--.16143S3;
	Tue, 06 Feb 2024 18:45:53 +0800 (CST)
Date: Tue, 6 Feb 2024 18:45:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/3] arm64: dts: imx8dxl: update flexcan[1-3]
 interrupt number
Message-ID: <ZcIN4EWS+t3hR9Xq@dragon>
References: <20240130152547.272125-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130152547.272125-1-Frank.Li@nxp.com>
X-CM-TRANSID:ClUQrAB33xPgDcJlwZr+Ag--.16143S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVy8BUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFQJ8ZV6Nm3UVkQAAs3

On Tue, Jan 30, 2024 at 10:25:45AM -0500, Frank Li wrote:
> Update interrupt number of flexcan[1-3].
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

