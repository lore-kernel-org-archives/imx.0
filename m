Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D195382
	for <imx@lists.linux.dev>; Wed,  6 Dec 2023 01:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFfcdYyH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5243C433C7;
	Wed,  6 Dec 2023 01:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701827918;
	bh=Db7+kqCZSBEIimX8QgK7lIl9DnyCoYu2s1pS0gFyC90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFfcdYyHZwe7QZqj6LBBh/KzmVO+mpyreomT6tEcNm87Z52lK6u5QhyEUHd/Q3m1U
	 ONmjPTK252s2Cq0VTEfRJdyS4wDSfHgDwA/qbem6pJDwNKBnagkW54WBhQkZLIEpQ8
	 dwpPN8tNPJSRt/AXV3mS/P/yx/WI8ZTQ4tGAwkRe4Kw5Xq3/49XowZnt/RoCwXaRg5
	 OGKwspsobTWk27xLULRkb6hBK86gtuSALceOBWP0btiCEfhjeBrLYnpu0doIET66rB
	 VyTHSvOWZXwjpqnVwo29wKtJ0Opo7r7JtOQaaNe43FMD69K+7PNPRePaoZI2O50OOY
	 CRLgip/ngW9dQ==
Date: Wed, 6 Dec 2023 09:58:32 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: reinstate freescale ARM64 DT directory in
 i.MX entry
Message-ID: <20231206015832.GE236001@dragon>
References: <20231127053414.2200563-1-a.fatoum@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127053414.2200563-1-a.fatoum@pengutronix.de>

On Mon, Nov 27, 2023 at 06:34:14AM +0100, Ahmad Fatoum wrote:
> The MAINTAINERS entry's F: currently only matches the 32-bit device trees,
> as commit 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
> inadvertently dropped the 64-bit DT match when it added the 32 bit
> matches. The entry has a N: imx, which reduced the impact a bit, but
> still some board device trees may not contain the substring and would
> thus not be covered by the entry.
> 
> Reinstate the missing F: line to restore previous behavior.
> 
> Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, thanks!
