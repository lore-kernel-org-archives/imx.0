Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDC2AD31
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725112758; cv=none; b=bol6+Wb85IgcqJNvDx9Xz+wCQh3+GTLBGDKWKZ2rdHLxgQxt/T4CQlAvuCb3229ZBtq+BblD1TK7UJ2KglYdXmo5WplF7vs2Hwud/1OHBSLqah2Ca5qn1rCi2QI/xANt4lQCFbWOirIRDYLcKaMSx9/2pdm07n3bRUBA2ttmuHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725112758; c=relaxed/simple;
	bh=olb2Yj319sDzyouQfaWxhscW/cDafKrdK0bsMwqI+SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJ1SGfVhu5wEL5XPdpXGODUrtUS1BTC0Mhmm8m7yyyWDkLHg0vSphji+MOhTfSmxVxDf+DLQ5ofOILI2pe4QnaEe9Z8fS4L00wuuPzwE90BPIE0NynzVCcTdqHEGCVV6ToZP24pMTLDToHwEVtKRvqgOe+1Kn+cJsMNp++UugaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=XapfVc8h; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="XapfVc8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rIBs47d/scBVqEy3z5/U1QghjEY+bs2wua1lZgASHyQ=;
	b=XapfVc8hIqZAzD95PT1c5wuygQx5O0/rHMu1pbatGHFcD7Y3tyi/aqTlyplJj3
	mwC6SC/hSoiD+oVUoTwaEK1907hX8upPIphdLXYty3RxhHYmurtiyFF8Pz38dqMx
	ZR+6WfdP025d4wVjlE6gGEhyaKsPDKHZ62cSsAzZuzDmM=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCX_jWRIdNm4fQ6AA--.16889S3;
	Sat, 31 Aug 2024 21:58:43 +0800 (CST)
Date: Sat, 31 Aug 2024 21:58:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 00/12] arm64: dts: imx: 3rd dtb warning clearn up
Message-ID: <ZtMhkedCstjfNJca@dragon>
References: <20240819-imx_warning-v2-0-4c428bd11160@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819-imx_warning-v2-0-4c428bd11160@nxp.com>
X-CM-TRANSID:Mc8vCgCX_jWRIdNm4fQ6AA--.16889S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFyUtFy5JFyUZry7Kr4rKrg_yoWftwc_uw
	13Wa1kWw4UJayfAw13A3Wjq348Wr15CryUWFy2g3WkXr4fta45Zas2v34rWr1UAF4a9r1D
	uF1UJw4vq3y3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0HxRDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQtMZWbS-GE9EQADs1

On Mon, Aug 19, 2024 at 01:01:09PM -0400, Frank Li wrote:
> Frank Li (12):
>       arm64: dts: imx8-ss-img: remove undocument slot for jpeg
>       arm64: dts: fsl-ls1043a: move "fsl,ls1043a-qdma" ahead "fsl,ls1021a-qdma"
>       arm64: dts: imx: rename gpio hog as <gpio name>-hog

Applied all except #3 which doesn't apply to imx/dt64 branch.

Shawn

>       arm64: dts: fsl-ls1012a-frdm: move clock-sc16is7xx under root node
>       arm64: dts: layerscape: rename mdio-mux-emi to mdio-mux@<addr>
>       arm64: dts: fsl-ls1028: add missed supply for wm8904
>       arm64: dts: imx8mm-venice-gw7902(3): add #address-cells for gsc@20
>       arm64: dts: fsl-lx2160a-tqmlx2160a: change "vcc" to "vdd" for hub*
>       arm64: dts: imx8mp-venice: add vddl and vana for sensor@10
>       arm64: dts: fsl-ls1088a-ten64: change to low case hex value
>       arm64: dts: s32v234: remove fallback compatible string arm,cortex-a9-gic
>       arm64: dts: imx8mm-beacon-kit: add DVDD-supply and DOVDD-supply

