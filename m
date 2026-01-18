Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1ED17D6;
	Sun, 18 Jan 2026 06:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768717849; cv=none; b=kd0CzSg7makWOvfL9bmzzoCMJYDLfDHLGrI1JLNc094Gs5DYGcNQXqQfvHmWdaUB4nXaX60NCY38SSAVZTY7RRNvTtP3OReGY94JlrSgf0eMynP+KRjPvBWXYItQZ9Xf5WNpffOr2rCzqmeimYbHffsJq7th3tyQEWCSmflrouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768717849; c=relaxed/simple;
	bh=XxnJLDJ6FviMVmSxBBVjWlMCbe7CLqe2DDs1wGal3Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIdD3p/F97a0YRmfM1hwJ7unocVCUs+cwLPHBuAbSqMZiXPK2g0v8uXnBwEWiM02cmPvWLBsy2jpggMiBse7np/yYapkRP1sEkfT0MwFcx6EFez1qBuvyG9zhYdL3/7pJFqr6KKg2tjVXQHr2ej6Y1Hfb8JmQFOZX7erp1LFf4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMjH1DGa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMjH1DGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86BCC116D0;
	Sun, 18 Jan 2026 06:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768717849;
	bh=XxnJLDJ6FviMVmSxBBVjWlMCbe7CLqe2DDs1wGal3Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMjH1DGaD4kJWPdrF7CEMcD0P+c6LqWy2JyagGfXNDHdqnaFbZUmRKPbiocVoM7fq
	 ZQRDGpjcujvKhfxV2E0u0SkZaMt8OdU9euAQDGN47TepfUuHhqY3KYPdwm8FUBi5WQ
	 Mvz53lRIdbkefH6Bstu5D5JKtiyk8eMRs9+E82ALIKJ1RP//a4p93FrOgC574AI9/a
	 7GbNYLXFk/59FiSs5nkxzGVA+l5AIODukzewkMwDZ4HoZovZ6yHSB//QN+f8Z/wC0S
	 XX+CVqOYLD5wjAOaVpSi2FwsrFOeWvzKThQrAzDK34srn7tORzEe0vhGfZ1WwBskN8
	 1E/GI5PG+dgrg==
Date: Sun, 18 Jan 2026 14:30:42 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: enable additional devices
Message-ID: <aWx-EkSr1m4o4Ai6@dragon>
References: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>

On Thu, Jan 15, 2026 at 06:11:34PM +0100, Francesco Valla wrote:
> Enable additional devices on the i.MX93 FRDM board:
> 
>   - CAN port and associated transceiver
>   - Bluetooth portion of the IW612 chipset
>   - WiFi SDIO port
>   - user buttons
> 
> The WiFi portion of the on-board IW612 chipset is still not supported
> upstream, but since SDIO is a discoverable bus it will be probed once it
> is.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>

Applied, thanks!
