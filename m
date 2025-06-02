Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948125761
	for <imx@lists.linux.dev>; Mon,  2 Jun 2025 04:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748837425; cv=none; b=nIUElF5qQlninadl16+UXQ/Mq3f8Q+QI+Sesrumk0KSnJx81vBXHAeL0S10zP4LBxXnf9vMXQiMUtIdMyjkBnHiMVt7IZ5eK74d+IZi2Qx2Smbr5Czji1dkmAFGvLGo0uBqD7obMtjWB6rSqb2l/2138Nv0oLrizpWuXtdmoZ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748837425; c=relaxed/simple;
	bh=FyI94pFb6BLEkoTZEquPEmfGVXYRKJvASIgguB4Xhu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBIjIP7DcstlIm7A7tWVh51hza4xeoxMVOB8Gp2JsMnXDcv9Yx4whJMsVGPrm5duaH8UacGmak8Qcn+RX0OBvrvuQVK4opIcbhVKY53mA+DQ0aG8KpdTxE7gIkVy179ixGK+FZyawjgNgtcx5Y2fUzNcXk5KtKBHww7h3RsOguQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OA/JTIcG; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OA/JTIcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FyI94pFb6BLEkoTZEquPEmfGVXYRKJvASIgguB4Xhu0=;
	b=OA/JTIcGI8uPdANyH9q/94ex8Q9Rt1o+M/hc2kvDsWsnrXg0ALJGWCXPWZUF1K
	Jl1vgWFQJq/VvKd47/m4VnIoJAS1HznKfKRfw8jGRO9W1OEM0T4eIKvEz2gbJ//V
	omPNAlc+8Q3kwZ0/RwmiEkc+wjXa/rWO8E7LQCYxkzCEQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnF_HeIz1odNx5Ag--.7355S3;
	Mon, 02 Jun 2025 12:09:04 +0800 (CST)
Date: Mon, 2 Jun 2025 12:09:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
Message-ID: <aD0j3gXeD6Nn6L60@dragon>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
 <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:Ms8vCgCnF_HeIz1odNx5Ag--.7355S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnUUUUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNABqz2g9I+DgbwAA3I

On Tue, Apr 15, 2025 at 01:19:16PM -0400, Laurentiu Mihalcea wrote:
> Add driver for this IP. Since there's currently no framework for
> access controllers (and since there's currently no need for having
> flexibility w.r.t the configurations) all this driver does is it
> applies a relaxed, "default" configuration, in which all masters
> are trusted for R/W.

Just out of curiosity, is there any ongoing/planned effort about creating
a framework for access controllers at all?

Shawn

