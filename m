Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA6C4A3C
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725109778; cv=none; b=RBOLzalZW2Ef/L+f6Ei86Uza/3aZ1G4blXk5AvZxPKC1M9xcTziwAOpHI5M0hsVEQrpAj6s5khUpWccDY2BGQmYj9nc8zvCiBcFAchtD5MxjakVfd5xzv7Q25/BPdB6oKWhsNFm1GkghPAuaaOdDM+Ss6T8/7vzOvPiA9s2w/50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725109778; c=relaxed/simple;
	bh=JhbA8SLC7PqTOJM4EjydUp66srUh+KBL2NPDw8VnI+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmDkTv0yCtEIvIyY9eCRfphOLkfRLxsVbEHlL3afRBqlVBuOr8Yqv9Uym7XyJtLn9mlqrLPAQutVyawo8HVdSIwm6ZFHjf7vU3u6pHEKRMXaxJ/5qgiGT4KU+7ND5BfraC7hQ82LhMNYXDD3KblS3ORMN7ld79My6rjKXFEGbI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=KZGpWoYn; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="KZGpWoYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=hBxY1wW+vCTmGRcQG2NrNyjhBF4l614KDLIpuKsQrS4=;
	b=KZGpWoYnBnxUI9tXJzTbd1KZVZDPR3pqI9QC4nSUmkNoa01s+BCekOiZWobjfC
	HfRMcMJ7SGvFt3I/6vsmjhVeMf1iVP8z1F7dkW79BbUbCdwGdDnT2RvnCBHWVwnr
	lpl70qEeXE6cQ+0nwGkAdLmEZLa0Tk9YWj/Scm9Px8u+A=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3X_LAFdNmMzI6AA--.19966S3;
	Sat, 31 Aug 2024 21:08:18 +0800 (CST)
Date: Sat, 31 Aug 2024 21:08:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v5 0/2] Add support for Kontron OSM-S i.MX93 SoM and
 carrier board
Message-ID: <ZtMVwKT5NbTywXtQ@dragon>
References: <20240813084934.46004-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813084934.46004-1-frieder@fris.de>
X-CM-TRANSID:M88vCgD3X_LAFdNmMzI6AA--.19966S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DKr47Ar4UCry8KFyDZFb_yoWfJrbE9a
	4UWa4DK3W8G3WIkF1Fyr1kX3ZxKay0kryq9wn0gw4fXFW7JrW5tFZ5Kry3Wa4rWFWrCa4v
	ya1kXa9rAw429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbD5r5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxBMZWbS-Ekw8QAAsy

On Tue, Aug 13, 2024 at 10:49:03AM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Patch 1: board DT bindings
> Patch 2: add devicetrees
> 
> Changes for v5:
> * Address Shawn's review comments (thanks!)
> 
> Changes for v4:
> * Reorder enable-active-high property
> * Add dedicated pinctrl settings for different SDHC speed modes
> * Add SION bit for SDHC pinctrls as workaround for SoC erratum
> 
> Changes for v3:
> * remove applied patches
> * rebase onto v6.11-rc1
> 
> Changes for v2:
> * remove applied patches 1 and 2
> * add tags
> * improvements suggested by Krzysztof (thanks!)
> * add missing Makefile entry for DT
> 
> Frieder Schrempf (2):
>   dt-bindings: arm: fsl: Add Kontron i.MX93 OSM-S based boards
>   arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier
>     board

Applied both, thanks!

