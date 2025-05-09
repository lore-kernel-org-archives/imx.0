Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379E9EAC7
	for <imx@lists.linux.dev>; Fri,  9 May 2025 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799525; cv=none; b=cZ8pNJbfsPobXMkaBXWQlC1/t9jYtx+uMlKknwMqU4kPYLVM1j2Xgah2sDohcMbpLu2sZbGYf9uPCEYaIdUnbod1DrAFVeXxJKeCOoNTYBD3zBaVQ0WmaoLocJJgfhmdSvbc0si2NlHlO2t08UGXrjkOQCggJAq6Qx9yBUC1FJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799525; c=relaxed/simple;
	bh=Ri457AVHzrKMvfqsMFNC3NXuEr7GJmE0E87glzx2AlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nho0ryk02lf1mxO689CLBiBsPiwpAqpkEK/fkTxIYxz/rtNYk7vbSRhOYWMdHzqF0UOFcavT7C3Q/GEr9knHTk9gzxW8xarOXpelP3+lZ9xd2UZ/nvE2rQ88u1FSuV8Ge+qSLtrL3NN88lp5CUhNIVr67cL8Ez802gXMHycGmn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=l82BzNXk; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="l82BzNXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=khh9GkiKSYF8ytE7q9ANWl34TwhOsAHnv4+wLwiqWMg=;
	b=l82BzNXkCTxWjEoAZgW+8IwakmblZgzJRLkx3jx1WP8S7IbkG/dkkC1uQCG/M6
	sUclQziMC7ZOJOJrcZkTnv+sah5IjGrlaIkJT7pTeDwwCnUz42rXeU0D3zWTAHHs
	woN/Ni4jnHOBW6lHjmzMSnj/ash2HiEUFSQaLPwpT9MfY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXTxNxCx5oIsCsAA--.16043S3;
	Fri, 09 May 2025 22:04:35 +0800 (CST)
Date: Fri, 9 May 2025 22:04:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add
 LVDS device tree overlay
Message-ID: <aB4LcS48R/uqSPPO@dragon>
References: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Ms8vCgDXTxNxCx5oIsCsAA--.16043S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUF7KIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARdIZWgd+-hNSwAAsL

On Thu, Apr 24, 2025 at 09:49:58AM +0200, Alexander Stein wrote:
> From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> 
> This adds an overlay for the supported LVDS display tianma tm070jvhg33.
> The LVDS interface is the same as for MBa8MPxL so the already existing
> overlay can be reused on this platform.
> 
> Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

