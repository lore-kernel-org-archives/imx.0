Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD9E1586FE
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730453212; cv=none; b=OCOb3twHf9ho3XbBKGs2xnSezLnDVXjhNnqbR67qmgfFb+8Wq/RraTF9o8eeCOR8EEdOqTa9XzRUQvadfYZ/N47CtyHjjY6XvXsimvRxQIxl5LExWpBqtEUfxOQ8D9MmXhrIqByrHOmZPh0QiM+0s/esAI3mPRUzZztHuv1QDXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730453212; c=relaxed/simple;
	bh=xVGTDR81S5oI6LQ8b63VxeN1Pb/IAxdK+PQ+RABmHuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+LVWH0w5JipdefXoqdxmgN45h1GXjuAeW26DnzJfRfSe73NmgAdxwrRar7jB26uetj8dCznUouQ7QWdDXLPjf5wAp1srNWoEMNUwueRoMNRTod4jph8KlGSVSJaBT6ErwASFQ/XAen4xrRq612dBHNwg6CVBBlgbPbsmMME+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ZhcAsuWK; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ZhcAsuWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UJfVlkISB8Y0Nj6NK+4jzx1o7Knv8GKqMIobgZ5NNIQ=;
	b=ZhcAsuWKA6FfQJOMViqHZ2fL/p4u9bmQkMbppds0z/gZEFCONRwhHAHT81bJ4h
	tgBwI82/G9xDRMU70X0YzrfRLWtKBc2WI+QLfzbSELV7RFAv2wBc1rLHc25LH2Th
	pmJ6N8CBiucFC+RUp/OiIMn1mUil21YCU3qzTwUR1nfEc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHrruSniRn7n1gAQ--.13488S3;
	Fri, 01 Nov 2024 17:25:40 +0800 (CST)
Date: Fri, 1 Nov 2024 17:25:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/6] configure imx8 dsp DT node for rproc usage
Message-ID: <ZySekZeAgD/GEh2Q@dragon>
References: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:M88vCgDHrruSniRn7n1gAQ--.13488S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUV73kDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgyKZWckdPt-HAAAse

On Mon, Oct 21, 2024 at 11:52:15AM -0400, Laurentiu Mihalcea wrote:
> Laurentiu Mihalcea (6):
>   dt-bindings: dsp: fsl,dsp: fix power domain count
>   arm64: dts: imx8-ss-audio: configure dsp node for rproc usage
>   arm64: dts: imx8qxp-mek: add dsp rproc-related mem regions
>   arm64: dts: imx8qm: drop dsp node from audio_subsys bus
>   arm64: dts: imx8qm: add node for VPU dsp
>   arm64: dts: imx8qm-mek: enable dsp node for rproc usage

Applied all, thanks!

