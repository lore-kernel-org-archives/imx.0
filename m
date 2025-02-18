Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3D82417FB
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880012; cv=none; b=oEbY9avofqw4sk9pgortV94rEN+LEcnDvai7uFXO/IGB1NbjTuDIDjLieZBSidKLeNTBYCk1gUbWuxXNOL2dkUPOsBvZUD/qnO4NkIp2bAqU5tzrYdYOwNJRXvy20MeAYbLusi4y13jVqIwveMnYUxjbnUz+rD6A8PTygsoxwQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880012; c=relaxed/simple;
	bh=9lsqb3KzQdXtJP11Em4GvATQ9hJVRCwBkO2a5mLLxC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVPtr3KBbrvCrXeYDiDuRPbfIN0VlbKNMEuER3KhJIOLG+8ygNmlN0NlMKyqUloolWO9sxTPXDRgKgCwLhOgDOY9+/IJcMJl6JoZdW/QgfsufFnOndk9oh5IgXBjGYkGMf2nbiIfVu8R8S3MsErEosiapFTMV/HAk63KXH6fKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=0vIasmSy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="0vIasmSy"
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 611F11F8BD;
	Tue, 18 Feb 2025 13:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1739880007;
	bh=Mj3PztAnvD9vDz6xP2L4dDXDamq37tJkkDcB9UoW23A=; h=From:To:Subject;
	b=0vIasmSyAYoHCecFVq8qfDEAKDf5y8zcgzKEgmSf4SnjZUhpdWkZy9p3GuieOjyRD
	 iDV89X9ERnCVMIZRnHABwQQOGCkPs8AG+tpupDCqLnV0qj+xsF9jwzTiZvWafig1SK
	 usqZmaBUTHQVPknMUVysdLDgSU/PylBZFlYh0GK92wWbJbM9M1qeny8DsiuRRjPtUC
	 e9+kCupqf02xuhszS1x6QARjQXfmlBwP49yQSoHj4FSJEAr5jXM9rPdu+U+gYbkvXR
	 oBT7KCh11h9tz2B4YIEmpkgxB0y5mTW6zaxFvbp1eEzJgeWx8NKh8cVVCBreoZ/lMX
	 Ztyk/MSWmcV2A==
Date: Tue, 18 Feb 2025 13:00:02 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-verdin-dahlia: add
 Microphone Jack to sound card
Message-ID: <20250218120002.GA15270@francesco-nb>
References: <20250217145744.179213-1-eichest@gmail.com>
 <20250217145744.179213-2-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217145744.179213-2-eichest@gmail.com>

On Mon, Feb 17, 2025 at 03:56:40PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The simple-audio-card's microphone widget currently connects to the
> headphone jack. Routing the microphone input to the microphone jack
> allows for independent operation of the microphone and headphones.
> 
> This resolves the following boot-time kernel log message, which
> indicated a conflict when the microphone and headphone functions were
> not separated:
>   debugfs: File 'Headphone Jack' in directory 'dapm' already present!
> 
> Fixes: 874958916844 ("arm64: dts: freescale: verdin-imx8mp: dahlia: add sound card")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Cc:stable@vger.kernel.org
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

