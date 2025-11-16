Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3E221ABDC
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 04:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763265775; cv=none; b=ararZvmMAQqVCGBiyzbdBsDH4305LQ5oSFP5gxZi+cgWDHqQPccEOQB0EdADnVQv3ikNI106lkfKPQv8+pek5K9OpIVTgvvV2Qpsxvw2KzDGj1CoQWLoeZqQ9dj+f32qztlNKTSSWkcnrmUukbs4OSy1LZl6edQJPChyPfY7HgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763265775; c=relaxed/simple;
	bh=Q7ue4S876L+raWlXiL7ilwE9gKagFdumxgDMR4PRIEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gr/hRt4LBf2Zb42BmA1yvl9Ip42A3fDC1ITWQTnpeEyWIKRFbWf83mz3K2B42xQLV7X1OPdtSxTXGhPTyCgL9knn3ZJKkdwKJpDRf+p+iyvTrZCxKRrsLRSuCaqiW0OFzIxGL754yBZNij2bbyxXcuIajEhRn5jqz8S6ede2cHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LShDOIkJ; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LShDOIkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=i0PZLFViVM77rtQbM2PYed3f5pGtD+vgIpymZKAXzLg=;
	b=LShDOIkJZ6RvjkNd4b2ARGJPDO4RoWigfTTqqUuOjYMsmb8ApWCyLKHeF+sOVw
	+F7FRh+N8iV9TL19PhvHbuJJfKnDIJfbbplLbEYihplOZeVD3m72CLLBzfqwy0vl
	5hr6nGK7vcXd+Y7Pv3Rb1XXXk9RbyXTB39t9OUEVMA3m0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3L5LATBlpox02AQ--.7862S3;
	Sun, 16 Nov 2025 12:02:10 +0800 (CST)
Date: Sun, 16 Nov 2025 12:02:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable i.MX95 drivers for pinctrl,
 Ethernet and PCIe
Message-ID: <aRlMwJ_CKoS1rpPn@dragon>
References: <20251027-upstream-imx95-smarc-defconfig-v2-1-0f664b08d553@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027-upstream-imx95-smarc-defconfig-v2-1-0f664b08d553@toradex.com>
X-CM-TRANSID:Mc8vCgB3L5LATBlpox02AQ--.7862S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWDKFy5Xw17Aw1xWr4kZwb_yoWfWFc_CF
	48GFnrCa1DGryvvwn3Krs2gFWF934DJw1Fg395Kr43CayxZw18XFsrJayrZr13urs5WrWI
	gFW3t393ArZ09jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUblfO7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgLjSWkZTMJ+wAAA3K

On Mon, Oct 27, 2025 at 09:17:53AM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> Enable i.MX95 pinctrl driver necessary for booting. Also enable the
> missing drivers required for Ethernet and PCIe functionality. These
> drivers are used on i.MX95 boards, including the NXP i.MX95 19x19 EVK.
> 
> The below configurations were enabled (listed with their DT nodes on
> imx95.dtsi):
> 
> * CONFIG_PINCTRL_IMX_SCMI for the `scmi_iomuxc` pinctrl.
> * CONFIG_CLK_IMX95_BLK_CTL for the HSIO domain clock controller
>   (`hsio_blk_ctl`) used by the PCIe controller.
> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
>   (`netc_blk_ctrl`).
> * CONFIG_NXP_ENETC4 for the Ethernet controller (`enetc_port*`).
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>

Applied, thanks!

