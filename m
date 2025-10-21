Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227AD3043DE
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761035602; cv=none; b=prDGwaodwQH0XN5diZwv/1mGW4bi+49+UAXcS+YeQbrgUIp+izBWcvhlyGKHFIaKFO39NG5tv2U+0v3/2zXgaVvSCQ1bmbHr4mTCetL0fzBaQPBqs5yJt/DSm+H7P1W4lbyulN+ap38USkCdEbHwOjy5Er6pGeQIakxkIjb+WqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761035602; c=relaxed/simple;
	bh=7iU7CJTvsGK9QB7AoMy91TybH/xefVCLXzcsEBKxdlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QELczNV3Ct/8UGGo+L0CzIjoGXCG7VpgY53or+trUyIor3PVicZ7O5GpZyw/L/v2NYBBRtaCTUqk4GM1HxuQpJPz+75c3w1XjRi5OW2JtM2DiLH8WZPuA/QJFXPA535fnYAwBlvKnITJ2pSxFPp4GDDCYC23ELrGMRpV0IiAF/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ZMisxgFw; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ZMisxgFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wVH8qj8Pg0otsfGSWfNaf2orFhrbu2S797ibxbYfU1o=;
	b=ZMisxgFwfZYcUxQVgOeJ8r907ZvHQcT3D08YfXgNn0ihnWGJZcHh+PCWeTEuW/
	LGIH2YC/aIhi/PZbv3FmY8n0az1rD0T71PjmNsvS0L1AAFtdcm2nZffuot/zOEP2
	7evX+vB1UfaNzgSg+ZV6rCLhTEEg34mPwvoDIKXa2uLm4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3d7A9Rfdo_wZeAA--.47555S3;
	Tue, 21 Oct 2025 16:33:03 +0800 (CST)
Date: Tue, 21 Oct 2025 16:33:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-15x15-evk: add fan-supply property for
 pwm-fan
Message-ID: <aPdFPdXD6MhZRvQZ@dragon>
References: <20250919-b4-imx95-fan-v1-1-c9127bd975e9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-b4-imx95-fan-v1-1-c9127bd975e9@nxp.com>
X-CM-TRANSID:M88vCgD3d7A9Rfdo_wZeAA--.47555S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxwvKUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNB943Wj3RT81VwAA3J

On Fri, Sep 19, 2025 at 10:27:04AM +0800, Joy Zou wrote:
> Add fan-supply regulator to pwm-fan node to specify power source.
> 
> Fixes: e3e8b199aff8 ("arm64: dts: imx95: Add imx95-15x15-evk support")
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Applied, thanks!

