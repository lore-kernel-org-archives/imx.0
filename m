Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D61B1991CA
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 03:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741664205; cv=none; b=lfyeeFi4B7PWnQxNhxJepmyvMhp+cXox/e4Qv88xaEF8NEuk45zrx4PsU+CPUqHhnAG4xoManr2DTuqNwFGk31vts8ek2fN/IZRJOQKSVkzxkUZjlNRnEn5PWV6b+vyDyJH4SrqFHkDrZR8due2fV6pg/ZHIZs4Nn0l50ilsPk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741664205; c=relaxed/simple;
	bh=s4H+Y9we62fXCCnHrxBU9pSXlTEJIEszZhIBpsmMnU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smEPJvaavj6aJEkDRVyz8Da2VK0VbP9+vILZbpO3Zgsg61jxnJnqcfGafypavmxrAobSLRRmqNTJGBaQ6bHsA2pS8zD5uDdXhQG1ne07lhezmaHfTt4kHHoPmps/HOYo+vz7eTARtIw/IKZGV2js0MRtLOLwaXcWsakqD/fuRpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FipnhvAy; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FipnhvAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IOD/8eH6MReKw3gPdZRtk1Rage4HyTQ3t3nqYrwuxj4=;
	b=FipnhvAyKOlglU6eH1sX5EopfIT2wQOpNzsc5WZ/Daaq6TRRIKLz4NgrU0Zm1u
	ePyg6ojedl9PaG7h0gPt1e/qc/C6KLMfce7dtkbrmz435V/FIFwP039HJyQ+j5Qp
	n4Sa4k4rbZwW5qA6mF1OwkBmjq6CZdW3G3IfpfRpdlYZU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnUiKzr89nKi21AA--.48775S3;
	Tue, 11 Mar 2025 11:36:21 +0800 (CST)
Date: Tue, 11 Mar 2025 11:36:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/3] Add Variscite i.MX6UL SoM and Concerto board
 support
Message-ID: <Z8+vs+0dKyBDMU5b@dragon>
References: <20250310-varsom6ul-concerto-dts-v4-0-6034fda6ec64@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-varsom6ul-concerto-dts-v4-0-6034fda6ec64@bootlin.com>
X-CM-TRANSID:Ms8vCgDnUiKzr89nKi21AA--.48775S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsHUqUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhANZWfPpLE8DAAAsn

On Mon, Mar 10, 2025 at 05:39:47PM +0100, Antonin Godard wrote:
> Antonin Godard (3):
>       dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board
>       ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support
>       ARM: dts: imx6ul: Add Variscite Concerto board support

Applied all, thanks!

