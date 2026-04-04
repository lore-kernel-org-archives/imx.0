Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E541D5CC6
	for <imx@lists.linux.dev>; Sat,  4 Apr 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775314039; cv=none; b=DvQNliEZDvpnUlqh1o7kEhf51xapQIgi8CkPySsgmfIBmx+7TnSH6xPxnw4oDRCaL9e8KEgXRWycW+009OmWXIyI4GdXal++tIH/s3fjPpcH4lnqe2NVztCxeh0hpopelKgpn+sl5lRkKvmRnh2tJEkt0fIvYDshUvolG1kSSkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775314039; c=relaxed/simple;
	bh=wkWsq3wOxvvGHQk5g9AdcPeG8Kmz14QfgWPiPSY/fAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMROk/chHs3E1RzMkt6faLSKFN+I8dIqXnz8CdH9PRSIGts2609NYc425K5sRAjEoMofgYsx5fQ0ivR18AXUOmuY6TtBqBl07WfeOO0CZWUjxEcUhlDrv7drs8jFmTycLyKhc6XiKElusb9sPb8u9X+hDTz7V6idCOEobcQQnPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgWB8Cvr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgWB8Cvr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F677C19421;
	Sat,  4 Apr 2026 14:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775314038;
	bh=wkWsq3wOxvvGHQk5g9AdcPeG8Kmz14QfgWPiPSY/fAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgWB8CvrnBabd/PPFTftEM8Yg4ce7Bnp5i35nCClv52Fol4A5/jbB0PR04WD4D5nx
	 OZ2mTONoFKKP91Q5Bb3d0CUgEm553zGSmU5/qFMxjD6MKaD1df3y+AmdN5rTgL1kjZ
	 x2F/zt4suiuQB1Fq+NvvHpgMld8/IVU7q85yds8LTwwKOQdzf+WpJOgzYjuEXHSBOz
	 m3masDW9xk0r2292SJ79A4GOBHboGlVxErafkxqh/biq5bsP9qsGLouFD2m/avjxjY
	 LMe2uTJmkZdCNUaF/FBkCCdrKxOAx+lGKBCZMVpLbt6atGPBpLVZrqKfV45a3+fJem
	 wCqBTw0AfzJqQ==
Date: Sat, 4 Apr 2026 16:47:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/4] i.MX arm dts changes for v7.1
Message-ID: <20260404-thoughtful-placid-boobook-da26da@quoll>
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
 <20260330141444.3789193-3-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330141444.3789193-3-Frank.Li@nxp.com>

On Mon, Mar 30, 2026 at 10:14:38AM -0400, Frank Li wrote:
> Frank Li (24):
>       ARM: dts: imx35: rename emi to emi-bus to fix CHECK_DTBS warning
>       ARM: dts: imx35: rename i2c clock-names to ipg
>       ARM: dts: imx35: remove simple-bus 'usbphy'
>       ARM: dts: imx51-ts4800: rename fpga@0 to fpga@0,0
>       ARM: dts: imx51-babbage: rename at45db321d@1 to flash@1
>       ARM: dts: imx53: drop fallback compatible "dlg,da9052"

This, just like arm64 pull, breaks users without explanation. You use
incorrect terms in that commit msg which might mean you did not perform
proper analysis of compatibility. Commit claims compatibility string is
not comaptible and as proof brings dtbs_check warning. So the sole
reason is the binding. What if binding is wrong?

Commit msg must explain that.

I looked at the drivers and it looks 100% compatible, so commit msg is
clearly wrong and this might affect users of DTS.

Please resend pull without this commit.

Best regards,
Krzysztof

