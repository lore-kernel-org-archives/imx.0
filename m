Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BF0A21
	for <imx@lists.linux.dev>; Wed,  2 Aug 2023 04:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BBDC433C8;
	Wed,  2 Aug 2023 04:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690952186;
	bh=jkqNebjbGSnF+JKGgJsSItHww469pXN74F0m7mNutlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIyEnXcHkhv1jvgI3nCnc6/9PJqXc9fTIm3eiqeI1DuD1AoXQVEOow+6u6MNiW5rq
	 03CLmHo3PLrZAqBT9yu8cN2nVN46FpTyDhxucWQ+84KDNLSoBU7gMBBPYPly/FGNiN
	 831dyR8JJfxxif73t+y1EIr0novEH/FyXEgd2iC9k0JXWwVs/sfepV/7Iq1dPCBCjf
	 8U+41Tq1GY6RPznJk7iuHRrNbJ0AoJohx6XGDohou7ALTh00dnlWNYIjk23nVhWdFy
	 ftf6N0MFSetfy1iKT6t2chVyOIrrBzpJOnNyiWEopjSmObJ8hnzgiapQqukZLa1+vm
	 4BiBxufmURavw==
Date: Wed, 2 Aug 2023 10:26:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: lpieralisi@kernel.org, bhelgaas@google.com, devicetree@vger.kernel.org,
	gustavo.pimentel@synopsys.com, helgaas@kernel.org,
	imx@lists.linux.dev, kw@linux.com, leoyang.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lorenzo.pieralisi@arm.com, manivannan.sadhasivam@linaro.org,
	minghuan.lian@nxp.com, mingkai.hu@nxp.com, robh+dt@kernel.org,
	roy.zang@nxp.com, shawnguo@kernel.org, zhiqiang.hou@nxp.com
Subject: Re: [PATCH v6 2/2] PCI: layerscape: Add power management support for
 ls1028a
Message-ID: <20230802045610.GE2370@thinkpad>
References: <20230731194010.73016-1-Frank.Li@nxp.com>
 <20230731194010.73016-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230731194010.73016-2-Frank.Li@nxp.com>

On Mon, Jul 31, 2023 at 03:40:10PM -0400, Frank Li wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Add PME_Turn_Off/PME_TO_Ack handshake sequence, and finally
> put the PCIe controller into D3 state after the L2/L3 ready
> state transition process completion.
> 

This commit message is wrong/outdated. Please describe what _this_ patch does.

> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> - Change from v5 to v6
>   change to NOIRQ_SYSTEM_SLEEP_PM_OPS to remove #ifdef PM_CONFIG
>   
> - Change from v3 to v5
>   none
> 
> -  change at v3
>   Basic rewrite whole patch according rob herry suggestion.
>   put common function into dwc, so more soc can share the same logic.
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 146 ++++++++++++++++++--
>  1 file changed, 137 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index ed5fb492fe084..f235c79600277 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -8,9 +8,11 @@
>   * Author: Minghuan Lian <Minghuan.Lian@freescale.com>
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/interrupt.h>
>  #include <linux/init.h>
> +#include <linux/iopoll.h>
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_address.h>
> @@ -27,12 +29,33 @@
>  #define PCIE_ABSERR		0x8d0 /* Bridge Slave Error Response Register */
>  #define PCIE_ABSERR_SETTING	0x9401 /* Forward error of non-posted request */
>  
> +/* PF Message Command Register */
> +#define LS_PCIE_PF_MCR		0x2c
> +#define PF_MCR_PTOMR		BIT(0)
> +#define PF_MCR_EXL2S		BIT(1)
> +
>  #define PCIE_IATU_NUM		6
>  
> +struct ls_pcie;
> +

Why do you need foward declaration?

> +struct ls_pcie_drvdata {
> +	const u32 pf_off;
> +	const u32 lut_off;
> +	bool pm_support;
> +};
> +
>  struct ls_pcie {
>  	struct dw_pcie *pci;
> +	const struct ls_pcie_drvdata *drvdata;
> +	void __iomem *pf_base;
> +	void __iomem *lut_base;
> +	bool big_endian;
> +	bool ep_presence;

Where is this variable used?

> +	struct regmap *scfg;
> +	int index;
>  };
>  
> +#define ls_pcie_pf_readl_addr(addr)	ls_pcie_pf_readl(pcie, addr)
>  #define to_ls_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  static bool ls_pcie_is_bridge(struct ls_pcie *pcie)
> @@ -73,6 +96,57 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
>  	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
>  }
>  
> +static u32 ls_pcie_pf_readl(struct ls_pcie *pcie, u32 off)
> +{
> +	if (pcie->big_endian)
> +		return ioread32be(pcie->pf_base + off);
> +
> +	return ioread32(pcie->pf_base + off);
> +}
> +
> +static void ls_pcie_pf_writel(struct ls_pcie *pcie, u32 off, u32 val)
> +{
> +	if (pcie->big_endian)
> +		return iowrite32be(val, pcie->pf_base + off);

Return value of this function is marked as void. So you should not return
anything.

> +
> +	return iowrite32(val, pcie->pf_base + off);
> +
> +}
> +
> +static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +	int ret;
> +
> +	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
> +	val |= PF_MCR_PTOMR;
> +	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
> +
> +	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
> +				 val, !(val & PF_MCR_PTOMR), 100, 10000);

