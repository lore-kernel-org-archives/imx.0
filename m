Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F17D286405
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854375; cv=none; b=rMT5SDYivETPx5MW54gZWFj9MGKqerXTVKNMaTr4CWW5IkegKlQJoY+Mj5Q2p6dJ4MNLIReM09MtecSMRdUrzn9Vs44a64UmpBxqZZGlWL+p5N3uC/OoqFkN0p4uetsZpjtwLiMrXmol8pkV8gWduHyo8/Qa3Ciw9DLnYXBuPNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854375; c=relaxed/simple;
	bh=gMccoOqcIUBKSBLqPcgd0stFtkhKyCFnWwb2JBVtDxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZicD6GcKA99rlIwG9zCS5BtfsNibuuaF0F7meCBMZwiqM+NHywhBn5eCMfvPx5AOI1fRXAFNHxCYGxn4uBgqXj1evYc3B+lDElYReGS6NTrDLGSa5LpQflmvzhMZqsFQBHEvPhI0Eqfibe27xR/ymub0gWS5UUdMQCA3lQpLi34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=QYvFhkIS; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="QYvFhkIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vk1f6oss+mpwghmtXVYnMqfDZeMdCeY2Y/KyyI4LKrw=;
	b=QYvFhkISzKsktKgmLfHux2upH5Ylju7UuDJ5EQEadelatUYe8cEyNZARt4zqYV
	/PazBnHohbrnibgXyX6Ip3lJXJ+S6Ab09o+Yw8mSf42gekq01VhNwCqae0RrqR5f
	bendSOVvEkF8PMIM6UFV2GOGtV9ssbg+vlSCTkZVKVcr8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDH_vYLNqhomVgoAw--.12962S3;
	Fri, 22 Aug 2025 17:19:09 +0800 (CST)
Date: Fri, 22 Aug 2025 17:19:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-19x19-evk: correct the phy setting for
 flexcan1/2
Message-ID: <aKg2CmgimiK1OOM_@dragon>
References: <20250819-can-dts-fix-v1-1-e43e7d98a544@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-can-dts-fix-v1-1-e43e7d98a544@nxp.com>
X-CM-TRANSID:Ms8vCgDH_vYLNqhomVgoAw--.12962S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI1IUUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIA-UOmioNg-XQwAA3s

On Tue, Aug 19, 2025 at 10:43:37AM +0800, Haibo Chen wrote:
> 1, the phy support up to 8Mbit/s databitrate for CAN FD.
>    refer to product data sheet:
>      https://www.nxp.com/docs/en/data-sheet/TJA1463.pdf
> 2, the standby pin of the phy is ACTIVE_LOW.
> 3, the phy of flexcan2 connect the standby/en pin to PCAL6408 on i2c4 bus.
> 
> Fixes: 02b7adb791e1 ("arm64: dts: imx95-19x19-evk: add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 and tpm3")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied, thanks!

