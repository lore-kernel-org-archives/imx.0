Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94642172767
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 04:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735533207; cv=none; b=JbV65hs/t9QS5a9r2nxY1BjGVrZbUIV0bsue25Qq6KbTRFqpCVI24GjJE0vlUmZQ1IIVg948SBKkqFndazdPUgQ3RyqDAmv5V5Q8m2zPYK1W0Ns3iZGktehHXZYHHF3gyE0gv5SPAtVhqQ5cq39CIMVec0+xFWYkcF9dT75FIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735533207; c=relaxed/simple;
	bh=g+vuPhQyFl6UPd393S0vFYqJMu+nWZUlGhRDquuIT18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY8o1a55c98G2Lm4oNNywrFSol1Zdwh3xhYxzgqhSjwDsni8rslSHqSQqvGNJzW9LbOyhq+gbLEbxnB8aO4XVzN3qH40RRCzNdt2p4kGySCyVcWtiP9kRuwg6IOHqiU6pF3J65X/qqCYdgWGHROnmrH5FmHX5BlF6yMPuo4KAqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ONItbrki; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ONItbrki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sRbOUu8aGJVO600q2KogDHBrNV2xszMwCHc4iiXDYuk=;
	b=ONItbrkihs+pA902M+iRc/mvKo6K5EiqF45hs6AogEPrx9aQ1XYO6O0gGAEs3h
	vVa8xgPEs4uQfcvTTBOdbvqV1N4b/DI+mbEsQxgGk04Iw8ERhL/5woDbnZkxrFI1
	4J46z3QMTGEifviG8LMWZOPFMTYp4jg72B35602iG+PRk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXHQR+InJniNUDBg--.61031S3;
	Mon, 30 Dec 2024 12:33:04 +0800 (CST)
Date: Mon, 30 Dec 2024 12:33:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH v2] arm64: dts: imx8mn-bsh-smm-s2/pro: add
 simple-framebuffer
Message-ID: <Z3IifsJxLG34b3sN@dragon>
References: <20241205162612.1804274-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205162612.1804274-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID:Mc8vCgCXHQR+InJniNUDBg--.61031S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBA7FZWdyDmBPOQABsm

On Thu, Dec 05, 2024 at 05:26:04PM +0100, Dario Binacchi wrote:
> Add a simple-framebuffer node for U-Boot to further fill and activate.
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied, thanks!

