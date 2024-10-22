Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255798F66
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 01:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729560743; cv=none; b=Fj8+r+PwGKYAV8Tk6VpLzlE6lrifvzT0SqibFANqXAC9nb/U32YkHr/k3hET2nQ96EFjHtyy+BlGdBzRZC68jxTXT2RJ7VPrPGYUuL2UpftfoJeii27pIpI73DyS4AB2v0y1nDzQ2Wi4ZHpsghMTADINGBFjYgIifeqb/LNTscU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729560743; c=relaxed/simple;
	bh=OMkw5dnxET0m6i1oeX8vKcSmAhjj/0kZ0bp/cpjgfkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9N3SZ03JYGHwP9CfIMjj85E6rxMaCc/usHcP+My+ok0UA6gvb8rkaBxdEpz7g6++6G9Y/BA672wpwyj8usmWhZgYQzs2XUTydJng7nXZKC8cqrB6NGYBa86UJe527rGQyNYlRnapzOQCvkoR54NDcY94tE0oVAn8WKKVxugZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AsTDbaKW; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AsTDbaKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=1X8kVmEbMFJxApTAaGolOIOVn5C/D1ylt7AqE6Lsdlk=;
	b=AsTDbaKWt9TrwbvX6xHRv2hgIP77UgHetYAxOpxHPYXOi1Vnrlh+bnN46ILpGN
	XGttILnw8fWb7UjO8no3O7euz2AbOYLf5FRg6MEzgDJb3vWGs99P18AljhSlJXUU
	+79fsH0clARBfGpPUjbImRRrnT1u+n6a7KQXnjJM9VyyM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDH5tWNABdncyiVAA--.5247S3;
	Tue, 22 Oct 2024 09:31:59 +0800 (CST)
Date: Tue, 22 Oct 2024 09:31:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 0/7] arm64: dts: imx95: add various nodes
Message-ID: <ZxcAjXzQjsmtcwDa@dragon>
References: <20241012-imx95-dts-new-v3-0-edfab0054c71@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012-imx95-dts-new-v3-0-edfab0054c71@nxp.com>
X-CM-TRANSID:Ms8vCgDH5tWNABdncyiVAA--.5247S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4IJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgeAZWcW3kZSbQABs3

On Sat, Oct 12, 2024 at 07:19:07PM +0800, Peng Fan (OSS) wrote:
> Peng Fan (7):
>       arm64: dts: imx95: set max-rx-timeout-ms
>       arm64: dts: imx95: add bbm/misc/syspower scmi nodes
>       arm64: dts: imx95: update a55 thermal trip points
>       arm64: dts: imx95: add anamix temperature thermal zone and cooling node
>       arm64: dts: imx95: enable A55 cpuidle
>       arm64: dts: imx95-19x19-evk: add nxp,ctrl-ids property
>       arm64: dts: imx95-19x19-evk: add lpi2c[5,6] and sub-nodes

Applied all, thanks!

