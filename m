Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A187558B7
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723534065; cv=none; b=U/DKeacDIjPHl7TZPR2cwmgCHRFquKAm64WUth0VNxg+4Mrusy8SzMViTxilywAAAwHqmkF+fLg1euSlxdrVoXH+Psedml6BnT/TfBwpjVB3NxFZmONIO9/FMd8G1F4yk97uHtmJ8OfHKtgxYVgGaWQq64mLx0uowRo6YSbk1yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723534065; c=relaxed/simple;
	bh=jOyfnNttF+JbOHF1VZDwVIR/LVCxD9x1nxj4aGHIibQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1NLqBSKua5W8wehwj0qnGsFu/E25vbWGiKroPRk4NfBTGvJXBdX2oZ42F88UXl9i0Qkg2huQRX4KOFErEVvkwPl6U7LPpnI88sd7JEAA8J385kZIRcHbvSbV6eMPv8vnUi6OHK6a0s77P1Oa90yeBO8FPzcTYqPqvE69/s1Uu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=D7jHVW/f; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="D7jHVW/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QwCyesgedQKYteFTZ+O3vBV5d0QLs46WyGTgF5Wdcdg=;
	b=D7jHVW/fyz4l9DKHkQRvCBYWtE0V+ZwIiQmS2FgQ7264CgaloDE47EB4TyAoza
	H/Vfg5sEM8GTEqWrA0jjTf9v1ge8g4/PAjz28Y1kmPSrNvvkl48yRj2qrzGcWAhO
	bOTqWRpKn7Hz09bEB7FEYkmK0wu4uTYZN0i6szhNUgs+s=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3vyDYCrtm_RFVAg--.43140S3;
	Tue, 13 Aug 2024 15:27:21 +0800 (CST)
Date: Tue, 13 Aug 2024 15:27:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 00/10] arm64: dts: layerscape: collect all fix warning
 patches
Message-ID: <ZrsK2G+sjWLLYTew@dragon>
References: <20240729-ls_warning_all-v2-0-942d80ddd441@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-ls_warning_all-v2-0-942d80ddd441@nxp.com>
X-CM-TRANSID:Mc8vCgC3vyDYCrtm_RFVAg--.43140S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWftrW3Jr13Wr43tw45GFg_yoWxKwc_uw
	43Grn7WrsrXa95ArW3Ca1jqF9Yg3W0yryDJFyfK3Z7Jr1ftF13A3sIv34rWr4Y9anxuryD
	AF15Crs2qwn5ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU03xhJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBI6ZWa6wsf+XQAAsz

On Mon, Jul 29, 2024 at 02:59:22PM -0400, Frank Li wrote:
> Frank Li (10):
>       arm64: dts: layerscape: rename aux-bus to bus
>       arm64: dts: layerscape: rename rcpm as wakeup-control from power-control
>       arm64: dts: layerscape: use common pcs-handle property
>       arm64: dts: fsl-ls1043a: change uqe to uqe-bus and remove #address-cells
>       arm64: dts: fsl-ls1028a: add fsl,ls1028-reset for syscon
>       arm64: dts: layerscape: add msi-cell = <1> for gic its
>       arm64: dts: layerscape: remove big-endian for mmc nodes
>       arm64: dts: fsl-ls1046a: remove big-endian at memory-controller
>       arm64: dts: layerscape: remove undocumented fsl,ls-pcie-ep
>       arm64: dts: fsl,ls2085a: remove fsl,ls2085a-pcie

Applied all, thanks!

