Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B615B971;
	Mon, 29 Dec 2025 03:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766979927; cv=none; b=YRcfMPjQrtK6LpXv5N3Kx6NtTMT7nkdW51PRswF2GyS1Ulfs5Rl+LPFpaRRikdTW11tc6L0ooMSZE+sFUeQrCZrz/7UY9Gwl2KToJ/wAP/Xek6D4Uyslu0a8GvYBkgq42vZCqhXddG69CaPEMcgfzWqHBk06fyir8ZLTYPb/6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766979927; c=relaxed/simple;
	bh=gMAqY+eLWWkGTNdPByA5LgE8BZzt8IImI0FhJUWIwCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=en7gErudZfb4vMHM/v+tMjCKC1yLVMmpMijUrxugjTPtSsZXqx+MseoZFa8Bwh/kC+exgAI/BTfhLkom97FgOPILB36ZxlIGQb3KiKUtf8LnBxCWSeDycDAVsgg2SVvCLH7BBKFqWki7jZOW9v2e3zXpfcnXwyMyeaQEBD3w7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXQj7FZe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXQj7FZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C092C4CEF7;
	Mon, 29 Dec 2025 03:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766979926;
	bh=gMAqY+eLWWkGTNdPByA5LgE8BZzt8IImI0FhJUWIwCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hXQj7FZeFJLdyCcbkg47T/TL7P3I6md1cTwcWxhEk6wFWIBxGsyCcT/ouKl0kcjOq
	 Fx62JucQTDL2pKCt41loOYgm8y/cZJ+k6YdFR7obV8zwFLuoegxJKEhob72TDtqQ/l
	 paHwtFpW1vZah70W9VRgprewlwYOtzxlbe+qWKBsGhzRRLr+coili/cHU8vbz6c/pw
	 wl2bag5FPPsnj52dbOZ6lZ04WvYAOxm+6zqUGFRm3xqERpVBB2jcjoCpr5/hNwVbDV
	 kNhJ8DbiyiEB31F3bhn0w1qLlC2ELXaC0CafhlLSrj7gpM32kmrsisUb2iX9oxCxtq
	 CfXCpSAT9goYQ==
Date: Mon, 29 Dec 2025 11:45:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM
 SBC DT to rev.903
Message-ID: <aVH5Ua2g8WbpW3Ge@dragon>
References: <20241226171404.84095-1-marex@denx.de>
 <173531253398.3886481.9345779510218290682.robh@kernel.org>
 <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org>
 <aVHqlnNGNGmaF14m@dragon>
 <b61fc304-26e0-422f-bb31-303e7bcbb824@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b61fc304-26e0-422f-bb31-303e7bcbb824@mailbox.org>

On Mon, Dec 29, 2025 at 03:53:53AM +0100, Marek Vasut wrote:
> On 12/29/25 3:42 AM, Shawn Guo wrote:
> > On Fri, Dec 26, 2025 at 11:24:29AM +0100, Marek Vasut wrote:
> > > On 12/27/24 4:18 PM, Rob Herring (Arm) wrote:
> > > 
> > > Hello Shawn,
> > > 
> > > > On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
> > > > > Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
> > > > > board which implements significant changes. Keep some of the rev.900
> > > > > and rev.902 nodes in the DT so that a DTO can be used to support old
> > > > > rev.900 and rev.902 boards easily.
> > > 
> > > [...]
> > > 
> > > > arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
> > > > 	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
> > > > 	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
> > > 
> > > This is addressed in bindings patch [1] . Can this patch and the bindings
> > > patch be applied ?
> > > 
> > > https://lore.kernel.org/all/20241226171124.83735-1-marex@denx.de/
> > 
> > Could you resend them?
> Why ? The emails are in lore/patchwork and the patches still apply just
> fine, don't they ?

A couple of reasons:

- The patches were sent one year ago.
- They should be in a single series, as binding change is a prerequisite of DTS one.

Shawn
