Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F88F7262F
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 01:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762912382; cv=none; b=N/OartcWzwLFcEMznGGHdxCl+0rBleionXRolM0Sx9Hcd0BvkPPGOMxzHC23yn5OxoLecIZGd4+sZKp8aNNyg881mzwM9mvxuBWjQ8V69bD/3t5np4DWde/tgCBNgpYMd5w4c02OvAElzGWySCxk8yODkqWBDAS4ymaMDBCjb2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762912382; c=relaxed/simple;
	bh=C9neEnQq3thnjzjGOw8nSCkjTdV9aE9g14bGC4lf5vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3dd6tLB60u7NTWPlzxaW6fv6VlIe6WV0rmjwY6TLjjdmGhvsF02mKakc7L5ieuRr0DM5GOnb7gaQauEnaLPynkMW5Kt2xEnRehcZgQwUHJnkI0WHOBTemDIHcYUZTsuyHfU4KkDtBAQR9ovwleiozzgWlT/Q9AT3w5l5qRvOV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NqdefhQy; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NqdefhQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=C9neEnQq3thnjzjGOw8nSCkjTdV9aE9g14bGC4lf5vE=;
	b=NqdefhQyq+sZoVxWznWBYZ2OWBn2H2NOGNh/Os3l7rkNzBdk2i26nmATH0wU4P
	4q0YgG+IWidcwRRI6NciXc1/zWQefvi7CKHaEs1D2zFXHaLtglQ7lvHI8/NTmeeZ
	nx7ued2u44pRu9fIGoz21fG+CByCpz55MYqHXBgoBwAa8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXXYde6BNpLQ7yAA--.5484S3;
	Wed, 12 Nov 2025 09:52:32 +0800 (CST)
Date: Wed, 12 Nov 2025 09:52:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/11] PCI: imx6: Add a method to handle CLKREQ#
 override
Message-ID: <aRPoXvIeooNhLpfn@dragon>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
X-CM-TRANSID:Mc8vCgAXXYde6BNpLQ7yAA--.5484S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUo1v3UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwBx1mkT6GC+PAAA3g

On Wed, Oct 15, 2025 at 11:04:17AM +0800, Richard Zhu wrote:
> [PATCH v6 01/11] arm64: dts: imx95-15x15-evk: Add supports-clkreq
> [PATCH v6 02/11] arm64: dts: imx95-19x19-evk: Add supports-clkreq
> [PATCH v6 03/11] arm64: dts: imx8mm-evk: Add supports-clkreq property
> [PATCH v6 04/11] arm64: dts: imx8mp-evk: Add supports-clkreq property
> [PATCH v6 05/11] arm64: dts: imx8mq-evk: Add supports-clkreq property
> [PATCH v6 06/11] arm64: dts: imx8qm-mek: Add supports-clkreq property
> [PATCH v6 07/11] arm64: dts: imx8qxp-mek: Add supports-clkreq

Applied these, thanks!

