Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D3B1C3BF7;
	Tue,  5 May 2026 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990541; cv=none; b=d9EhZMazA0aN4a37PlneJlS8Ed7EOZtNHh9QYnPx/Cl8we9Q3PzfmeoqEHF2iyl4Sjb4OMhN+MVLGEkBYOI0r4oTXhalnwPh32KMwhAW42KgHVsqCOtVIso/KUk7umJ7jdd6ch9TDW8WUD7Y70e8p4jw647sMYEGARQ6pKBPtXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990541; c=relaxed/simple;
	bh=FQsBhAgsYHplHV2/vcCwYjBqbsq7KXkPO3MRqXSfMok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqbCeD1x3CQxvS1HkJxI9LYHue3T1CalSgIEI+mtxhjoz+j6kCC/v0lF4gerk+juj9WgTCKH4c/nChmSjUvV/P7v0JQs+OINZrGVtuRq6jLxUR5RbB8FqGV6v9twbdGf+6RnzYZpA2sHIH2Dr5uo+A6kdQjUJN7kuioQ459b6xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6osNGJm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6osNGJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698A6C2BCB4;
	Tue,  5 May 2026 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777990540;
	bh=FQsBhAgsYHplHV2/vcCwYjBqbsq7KXkPO3MRqXSfMok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6osNGJmPtrOn/dO5V7lDP7Lu/A7Jxq46ChObn5PlgAvC6B/uvqi6QdXgDtylkKuM
	 fustiBuO44Cvy9/Z8gnQ76Exw7F/EXMUM4tSZWdpthwoUGaAcvKTxfr129TuZP6AEp
	 acVDIdJWpmY9DvuBke1cI4BAhj6/Bo7OzY2Lo5qNrUeNE3QZsRE8RiO0sPN9cQVgoK
	 UIC3P1lMZp8WkwsjfaA+BGMryIpLkoMJpkbBeeXm28BjehqGYWBVps0s8ISiwSZ3ti
	 UIk9UYCpdU0ypAKcGcmQqzOppY78h0DnZSdZF+XEj94/78Kh78Mv6n5pO1dnuOpRqM
	 Sg6yu/4lU10xg==
Date: Tue, 5 May 2026 09:15:38 -0500
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com,
	victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in
 reg property"
Message-ID: <20260505141538.GA2547282-robh@kernel.org>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>

On Mon, May 04, 2026 at 10:21:42PM +0200, Marco Felsch wrote:
> This reverts commit 16c8d76abe83d75b578d72ee22d25a52c764e14a.
> 
> Remove the 'reg' and 'reg-names' property from the LDB.
> 
> The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
> (i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
> register ranges with loose register definitions. E.g.
> 
>   - On the i.MX8MP there is one register which controls the AXI
>     threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) - IP2).
>   - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 settings, PXP
>     handshake, ...
> 
> In conclusion: it can't be ensured that one register belongs to one
> dedicated IP and the LDB is rather an exception than the rule.

It is fine if there's a child node for LDB if the LDB registers are 
consistent, but the other misc things are represented by the parent 
node. It is certainly not a requirement that either everything be in 
child nodes or nothing be in child nodes.

What I don't see in this series is what problem does this fix? If you 
are going to break compatibility, then there had better be a good 
reason.

Rob
