Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBB41C84C2
	for <imx@lists.linux.dev>; Sun, 23 Feb 2025 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740298657; cv=none; b=dEcyEg1ggP0YBjXAXz6asu8izjWudI7iBUQG68s2v2VDe60PcNbxEDZDFhXHmNxz97Y68ndiIoG4XARYfs3/maAX230cH8FzB8b0RPouCk0603sl5uxbx3/nAbEpkq/Gtyl6UBZfI7uibbLR1aU14WJvxd+pGwnQzMRdxt9CM58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740298657; c=relaxed/simple;
	bh=JnJaxXszhEapJdtvEBPiLgNWovhW80GOTeW5EX3OIu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oflXCZsyHFr46Wvf6bg5hlmb86QRPBEnqbcT4o8Ec81lLSVUc5TE7l5TmfbqM+NspY0feGY4D6kaHpLqhKg271Ki7RQ/N1+kDpDhp0lEwsHrkSTQXCgTWewqO9hO6+d8KjouxjqyoKJrGW9gQVBYSNu2h5CemnfXbBZwNKQTQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jnFE7BXY; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jnFE7BXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=CAIATOjAFIlfdECkmuMV7fShBSNKlp8OzqEdVUlOvEk=;
	b=jnFE7BXYztlYs6iPiIaO4A08FKdJVr3Ra2nY7ZcQtPdFJ9u+1YhyPNmMPf8t+W
	xmM/xFOKCsPRnu7viACG8RlzaPfov26+LXlTnt3gwP2iODm1C2vwsZqHNB7ojkEI
	PXAclUfi3w0dKoM2T7DwxDtOJhREunkvZnpJHKtzoyP6E=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnso2N2bpnXhGMCQ--.21668S3;
	Sun, 23 Feb 2025 16:17:19 +0800 (CST)
Date: Sun, 23 Feb 2025 16:17:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrej Picej <andrej.picej@norik.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 00/15] Update PHYTEC's i.MX8MM DTSs
Message-ID: <Z7rZjdXwN2W+Y2Bd@dragon>
References: <20250218074156.807214-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218074156.807214-1-andrej.picej@norik.com>
X-CM-TRANSID:M88vCgAnso2N2bpnXhGMCQ--.21668S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrZrWUuF1xGF18ur15KFWrAFb_yoW8Jr1DpF
	W7X347KrWDtr48uF1DXanrtay5G34UGF13uFy5ArWvv34qyFy3AF45Kry5Wr4UGr129FZY
	yF47GFyDCa4rXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzc_fUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERX8ZWe6kszsgQAAsz

On Tue, Feb 18, 2025 at 08:41:41AM +0100, Andrej Picej wrote:
> Andrej Picej (3):
>   arm64: dts: imx8mm-phycore-som: Fix bluetooth wakeup source
>   arm64: dts: imx8mm-phyboard-polis: Set RTC as wakeup-source
>   arm64: dts: imx8mm-phygate-tauri-l: Set RTC as wakeup-source
> 
> Dominik Haller (1):
>   arm64: dts: imx8mm-phycore-som: Add overlay for rproc
> 
> Janine Hagemann (1):
>   arm64: dts: imx8mm-phyboard-polis: Add overlay for PEB-EVAL-01
> 
> Teresa Remmet (5):
>   arm64: dts: imx8mm-phycore-som: Keep LDO3 on in suspend
>   arm64: dts: imx8mm-phycore-som: Remove magic-packet property
>   arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10
>   arm64: dts: imx8mm-phycore-som: Add no-eth phy overlay
>   arm64: dts: imx8mm-phycore-som: Add overlay to disable SPI NOR flash
> 
> Yannic Moog (3):
>   arm64: dts: imx8mm-phycore-som: add descriptions to nodes
>   arm64: dts: imx8mm-phyboard-polis: add RTC description
>   arm64: dts: imx8mm: move bulk of rtc properties to carrierboards
> 
> Yashwanth Varakala (2):
>   arm64: dts: imx8mm-phycore-som: Assign regulator for dsi to lvds
>     bridge
>   arm64: dts: imx8mm-phyboard-polis: Assign missing regulator for
>     bluetooth

Applied all, thanks!

