Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106CC22301;
	Tue, 30 Dec 2025 03:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767064413; cv=none; b=hx9eiMCv8tIpbbQj3xHXCjfk5900URomQCuiSuz1P9UlqfZtXY/kJaGIrLHOaYWisd6XzJFFwdTDqMSsQmUqUp1nEfTw1930JBvkRQ4P3ODPFtOvnfSV4JrIZ7MBsCRGRVvmf8tUqfv+6SRIKCaxjcxi7Car0AkOsdtVUtm4EEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767064413; c=relaxed/simple;
	bh=SChn05DCiVGJdEArMObQBUB0k7u74rd1jxqKVOfotXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ls9dEYVy8EnsayrUbV9lrKhLwzVSjs1vs/B3MJSIrp+bsSBIfwanAs6Qn96toMjrOKyOHJ6SXBzSWiIKYsJbucXHAzy6m+SwxzQNuxWjQpwIY1lIxq/GB2TcUYca/f3DkrALGIiHbMfeEv/LVw5xwwkHxPdOpkw8Hfvnah7aaE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsMCxrhl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsMCxrhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025F9C4CEF7;
	Tue, 30 Dec 2025 03:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767064411;
	bh=SChn05DCiVGJdEArMObQBUB0k7u74rd1jxqKVOfotXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZsMCxrhl0Y73xf02NnAyflBkAM8ZsZ/LKgcNJBMCS27TtnxlLNcKL5JH4COq9XRNr
	 dtr0JtYv7gSSXvU6d7HOV9QRtzNap6B7u1FMnQu4Is5Er9VH0CfQDWZio13Kg/kFtk
	 MdDeBycYF2n6lEKE8Orbhy5icD69jRNysg9o94du2c9xrZRgMEU2lCgqOnns1ohNxk
	 5CNE1iRarixNZWS/YEwLz2gX4qF3s1Trc2QRxARpR++IizojkqGrOSDeJoHKNQ84BY
	 2uXUy0v5jNnrewNFVcueycqXAYcTH6wUBvDTpZ4D2KuVJyL5EEurXLtOmOgrBsBbJX
	 l0+FxIeNPirDQ==
Date: Tue, 30 Dec 2025 11:13:26 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] arm64: dts: freescale:
 imx8mp-(verdin|toradex-smarc): Add HDMI audio support
Message-ID: <aVNDVu0ELBsKR11J@dragon>
References: <20251209101754.54067-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209101754.54067-1-francesco@dolcini.it>

On Tue, Dec 09, 2025 at 11:17:48AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add support for HDMI audio on Verdin and Toradex SMARC iMX8M Plus boards, as
> done in commit b21f87b8322f ("arm64: dts: imx8mp-evk: enable hdmi_pai device")
> on the NXP i.MX8MP EVK board.
> 
> In addition a small cleanup on spurious comments.
> 
> Francesco Dolcini (3):
>   arm64: dts: freescale: imx8mp-verdin: Remove obsolete TODO comments
>   arm64: dts: freescale: imx8mp-verdin: enable hdmi_pai device
>   arm64: dts: freescale: imx8mp-toradex-smarc: enable hdmi_pai device

Applied all, thanks!
