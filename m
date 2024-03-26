Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99080535AC
	for <imx@lists.linux.dev>; Tue, 26 Mar 2024 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444273; cv=none; b=mmTYxUPxcLpOJ3ugzUCFIdcxcv7Rxlg4SxF1cjOZHZBRUjuS54KPq5Ws6Vt3Sicil2Lvr9UWhyN5iL+vmVu+QnjzqVG+650BPnm81KiEKa0Zxex/6tEmClNB7wzCvdbNxrMkeVG5Z4CLmjRmDgVNY+VQzmSD1EYNC6jSbwTBG4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444273; c=relaxed/simple;
	bh=X7uw4bRczWyjKq0KZhbssyL+v5MIwKTEPEkZZhMtp4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asFJ4SRSMjVmsAoe6gNuoJ2tT6FHeFLgXbAiJz7nr+UCjW6bXjmkBd4ZpGE9QTw7BhZYqCygmNe0P7YD6+CXOoE27rD4JvcJZaIRq/ylZEUjQxorA21JXKReALEskSuoZnFHOTPcWqwinszyX5h9bgBxw28wr7EsU2nlCr858pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LeoEBgYU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LeoEBgYU"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27915497;
	Tue, 26 Mar 2024 10:10:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711444236;
	bh=X7uw4bRczWyjKq0KZhbssyL+v5MIwKTEPEkZZhMtp4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LeoEBgYUerCMv8/annu7qqEHbeFuTMSmJvbV2ivD+drF/QrxSvi+p08vLmHcwDiKl
	 SmNJYrx6xq4jiSOKeFDZdWwYoRapN2OR7lqm0IzPJsST+srfe2/PVPIhtv9xspcaQY
	 2JloT/gMxWWhHzOBMGLvWKY68EEhZnxXMp8ePl/g=
Date: Tue, 26 Mar 2024 11:11:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Trevor Zaharichuk <trevor@au-zone.com>,
	Greg Lytle <greg@au-zone.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: Add device tree source for the Au-Zone
 Maivin Starter Kit
Message-ID: <20240326091100.GA17454@pendragon.ideasonboard.com>
References: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
 <20240325203245.31660-6-laurent.pinchart@ideasonboard.com>
 <8fa53bf5-2467-4d21-9ac9-2824c79a0187@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8fa53bf5-2467-4d21-9ac9-2824c79a0187@linaro.org>

Hi Krzysztof,

On Tue, Mar 26, 2024 at 08:12:45AM +0100, Krzysztof Kozlowski wrote:
> On 25/03/2024 21:32, Laurent Pinchart wrote:
> > The Maivin board is an AI vision starter kit sold by Au-Zone
> > Technologies, developed in collaboration with Toradex and Vision
> > Components. It is based on a Toradex Verdin i.MX8MP SoM.
> > 
> > Add a device tree that covers the base set the peripherals found on the
> > board:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.
> And drop redundant parts.
> arm64: dts: imx8mp-maivin: Add Au-Zone Maivin Starter Kit board

Including in the command line the name of the dts that is being added
doesn't seem to be a very common practice. See for instance

6d382d51d979 arm64: dts: freescale: Add SKOV IMX8MP CPU revB board

I can use

arm64: dts: freescale Add Au-Zone Maivin Starter Kit

if you prefer.

-- 
Regards,

Laurent Pinchart
