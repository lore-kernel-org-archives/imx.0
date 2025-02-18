Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4942C1FF7C0
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739871722; cv=none; b=IjoIKowPVUVYi3OxzwFrTH09Ts2upzx3cmUNpciznqEQYKUnNEuCtoeMBCRbeJ70szHHH5X9oShpLWUqm2q3qbI16cpzN5fW0V4odDE0XzggeiLYTgfuGLOJkfx3B9BaHqwSh62W3tfM4OqrnKSwL4dlUQ/tYx53q7IYlr5l/p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739871722; c=relaxed/simple;
	bh=7lgiX0WkJ1p/qX9ivmhvKwBQNKziFEeFXGDQfXJc3x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lrfl7ER2YOjsYHOMs/Jvpq/8gNW1HOK8/hpnDYk06FYA0HpPa/sOvEV6nDp3BORzmTkNiBK3Mb39JCE6cxFOrK7IqtbI1k4uoRTHxIR/cNtAmXdc+hGA2lHs0ElEPgh+NrT/qLNouzZnk5sqFFM3mtE498VSpr9DQSAa14sIzjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BSnIe/Ug; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BSnIe/Ug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eLj9MWLdh0oMfWDc+SInSAR4dxVskqRMPSbsgEfwJUI=;
	b=BSnIe/Ugl+bHYxYpJFgcOGidrVXpe4CZh22unGoKI2XGY7g3OqEpb8T8oVtGQg
	rTg1uNBLMPaPsqM0qNIbwBFXiH/8AVCpqwLRZquNaiFJi/Dd5rnzmU5D4G28MTaR
	dsH3yMYOACWxOylHfLWNLgHZGlz1Dt1kmFpoGhYctqGK4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHLe3TVbRnBRI6CQ--.18371S3;
	Tue, 18 Feb 2025 17:41:41 +0800 (CST)
Date: Tue, 18 Feb 2025 17:41:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH 0/6] Complete WM8960 power supplies for i.MX boards
Message-ID: <Z7RV0wA0WCi64pGs@dragon>
References: <20250109012718.328692-1-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109012718.328692-1-chancel.liu@nxp.com>
X-CM-TRANSID:Mc8vCgBHLe3TVbRnBRI6CQ--.18371S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaqjgUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhD3ZWe0L6um2QAAso

On Thu, Jan 09, 2025 at 10:27:12AM +0900, Chancel Liu wrote:
> Chancel Liu (6):
>   arm64: dts: imx8mp-evk: Complete WM8960 power supplies
>   arm64: dts: imx8dxl-evk: Complete WM8960 power supplies
>   arm64: dts: imx8qm-mek: Complete WM8960 power supplies
>   arm64: dts: imx8qxp-mek: Complete WM8960 power supplies
>   ARM: dts: imx6ul-14x14-evk: Complete WM8960 power supplies
>   ARM: dts: imx7d-sdb: Complete WM8960 power supplies

Applied all, thanks!

