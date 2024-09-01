Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B75E142904
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725183976; cv=none; b=OOvO/8hfed08+C38wi9Ifvs8upl2zqrht4rJxVts8EmwwOCsjqwBLc7FtOweA+yA573bwA+wL5CNZU6mWG4ZXWExI3HX8mMOTccv8y1zPFqIcfnjaiulLFPIMifvcPNV1mPb+1a2WG/BmFP2uEqpiR5eKtELpJdiDtJoqWFElso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725183976; c=relaxed/simple;
	bh=P2pnO1BrbY1wEyH8aTS6WNyRjXR/lbY2nnn9GSwtraQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8QfLZfr2VX/Txt5QzO+/HqjJ9VNEAThgaA/lIRfOzrUuudv21HN14FkmEESTQVf1HLNYU///FgPYq5rEkCViYBFkn0nBxauCz3oSPpjW4xlL5FOv+7w/Jf+p67bgzCJevNLjDyfTpV1sU+RMwr1PqOLzhqBKjlZFjMllOqI8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=RkBG5WUd; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="RkBG5WUd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RfsGjbmHv8ZEt+kPwgGgTifDmBQIRDYNPTcUivaQ62E=;
	b=RkBG5WUdblZMtXfWh0aKe7wW6lH3JZ4twlLiNPqX8MAZMj3kX9PY/XqOIW/yjo
	ngkYdFfwsBE/ror6KDf3HFxfzHAj+raUJBlqTpAlfF7/+GGUrNSV5Ve4d3kOZWRK
	Ye9VPSGkeJO8HrIYIrwkdDLzcj7rK7qvk+zyG9YC0rbQU=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXfjrQN9RmxBxEAA--.32322S3;
	Sun, 01 Sep 2024 17:45:53 +0800 (CST)
Date: Sun, 1 Sep 2024 17:45:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: dts: imx7: minor cleanups
Message-ID: <ZtQ3z+lWiUZMaGj5@dragon>
References: <20240828095638.231569-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828095638.231569-1-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID:Mc8vCgDXfjrQN9RmxBxEAA--.32322S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVnN3UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAh5NZWbUDStdlAAAsp

On Wed, Aug 28, 2024 at 11:56:35AM +0200, Krzysztof Kozlowski wrote:
> Krzysztof Kozlowski (3):
>   ARM: dts: imx7d-zii-rmu2: fix Ethernet PHY pinctrl property
>   ARM: dts: imx7: align pin config nodes with bindings
>   ARM: dts: imx7d-sdb: align pin config nodes with bindings

Applied all, thanks!

