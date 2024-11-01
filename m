Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4561598F4
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456059; cv=none; b=qWfNiT2xXAZY+J1FB+Jr1xSJXtas0lGoLP2zb3eLV783BWMw5/RR86ekCnfIEOz782tKrWbKWuC9aVO09QQA+tjLkk4+xD1855yGdGJ2j4eO+u6HYG20kg9jVSC46/9AG5gOvODySkVjECTd4UgB1UZ+trVwWy6zBmb/zEFAP2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456059; c=relaxed/simple;
	bh=62G3rR/IOqIrkP2hPOwpcGpbP/cEvQLeb2BXmg4kXE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm8K1u2SUe04MixT3z7NexWi9CJiAPgQ12wuqYU0HndoZ1G5GIdacjaYrBKnlcTH8b2ITgpVbZ3rTn+fRd9YcKeHKUkTrSrsbco6hbvijpXz4Wcl18xY54mY4i9oU6pKJ7NCzmtfgTVELu6WfZ26UCNuKoQJLELRZzfu65m7bUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=DoamlOQk; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="DoamlOQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QZXkEKg8UMMMm6kMsBNgepDvQgd83Ldg8fmPaQgqqcw=;
	b=DoamlOQkoGTjoHdzVo7tQeH4A2jVJDBmBBFryVUJ8NQDNCBR1wCOyi9t/2KUrR
	Pi76EKmMpc8leqH6J55yIzLd7+30fHS8b9j+Y5+3cJXEOdFzv1Ijt8cezDJcGgUF
	aaz/qZGl+S91NCO2ezdxKp7i7EIZdvecONU3GSM2wTa4A=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXFgfsqSRnPmpkAQ--.13510S3;
	Fri, 01 Nov 2024 18:14:06 +0800 (CST)
Date: Fri, 1 Nov 2024 18:14:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v1 1/1] arm64: dts: layerscape: remove en25s64 and only
 keep jedec,spi-nor compatible string
Message-ID: <ZySp7J4JTrrnT62R@dragon>
References: <20241023201129.1382895-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023201129.1382895-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgAXFgfsqSRnPmpkAQ--.13510S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4kuw48Xw4fAr4UZw1UWrg_yoWxCFcEya
	y7XrnxG3y5CrWIgryxCa1rW34xWrWYvw18Xr93GFs5t3y5Zr15Was8Kry3Jws09r4YkrZx
	Z348Jr48AFy5CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8RHq7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhuKZWckdPudrAAAsb

On Wed, Oct 23, 2024 at 04:11:28PM -0400, Frank Li wrote:
> In jedec,spi-nor.yaml:
>   SPI NOR flashes compatible with the JEDEC SFDP standard or which may be
>   identified with the READ ID opcode (0x9F) do not deserve a specific
>   compatible. They should instead only be matched against the generic
>   "jedec,spi-nor" compatible.
> 
> en25s64 already in drivers/mtd/spi-nor/eon.c. So remove it safely and fix
> below warning:
>   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: flash@2: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['en25s64', 'jedec,spi-nor'] is too long
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

