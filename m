Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D872F2D
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 04:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713760662; cv=none; b=NXmvN1ukqxm9tRZ5/ZtQ2Uz26PJ2zXXBKVmIPtHAkJKdEg08uLshoPxoQNlqgbbEBL3S6l0Bb8UOqD8Ax21NWNqfsCjH2i44DLY8wVlTZyxypjdT2Hu/3iH1yVNoODQwL5n7371adODyyKP4goo4jEVBlTkDms6zEMpIlcCJ6nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713760662; c=relaxed/simple;
	bh=VMo49RKyDZXwJuvtdWgYMG2IJ2P0BVT+Va85L44nOz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtnVR8Sx8ZRuFac+jYspo+x6YAvnQTpB8EhmVJhvwBa7XbU9UImG6GQn+C0Efb7LCY9SKsLZeqUIsLMTYyEW/qp1e7HG2VYSSTAmfhRUBd1EjuRoavA+2F4hb4bui9PLupBQZbYk/tP/rsVS0gZExL2vBuXKxT2YK03QgpU+5h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=aUGtsvAr; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="aUGtsvAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bQuDCrgGQHd70haKhLcz5+2qdi5D14q5gmUwOP4MAiA=;
	b=aUGtsvArlPAe2UC9814yTsk40q1wFN83IDA+l6vghbZLUqnEAeOrGB4yCjLxEl
	eF3I9vnbteaNUckHoU+wavgDvCxLdnT7DRx/rT898Ikn9P5NNQG07+SwIQ/yOykR
	LhQmEgTfe7ExcvOxSxxURkd1EGe8FhQlLirW40+agUQeA=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrAC3_yCE6SVmCTAsAw--.41245S3;
	Mon, 22 Apr 2024 12:37:26 +0800 (CST)
Date: Mon, 22 Apr 2024 12:37:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 0/4] arm64: dts: freescale: verdin-imx8mm/imx8mp: add
 sleep-moci support
Message-ID: <ZiXphEC7vyFJci0J@dragon>
References: <20240405160720.5977-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405160720.5977-1-eichest@gmail.com>
X-CM-TRANSID:ClUQrAC3_yCE6SVmCTAsAw--.41245S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryUJrWfGF15JFWUGrW8Xrb_yoW3Wrg_GF
	yvqr97KrW8Jw4kGw1rGa1aqa4293yjvrya9FyDWFs7tr97A398AryqgryfCrnFyayrCrZF
	vF1UKrsakFW3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8EoGJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDQbIZVszXbcyuAAAsu

On Fri, Apr 05, 2024 at 06:07:16PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> This patch series adds support for sleep-moci to the Verdin iMX8MM and
> iMX8MP in combination with the Dahlia carrier board. sleep-moci is a
> GPIO that allows the system on module to turn off regulators that are
> not needed in suspend mode on the carrier board.
> 
> Stefan Eichenberger (4):
>   arm64: dts: freescale: imx8mp-verdin: replace sleep-moci hog with
>     regulator
>   arm64: dts: freescale: imx8mp-verdin-dahlia: support sleep-moci
>   arm64: dts: freescale: imx8mm-verdin: replace sleep-moci hog with
>     regulator
>   arm64: dts: freescale: imx8mm-verdin-dahlia: support sleep-moci

Applied all, thanks!

