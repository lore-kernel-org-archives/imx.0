Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE72F5A14
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954345; cv=none; b=Ieps9o8MU01na2ULK52l48RxLgN2MWWSG27RH9QIJKnfreoGQNKM8XL+DynQqHWbgwxJ30Oxt6M3I3hksY9iCRUqO0vUdmiXJ+AVkYycQXe/bDDlRZiUZa+SyDn1qd3zaEAUClIDJkKxYLdOwKIT+OO6zN6lPgltwxvm9RNJjGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954345; c=relaxed/simple;
	bh=eA1tibRP1UcX4pMbZyxWjJVF9+uB6ZwTUZ06FUGKNow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlimACp0mE0SylGZLxfzWcdOLLErPBHYzXv9Y1p9w2UUd1OzNk5to/JZ2Xn7iIYoaK6KzeZF3r/hoYGEHBDipkJ5lV+m2h8C7hJvj/0msL+MR4YtSi2Vei+ZEitqle6ac4g+iAZXcsNoWbt9QvjWdwhw3QLYz6HZM6kOs9sod7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IjWAFwgH; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IjWAFwgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/hRMZ7RubjZ51t5HEsE2KinRdv78Ykro8hts/vPrg7E=;
	b=IjWAFwgH4BD9QVtbIQgLD5TtcK3BFRS9t1OkMGzZNaJElB40T4I0l6t84L57xg
	ywaE/oanlws4Qyy1MFlUwdrKpF359uYcqwgkx04q6Merf+CQygOfO9oEIA3yw0/t
	qthbcHi1yjUpbY+2RJdHd+b80zO9TD3oz7gmBAtu58L38=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3_1a8B_ZogCNUAA--.13047S3;
	Mon, 20 Oct 2025 17:58:22 +0800 (CST)
Date: Mon, 20 Oct 2025 17:58:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: arm: fsl: add compatible for Skov
 i.MX8MP variant
Message-ID: <aPYHvCZbVIr0-gJ3@dragon>
References: <20250922-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v2-0-abbb759cf8ef@pengutronix.de>
 <20250922-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v2-4-abbb759cf8ef@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v2-4-abbb759cf8ef@pengutronix.de>
X-CM-TRANSID:Ms8vCgD3_1a8B_ZogCNUAA--.13047S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzWrWUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNB7ILmj2B77crgAA3Z

On Mon, Sep 22, 2025 at 01:10:55PM +0200, Steffen Trumtrar wrote:
> In preparation for adding a new device tree variant with a different
> panel, describe the DT compatible in the binding.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks!

