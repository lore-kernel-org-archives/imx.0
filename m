Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E290C34C815
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518664; cv=none; b=fUXBWc5EpyAuQFy3Ly7xhm1xAPhuqT2urCg1hwvRDBHgfLFofdrl2oScY+eqm7YbO3uUIYaoO2s5LQD/vB1nHnXj3BVFVUfAoHcXEHjuwI5hx3Up8XXnD2YuojqecoITXdnCJtH5A4brytYPmXuHUcff7DsVJUznBRRsc37kTvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518664; c=relaxed/simple;
	bh=2y2yUNQLvl9upq9zpGwA5oOXDtN7gZ+FS2/mKJBl6kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtqDLpPukNI8HkQVEgzjjgWCLNGdJfySEC+/93HpHXbWY9jcWIjZpHFp7J2rjp2eIPjPc4PpmwlK2397cgmoHvv61U4HF42vDMZJpGMIuf6CM7S0Mv9KbVgHTJnQNCokNvjHty+k4M5K2qa7DY49tTEGp1P+z1f76K586mMeFxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=X23sGSAW; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="X23sGSAW"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DC3DD1FC8B;
	Thu, 19 Feb 2026 17:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1771518654;
	bh=LgBwNLmrIki/SK8WVAvQt3v0t3CnW+2Cc51W3lptYuE=; h=From:To:Subject;
	b=X23sGSAWt2EKgPi26CvX/nfnR5KTeIuJZ2ZPzg30iqU0ZwE2qV0PFo1WVYGM/JVJu
	 +Rc46kzbtvHjhgd99Bb+VTxvQ6GFozf0Q/9BP3qYV9aTx3CYPXwyswK40fo7wfrwRk
	 cIaSFgVamNmv+gzsv1BViRmA9kwuk+q+4HfOkhmFRYirqSHTd/YqcRwsL3tuWsvm6N
	 CD2qI6rZSODERTNHBYM4lemEzlRJBWpyZTJkrcUp+BenuIrX5Z/SOdDL7RyZzSnsIA
	 uhqfWl09O02rXsjo7alV4P2qOM7n4BfiU0Zt2QNW+l/BrmOV/auex275ifwolr3zTa
	 a2h3at6TJox0A==
Date: Thu, 19 Feb 2026 17:30:50 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: max.oss.09@gmail.com, Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <20260219163050.GA194254@francesco-nb>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>

On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> >
> > The change introduced a regression: at least Colibri iMX6ULL and
> > Colibri iMX7 no longer boot with that commit applied, while they boot
> > again after reverting it.
> >
> > Although this has only been verified on these two modules, the issue
> > is expected to affect all device trees using the gpmi-nand driver.
> >
> > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > ...
> > [    0.960443] ubi0: default fastmap pool size: 200
> > [    0.960476] ubi0: default fastmap WL pool size: 100
> > [    0.960500] ubi0: attaching mtd4
> > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > ...
> > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > [    1.650029] UBI error: cannot attach mtd4
> > ...
> > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> 
> Can you help found the real reason why not boot?
> nand@0 is preferred format for MTD raw nand.

I already raised the issue when you sent this patch series, we need to
consider the other users of this DT blob, for example U-Boot.

Please see my comments and Krzysztof one here [1]

I agree on investigating this, but I see no other option than reverting
for now.

[1] https://lore.kernel.org/all/20251105115538.GA17091@francesco-nb/

Francesco

