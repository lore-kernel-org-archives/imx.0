Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55D2367C9
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 06:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751957427; cv=none; b=jeu6xKn51qJKTdB6sgXzgyiwSdgaNcwhUKA5lPdZRUHjb3zQx8AOOFeZDEnQ2DrHCH47cD8e9zk9HEQ+nYBfKCFGgrNiQsR2CnDZ5RwFL++2E+3re7OyAD4OdTJ4/9lzgRiq/AYCVPUb0snzylQ7IWwpZpANwKVVBRtGGFNvAkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751957427; c=relaxed/simple;
	bh=NszIzPfg+J7mLUyhSZUBtCIxa0lA1Mn/+DBmH6nBQDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQUHdjHGS10fMsiu+FJiuiV9tKn6FZI6Z7yiE7Ls+waLevcLaP7T1kTPJAYMOFkhpfni4ApkS8nhg1J49fwBDGTDjPZrk/iQ3WZfhI4OQGxVn6GtMD4HKB2sIX7RF6yET2ePgkIgM/EZ9/g6EBOsmQQwHPhVBFnDUTIcXBXL5Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LBCwjU1S; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LBCwjU1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TKk5nHWGdylz6lko9xpOMyn5Y/E4mXiwt9y3ZARKnPw=;
	b=LBCwjU1SrEDmdsfnssxd18SMkm1w7CgeCoKxoloj46sCrGbsdmPmv0qiMjUMmL
	m8SUe6TLOW1piGGAyb39dletwHqrfVBkvNdjYF1kgrNR8bKkvKsNKHjs1c0FbDlm
	0yiyDPQ1McLPGQcGQvr7oyQfCfAC1QrqBnn1b1V/eFGVo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXX_aKv2xo1nBMAA--.64566S3;
	Tue, 08 Jul 2025 14:49:48 +0800 (CST)
Date: Tue, 8 Jul 2025 14:49:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 0/4] Initial PHYTEC i.MX93 overlays
Message-ID: <aGy_ivfclZ_YXYui@dragon>
References: <20250708042206.329208-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708042206.329208-1-primoz.fiser@norik.com>
X-CM-TRANSID:Mc8vCgDXX_aKv2xo1nBMAA--.64566S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOmhFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxOEZWhskC2smAAAs0

On Tue, Jul 08, 2025 at 06:22:02AM +0200, Primoz Fiser wrote:
> Primoz Fiser (4):
>   arm64: dts: imx93-phycore-som: Add RPMsg overlay
>   arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
>   arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
>   arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay

Applied all, thanks!

