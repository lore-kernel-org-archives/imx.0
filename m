Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F525FA0A
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 12:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961670; cv=none; b=KJMjHfC2M9iSgLA+ju/dqRpljYEcSxJIQBNXN/nOEClEDuh9c+4dBmxD2fGfaXc3WlACZPM/DiPCP1rAt9HoH4pQaw9cbcA6k5ZPwk9z5kFYxnx1/llYhWPp7DZOFjNYqdDMxBs82a9lbUfDwoXg/PlCmE7NgBdexSsWpcW2ZsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961670; c=relaxed/simple;
	bh=pMg3bHidqQtP00nqrl2RWXyB/Sser/MWTP0A5E9Fvr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0biMNXR2+w8JNQeLbmtEaFeeP6p0cvAhu0Bv9FEtJkvM9Tg6akMyPAHH5hn4SI424BUSsmhYcACo9AOfUnMG7KSSEc3BPdCkolnJCvP9a6916lSkJnseg1gOr0O13ymdSdIMM7UNwNUsLsf6RWiQ3n0Y3ESuuGHZn6bJGbKKYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=C1VJkpK3; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="C1VJkpK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=h+gm3djY3aFRFTh0X94X6zEeIzmW+ZxYY8d+IIU0lJI=;
	b=C1VJkpK3CfvWSf6sIaUtBRMngG5pujyorUCWg1wLcL+NMBb2txWKY4D15MhUU8
	pV+BoYDgeWEhWRS5aH5IvLPJDnc4EOPVbgwHs2L4aJQcJbYCw2oKkx3fo4FL7h60
	av7TsfECecYTC3Cibf07k3gsF1G1YaprpJEqlfbACQp/U=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXRihlJPZonopTAA--.32146S3;
	Mon, 20 Oct 2025 20:00:39 +0800 (CST)
Date: Mon, 20 Oct 2025 20:00:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx6ull-engicam-microgea-rmm: fix
 report-rate-hz value
Message-ID: <aPYkZXCtXyYYprp6@dragon>
References: <20250913091638.1003563-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913091638.1003563-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID:Mc8vCgAXRihlJPZonopTAA--.32146S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy7Zr1UZFyDAw4UCw1UAwb_yoW8Gw4xpa
	9xGr47Ar1ktrWUA3WUA3WF9aya9w4UJ3s8urs5Xr17Arn8WryFqr1Ivw1DXFWYkFy09Fya
	yF45Cr95WanxAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jebyZUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgTsZWj14CmiuwAAsS

On Sat, Sep 13, 2025 at 11:16:31AM +0200, Dario Binacchi wrote:
> The 'report-rate-hz' property for the edt-ft5x06 driver was added and
> handled in the Linux kernel by me with patches [1] and [2] for this
> specific board.
> 
> The v1 upstream version, which was the one applied to the customer's
> kernel, used the 'report-rate' property, which was written directly to
> the controller register. During review, the 'hz' suffix was added,
> changing its handling so that writing the value directly to the register
> was no longer possible for the M06 controller.
> 
> Once the patches were accepted in mainline, I did not reapply them to
> the customer's kernel, and when upstreaming the DTS for this board, I
> forgot to correct the 'report-rate-hz' property value.
> 
> The property must be set to 60 because this board uses the M06 controller,
> which expects the report rate in units of 10 Hz, meaning the actual value
> written to the register is 6.
> 
> [1] 625f829586ea ("dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz")
> [2] 5bcee83a406c ("Input: edt-ft5x06 - set report rate by dts property")
> Fixes: ffea3cac94ba ("ARM: dts: imx6ul: support Engicam MicroGEA RMM board")
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied, thanks!

