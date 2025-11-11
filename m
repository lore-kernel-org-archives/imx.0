Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692A941C69
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 07:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762846394; cv=none; b=IOCx/Wd0cUx92gOmf4beAK42a5cI6I4mjRK6Qj3ngqkJBi9ZFBBnPeyrj7IeftnWMe5I9HBCGKU+XAvRXlhPz0u3UQIieFQQeFGhIpMKyA21O01Sr1sBR9VEz4oQUZypOOimcy2Yrfzg6sFFBE6NFNKMC5LjsEMDXlf7403g3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762846394; c=relaxed/simple;
	bh=uplPXJMzKcAVAjzc8AdoyO3MKm4Opeor6rUmaY7BFP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUD63EPSPFDcvHJqMFo0wXp6x8L0N434TaKqK6GDVlyt57LAPUI8265U6CkRY1eyQyF7g/QPjt+WGRlAmIcLCI5F9t44jVTmdV6ywUXK8UavLG0AarsNQfEUzA3O8FvryelyEBJB+l9UJawzGlgug6gfAuBLAX3EHq3izg6OJxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pCGrPFo8; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pCGrPFo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=A6MYlnhD622vn+jskvtP2u3P8TmkgrkKitICNkrmhfs=;
	b=pCGrPFo8uuYBh8CwNEyIz8LkgTxF1S38/tKl8mkLe/rQnC/7CQYUhVlPCthal5
	Y444dprs5ZCeKf2knL9EpU9B1bjhxloPOCCCvCnPUPKOux+XPpaSs/8Ug/mhfPnu
	/UzJ+eSFO7gcOQoad+30bFkU4r/XwELH+eVZBtB5lQ+iE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHDpuV5hJp_hnNAQ--.5255S3;
	Tue, 11 Nov 2025 15:32:39 +0800 (CST)
Date: Tue, 11 Nov 2025 15:32:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH 0/2] dts: imx: cleanup warning cause by fsl,mpl3115
Message-ID: <aRLmlQHs5tF2lBb7@dragon>
References: <20251022-fsl-mpl3115-v1-0-93187d095efc@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-fsl-mpl3115-v1-0-93187d095efc@nxp.com>
X-CM-TRANSID:Ms8vCgDHDpuV5hJp_hnNAQ--.5255S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrGF17CF4xGFyrJF43uFWDXFb_yoWxWFcEk3
	y8GFWkZ348Cw47K342kr1FvFWkG34UAw4qgryYg3y2vayI9rWxWrsrKFy3W34DGFW0vr4v
	v348Kr4DXrW3KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU86wZ3UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhe9I2kS5peamgAA31

On Wed, Oct 22, 2025 at 04:43:20PM -0400, Frank Li wrote:
> After commit f11e4374b(dt-bindings: iio: pressure: add binding for mpl3115 )
> vdd-supply and vddio-supply is required properties.
> 
> thread:
> https://lore.kernel.org/imx/0e00bb14-19c7-493a-9629-354bac3a273e@baylibre.com/T/#t
> not prefer change both to optional. So update dts to fix CHECK_DTB
> warnings for both ARM and ARM64 platform.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (2):
>       arm64: dts: imx8: add vdd-supply and vddio-supply for fsl,mpl3115
>       ARM: dts: imx: add vdd-supply and vddio-supply for fsl,mpl3115

Applied both, thanks!

