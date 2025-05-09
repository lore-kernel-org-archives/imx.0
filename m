Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E92EAC7
	for <imx@lists.linux.dev>; Fri,  9 May 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798881; cv=none; b=rQlX4atEtwh2IJKpzl7d/hFN6haJETwUQWJ+vpk+rZw0octnrJNQbthoXvDl/q9szhwFbwXzF90fSkLH2jcB9cNJbZGQJEkAnY7NBiDK+hYQ8lh1FBceLyzU47RBJ8gemIDq38Sbnrm+n45BS2kKp6BcUxMg1Mz+7Gn8CaArCJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798881; c=relaxed/simple;
	bh=JpcHSboQoDJQqtPkSw8rL5cSQk4HHcNjNLT3/ntcRrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quYR+rtAPzCdU7mI9O1aEFtIB8j+YVydR+kw2yFdA2O4qFzzMZ7OYpNsPAvjJMumYBCTEpvkM2BQgY5Ca58FgC2bTl0PFfGzzH/s5eZ6qiWU5BKL0xWQf/7jih1wC/ZNLBG7GEn4jhRmR/VMA/eREg7gMhlmEQ/K8wqqax36NLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=K9PxEyfr; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="K9PxEyfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Ssj99sYpJXTFZJPScPM2oAgzEWZZ5DXMgQ1Kw1tihm8=;
	b=K9PxEyfrbz73OF8/PjGXttw51CntkQtp8Pcbv0grEMfrKTo5rb0zlIAijENPoG
	mCc4ACT8lOyuSJ/KCQXwjiVlmoiC9kBFV+SWjAWl1hIQHnnieRK9wM112FY2qrMO
	UvSNxJDdHH4EGV9ZDWtCI1yAqtdstUuUPenLd0O7+k+pc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHj_fyCB5oUfWpAA--.49000S3;
	Fri, 09 May 2025 21:53:56 +0800 (CST)
Date: Fri, 9 May 2025 21:53:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de,
	linus.walleij@linaro.org, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH v6 0/3] Add i.MX943 basic dts support
Message-ID: <aB4I8gGl+Z0v3JnH@dragon>
References: <20250421065139.3073232-1-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421065139.3073232-1-ping.bai@nxp.com>
X-CM-TRANSID:Mc8vCgAHj_fyCB5oUfWpAA--.49000S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUFsjjUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxpIZWgd37VaMgABsK

On Mon, Apr 21, 2025 at 02:51:36PM +0800, Jacky Bai wrote:
> Jacky Bai (3):
>   dt-bindings: arm: fsl: add i.MX943 EVK board
>   arm64: dts: freescale: Add basic dtsi for imx943
>   arm64: dts: freescale: Add minimal dts support for imx943 evk

I fixed the trivial things on the second patch, and applied the series,
thanks!

Shawn

