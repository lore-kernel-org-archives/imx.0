Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7450095A;
	Sun, 18 Jan 2026 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768701469; cv=none; b=eJPrfcsUPKNq3xPgrX6i9U+VGAxM6Y3uPKMSM5BHAwrZTyuJwnkuYpm4DDF+jiWKhCRb7L55fJEfaMYgKw8GS5wZgdrd/qVD5ujYdvQ84cGsHnKbB13MeaqzhNrSJ83E9sfAMQMR+gVuhp6dE0Jf+mbfa4DHAEaCZbCkP2IOxRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768701469; c=relaxed/simple;
	bh=uv7zhOp4884/tuKtAkmrUryWBtd8KN/Cy4PHDVLMqy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfVe0Uxll9vGy42pnEf/KG0atWxIMGIkA0zMUdWf5XPGZZP+eIKpW/7U5LlaTvcZwkTEdVsGyrWsCfd/ehHiAKMfzKpHkGOAjowf3c1eaBOvLRkRNG86jG6YN35q+UXD9QjrIYgZYM2LrO8C3MD79CybLtqDg9hl2hZj3HZVNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yv/2Kb22; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yv/2Kb22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F70AC4CEF7;
	Sun, 18 Jan 2026 01:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768701469;
	bh=uv7zhOp4884/tuKtAkmrUryWBtd8KN/Cy4PHDVLMqy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yv/2Kb22Uhhp9sQTuFOCntQG0IhNQMPorxaELC9SUTyRyEQX8Kqjn8+HSOq1CUWT3
	 9jnFRdVhSPAMkvaIOjgIA0ykrmD9p06ldpN8seX0mNlwwfjMGGMy+cXBgvgMY2nfZr
	 IPexC6ehzffs1SJzwCcuyvA98fhqDlLl/bR6UT+gwKux3NaG5CmvhwIpnzqCIhNEXf
	 fMww4CXIu3Hnlo4q8PB51+k7+dDmVGCNwHqXgFKiHfYZTuWEiFw4zLNf2SvIIFBntP
	 pMjzpycKs+tBnvZctns+6uWckXLw6OQtUQbwtZrx5NrnkLe1AwYpV8Ym58R/dFlCP7
	 vIlShx+Nof+VQ==
Date: Sun, 18 Jan 2026 09:57:43 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: s.hauer@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, haidong.zheng@nxp.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: Add MQS audio support
Message-ID: <aWw-F5KS4YwzaQEc@dragon>
References: <20260112134712.464063-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112134712.464063-1-daniel.baluta@nxp.com>

On Mon, Jan 12, 2026 at 03:47:12PM +0200, Daniel Baluta wrote:
> Enable Medium Quality Sound (MQS) output on the i.MX93 FRDM 11x11 board
> by adding sound card description and enabling SAI1 and MQS dts nodes,
> together with necessary clocks and pinmux.
> 
> This supports audio playback via SAI1 DAI which is connected to the MQS1
> block.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Applied, thanks!
