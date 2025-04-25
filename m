Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A5E2701AE
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 03:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745550856; cv=none; b=NhuTTOuLANuvpIBhR6v8XJ9y1hPTvTqrukS3Hia68W6zO5JqDuXoYh+dKGIKLdHTIkHJcRRN2ZN+kan64ScXDsngtRPwYhFap9ef2cde6nnre/8Os3c1dXN8YoPIoZ1KrsiS85rGAFkml80J7LVW54JhJtJvACN0y/Did2axcKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745550856; c=relaxed/simple;
	bh=9xzEWc7rbuzjVsxgwE/wIoKdmmySG3tWSDW4PCBvxPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XD7AaS2eTqQ3a1uY3JtXCTcIU98fXRp1DRFem4/O+2ijrN9df3RnpvRJ11EzsqE92T4kohJ2YjkQiuetLzN2khxy8vCLoK6ldTv0YgUPyxglPSHpIoW6yOyzKV+4g6TcTOP/mxpHqHpFURygLbyGBiVjJKGJZTl8G9bsGgstbGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SKRlq7iI; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SKRlq7iI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Ns+L0aOm8q4XI8tdY0zbGpGXoWoyJjIZ1B6rDiXbX30=;
	b=SKRlq7iImJSm8WSOqSFewc3xuRNOOHQvEfFqd5/qWhssemJdgOYpsRvR8vgppJ
	Lcod9RJv/UYLydErZV9zePUAfDLqC37XxNuhpNq8mMC1IIQ4U5jLTplbf1PDkd2v
	D0azbviE8xSXZxe75QPU3OA1y5Qsf4FrBWyaUSVbx8tvI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3zEXr_QpoCyPbAw--.5525S3;
	Fri, 25 Apr 2025 11:13:48 +0800 (CST)
Date: Fri, 25 Apr 2025 11:13:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hongxing.zhu@nxp.com
Subject: Re: [PATCH v2 0/8] arm64: dts: imx8: create common imx-pcie[0,1]-ep
 overlay file
Message-ID: <aAr96tBdflbAyKSb@dragon>
References: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
X-CM-TRANSID:Mc8vCgD3zEXr_QpoCyPbAw--.5525S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5Kr4fuF1rXFy7Xry7try3twb_yoWxGFg_Cr
	45Wa1kJ347Jw4fJ345A3ZxuFy2g345Z3y5Wry8Xwsa93WfZFWYvr4kJr1rW3WUCF13Xw4D
	CFn8Xw1xXw4rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08cTPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARs6ZWgK0Y3JqQAAsb

On Wed, Apr 23, 2025 at 08:41:22PM -0400, Frank Li wrote:
> Frank Li (8):
>       arm64: dts: imx8: create unified pcie0 and pcie0_ep label for all chips
>       arm64: dts: imx8dxl-ss-hsio: correct irq number for imx8dxl
>       arm64: dts: imx8dxl-evk: Add pcie0-ep node and use unified pcie0 label
>       arm64: dts: imx8: use common imx-pcie0-ep.dtso to enable PCI ep function
>       arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files
>       arm64: dts: imx8mm-evk: add pcie0-ep node and apply pcie0-ep overlay file
>       arm64: dts: imx8mq: add pcie0-ep node
>       arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes

Applied all, thanks!

