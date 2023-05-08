Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF09111B9
	for <imx@lists.linux.dev>; Mon,  8 May 2023 21:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31388C433EF;
	Mon,  8 May 2023 21:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683581468;
	bh=T0A52YhbVC0xShcDektXWFKw+mqnN3k3AY2OPTdnEjg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SOAlUBWI1RiZWt4v/no1jMnVz5vsHRWC2dBBSgu+0aa6liSOZwgEjQbPrfmfwkHHd
	 ILaGwcnaIIg7BHxDSihUs3mN3XnskViXm/8m651NE0q+h5VHuJzKgHP4u/+gNjTRjB
	 8+ko+NbXdY43bHh3j6RNCenshzNAOK2waDgHlP4c92mJ/DJb6y1CK4NNgSWpdhtEgc
	 ysOmHf1sL7Vio+P+ydRnTNaP2wOCN+2a5C2gVVI8JLWQX10LIiffiHx40GFLUcMUSs
	 aUsd3zbTFdYjBRhT4u/2xvwZ1jpzG9pzddicUmBXu8z+kTVhbLQnwU9At99GnQoFgx
	 QdT91TV03NtRQ==
Date: Mon, 8 May 2023 16:31:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Rob Herring <robh@kernel.org>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"M.H. Lian" <minghuan.lian@nxp.com>,
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>,
	Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>,
	Mingkai Hu <mingkai.hu@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint
 linkup notifier support
Message-ID: <20230508213106.GA1192065@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM6PR04MB4838D92748AD426DA1661C0C88719@AM6PR04MB4838.eurprd04.prod.outlook.com>

On Mon, May 08, 2023 at 01:31:26PM +0000, Frank Li wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: Saturday, May 6, 2023 2:59 AM
> > To: Frank Li <frank.li@nxp.com>
> > Cc: M.H. Lian <minghuan.lian@nxp.com>; Mingkai Hu
> > <mingkai.hu@nxp.com>; Roy Zang <roy.zang@nxp.com>; Lorenzo Pieralisi
> > <lpieralisi@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof
> > Wilczyński <kw@linux.com>; Bjorn Helgaas <bhelgaas@google.com>; open
> > list:PCI DRIVER FOR FREESCALE LAYERSCAPE <linuxppc-dev@lists.ozlabs.org>;
> > open list:PCI DRIVER FOR FREESCALE LAYERSCAPE <linux-
> > pci@vger.kernel.org>; moderated list:PCI DRIVER FOR FREESCALE
> > LAYERSCAPE <linux-arm-kernel@lists.infradead.org>; open list <linux-
> > kernel@vger.kernel.org>; imx@lists.linux.dev
> > Subject: [EXT] Re: [PATCH v2 1/1] PCI: layerscape: Add the endpoint linkup
> > notifier support

All these quoted headers are redundant clutter since we've already
seen them when Manivannan sent his comments.  It would be nice if your
mailer could be configured to omit them.

> > > +static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
> > > +                                  struct platform_device *pdev)
> > > +{
> > > +     u32 val;
> > > +     int ret;
> > > +
> > > +     pcie->irq = platform_get_irq_byname(pdev, "pme");
> > > +     if (pcie->irq < 0) {
> > > +             dev_err(&pdev->dev, "Can't get 'pme' IRQ\n");
> > 
> > PME
> 
> Here should be dts property `pme`, suppose should match
> platform_get_irq_byname(pdev, "pme");

You can also edit out all the other context and questions if you're
not responding to them.

There were a lot of other comments that were useful but are not
relevant to this reply.

Bjorn
