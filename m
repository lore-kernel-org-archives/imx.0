Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB30320C
	for <imx@lists.linux.dev>; Fri, 28 Apr 2023 21:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1666EC433EF;
	Fri, 28 Apr 2023 21:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682718721;
	bh=7O0Ned+q8ZPBB8k9Xsvo1WnJ6w0vF5mKxj1ue/l/84E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iTc5xlR/sYKg5kfAIuSF+qH8xR/12KpzXW/JWJKxFGx6KoVLMC5SQC3XZGEUatNBy
	 qxHxopoaTIxYs5y0h5IiFGDmE6jegNNDxWExCMesp1KPbrPScCx0scKsi89Q2mtma7
	 CEzHIftjJ2IENV5Oa+PrQzchU9nSUZpyIzawNh4y8BEHyDnBVHw2u+gDiFAyLU7dQS
	 7Di+G9J1V6k+ud9xPsdWBXF+Dkbu2UQCAk1VYMAgoPK8wHCGXqZVci8353+kEHs6i9
	 lyQdGmgsfYSJLbuzqyYwBZYfAZVADY+iGHvCaQqFaoh/xguzlkGzvXWJru9go150Ha
	 CW8iqrmcdcqJQ==
Date: Fri, 28 Apr 2023 16:51:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] PCI: layerscape: Add the endpoint linkup notifier
 support
Message-ID: <20230428215159.GA369421@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420221117.692173-1-Frank.Li@nxp.com>

On Thu, Apr 20, 2023 at 06:11:17PM -0400, Frank Li wrote:
> Layerscape has PME interrupt, which can be use as linkup notifer.
> Set CFG_READY bit when linkup detected.

s/use/used/
s/notifer/notifier/

> +/* PEX PFa PCIE pme and message interrupt registers*/

s/pme/PME/ to match other usage and spec.

> +		dev_info(pci->dev, "Detect the link up state !\n");
> +	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
> +		dev_info(pci->dev, "Detect the link down state !\n");
> +	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
> +		dev_info(pci->dev, "Detect the hot reset state !\n");

No spaces before "!".  Omit the "!" completely unless these are
unexpected situations.  They seem ordinary to me.

Would probably be better as just "Link up", "Link down", "Hot reset".
Or "Link up state detected" if you want.

> +		dev_err(&pdev->dev, "Can't get 'pme' irq.\n");
> +		dev_err(&pdev->dev, "Can't register PCIe IRQ.\n");

Capitalize "IRQ" in both the above message and this one.  No "."
needed at the end.

Bjorn
