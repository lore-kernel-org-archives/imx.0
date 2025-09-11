Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763F32AD22
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 01:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757552790; cv=none; b=cPumxHAnh5qC+7bR3vPpt3hhScUAU9R3kUg0uKi704E0oQv4Pqf0Rb2YWmKiaMyJJp5h+kpbo0Dj/6mSivYjy7+eo/e2IxdBbj48pk+hAizSvpTCcxtFDlGkzqxeZ6RnscAfhBn1nCcKZBn55/Z8P1U6iFvDWTLqRhbGuKFUi/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757552790; c=relaxed/simple;
	bh=JYSW4MB9pMusPzumKqihWAqFYMngihvRZKS64yMKi6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMGtbcBdTG3jc+2kVDLYvo82ld72TfCVb2h90iy35GUcMNjkdmjGx0arkRGMzVad9Ky1/OTY1wYioUGEPqsc9WkDnT+suB1bz90H1b4qPhqpXTKwaU3JZcatlqhImUEhUw4t8pkysgMuBzeaTCB55q6jgfkyF5w9oA2bcLifyLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=k0j2tXMd; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="k0j2tXMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=KbYMnuTWyfN0Gz6b3slKCQiIkGgeBPU1rlOHaU7fi2E=;
	b=k0j2tXMd+2VFECbFDfy941g+mbxW1NBDwcrE3/wLDkiaqNbzwytmU1S/CelBXR
	junfLtIVEt0g+hIijhJoz7K9h+uaVeNmC32B+tplAEFhVyeq4yIbFT6Hgtf4xr9U
	9NL6g6GKuA3VzM+iZUIjYAByrm7KOCd/HHcX4pxq6cttg=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHP_d_IMJoJQFfBA--.42211S3;
	Thu, 11 Sep 2025 09:06:09 +0800 (CST)
Date: Thu, 11 Sep 2025 09:06:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Hu <richard.hu@technexion.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ray Chang <ray.chang@technexion.com>
Subject: Re: [PATCH v5 0/2] Add TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G
 carrier board support
Message-ID: <aMIgf50uRVg7fxKx@dragon>
References: <20250822-add-technexion-edm-g-imx8m-plus-som-v5-0-bf745447345a@technexion.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-add-technexion-edm-g-imx8m-plus-som-v5-0-bf745447345a@technexion.com>
X-CM-TRANSID:Ms8vCgAHP_d_IMJoJQFfBA--.42211S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOksqUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQHyWGjCIIEAowAA3i

On Fri, Aug 22, 2025 at 03:33:07PM +0800, Richard Hu wrote:
> Ray Chang (1):
>       dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board
> 
> Richard Hu (1):
>       arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS SOM on WB-EDM-G carrier board

Applied both, thanks!

