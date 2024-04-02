Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4137B1757D
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712027076; cv=none; b=oqC7IyE0oHniSzkJJKWBXI1BEEuqGGSAgfrFDYxUXNGX3CJI57C1dsnVTUzi9BwpCmO/4DKRK/QJHnNZe23P7QU7IQfhiP+A8Z14GcADqOlzGy0mv5+sN8xeshvDdVdE63S8xf5imHP0AJWXESbtjuNJASRlupLH7C9WUrE3h0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712027076; c=relaxed/simple;
	bh=eAXc09xEKhzdLACdh70tJItL4IIbJf5hovpipkhS+KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG7zA9lzSnRjRR6+NuGMyS30ouIjmX8QQL6mqCubNgXFc4rrtozvDR7C771MiA7KWfX7kcTStsrJ2iESIPls0rmv+oErhrDyIc3XMAbPkUIrESPMFCnOOeD58Ey2cn1bzyd4wkWuQH8Icz7LBPo/NisxLdKPupykbv4PbcYpA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=UWogBxFD; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="UWogBxFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=jZdmlIK9BLALrTRQhLlnaYBmJtd1g54qxC+APchnqLQ=;
	b=UWogBxFDIp1JPn5zvSMptp7eRGlQUyMCv5Ni9qMmF6t9Rn+li5HeD8dWMvg808
	mBwR6AKsfYhyB6PMlKFVUB7+yJFILDyikTanniuoDaLcNKnElj2TJ14RTENFaLLa
	n1LBiFKLozkZt4caM65z2Ecvt8yqs3R0qssE3/5/zXiq0=
Received: from dragon (unknown [223.68.79.243])
	by smtp2 (Coremail) with SMTP id C1UQrAD332ijdQtmQAejAg--.52779S3;
	Tue, 02 Apr 2024 11:04:04 +0800 (CST)
Date: Tue, 2 Apr 2024 11:04:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Describe CSI2 GPIO expander on
 i.MX8MP DHCOM PDK3 board
Message-ID: <Zgt1o/CT29hPBvOP@dragon>
References: <20240319043733.134728-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319043733.134728-1-marex@denx.de>
X-CM-TRANSID:C1UQrAD332ijdQtmQAejAg--.52779S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAW0ZV6NnqdSYgAAsW

On Tue, Mar 19, 2024 at 05:37:09AM +0100, Marek Vasut wrote:
> The production PDK3 carrier board rev.200 contains additional GPIO
> expander to control power and reset signals for each CSI2 plug
> separately. Describe this expander in the carrier board DT. The
> label is used by sensor DTOs to reference the expander and its
> signals.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

