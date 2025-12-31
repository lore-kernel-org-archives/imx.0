Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FB412CDBE;
	Wed, 31 Dec 2025 03:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150345; cv=none; b=EmPWJSRFrjEZ0c4MRyiTmWtoV+Hcep4XS3XiMW3dpalqfpAdHuTef+tESasWk7L3tWGDbkiFTLafTMtD2zjCfSKvffiIieHFVBWUe9usGXq4tfprNKj6L18X0DKlF4iQPlTfTuc0s7I833Hax5fy2OTM/elS5FNMz2FaqBb3AO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150345; c=relaxed/simple;
	bh=MqHLvL68KAQb7SXagB6QkmhNElLWAClnQb+Cnw8dcUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deIFEqa4Ib/C10dhyObioJw8jsbD/4FhXEa+B4kSGK2+y2m5YMwZrbkUGlHhBzgzeGnAzHeycXF27EGo5UpEGPjVHgk650fu0quYAwrvDC1LMHobtIzVSIufTvlAvTlk/qTW/N3f5RFgFWJkQN/YkekTNbmy3BPtvu+7iBdkCfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ic8+St29; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ic8+St29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A276C116C6;
	Wed, 31 Dec 2025 03:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767150345;
	bh=MqHLvL68KAQb7SXagB6QkmhNElLWAClnQb+Cnw8dcUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ic8+St29FOOQ39l/NebKgSGGDd4gYL1qDKdxaJlLRa/olQXp5znmSRQDplZRfDYSE
	 CHvzYgwqXWJaaDyYvf/Gd3kpMjw/xJdHPjptT36ktjk+QcU3F6JpuUq5wXRswxuzeR
	 ezUcrlCZT6N6pOWsRSBmyAogQt7bkyDNLThLNQ6Aicu+RwcgIW0S7vPWn2lHRCqKNt
	 9040PxNjefVA4qXJ2O4v0KdOF3nR0b3f3ht/70gU5RJLleVqypeQmKEEbx6L54BD/e
	 ClXs49HiTYKfNuxAVNvyF6ozv3ORFaTUpxIpFl3kChhqZSQkqMfDw1S12prKt5SukR
	 xt9smCDs1CCTw==
Date: Wed, 31 Dec 2025 11:05:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Francesco Valla <francesco@valla.it>,
	Tom Zheng <haidong.zheng@nxp.com>,
	Steven Yang <steven.yang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 0/2] Add FRDM i.MX 91 Development board support
Message-ID: <aVSTARNDcNqvam1f@dragon>
References: <20251230-imx91_frdm-v3-0-60cac61c96ec@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-imx91_frdm-v3-0-60cac61c96ec@nxp.com>

On Tue, Dec 30, 2025 at 04:58:52PM +0900, Joseph Guo wrote:
> Joseph Guo (2):
>       dt-bindings: arm: imx Add FRDM-IMX91 board

Subject prefix "dt-bindings: arm: fsl: " might be better.

Fixed it up and applied both patches, thanks!

Shawn

>       arm64: dts: freescale: Add FRDM-IMX91 basic support
