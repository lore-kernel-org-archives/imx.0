Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61CB1B95B
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730454248; cv=none; b=ZsMICxHYhAaoNEdy4fTcwXYAIueIRqeQjmAK8eNRNjplRaZR7cSqqJG0gD8wVhAMBhiXp5e2rL6teBkPr+48ydtEICMfuCatSiwIYrdZ3jh6pfXD3CyaALQw/Cg4IhB5CTRz40Rg+rhDlCy01perrl/IvyXejiIcfNdgtsqrjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730454248; c=relaxed/simple;
	bh=UtbEw9PpeFiRtaLNPiremI+4jAr/ByX5D3N7bqeXPuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joD8UQroU9cmGyffBSOfKXoVrPNr+vD/IM4o6tsPqTKhbgveZngvtxeOzM5zewvgFvSKxj7Tl1E7bnh+NqcwnC+PvVfTSU1/6pF02iUc6SR552PJ4I0qfi2vhU4kOqRb6KE+MMCxtitY5L+jcZXkktTFJEVIyj85Q5KkitoX5AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fy66hohr; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fy66hohr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=XLnYQfdr8NyxggDtyRx5yaVqi2owvaQFbxe2uSIzQDY=;
	b=fy66hohrsCdw8c1rLOwe1R3p0cESVr4sM7Wg0sz6gnvpaC9gbGWQk5cVrOeMfp
	mQi10MAUzS0dyf+eg3+BZ06Y/hb6Cd/rM0jE8JyTWh9ooGrAxtCT9ENGHpEalrjr
	5Lma9nkUb2nzst601UrIUfobJn6qGNGXXM9O6pOHulB2Y=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXf8lroiRn8dxjAQ--.13888S3;
	Fri, 01 Nov 2024 17:42:05 +0800 (CST)
Date: Fri, 1 Nov 2024 17:42:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: Add Gateworks GW82XX-2x
 dev kit
Message-ID: <ZySia6Jaie9QvcH4@dragon>
References: <20241022153031.1231934-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022153031.1231934-1-tharvey@gateworks.com>
X-CM-TRANSID:Mc8vCgAXf8lroiRn8dxjAQ--.13888S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdWFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCx+KZWckj-02owAAsf

On Tue, Oct 22, 2024 at 08:30:30AM -0700, Tim Harvey wrote:
> Adds support for the Gateworks GW82XX-2X development kit
> based on a GW82XX baseboard and a GW702X System On Module.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!

