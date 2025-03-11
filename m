Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91BA3FD1
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 02:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741659113; cv=none; b=oQNTR4Dg3zW74cAf3hRfdcsnKTVs6jAnrRyixW4I7FOPG112Oe1N2o+dc/O26FjauSgS/Um6mdON19coz8hWq8cGJY+RPzkOgTwyQx+YuYYsujv61vtNFA/7hfqTwxiBRK1/bUUZd+8YU6l11MiYnpYiRKno+4iAX1N+91lDJBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741659113; c=relaxed/simple;
	bh=Uqg4BvoIFHOy8ZsafPUstg5rBCNgYL7IMM8j6pBom3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlwkE21gOKb6kZrXtQ4dtomrX36LKYtr78xNEP1sHZxp0wfP+1HMx2K+mn1I79FcZbQzRLTCawv/DZSbnUlBnma5zVfUrqHT/8ULp/4Pkdb3kqWspR6bL+aySUWWEehsMBqKeOsp43LBIgNP4usKoORwDCugTZ2s7rtwjPg0fYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=QyvimTas; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="QyvimTas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aNXkJxcJ2zsVazXzVhb67vC/AWSm5E/sISjDwq9fejc=;
	b=QyvimTasT15gCS/eL9gH7dR1XCjRIaHLmSGawEgiQNyCNQEbQqZUQBmpNu8ytM
	W6ateqgBkQc1Y3b0eOALREUSlFp/7z0kKxudAbLp826Yz3bcmsfOjgcTlYFYxszk
	NEoDQugL3Yo58BGWfkXKCydkgxL4XvH92CJnSgF+BWNSA=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCHyeCWlM9nKL2zAA--.807S3;
	Tue, 11 Mar 2025 09:40:40 +0800 (CST)
Date: Tue, 11 Mar 2025 09:40:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 0/6] arm64: dts: imx8mp-skov: add new variants
Message-ID: <Z8+Ultn2BDg+fSng@dragon>
References: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
X-CM-TRANSID:Ms8vCgCHyeCWlM9nKL2zAA--.807S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4IJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRANZWfPUEK8TAAAs7

On Tue, Feb 18, 2025 at 07:38:12PM +0100, Ahmad Fatoum wrote:
> Ahmad Fatoum (5):
>       dt-bindings: arm: fsl: add more compatibles for Skov i.MX8MP variants
>       arm64: dts: imx8mp-skov: move I2C2 pin control group into DTSI
>       arm64: dts: imx8mp-skov: describe I2C bus recovery for all controllers
>       arm64: dts: imx8mp-skov: add revC BD500 board
>       arm64: dts: imx8mp-skov: support new 7" panel board
> 
> Oleksij Rempel (1):
>       arm64: dts: imx8mp-skov: add basic board as fallback

Applied all, thanks!

