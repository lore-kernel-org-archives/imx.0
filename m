Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C362283C83
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777466774; cv=none; b=l7BhTb13G5dU1CLP7ADEHyyO4Hm1B842tW8zkH7f15amb5RGUqvq74Iz+OLzimMCI6Qldox6ulh++pVgadG2BykFvBjCxqaFu7EQGCwCejnw0rY2DUf2CsQByrvngufzllKkQfGEqIOgIMVGQzYm2NHvCRzw4nxSUis/KLTVy0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777466774; c=relaxed/simple;
	bh=ACbog7xw7Wnwn8unL5NhQXkcT+RQGICtbl7byDwhpxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeKZ35VYLsNVMbWBGSTPePpb0sQ7Z+1uCOOQ/ThWoGvC86Gl2aQ2d737V/YdoK2U3BFbgoJmwwuIe4gQP5yjK0kWhlEuyFu1bAgyKahfq/GHKiesrP9KyeYmaQKYTxXq4n2RAduyclblxhKf7gEYfGcSxa2TvrDVwcosL3AhIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=acc7YbmW; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="acc7YbmW"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1CBE622B80;
	Wed, 29 Apr 2026 14:46:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777466770;
	bh=F8YrPdCR+u03ef1UAvjgy6RoNtkjTp2zBuXHNNCd0/s=; h=From:To:Subject;
	b=acc7YbmWC0WpRoKbLyQBQKAchhy8m8X/n89Sb0CKBYtXDTrGj/yn//yUoCln5LCSK
	 qFAMpgjVJponjMPWoVqOXbGu72KDNJjsiB1kuDuQ9wI7oZOnOwLR8ky/pj2z8tOddT
	 sbkJjJfRrsA0co2gZ2eNZ6WuuS3De3zw9ZJ7jGG/uGOfi3PFt//Tvm1gseUF3fYBd0
	 EpUgXHZVHmKoMSoBkdYB0qk0yTRlmLRJqZl1fhin8WJb6sdmn4RiUV7fmmWmVfn2sk
	 QRj+62AYVPf4EJyTkGhLes8Pav+FnDFNA7u9JKEOWmaGm8iUaYUBlnr9whZaJCdc60
	 LrE0HzWq2EfFw==
Date: Wed, 29 Apr 2026 14:46:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com,
	justin.jiang@nxp.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
Message-ID: <20260429124606.GA62742@francesco-nb>
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com>
 <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
 <d0dc01c7-dba1-4f25-88ea-a0840559cf38@oss.nxp.com>
 <bde82660-0550-4614-80a2-bf4f49b92063@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bde82660-0550-4614-80a2-bf4f49b92063@oss.nxp.com>

On Wed, Apr 29, 2026 at 05:26:02PM +0800, Joseph Guo (OSS) wrote:
> On 4/29/2026 5:26 PM, Daniel Baluta wrote:
> >> +
> >> +&flexcan1 {
> >> +	phys = <&flexcan1_phy>;
> >> +	pinctrl-0 = <&pinctrl_flexcan1>;
> >> +	pinctrl-names = "default";
> >> +	status = "disabled";
> >> +};
> > 
> > Why add this if it is disabled?
> 
> The resource of flexcan1 in System Manager is assign to M7 by default.

I think the correct status in such a case is "reserved", am I wrong?

Francesco

