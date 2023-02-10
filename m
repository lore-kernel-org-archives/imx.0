Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15ED8483
	for <imx@lists.linux.dev>; Fri, 10 Feb 2023 20:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9022CC433D2;
	Fri, 10 Feb 2023 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676059461;
	bh=9WmhS+AFzxhdlQZRvRCBT4MfcWL+Y2Jom7fpas4JOgc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ec302W45QuG/EuSGN6UmNSOfRiZhIlWJafp6zqBbVA2oNbH8jESPcrwarBuikZeI9
	 uxwHM5wUCZseGzbBte3PBvDCSCiUVXTWVUNqdFyW8xi/L81VfUMLctRmqEkQDRbeoV
	 potZEheCBcay6U6EP8jcWDVDqitT8D4/fFGP43Vc/hT0Kd9ByTD3ZWFOrrH8T0WwhR
	 zE6b4twEDpnplXv8bT38jmCOo2WwN7QmsiSm8QDYhceBmHVDKad/08Z0HpkvA4jBi4
	 HpL2WT54s6csNuZ/aEX2pPoIPyvi1dRXKhXlnI2fJjOATmZj0aSbGE4f9AKjRwI4T6
	 a0YE6gw9ZnThg==
Date: Fri, 10 Feb 2023 14:04:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Frank Li <Frank.Li@nxp.com>, bhelgaas@google.com, imx@lists.linux.dev,
	kw@linux.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, lpieralisi@kernel.org,
	minghuan.lian@nxp.com, mingkai.hu@nxp.com, robh@kernel.org,
	roy.zang@nxp.com
Subject: Re: [External] : [PATCH v3 1/1] PCI: layerscape: Add EP mode support
 for ls1028a
Message-ID: <20230210200419.GA2694677@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ab8bdac-3264-2718-e5c9-53bcaa5db010@oracle.com>

On Fri, Feb 10, 2023 at 11:51:46PM +0530, ALOK TIWARI wrote:
> LGTM,

Thanks a lot for looking at this!

In the Linux world, "LGTM" is not something a maintainer can really
act on.  If you respond with a "Reviewed-by" tag as described here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v6.1#n495

maintainers (or tooling like b4) can add it to the patch when merging
it.  Here are some examples of how it can be used:

  https://lore.kernel.org/linux-pci/BN9PR11MB527699243353309A1DDFEFBE8CDE9@BN9PR11MB5276.namprd11.prod.outlook.com/
  https://lore.kernel.org/linux-pci/Y9AEzVrTB4Sobufr@memverge.com/
  https://lore.kernel.org/linux-pci/a20028e6-3318-26ca-117a-26c87c292139@linaro.org/

Bjorn

> On 2/9/2023 8:40 PM, Frank Li wrote:
> > From: Xiaowei Bao <xiaowei.bao@nxp.com>
> > 
> > Add PCIe EP mode support for ls1028a.
> > 
> > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp>
> > Acked-by:  Roy Zang <Roy.Zang@nxp.com>
