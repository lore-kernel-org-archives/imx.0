Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDC22D77EF
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 05:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544538; cv=none; b=nS4NOFfqQewp7rh104leUD0PjTO08RhaNPn7fiwfY13oLYhBej3MoxqqcBivTwXOAPP9PBtwQwgTzpx6dkJIQ6A5OIpbgqelBTPzLlMYHv/Auh1fRsW5ciadD4dCct7mj/lsQZgAS3mIUW01bnHTVaQDCE5lQW7TO+qcXT4ni4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544538; c=relaxed/simple;
	bh=EfIQEjHO0SC7Aqmqkbs2O93BEaGxsZvcg/d6WWIvSz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAjUqCYpBhRxth1W8L8Zm0oiCO7ADWKcfDm5iFhhdiV5XAhcQVza8SuCg0je6uwIFjHmOTVJ73ixA7egpB+XK8mH5uTLIq7Pnufs1XDSfImKS2le6IXPGqNJjTmMbKUfKAgZ2NVN7zSxRJPPke+edhRxl/c26yPaSwVHNRHs4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=UGln7ZOV; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="UGln7ZOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Ljd/GfWV/LpuXLPWohOtAse3dPFW/ARWxabMfHqOTJA=;
	b=UGln7ZOVacTnbhninps24IXqlFlyB0RG1OMwWhYRwl2Q66TfPUDvmZ5zqU+Ilg
	lNSBDdkaX1WkqhLbbZh8cgtFdvdjG4N5XkL+WgoMa3UABxpAZEPfBkBM+F+FvST4
	Yut2bKfEvDVSHfm5iBPGs3QSKtbfZBAAJYc6aGGunIoGU=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgD3371JCf9o49s+AA--.49824S3;
	Mon, 27 Oct 2025 13:55:23 +0800 (CST)
Date: Mon, 27 Oct 2025 13:55:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mp: add idle cooling devices to
 cpu core
Message-ID: <aP8JScVXZo9nj4MY@dragon>
References: <20251013065903.35216-1-martink@posteo.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251013065903.35216-1-martink@posteo.de>
X-CM-TRANSID:Mc8vCgD3371JCf9o49s+AA--.49824S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUz8nYUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQtu02j-CUtMEwAA3d

On Mon, Oct 13, 2025 at 06:59:19AM +0000, Martin Kepplinger-Novaković wrote:
> The thermal framework can use the cpu-idle-states as
> described for imx8mp as an alternative or in parallel to
> cpufreq.
> 
> Add the DT node to the cpu so the cooling devices will be present
> and the thermal zone descriptions can use them.
> 
> Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>

Applied both, thanks!

