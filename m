Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB2B23D291
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763285864; cv=none; b=NdLwLtGPIsDDY6yE2mwnxPL96il2MNL6FzKMcr471wHhSWV0uq35fc4w9Q939ODbmhTiC+WPsI57GhC++WWoLao/qsnhCueYce7nBwN8ee10e3xPph0jnx9Sf2flX6Ft8FN2jkC7ZK052vt5b+KCPC2es2QsRETLZwR4PY4Rjbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763285864; c=relaxed/simple;
	bh=6jQBLz+8gb7lohjfGJXcIhWQLNbcyYxSDwEoh6zYg8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7jCEhlmqAhWcaaQAwTSuOI5OYubJTRSofXWqLIC5uygNHmF806btkVVlAY1P942N1oB3jGzNv2/lyStP24mKEOgzL/1cO8PwOJoW9i2IW2vpkWPVBhwyKrfwZozCrHccNMbYT/FUzNcg6NNZmSupXO87Wo/WgPdc0Hw4FbzMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FR+8b2mI; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FR+8b2mI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9Bq0wIVfG4dtC44QwaB5g6CpsX37U6dOcN4JGpRHlZQ=;
	b=FR+8b2mI6sKu5ZUSur7jnZiM6TGW25UojjlPY5a/KbIJc2R4jiIqo3glt1CprN
	G9xsz/9IUnMxA726YhCupNwINfP5cu8kUl05JcIUWBfstrJLF9qsgmRnTOwk3L59
	SpJn2LmTjVwkHJ9fniy+SVMxJil53S2CQbMwAWL92bY7s=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3+c1Rmxlpbbg5AQ--.7938S3;
	Sun, 16 Nov 2025 17:37:23 +0800 (CST)
Date: Sun, 16 Nov 2025 17:37:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Teresa Remmet <t.remmet@phytec.de>,
	Janine Hagemann <j.hagemann@phytec.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/6] arm64: dts: imx8mm-phyboard-polis: cleanup and
 additional display
Message-ID: <aRmbUZhFfZjH_4SS@dragon>
References: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
X-CM-TRANSID:Mc8vCgD3+c1Rmxlpbbg5AQ--.7938S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwQ6JUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOBScAmkZm1QI9gAA3z

On Tue, Oct 28, 2025 at 09:58:07AM +0100, Jan Remmet wrote:
> Jan Remmet (5):
>       arm64: dts: imx8mm-phyboard-polis: Use GPL-2.0-or-later OR MIT
>       arm64: dts: imx8mm-phyboard-polis: move mipi bridge to som
>       arm64: dts: imx8mm-phyboard-polis-peb-av-10: reorder properties to match dts coding style
>       arm64: dts: imx8mm-phyboard-polis-peb-av-10: split display configuration
>       arm64: dts: imx8mm-phyboard-polis-peb-av-10-ph128800t006
> 
> Teresa Remmet (1):
>       arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix audio codec reset pin ctl

Applied all, thanks!

