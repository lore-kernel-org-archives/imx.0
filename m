Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B18914D712
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723454499; cv=none; b=e7sH96T3knOodCvKPPFFCHPNjp1BhHVKpuYl2880IqgPid/Wge5ugCkfQbOpXYcNPygzBRO580SCSnQWERZCsym3SsIzBzCG2/qRreiH+jLcrH47DrUz5f82j/MOuuw+wWo4Q0hnyUlAiVLunJHuhfSChKZpht166mDTGR4cWEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723454499; c=relaxed/simple;
	bh=zMSKNSWh/knSs3qDexWL28UU9jSfVIYFcb2OsSO9oaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgjmjGHLv1Sz0xB+0CYk5xK0PNX1Lo8wtehqYbSJXd5F2epHE1M5AIcHeNd5832TM8RVeM4SamLYamWomO9Vegl93/4HSpo34AvDPFSglGM7dH21zLsTzXCCct0G0pAHpzgx3+i7EUv2a3GOsuzNbXzF+0MuPA1Nx7Vb0dJ64q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lvhF6B/N; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lvhF6B/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5zDuPwXK1w846oyge0RbaA657hY2Vn9PqOwRQHHanCA=;
	b=lvhF6B/NzC4ryFgNgaJjTxIwFR80TCrR5jU+E9x01pWVGMzzLn9P/c5EHz0A8n
	F4mrPwrWjP/LociJVpTaQWvEQmAlc44OVUZuWlfpwl7Jq1QkIl/b6MikC2883qgO
	hHPTAqwamfKGhDS0TICB3KPgKcu3H9uzsy0W4Vj/ReA6E=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHzyAB1Llmo45JAg--.40046S3;
	Mon, 12 Aug 2024 17:21:07 +0800 (CST)
Date: Mon, 12 Aug 2024 17:21:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrej Picej <andrej.picej@norik.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux: Disable
 write-protect on SD card
Message-ID: <ZrnUAb1EKZHleb3M@dragon>
References: <20240716085114.3205582-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716085114.3205582-1-andrej.picej@norik.com>
X-CM-TRANSID:Mc8vCgDHzyAB1Llmo45JAg--.40046S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQY5ZWa5zUwYPQAAso

On Tue, Jul 16, 2024 at 10:51:14AM +0200, Andrej Picej wrote:
> Micro SD cards can't be physically write-protected like full-sized
> cards. Disable this feature in device-tree to get rid of the kernel
> warning:
> 
> "host does not support reading read-only switch, assuming write-enable"
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>

Applied, thanks!

