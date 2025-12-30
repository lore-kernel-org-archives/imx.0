Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC8B24EF8C;
	Tue, 30 Dec 2025 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082154; cv=none; b=faDJCYn939biHsiBd+EjnsY0TIdanl1gizUl/6NZnrd+he3eTpq9lkBq2GoUv/xPfEKefucB9o33wXCwUqTIfhHwDsZr2bVfDhIwNrgNO9PxXfcD+4hozcFiKzfZMFdw9xepYu9pTYq8hS6nLfrLQzniplPv8UG9KkJvknPgu58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082154; c=relaxed/simple;
	bh=STvICv03DYY1Jku37i0sIRJQGUTF4yyyZ5Dx965x5Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAsXCxpLdaylcMkCdV+qgpGlwZDyUgKPyGU3roBKNgA1PyThiG2HB3A9xYny1r045HNN4mDyUM7pfnO4ouO0W7xBR2vZGQfCpAwKMNCPMPwUHbx5y0A0lSZIO0OmNm1EYjaxoEAoZs8wOX4MSMwrPyCK5CgsJyROldShOpdgEG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hse3nS7H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hse3nS7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA07C4CEFB;
	Tue, 30 Dec 2025 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767082154;
	bh=STvICv03DYY1Jku37i0sIRJQGUTF4yyyZ5Dx965x5Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hse3nS7Hgxdn2r1IYMDI5XR4Lf77RBYLfMX9EAqbLW3mmmOTcdgPOUGpvdjKwdP32
	 bTkzD9cCMZIfRJ4dGmyKN86CRBAagpwBC/BJfNaGcE+TRrwDhCSDNmcelUjMMQIdsN
	 rnj7jmNfxHIkvSv2OdpgnplQvmlpGQfTMTsdyxJQf/XFBmtJHLBjMgh8pVjztmVX9e
	 Dc868hwov5rvW7Sj6Gbv0wBIZ5zKFfAj8FrGYOmDO5Z83jRZYIhTpsGXBkkIggv539
	 0JEx/BDlWMJSY3gBbIg7lm6w7f3HSdWp/b3tiaQHvc78E/j1akEN9ukG8KgmTue4XE
	 +QStvYFH6rOGw==
Date: Tue, 30 Dec 2025 16:09:09 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: mba8mx: Fix Ethernet PHY IRQ support
Message-ID: <aVOIpTeEmhFrs5rO@dragon>
References: <20251216131529.886546-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216131529.886546-1-alexander.stein@ew.tq-group.com>

On Tue, Dec 16, 2025 at 02:15:28PM +0100, Alexander Stein wrote:
> Ethernet PHY interrupt mode is level triggered. Adjust the mode
> accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied with tag:

  Fixes: 70cf622bb16e ("arm64: dts: mba8mx: Add Ethernet PHY IRQ support")

Shawn
