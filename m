Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC63C8EC
	for <imx@lists.linux.dev>; Wed, 23 Aug 2023 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04537C433C8;
	Wed, 23 Aug 2023 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807120;
	bh=pNHMDSofAvP8QX/d2Msi3h2uJ91bbmjTCRWGWU/RVIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7TFU5kwyCBeCDZIsZVe2kTo4ubtSfffDk1Gy2QGeC8f3zJuI+Jg1rdeWOBjledj6
	 9lXcoK47lDbiRx/0n/lwu7/065jhnCVkVymkJHRVK7FJkvPcsYxgURmJPmUtZxLvT7
	 tjgTLbPelxBGZfPGI9uMhBiDdaVtvH6ruxbFB28vLCsPbrhdt7AmgbFpDTw0leLDMI
	 pm1cKYnzISHsfFrU09v/nu8QIWekX5ODFbwCilNjrQYI3qh6Tl2KoaSBIoB7pyG+rV
	 aseiaHA0pj0mOWPu2cDuYAGPn+eEScHvUyzYdhUOhDQ4nc0LIUXysvE0dySMtop8w0
	 qrvWeYRIkNesg==
Date: Wed, 23 Aug 2023 18:11:53 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Zhiqiang.Hou@nxp.com, bhelgaas@google.com, imx@lists.linux.dev,
	kernel-janitors@vger.kernel.org, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	mani@kernel.org, markus.elfring@web.de, minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com, robh@kernel.org, roy.zang@nxp.com,
	xiaowei.bao@nxp.com
Subject: Re: [PATCH v4 1/2] PCI: layerscape: Add support for Link down
 notification
Message-ID: <ZOYvyUgC1o2lWAzE@lpieralisi>
References: <20230720135834.1977616-1-Frank.Li@nxp.com>
 <ZMfN9w6ixBFBmof7@lizhi-Precision-Tower-5810>
 <ZNzw7MPF00t3i3bn@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNzw7MPF00t3i3bn@lizhi-Precision-Tower-5810>

On Wed, Aug 16, 2023 at 11:53:16AM -0400, Frank Li wrote:
> On Mon, Jul 31, 2023 at 11:06:31AM -0400, Frank Li wrote:
> > On Thu, Jul 20, 2023 at 09:58:33AM -0400, Frank Li wrote:
> > > Add support to pass Link down notification to Endpoint function driver
> > > so that the LINK_DOWN event can be processed by the function.
> > > 
> > > Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > 
> > @Lorenzo
> > 
> > Could you please consider pick both patches?
> > Manivannan already reviewed and only impact layerscape.
> 
> @lorenzo:
> 	ping

I will have a look tomorrow.

Lorenzo

> > 
> > Frank
> > 
> > > Change from v2 to v4
> > >  - none
> > > Change from v1 to v2
> > > 
> > >  drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > index de4c1758a6c3..e0969ff2ddf7 100644
> > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > @@ -89,6 +89,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
> > >  		dev_dbg(pci->dev, "Link up\n");
> > >  	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
> > >  		dev_dbg(pci->dev, "Link down\n");
> > > +		pci_epc_linkdown(pci->ep.epc);
> > >  	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
> > >  		dev_dbg(pci->dev, "Hot reset\n");
> > >  	}
> > > -- 
> > > 2.34.1
> > > 
