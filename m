Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE06482EB;
	Tue, 23 Dec 2025 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499556; cv=none; b=T4tTffxvniezvjcKHArIasm/sE0k2yi0Ltftln0+NHZ97I/0sJldGOps13cvFErn6/nQfykGgBVO4saGGJGwpnjauM4Qck4JccxPK/5UhEg4DJY3CePN5XbccRy1s2yqPRelyhHwmP1tqC1R2oNcPtZA24JhV1fQlSISD5dd1xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499556; c=relaxed/simple;
	bh=fHt+n+HRt03RdQYU56XGeelEoWfLQjIFIxqVDHoSshw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYE6HDLWGbBzbiiqCIFO4qkyLfh6m2uNCz9Grdk4t+g1JlCToVrAW5JV53NBqorsjkfOsswl9Pm4+FWtHGPUSdTPsb7kl1EBwZTWK9z5NNAmtdcDcGAseIQO8NNzTdmXPagX42frQ9sm69Ihj1RZ3NTsDCRTQeij31ZyryTVNwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/kmEJZv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/kmEJZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90FFC113D0;
	Tue, 23 Dec 2025 14:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766499555;
	bh=fHt+n+HRt03RdQYU56XGeelEoWfLQjIFIxqVDHoSshw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/kmEJZvsAd06e8rgHKVlKwZ+lVgKR/LV0wNMIIXTQifbMyDKqPrT5qe12+GnYQ0k
	 XhWZBPbeSEsVtxIIWj9qJSnne4t6Ko80n77DrSs7d8xUFIyNShpCtoTloWvAt48hG8
	 oSI4p9gZYPvJw2R0QEwN/9cn0r7Iqv4d8yUhCI8uS53epYKYuQIXvdkngKId4Va4zf
	 TScjfWXb8nIyOXz4QqMoZfQp9Sprfsn+ZQ1y0dMQwG3izKLjj6T+eU5/mbOKyrLMnq
	 n5kzznw9s6wSwtzGM5vYIckfzn3Z1orCuZDcjb1bO64G9R6XOM4YdXh2yt2BBQdDhc
	 tNP66KyFio/bg==
Date: Tue, 23 Dec 2025 19:49:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <aUqk3z8CSVldoO5V@vaman>
References: <20251219075447.3672833-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219075447.3672833-1-xu.yang_2@nxp.com>

On 19-12-25, 15:54, Xu Yang wrote:
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY. While access to these registers is not required
> for normal PHY operation, this interface enables you to access
> some of the PHY’s diagnostic features during normal operation or
> to override some basic PHY control signals.
> 
> 3 debugfs files are created to read and write control registers,
> all use hexadecimal format:
> ctrl_reg_base: the register offset to write, or the start offset
>                to read.
> ctrl_reg_count: how many continuous registers to be read.
> ctrl_reg_value: read to show the continuous registers value from
>                 the offset in ctrl_reg_base, to ctrl_reg_base
>                 + ctrl_reg_count - 1, one line for one register.
>                 when write, override the register at ctrl_reg_base,
>                 one time can only change one 16bits register.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 221 ++++++++++++++++++++-
>  1 file changed, 220 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index ad8a55012e42..cb2392008ad2 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (c) 2017 NXP. */
> +/* Copyright (c) 2017-2025 NXP. */
>  
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -52,6 +53,21 @@
>  
>  #define PHY_TUNE_DEFAULT		0xffffffff
>  
> +/* PHY control register access */
> +#define PHY_CTRL_REG_COUNT_MAX		0x42
> +#define PHY_CTRL_REG_OFFSET_MAX		0x201f
> +
> +#define PHY_CRCTL			0x30
> +#define PHY_CRCTL_DATA_IN_MASK		GENMASK(15, 0)
> +#define PHY_CRCTL_CAP_ADDR		BIT(16)
> +#define PHY_CRCTL_CAP_DATA		BIT(17)
> +#define PHY_CRCTL_CR_WRITE		BIT(18)
> +#define PHY_CRCTL_CR_READ		BIT(19)
> +
> +#define PHY_CRSR			0x34
> +#define PHY_CRSR_DATA_OUT_MASK		GENMASK(15, 0)
> +#define PHY_CRSR_CR_ACK			BIT(16)
> +
>  #define TCA_CLK_RST			0x00
>  #define TCA_CLK_RST_SW			BIT(9)
>  #define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> @@ -113,6 +129,9 @@ struct imx8mq_usb_phy {
>  	void __iomem *base;
>  	struct regulator *vbus;
>  	struct tca_blk *tca;
> +	struct dentry *debugfs;
> +	u16 cr_access_base;
> +	u16 cr_read_count;
>  	u32 pcs_tx_swing_full;
>  	u32 pcs_tx_deemph_3p5db;
>  	u32 tx_vref_tune;
> @@ -420,6 +439,204 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
>  	percent = min(percent, 100U);
>  
>  	return (percent * 127) / 100;
> +};
> +
> +#define IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT 500000

