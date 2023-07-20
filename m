Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCDF18AFC
	for <imx@lists.linux.dev>; Thu, 20 Jul 2023 18:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B42AC433C8;
	Thu, 20 Jul 2023 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689878114;
	bh=HHNimsGbYiF+yClPAucr45cH1YusC5uNBkDbI8K0mAY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OmjL2PG2eMtxrLt3oP1OxR+/uzlPfB8MjZmiJYl1L6pWvEghWDYm0gfovHvc5Dixv
	 U+NaKzWvVV4jKdZhGnw4dWSWXt24Ukz91kbFVvFqFriN1hgyL0uBOfbrX7YCCCJa6u
	 l24ySGuAGw9hEaqSlXKAmiiYrg10Xjz8gggGKd5V3BCrnQ2xITWN2+YLA3TsmeUCvG
	 77hZSu1eh/I89240jt+2roY+LVnEmgfZAqyZIaICyHWc7yu0EoDztFLo5I5pZ837ln
	 8oNnuNxku2U1U4S7eDkxiiFI5SY9OgXNqyGXFA+LA1HSKsQ42fu9Q+xYpp14Z9ZMk6
	 uQeG+7zzrFHIw==
Date: Thu, 20 Jul 2023 13:35:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	imx@lists.linux.dev, bhelgaas@google.com,
	devicetree@vger.kernel.org, gustavo.pimentel@synopsys.com,
	kw@linux.com, leoyang.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lorenzo.pieralisi@arm.com, minghuan.lian@nxp.com,
	mingkai.hu@nxp.com, robh+dt@kernel.org, roy.zang@nxp.com,
	shawnguo@kernel.org, zhiqiang.hou@nxp.com
Subject: Re: [PATCH v3 1/2] PCI: dwc: Implement general suspend/resume
 functionality for L2/L3 transitions
Message-ID: <20230720183512.GA539111@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720162758.GD48270@thinkpad>

On Thu, Jul 20, 2023 at 09:57:58PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Jul 20, 2023 at 11:20:27AM -0500, Bjorn Helgaas wrote:
> > On Thu, Jul 20, 2023 at 09:37:38PM +0530, Manivannan Sadhasivam wrote:
> > ...

> > > To be precise, NVMe driver will shutdown the device if there is
> > > no ASPM support and keep it in low power mode otherwise (there
> > > are other cases as well but we do not need to worry).
> > > 
> > > But here you are not checking for ASPM state in the suspend
> > > path, and just forcing the link to be in L2/L3 (thereby D3Cold)
> > > even though NVMe driver may expect it to be in low power state
> > > like ASPM/APST.
> > > 
> > > So you should only put the link to L2/L3 if there is no ASPM
> > > support. Otherwise, you'll ending up with bug reports when users
> > > connect NVMe to it.
> > 
> > Can you point me to the NVMe code that shuts down the device if
> > there's no ASPM support?  That sounds interesting and of interest
> > to other drivers that want to do suspend.
> 
> drivers/nvme/host/pci.c #3185
> 
> Note that, with ACPI based systems and for a few SSDs the behavior
> may change (check NVME_QUIRK_SIMPLE_SUSPEND flag).

For posterity, since the filename and line number may change:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/nvme/host/pci.c?id=v6.4#n3185

  static int nvme_suspend(struct device *dev)
  {
    struct pci_dev *pdev = to_pci_dev(dev);
    struct nvme_dev *ndev = pci_get_drvdata(pdev);
    struct nvme_ctrl *ctrl = &ndev->ctrl;
    int ret = -EBUSY;

    ndev->last_ps = U32_MAX;

    /*
     * The platform does not remove power for a kernel managed suspend so
     * use host managed nvme power settings for lowest idle power if
     * possible. This should have quicker resume latency than a full device
     * shutdown.  But if the firmware is involved after the suspend or the
     * device does not support any non-default power states, shut down the
     * device fully.
     *
     * If ASPM is not enabled for the device, shut down the device and allow
     * the PCI bus layer to put it into D3 in order to take the PCIe link
     * down, so as to allow the platform to achieve its minimum low-power
     * state (which may not be possible if the link is up).
     */
    if (pm_suspend_via_firmware() || !ctrl->npss ||
        !pcie_aspm_enabled(pdev) ||
        (ndev->ctrl.quirks & NVME_QUIRK_SIMPLE_SUSPEND))
            return nvme_disable_prepare_reset(ndev, true);

    nvme_start_freeze(ctrl);
    nvme_wait_freeze(ctrl);
    nvme_sync_queues(ctrl);
    ...

Added by 4eaefe8c621c ("nvme-pci: Allow PCI bus-level PM to be used if
ASPM is disabled"): https://git.kernel.org/linus/4eaefe8c621c
