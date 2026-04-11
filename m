Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94811B6CE9
	for <imx@lists.linux.dev>; Sat, 11 Apr 2026 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895251; cv=none; b=bjcucmCkvPIyUxeDqCaqEtJMcxFvCpp9yHlwQgmNQbuklb7ua1NJ9R88X36/pMtXoPSj2t9OQjDtrJURrOhtzTbDw/LAE6YjvoSsNUn8x8ZvJ70JLg8+ofNqoQn5OB6dAXTsn4+Dddbyz6oYh50Yu6TBMS9z0DHgQu0BAG7/HdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895251; c=relaxed/simple;
	bh=dwBCOiXBWQ9YL4DB5lMeqs9qrMikjKAukVChq9kRbDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/zvi1+qRwHe3FxaLnSPexGB5p+1uRrNN6ey6dIJx+U9xtBtKcVI773H01OLvdUVUjT5cFr4ywbTf9i/mjK6aUQpUYI4DPUBVAdAFHhzAWc1ly6R+w99djGDuOpPQp5wZw8X6oFNW79N2PnA4oo5kTkpA05PywAXvRSvCviZSkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhwFuPMP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhwFuPMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89ADC19425;
	Sat, 11 Apr 2026 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775895251;
	bh=dwBCOiXBWQ9YL4DB5lMeqs9qrMikjKAukVChq9kRbDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhwFuPMPpUhZQESrVQ7+1xVqqd844um0qi670mptM2+luPvwdYlm73uks5Oxwyim5
	 pd3Dxztg3X9znhTbFIWjZ44uwtI8RR5Zddyb5tEC06MBEgTaZQPBEp/IvYzyQFe6of
	 wvzKGah5MdEaI+Ny8jOHr7XnKmRrXNT+hjwFQnoQ8UQZHkSrQQ7uLETHrtzJdy9vaZ
	 J5LHDkcgxhaoypQy5UsyviYgcNnvU0xhNfPk4t0pmA+5m/SNDZdMIsiHfj5UR9AFz/
	 snLMBLyybSFWvDS3JbyQrxnFuGfI6ZbeFWMlCrrQAjpksDNMcKI+wM+KpJN52dUyCf
	 JxlYYfJTb6ZWQ==
Date: Sat, 11 Apr 2026 10:14:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] i.MX fixes for 7.0 round 2
Message-ID: <20260411-ancient-okapi-of-excitement-e5e22f@quoll>
References: <20260404001857.3374669-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404001857.3374669-1-Frank.Li@nxp.com>

On Fri, Apr 03, 2026 at 08:18:47PM -0400, Frank Li wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 511f76bf1dce5acf8907b65a7d1bc8f7e7c0d637:
> 
>   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-17 23:24:44 -0400)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0-2nd
> 
> for you to fetch changes up to 42a9f5a16328ed78a88e0498556965b6c6ec515c:
> 
>   arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for PMIC_nINT (2026-04-02 22:07:41 -0400)
> 
> ----------------------------------------------------------------
> i.MX fixes for 7.0 2nd round:
> 
> - Fixes interrupt storm by adding pull up pinctrl config for pin PMIC_nINT.

This is way too vague. Commits are odd and suggest that you rely on
driver. Or that DTS and driver are inter-connected. That is a warning
sign. You need to explain all this here. We had internal discussion
about without clear resolution, so I decide to merge it.

But in future this is your message to convince SoC maintainers that
such DTS changes are correct from rules point of view.

Thanks, applied

Best regards,
Krzysztof