empty line here, possibly move this to top of file

> +static int imx8mq_phy_ctrl_reg_addr(struct imx8mq_usb_phy *imx_phy, u16 offset)
> +{
> +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> +	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
> +	struct device	*dev = &imx_phy->phy->dev;
> +	int i;
> +
> +	/* Address Phrase */
> +	writel(offset, cr_ctrl);
> +	writel(readl(cr_ctrl) | PHY_CRCTL_CAP_ADDR, cr_ctrl);
> +
> +	/* Wait CRSR[16] == 1 */
> +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> +		i--;
> +	if (i == 0)
> +		goto cr_addr_err;
> +
> +	writel(readl(cr_ctrl) & (~PHY_CRCTL_CAP_ADDR), cr_ctrl);
> +
> +	/* Wait CRSR[16] == 0 */
> +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> +	while ((readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> +		i--;
> +	if (i == 0)
> +		goto cr_addr_err;
> +
> +	return 0;
> +
> +cr_addr_err:
> +	dev_err(dev, "Failed to address reg 0x%x.\n", offset);
> +	return -EIO;
> +}
> +
> +static int imx8mq_phy_ctrl_reg_read(struct imx8mq_usb_phy *imx_phy, u16 offset)
> +{
> +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> +	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
> +	struct device	*dev = &imx_phy->phy->dev;
> +	int val, i;
> +
> +	/* Address Phrase */
> +	val = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
> +	if (val)
> +		return val;
> +
> +	/* Read Phrase */
> +	writel(readl(cr_ctrl) | PHY_CRCTL_CR_READ, cr_ctrl);
> +
> +	/* Wait CRSR[16] == 1 */
> +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> +		i--;
> +	if (i == 0)
> +		goto cr_read_err;
> +
> +	val = readl(cr_sr);
> +	writel(val & ~PHY_CRCTL_CR_READ, cr_ctrl);
> +
> +	/* Wait CRSR[16] == 0 */
> +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> +		i--;
> +	if (i == 0)
> +		goto cr_read_err;
> +
> +	return val;
> +
> +cr_read_err:
> +	dev_err(dev, "Failed to read reg 0x%x.\n", offset);
> +	return -EIO;
> +}
> +
> +static int imx8mq_phy_ctrl_reg_write(struct imx8mq_usb_phy *imx_phy,
> +				     u16 offset, u16 val)
> +{
> +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> +	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
> +	struct device	*dev = &imx_phy->phy->dev;
> +	int i, ret;
> +
> +	/* Address Phrase */
> +	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
> +	if (ret)
> +		return ret;
> +
> +	writel(val, cr_ctrl);
> +
> +	/* Set cr_cap_data to be 1'b1 */
> +	writel(readl(cr_ctrl) | PHY_CRCTL_CAP_DATA, cr_ctrl);
> +	/* Wait CRSR[16] == 1 */
> +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> +		i--;
> +	if (i == 0)
> +		goto cr_write_err;

seems like a repeated pattern, maybe move to a helper. (if driver used
regmap, it could have used helpers from regmap for this polling)

> +
> +	/* Clear cr_cap_data to be 1'br0 */
> +	writel(readl(cr_ctrl) & ~PHY_CRCTL_CAP_DATA, cr_ctrl);
> +	/* Wait CRSR[16] == 0 */
> +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> +	while ((readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> +		i--;
> +	if (i == 0)
> +		goto cr_write_err;
> +
> +	/* Set cr_write to be 1'b1 */
> +	writel(readl(cr_ctrl) | PHY_CRCTL_CR_WRITE, cr_ctrl);
> +	/* Wait CRSR[16] == 1 */
> +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> +		i--;
> +	if (i == 0)
> +		goto cr_write_err;
> +
> +	/* Clear cr_write to be 1'br0 */
> +	writel(readl(cr_ctrl) & ~PHY_CRCTL_CR_WRITE, cr_ctrl);
> +	/* Wait CRSR[16] == 0 */
> +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> +	while ((readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> +		i--;
> +	if (i == 0)
> +		goto cr_write_err;
> +
> +	return 0;
> +
> +cr_write_err:
> +	dev_err(dev, "Failed to write reg 0x%x.\n", offset);
> +	return -EIO;
> +}
> +
> +static int ctrl_reg_value_show(struct seq_file *s, void *unused)
> +{
> +	struct imx8mq_usb_phy *imx_phy = s->private;
> +	u16 i, val, base = imx_phy->cr_access_base;
> +
> +	for (i = 0; i < imx_phy->cr_read_count; i++) {
> +		val = imx8mq_phy_ctrl_reg_read(imx_phy, base + i);
> +		seq_printf(s, "Control Register 0x%x value is 0x%4x\n",
> +			   base + i, val);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ctrl_reg_value_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, ctrl_reg_value_show, inode->i_private);
> +}
> +
> +static ssize_t ctrl_reg_value_write(struct file *file, const char __user *ubuf,
> +				    size_t count, loff_t *ppos)
> +{
> +	struct seq_file		*s = file->private_data;
> +	struct imx8mq_usb_phy	*imx_phy = s->private;
> +	u16			cr_value;
> +	int			ret;
> +
> +	ret = kstrtou16_from_user(ubuf, count, 16, &cr_value);
> +	if (ret)
> +		return ret;
> +
> +	imx8mq_phy_ctrl_reg_write(imx_phy, imx_phy->cr_access_base, cr_value);
> +
> +	return count;
> +}
> +
> +static const struct file_operations ctrl_reg_value_fops = {
> +	.open		= ctrl_reg_value_open,
> +	.write		= ctrl_reg_value_write,
> +	.read		= seq_read,
> +	.llseek		= seq_lseek,
> +	.release	= single_release,
> +};

please use DEFINE_DEBUGFS_ATTRIBUTE for this

> +
> +static void debug_create_files(struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct device *dev = &imx_phy->phy->dev;
> +
> +	imx_phy->debugfs = debugfs_create_dir(dev_name(dev), imx_phy->phy->debugfs);
> +
> +	debugfs_create_x16("ctrl_reg_base", 0600, imx_phy->debugfs,
> +			   &imx_phy->cr_access_base);
> +	debugfs_create_x16("ctrl_reg_count", 0600, imx_phy->debugfs,
> +			   &imx_phy->cr_read_count);
> +	debugfs_create_file("ctrl_reg_value", 0600, imx_phy->debugfs,
> +			    imx_phy, &ctrl_reg_value_fops);
> +
> +	imx_phy->cr_access_base = 0;
> +	imx_phy->cr_read_count = 1;
> +}
> +
> +static void debug_remove_files(struct imx8mq_usb_phy *imx_phy)
> +{
> +	debugfs_remove_recursive(imx_phy->debugfs);
>  }
>  
>  static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
> @@ -724,6 +941,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  					"failed to get tca\n");
>  
>  	imx8m_get_phy_tuning_data(imx_phy);
> +	debug_create_files(imx_phy);

please use phy->debugfs as root node

-- 
~Vinod
