Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C923BCFD
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763286255; cv=none; b=SYVlVkwR4KBpzc/ptf8fuUusnYUa7f62nlAJEFTu7V0oSww8UVAr7+6mpS3sdTDxO14/tUN0EKUCKefDqcJJwfwmrPunu6iTPmFEvnZ8BXlltixErzdOfh/CoIuid+m8QIRq1cNou7Ry3l832u+FM0suUmIRd+IumvjqvCXZM20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763286255; c=relaxed/simple;
	bh=uoktajP6GKmpgJWLkx1PHjw0ytxfrrJiW2Lr3KzPkcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B64K8eTMczmsq0PBWpZBnimsKMCMHZFUKUKggFKLYPiooYEZdeAI1eX3CQSlY/IhqNGGxa/dfvUOZUgat0gdNPB4Lyz9G+qsotX9G6BzSLXeLEi7A0cvzmuXLa3Sx6zZF0zxJQNJAlMbV+dMZQ0o3p96QE6d/PBx6lnEYTsBmw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=V1qlQuWd; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="V1qlQuWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yuCXAew1ENyewRNTNIKnXN+mXacGjLsytBQ3ltmtgHU=;
	b=V1qlQuWduYpXQe4zr4nr/k1OLwA/LgCaONo3FAFjtvsEO93i9peYIJFQP4NtZw
	q7/AylopJCe49l+DisN7kYcSwZw0/5lvTpLJgJtHRo4xXX3cqTkAFMFXShxNJcBx
	pNKyWn5xdtlaiS8+/B8X7JrFV5/a3mCuNepDRQHFbkGSc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDX_1TPnBlpHEsWAg--.7896S3;
	Sun, 16 Nov 2025 17:43:45 +0800 (CST)
Date: Sun, 16 Nov 2025 17:43:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andreas Kemnade <akemnade@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] ARM: dts: imx: e70k02: add sy7636
Message-ID: <aRmczxYXbjRDMHXD@dragon>
References: <20251028-sy7636-rsrc-v4-1-242ccfd3bc10@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-sy7636-rsrc-v4-1-242ccfd3bc10@kernel.org>
X-CM-TRANSID:M88vCgDX_1TPnBlpHEsWAg--.7896S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOjg4UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOBH7YWkZnNENYwAA3g

On Tue, Oct 28, 2025 at 04:00:36PM +0100, Andreas Kemnade wrote:
> Add the EPD PMIC for the e70k02 based devices as a step towards full EPD
> support.
> 
> Acked-by: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>

Applied, thanks!

