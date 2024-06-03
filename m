Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BE94691
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 01:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717376888; cv=none; b=kW3NEHvLTmRvWeGAJ+Pz7DQV7w7rgNZ6oBDryiFF3839x6RQTHFESY0M62WANI7y9WwjYW3/EwGZJOFvkn+LaT1a60BRi+AjeXKORQQ6RLuKuWPVsTzsQ/afkJIFTL/Awj1P95xFAh/Wxsu2P3Jiu82jbrBCF8InLxbex7sU4Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717376888; c=relaxed/simple;
	bh=AJxGqelg0blaxEfUwaK4bxSO4X7eGYRg9Lopc0VXZiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tiK1r1X90YXPtjm/R3cfJlnI96LhpkuqOS115EPjbKkdptn6kpkWoju/Tc7J4MkAcUwHKOlecdUVRzBdrRWjW6jJ5rvwYy11U2CPALJ5pSmgn9NukHViLSukw2EuQS3EQw3S6ZaAXm385rjFIDIt/wfia0hx07t/3wWeK4cYU54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VVyJN1sg; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VVyJN1sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8k4gT2nqBFGqyZpCaHqPeKXyYM2eTwYAEViYCARACp4=;
	b=VVyJN1sgTyinA5KMAya98HGWpnxuyr3WS284tcF7qj+DWguzyIUYmUGlQj7EuD
	lT/li4MsfaK8GfxkLwiUy5Dh9XQXWvn7iTi1CpVVvLBDLBFMEIWECJN7+OCB+0Jn
	1VHf/9HZc5z4dABzLZ4dV6+knvVq/DrH/tyn94az9O+ss=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrACHT+JiF11mjQ7sBw--.2328S3;
	Mon, 03 Jun 2024 09:07:47 +0800 (CST)
Date: Mon, 3 Jun 2024 09:07:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: mba93xxla: Add USB support
Message-ID: <Zl0XYo+Ls25xM/SP@dragon>
References: <20240423093341.1927592-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423093341.1927592-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:C1UQrACHT+JiF11mjQ7sBw--.2328S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIxpnUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDQPyZVszXjYKlAAAsH

On Tue, Apr 23, 2024 at 11:33:40AM +0200, Alexander Stein wrote:
> This adds support for both USB host and USB Type-C ports. This includes
> the on-board USB hub.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

