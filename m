Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0550EDDBB
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110461; cv=none; b=TqpjPWI2+qd0MWub87BxQZJnKC+8hwqHUf+cJ7tX3NytxVoPR6CXtJML7Bqd/U7a1kVXDmMSiQrI23uWk0PnpILhUyWTgqT/gK71IO6p9blJOP5VcaPncA1D4XX7iQAXNpfEPjnzhLlAyoqgdCgLmvlAXejinCc2J4JD3/Btcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110461; c=relaxed/simple;
	bh=6gerh+4m9TOL8QpS7wObCi456AtJ1It5igqGsVG1oEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFiBxeA7hcXfCaaBQ5ezcAY1XtZryo18SIjcHWweJP482Mz4kCxHi3e02Sfy4Ux6Mloz/5qM1CqBNopEMtwT85nD0hG+pPS8wxHDl3mmkdmXnjUEPvs1CA4P/Xw6Zzt9NmmrqBVod4HlJS499fjJK3gELWWZ+PyHvbW9amcQWRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gqXEIUUR; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gqXEIUUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SCKj5wvSROJE1QpWcm2KpBEU5Y+Y3j7do70UkU92Mm4=;
	b=gqXEIUUR/7uJsS7k5q/g7o5tDGivRgqJlmWmb7T70o/Mj//aOnDCRw0Rpr5qzL
	o3ue2kbra4OW9sH7b7g8Io14D5Ca9OIjqSJRwyd5QdNgkMr9IWIsqCK7WXy1jond
	jkvq2IfW3/x7Sjw68rULQREVkaoQjCYDhqZkTjSFQYJ18=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXfjqoGNNmjqc6AA--.19497S3;
	Sat, 31 Aug 2024 21:20:42 +0800 (CST)
Date: Sat, 31 Aug 2024 21:20:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Teresa Remmet <t.remmet@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yannic Moog <y.moog@phytec.de>,
	Benjamin Hahn <b.hahn@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH 0/6] arm64: dts phyBOARD-Pollux: Update regulator nodes
Message-ID: <ZtMYqOB5fjO6LKQz@dragon>
References: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-0-e2500950c632@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-0-e2500950c632@phytec.de>
X-CM-TRANSID:Mc8vCgDXfjqoGNNmjqc6AA--.19497S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4DGFWxXFW8Zr4DCrWkCrg_yoWxuwbE9r
	1rXFn29w45ArZ7G345G3ZIvr9Iqw1jya4fZry3Wws5tw17ZF1DC34S9r95ZrW8AanxAr4D
	CF1xZay0qry5ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8_nY7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgVMZWbS-GY3CgAAst

On Wed, Aug 14, 2024 at 11:26:07AM +0200, Teresa Remmet wrote:
> Add some fixed regulators based on the phyCORE-i.MX8MP and
> phyBOARD-Pollux-i.MX8MP schematics. Reference existing or new ones
> to the correct nodes.
> 
> ---
> Teresa Remmet (1):
>       arm64: dts: imx8mp-phyboard-pollux: Add SD-Card vqmmc supply
> 
> Yashwanth Varakala (5):
>       arm64: dts: imx8mp-phycore: Add VDD_IO regulator
>       arm64: dts: imx8mp-phycore: Assign regulator to EEPROM node
>       arm64: dts: imx8mp-phyboard-pollux: Assign regulator to EEPROM node
>       arm64: dts: imx8mp-phyboard-pollux: Add VCC_5V_SW regulator
>       arm64: dts: imx8mp-phyboard-pollux: Add usb3_phy1 regulator reference

Applied all, thanks!

