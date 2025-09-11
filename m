Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FCB224D6
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 01:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757555460; cv=none; b=tWnZsUvp/rVb53B0ijXKx9Tacijpkgn7pSUiVN8JkbUo/tIjqbrgACuh4Bv+AJvuUKrALUShkkRuB5XM7lUYTFaKNNHSMBW7YaThwPxqN2zwuDjyaG7XUlZCYY7HFzlrTrNTCSADgcvWWitVzVNYY41Y1iHyKZ7GuZFnWq132A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757555460; c=relaxed/simple;
	bh=S0GcGkgfIGg68g741TdmbBJHFnk5Vj/Wgu4whH0XC4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCK+4yfX9t9E7eSeQdP+PHItAXT2KYj0iS8PMESx0S2CulJMVnY8Da4gEsXvvR1Um267wzYXhARFgouR3kCbnnMEY5uP51N0+9SEhU98QhQO14c3oBrXjYGWJ0nYIpxaXUr8/03Aheurgvc+9Nu8WvJMepR/rjKHNlaeH5sYLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=O76U9ZV2; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="O76U9ZV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ZUI/i+ja9oevYg1fVVK/IyksXCQlyryj3w/XBV25Te8=;
	b=O76U9ZV2uADWd+6J6/mpLppDnBErAY1qsuLBqi/9SqqnLNQsucrZTE+bYVIJmV
	JEGmRiYB2qeBPxw2h88ujedrxhmq02Ap6++IENga7E7tXIO0Vkb1C0qgNi/jxvr7
	Ohc7zYFtqfRIURZNcKRVK2OdT/EHLyPhplRO+A6ExuyGc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnnyjwKsJoColfBA--.14977S3;
	Thu, 11 Sep 2025 09:50:42 +0800 (CST)
Date: Thu, 11 Sep 2025 09:50:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: Add bindings for SolidRun
 i.MX8MP SoM and boards
Message-ID: <aMIq8FAJ3f6irsX0@dragon>
References: <20250823-imx8mp-sr-som-v3-0-a18a21fbebf0@solid-run.com>
 <20250823-imx8mp-sr-som-v3-1-a18a21fbebf0@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823-imx8mp-sr-som-v3-1-a18a21fbebf0@solid-run.com>
X-CM-TRANSID:Ms8vCgDnnyjwKsJoColfBA--.14977S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUw5l1UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhKR9mjCKvKOowAA3I

On Sat, Aug 23, 2025 at 05:28:21PM +0300, Josua Mayer wrote:
> Add bindings for SolidRun i.MX8M Plus System on Module based boards:
> 
> - CuBox-M is a complete produc with enclosure including the SoM
> - HummingBoard Mate/Pro/Pulse/Ripple are evaluation boards with common
>   design but different available interfaces.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks!

