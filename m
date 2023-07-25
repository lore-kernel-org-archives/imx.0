Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B791A25936
	for <imx@lists.linux.dev>; Tue, 25 Jul 2023 21:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A4FC43395;
	Tue, 25 Jul 2023 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690319350;
	bh=Ff/txvp9LavcXyHSeC+rlocRZ0Sp08Nd5An9D2bNHlo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BDV1HD0bvGtOIXU4MpTCrkUP96M9lIZ/iVDALRAikR3vF9otGcYeDrQT8TkjOQw1r
	 pUkBwOYpYL9DLYl2CjHdamfnuT5RGFZcoZzGV4LdDo71Qy7SGUTaqQV8yjg4bG9b+9
	 xBSoIcXHlbRdT8+6gsTpwKEhK7ZRmlann80tyoTXJg4KO2vX7/hWU5NRUIScK07osb
	 KFt8chH+cA/pcNgductXv5gySZoE3vM2A1VoronqXo0biA76YIRyJNA+yXL/QWjEv8
	 qzwfebCeQ16XqgW0nPuibL1q1i/3817xygdiGNLIElnW42db/IbNfR55yhLONIQRZM
	 57b81RFo2P31g==
Date: Tue, 25 Jul 2023 16:09:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: lorenzo.pieralisi@arm.com, manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com, devicetree@vger.kernel.org,
	gustavo.pimentel@synopsys.com, imx@lists.linux.dev, kw@linux.com,
	leoyang.li@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, mani@kernel.org, minghuan.lian@nxp.com,
	mingkai.hu@nxp.com, robh+dt@kernel.org, roy.zang@nxp.com,
	shawnguo@kernel.org, zhiqiang.hou@nxp.com
Subject: Re: [PATCH v5 2/2] PCI: layerscape: Add power management support for
 ls1028a
Message-ID: <20230725210908.GA665573@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724215830.2253112-2-Frank.Li@nxp.com>

On Mon, Jul 24, 2023 at 05:58:30PM -0400, Frank Li wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Add PME_Turn_Off/PME_TO_Ack handshake sequence, and finally
> put the PCIe controller into D3 state after the L2/L3 ready
> state transition process completion.
> ...

> +#ifdef CONFIG_PM_SLEEP
> +static int ls_pcie_suspend_noirq(struct device *dev)
> +{
> +	struct ls_pcie *pcie = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = pcie->pci;
> +
> +	if (!pcie->drvdata->pm_support)
> +		return 0;
> +
> +	return dw_pcie_suspend_noirq(pci);
> +}
> +
> +static int ls_pcie_resume_noirq(struct device *dev)
> +{
> +
> +	struct ls_pcie *pcie = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = pcie->pci;
> +
> +	if (!pcie->drvdata->pm_support)
> +		return 0;
> +
> +	return dw_pcie_resume_noirq(pci);
> +}
> +#endif /* CONFIG_PM_SLEEP */

You may be able to dispense with some of these #ifdefs as in
https://lore.kernel.org/all/20220720224829.GA1667002@bhelgaas/

> +static const struct dev_pm_ops ls_pcie_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(ls_pcie_suspend_noirq,
> +				      ls_pcie_resume_noirq)
> +};
> +
>  static struct platform_driver ls_pcie_driver = {
>  	.probe = ls_pcie_probe,
>  	.driver = {
>  		.name = "layerscape-pcie",
>  		.of_match_table = ls_pcie_of_match,
>  		.suppress_bind_attrs = true,
> +		.pm = &ls_pcie_pm_ops,
>  	},
>  };
>  builtin_platform_driver(ls_pcie_driver);
> -- 
> 2.34.1
> 
