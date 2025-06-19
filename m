Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F7C2397B0
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 04:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305887; cv=none; b=fzLnH8GgC26BoNNT7DATazQdbudGQpK8hDDF+FiZpkaLACQ8A2n1dYCCpseOTiudLICCpbJZxo7TXxlQ33EOj2CxFlzHMKMUnHyPTPZArgARVRzg4jO3bLX5pGp8akbYVoLIyb9hBVmcXwGGHSTXPWFCR1SQJFo7iNSRle3N5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305887; c=relaxed/simple;
	bh=kmlXgdsNUgn8XgiTxVSrLP4WUDdb5I7hA+XEzKU2m78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/o9WKg6ZZQhFU3yggXO0YvYu0lSb/tAid6eTsex3sIzCR12udsTqTmNMQWw4ySA1nlwNFh7CWRUGHy3RSl02CFwO5q7SsVEyeOVhEvdb2OQeM7b9PKdlf9sl7EWuojCJXKTwZIqCmKlFINDh1r1eiAF5C2oSGhY+BWtMOLkz/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bSShQE55; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bSShQE55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9jL3UrAs4Pzh8kulwSxN4uC93Iezx2+kJVwgk+0EkKw=;
	b=bSShQE55tirU3sipXpiYeBLELSwKyTdAktdIeB5Ju68r2tne88Yk3mvskCIpQe
	HaLjME3x4OYb9HAHv3p5Sog2wQltkjwVHUSM5K0shcFeGUdLE7NdLhmi6nUsGiIl
	0sxO22PUZx64GHwecIFZYm772I4O74C7b/1xl/FcsfCPQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnjlE_jFNomST8AA--.27276S3;
	Thu, 19 Jun 2025 12:04:17 +0800 (CST)
Date: Thu, 19 Jun 2025 12:04:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Display
Message-ID: <aFOMP+eFULDDAtOr@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-7-a8f0195420aa@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-7-a8f0195420aa@gocontroll.com>
X-CM-TRANSID:Mc8vCgBnjlE_jFNomST8AA--.27276S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7sqXDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgtxZWhThWMa0QAAsb

On Tue, May 20, 2025 at 08:34:56AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
> comes with a 10.1 1280x720 display with a touchscreen (not working in
> mainline).
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!

