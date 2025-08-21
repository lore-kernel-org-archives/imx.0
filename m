Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ACA15853B
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755761264; cv=none; b=pGGTPpgotrPB/hsJioAAyn4GnTL1B6plVDe9OFZTJ9WxzgIx+4PTtgmcx8fVRFFGAOjDlA/N+D6p21KHIMEw3Ftg8d2LdJN38qX1KqUOEYKRaIGNMsd+SklZsk3WQjya43ViXPoeJEoJFEHTxZ0Q3EhfaGyIdfES6MfHOeX/Mrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755761264; c=relaxed/simple;
	bh=svqcbi3OmPTDfakiBEfBMCs3Ex89tSVr80w/U+8RMkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0CzWXchn37dI1UHrsSNE+Jr03buWN0+wAze8YJ9C9ptbAh68WJhyUWnvE4JO1zV1otHq2+excb9RNg6dFOI0OfHawTXliVOvgx0yHmlX/xkYvhu/4YJmMxF44inv6WeJ6GRY66kFrdzK4dH63oJu2EJQFZphSfj0Qrs4gdTCG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cAnZIVwX; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cAnZIVwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vSKYxpG2l1hLbvhop/k88VTpfR3m9wwP+xtV0BRw8B8=;
	b=cAnZIVwXcfoCbePnaF9lR41aRUKHK61RpFnwD8UwDIeLYSLWPFvT6OhrmTX6dK
	QZdvcJp6PhMfEe5NDEI8NjyqU5JQ+jF/peP0O/xTFKWsTtPmTccTMpH4vEOY4rfp
	25DPz1Qs59k+A8kWUrP3ftU3bARpRy829m15pXT02xmNU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnnyhGyqZoY5IZAw--.37745S3;
	Thu, 21 Aug 2025 15:27:04 +0800 (CST)
Date: Thu, 21 Aug 2025 15:27:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: imx6ulz-bsh-smm-m2: fix resume via console
Message-ID: <aKbKRmzJ75uoVTxB@dragon>
References: <20250715141322.1305512-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715141322.1305512-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID:Ms8vCgDnnyhGyqZoY5IZAw--.37745S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5Kw4ruFWrur47Jr45WryDKFg_yoWxGFX_ur
	18Grn7X3Wjy3WxA3WIyr4UZryjgw47GrZxW3yFkw1fJFy8urZ7Ga97tr13ArW7Wr4rK347
	W3WYvan0yw47JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb7PEDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQiI7WimykhiKAAA3e

On Tue, Jul 15, 2025 at 04:13:10PM +0200, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> Despite the current configuration being compliant with the technical
> reference manual (TRM), testing on the system showed that resuming from
> suspend via UART4 (used as the console) fails unless any other UART
> is also enabled.
> 
> In our use case, UART2 is enabled to ensure reliable resume when UART4
> is used as the console.
> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Weird, but applied.

