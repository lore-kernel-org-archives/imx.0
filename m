Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD042749C1
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462473; cv=none; b=ZCoDj+sVkgV35JJ2TpNKR65Jke7ydCogOk9cRsA6CU0La/e9Q52XJVs6cfHUIu9rWc8HOj7IoITikPG/hXWJHNTlG9Q201FPca339b9YsfqH/hldOy9qTW9N2n2qJ+5LGBxvFFDPYL3m42THvt1fLxTIyHmWpWUOOEfef5m0D10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462473; c=relaxed/simple;
	bh=J41h1gGqXCp+D7XdRgVOjoCXlGiSBPgGvotcfkroK8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQYIbvgwOroyBbvO5tnfCo048VD9NjmzKUCZG4kEAZNbeIBe3+D1ykVEkWK4zSyyA9fAmMENWYkJ/CII3vFRDO/gBbs7kdLAG7Y+2cSq1zruEkhrv2w6asWV8LBAumeyc/wJoDBJ/m2jrT6LV6qZpe/ECQlUNR+7JBspuSYUZJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=JoyFheb1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="JoyFheb1"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4AA641FB6C;
	Thu, 15 Jan 2026 08:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768462462;
	bh=UbEuSfoC/WNUVqtU0A2Dex7ZSI1NDiP/B9w9lXMIyPc=; h=From:To:Subject;
	b=JoyFheb1cuMVGql9CA2LpqlWfMk7H6OR/doc2/8n0Dx9mO7plT2bjUdHET25mYSZ1
	 /6D+24YHDCONqoVkdoWsUV6J9x9YdkfK9KVpBdAVIJ8KIjvC2TOxtyuXlmoU118iWB
	 B3gZGRkyZZvb6RCbz1ctluG523jtrGS52mhzmwQhyh+sCzzTLuu0gE+N9X1QDJ4HqX
	 iJ+rYfkd5FyhcT1zO8THFCNiQIEWI8E8+TZLOi5HSpjysqoR+ycKGoUzc5l3mNb8wN
	 rM+u8Xn9XbBC22pAJBMyAliNS5Dcykkq352IrXhws0RpMdvCsQxO92gz0hb5Qk5pVf
	 UgxGbo+NwZA/w==
Date: Thu, 15 Jan 2026 08:34:18 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kwilczynski@kernel.org, mani@kernel.org,
	andriy.shevchenko@linux.intel.com, bhelgaas@google.com,
	hongxing.zhu@nxp.com, frank.li@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fsl,imx6q-pcie: Remove the deprecated
 "reset-gpio-active-high" property
Message-ID: <20260115073418.GA4366@francesco-nb>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115071816.115798-1-sherry.sun@nxp.com>

On Thu, Jan 15, 2026 at 03:18:13PM +0800, Sherry Sun wrote:
> Commit 2e81122d681c ("PCI: imx6: Convert to use agnostic GPIO API")
> deleted the "gpio_active_high" flag in pci-imx6 driver, so currently
> the imx6 PCIe driver doesn't support "reset-gpio-active-high" property.
> 
> Let's remove this deprecated property in imx6* dts and the
> corresponding dt-binding.

Are you sure this is not breaking anything?
DT files from the Linux repository are not used just in Linux.

And , the property is still handled, see commit b8b80348c57b
("gpiolib: of: add polarity quirk for Freescale PCIe controller"), the
DT compatibility was not broken as you seem to imply in this series.

Francesco