As I mentioned in previous patch, if you intend to use 1ms, please change the
value to 1000.

> +	if (ret)
> +		dev_info(pcie->pci->dev, "poll turn off message timeout\n");

dev_err? Same below.

> +}
> +
> +static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +	int ret;
> +
> +	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
> +	val |= PF_MCR_EXL2S;
> +	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
> +
> +	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
> +				 val, !(val & PF_MCR_EXL2S), 100, 10000);
> +	if (ret)
> +		dev_info(pcie->pci->dev, "poll exit L2 state timeout\n");

Same as above.

> +}
> +
>  static int ls_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -91,18 +165,33 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
>  	.host_init = ls_pcie_host_init,
> +	.pme_turn_off = ls_pcie_send_turnoff_msg,
> +	.exit_from_l2 = ls_pcie_exit_from_l2,
> +};
> +
> +static const struct ls_pcie_drvdata ls1021a_drvdata = {
> +};
> +
> +static const struct ls_pcie_drvdata ls1043a_drvdata = {
> +	.lut_off = 0x10000,
> +};
> +
> +static const struct ls_pcie_drvdata layerscape_drvdata = {
> +	.lut_off = 0x80000,
> +	.pf_off = 0xc0000,
> +	.pm_support = true,
>  };
>  
>  static const struct of_device_id ls_pcie_of_match[] = {
> -	{ .compatible = "fsl,ls1012a-pcie", },
> -	{ .compatible = "fsl,ls1021a-pcie", },
> -	{ .compatible = "fsl,ls1028a-pcie", },
> -	{ .compatible = "fsl,ls1043a-pcie", },
> -	{ .compatible = "fsl,ls1046a-pcie", },
> -	{ .compatible = "fsl,ls2080a-pcie", },
> -	{ .compatible = "fsl,ls2085a-pcie", },
> -	{ .compatible = "fsl,ls2088a-pcie", },
> -	{ .compatible = "fsl,ls1088a-pcie", },
> +	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
> +	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
> +	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
> +	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
> +	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
> +	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
> +	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
> +	{ .compatible = "fsl,ls2088a-pcie", .data = &layerscape_drvdata },
> +	{ .compatible = "fsl,ls1088a-pcie", .data = &layerscape_drvdata },
>  	{ },
>  };
>  
> @@ -121,6 +210,8 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	if (!pci)
>  		return -ENOMEM;
>  
> +	pcie->drvdata = of_device_get_match_data(dev);
> +
>  	pci->dev = dev;
>  	pci->pp.ops = &ls_pcie_host_ops;
>  
> @@ -131,6 +222,14 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	if (IS_ERR(pci->dbi_base))
>  		return PTR_ERR(pci->dbi_base);
>  
> +	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
> +
> +	if (pcie->drvdata->lut_off)
> +		pcie->lut_base = pci->dbi_base + pcie->drvdata->lut_off;

Where is lut_base being used?

> +
> +	if (pcie->drvdata->pf_off)

No need of this check. In the absence of "pf_off", pf_base is going to be 0
which is anyway wrong if used. So just use "pf_off" directly.

If you really need the check, then you should use "pm_support" as below:

	if (pcie->drvdata->pm_support)
		pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;

This makes it clear that "pf_base" is only used if pm_support is enabled.

> +		pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
> +
>  	if (!ls_pcie_is_bridge(pcie))
>  		return -ENODEV;
>  
> @@ -139,12 +238,41 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	return dw_pcie_host_init(&pci->pp);
>  }
>  
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

Remove newline.

- Mani

> +	struct ls_pcie *pcie = dev_get_drvdata(dev);
> +	struct dw_pcie *pci = pcie->pci;
> +
> +	if (!pcie->drvdata->pm_support)
> +		return 0;
> +
> +	return dw_pcie_resume_noirq(pci);
> +}
> +
> +static const struct dev_pm_ops ls_pcie_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(ls_pcie_suspend_noirq,
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

-- 
மணிவண்ணன் சதாசிவம்
