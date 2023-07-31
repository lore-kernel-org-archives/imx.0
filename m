Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F1619BB2
	for <imx@lists.linux.dev>; Mon, 31 Jul 2023 16:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C182C433C8;
	Mon, 31 Jul 2023 16:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690822499;
	bh=P+oZaYwkspIaNJxLa9jftp8BzKB/m6+tOlqYJtPkrv8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lZhTM58/UsAB7ghAERsf/f2VKck7rHwk4a29K7eBveq/fkUzLUIxsJzg+nzCl69uF
	 XW7wkrLRDvCuuCPcMGbdN2Rz8illQSPfAc/J0x2h21xWzQbsKFidB5mklaeLONcHi/
	 f68Hko0+LxX7gglkr8ey32Wt33KU+DLHwa5GUUzG/giKw9AptTvtH1ZRTHQJlmbjQa
	 BOOf1ytXM190mCZTL2VwE+XF7JB6PY1cILASQsnZOvG8j8GMM24lExSYAD/yl76cbc
	 NbwYpr/6wGXNar3QDMX4Cc347Ld6s2c/ryVzxHA4ShnAwNjXA9fB1E4imN0iJTzA2C
	 Uzai8WiNb60ag==
Date: Mon, 31 Jul 2023 11:54:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	lorenzo.pieralisi@arm.com, bhelgaas@google.com,
	devicetree@vger.kernel.org, gustavo.pimentel@synopsys.com,
	imx@lists.linux.dev, kw@linux.com, leoyang.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	mani@kernel.org, minghuan.lian@nxp.com, mingkai.hu@nxp.com,
	robh+dt@kernel.org, roy.zang@nxp.com, shawnguo@kernel.org,
	zhiqiang.hou@nxp.com
Subject: Re: [PATCH v5 1/2] PCI: dwc: Implement general suspend/resume
 functionality for L2/L3 transitionse
Message-ID: <20230731165457.GA13422@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMPjiBYQV20N5kdu@lizhi-Precision-Tower-5810>

On Fri, Jul 28, 2023 at 11:49:28AM -0400, Frank Li wrote:
> On Fri, Jul 28, 2023 at 09:02:38PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jul 24, 2023 at 05:58:29PM -0400, Frank Li wrote:
> > > Introduced helper function dw_pcie_get_ltssm to retrieve SMLH_LTSS_STATE.
> > > Added API pme_turn_off and exit_from_l2 for managing L2/L3 state transitions.
> > > ...

> > > +static void dw_pcie_set_dstate(struct dw_pcie *pci, pci_power_t dstate)
> > > +{
> > > +	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_PM);
> > > +	u16 val;
> > > +
> > > +	val = dw_pcie_readw_dbi(pci, offset + PCI_PM_CTRL);
> > > +	val &= ~PCI_PM_CTRL_STATE_MASK;
> > > +	val |= ((u16 __force)dstate) & PCI_PM_CTRL_STATE_MASK;
> > 
> > Why can't just,
> > 
> > val |= dstate;
> 
> fixed a build warning.
> 
> Closes: https://lore.kernel.org/oe-kbuild-all/202307211904.zExw4Q8H-lkp@intel.com/

This is the sparse warning from the lkp URL:

  sparse warnings: (new ones prefixed by >>)
  >> drivers/pci/controller/dwc/pcie-designware-host.c:824:13: sparse: sparse: invalid assignment: |=
  >> drivers/pci/controller/dwc/pcie-designware-host.c:824:13: sparse:    left side has type unsigned int
  >> drivers/pci/controller/dwc/pcie-designware-host.c:824:13: sparse:    right side has type restricted pci_power_t

We have a zillion of those warnings already (try "make C=2 drivers/pci/").

Personally I think it's better to omit the ugly cast and live with the
warning for now.  Someday somebody will figure a better way to use
pci_power_t that will fix all these warnings at once.  I'd rather wait
for that fix than clutter all the uses with casts like this.

Bjorn
