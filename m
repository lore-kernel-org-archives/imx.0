Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED5A2C9D
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 03:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723433651; cv=none; b=FL74VZAjUezHjE5w4I81e6TPM359G7L2ezfTWb31IgJPm4UatAzBheGO8zJQOdNF6+0PXBs6hCKZIqCHPhrMD+Zg3WY69FpUB4xYuWa9E53A98rpGcZlwc566gItXpxGL2jkaGdMc+z4W3zfeKbQc31gn+nEtyhcQNP9N/r8dfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723433651; c=relaxed/simple;
	bh=xfpCQhn3U0gxPZTtAwQMWr9rme+W8I7i7rnG4+guxgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LS6u1jzXPQGUP0LNs6EfkGNON9x1e4Sqw/XByDp8jaG6/wwryepe0fqI20B/Gi22MzfVctiuAe/ul9amxrgNtb9u9ypSvz7lsPwCTmpR/fnZNU3crS7aJnBGGeN3T7+f9p+E0EzgAUJkkAOOtB/8aGJIDnDG0VP8ubAUmn1dlBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bM3szqdf; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bM3szqdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=r2fqcbW4eowzfLw53eCIKo5ZYNSqw+1v/v/btK3jwZk=;
	b=bM3szqdf2M3h71w5VEPCDhNxx1MAv+ULK0aCATLldDxvMKi7WagJoaGtfJ1zG9
	dytQNVKcNv3VN00z9x1nWRgTBmCc6M0PgLa5e3cG/N/CtPL65ASmjw/mwcsg+lFx
	KHyOpdOOsFKuKgU/2IPRB8wXndWV+2P/V4JpqPAA9c98M=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3X4QQgLlmaW9SAg--.33944S3;
	Mon, 12 Aug 2024 11:22:58 +0800 (CST)
Date: Mon, 12 Aug 2024 11:22:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3] arm64: dts: freescale: imx8mp-phycore: Add no-eth
 overlay
Message-ID: <ZrmAECbFwAVSUg5M@dragon>
References: <20240710-bspimx8m-3180-v3-1-8ef55381172c@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710-bspimx8m-3180-v3-1-8ef55381172c@phytec.de>
X-CM-TRANSID:Ms8vCgC3X4QQgLlmaW9SAg--.33944S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgM4ZWa4nhcbtAABsl

On Wed, Jul 10, 2024 at 11:48:54AM +0200, Benjamin Hahn wrote:
> Add a devicetree overlay to disable ethernet for boards where it is not
> populated.
> 
> Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!

