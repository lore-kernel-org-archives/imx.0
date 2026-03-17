Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E449346FD0
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734602; cv=none; b=VisbRFPl2pj9A2ZhGQEIOb1IRWVRnBXE7Sh5YM9D4b4hAUm2pD27t7OXkzltmOWL7Ym0lPf3bThKeIbADnAPTo/sHh5nYlZsi/XqkISywhz+DAXCQbjU1e24kW23/fpJM3NyNPY/GInd8bhSIXhxEbwZkKoo1dwKBRyYwU/aBhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734602; c=relaxed/simple;
	bh=C2n3Bh4IMnS+Db8fN1VzLFfIHd2WnC9Bb8dscoV8+YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9Ycw9ciOoTjOL3an6sq5/RKASXZ3+p3dLx8TnG4JSf5H+bFGKlEmpWSbXXIlGzURZnSf0eFgMM/6hlrSwxjYu1iVqSgPTnBhEuSZI1KkcBqY2vv7l8Y1ZjzcHGGqTpLm8qJC856F3OPt45fXdkUVHFsO4bj1yl5jkPNyxa8Rqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idjx2NFw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idjx2NFw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63666C4CEF7;
	Tue, 17 Mar 2026 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773734601;
	bh=C2n3Bh4IMnS+Db8fN1VzLFfIHd2WnC9Bb8dscoV8+YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=idjx2NFwSiLqX2HOhxAHnHgvc9dAM0s6kh/RGJTk6QtOqAn6dPXI458stw8Cyyqn/
	 nF1r8IWBF6PlOtGf6R4Hv8V5uLgIGtrwM9KpSXICqmEo5eCnw6Ph3LQ4DjUfWK4yIZ
	 t+/wePKghcIRf3gERl8EMEf/GUXqDpDkickBMwCd6UdE1bvXvu4X5+H+HwNUxeAOgv
	 G4sSwX4blcJ1O8/dzZ7hnCB1Ix66CZdAHPaJxVGWyFzvdknIIzYNggyRG52b5roUFO
	 AiwSSKCXZNxdaqbHNFprTDjPCmIiXu7uctdGHCaQznW0JpHYrmLdg+KvuvO4r1W8BU
	 0tWU9or2O+NFA==
Date: Tue, 17 Mar 2026 09:03:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Fabio Estevam <festevam@gmail.com>, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL] i.MX fixes for 7.0
Message-ID: <20260317-jumping-corgi-of-defense-038bcd@quoll>
References: <20260312153557.3338430-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312153557.3338430-1-Frank.Li@nxp.com>

On Thu, Mar 12, 2026 at 11:35:54AM -0400, Frank Li wrote:
> From: Frank Li <Frank.li@nxp.com>
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0
> 
> for you to fetch changes up to 04d00f57c168153758d2c6a2395d20aadc785e3e:
> 
>   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-06 11:19:41 -0500)

Hooks fail.

Commit 587096ada520 ("Revert "ARM: dts: imx: move nand related property under nand@0"")
	committer Signed-off-by missing

Please implement basic checks from beginnners maintainer guide (LPC
2023).

Best regards,
Krzysztof

