Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FC7312805;
	Thu,  8 Jan 2026 18:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896680; cv=none; b=q4PnXciIYcewj36GxqqVRfmmBPZTzbuK5CqqP/FgBx4Z3SfDP2YxG2+PPu4v5T6VFOSPUIgjYsbPDtX1Wi2ki4Dt0ZIntf3thBhezyK1pC8ZceroQcSpRokuVMECq16cyT5J/r5EaGhywQeiUVtOyFzT2L7UKWmr+9z/mWFdPyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896680; c=relaxed/simple;
	bh=GtZrN+KA/WFKk0j2HgV1z+jjle5j8XbwWBxNKhNBBsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqym78tejYfyBQyfbXYLI4ctzBFcoMz10E/oSrlefmcieWPD5lB6BuctbsYXY5Sd01nywdRRKGTo/T4zccpOjeyt5v7DLDeZ15lftcKty3VwkTQLRz7mDeqEkJeHKL9/tez/H0SS6dYjJgZqi2fcnJR7nziKu6tbivohdGLmBOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=nGKcLUIL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nGKcLUIL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=IUwrWUOIpMj5TVaHyA5w/9OjOinSfTYecOzgun1vdNk=; b=nG
	KcLUILiB/z36vV4/ZAd41y9YeZ/Rnb53VPkMfS0BFeXE2axRKFffQ59bQfpPmdZKGJ8SgJVYlGrlu
	S6pSkCwFSYfZmHsctmkWQcfmd8WSNjbDP2go2kTczdXVNnT/DlDyTozsMFu8igt78DLAlMAer9AYC
	W1LoSctomNwqT78=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdugR-00205J-PQ; Thu, 08 Jan 2026 19:24:31 +0100
Date: Thu, 8 Jan 2026 19:24:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	Frank.Li@nxp.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <c1425564-9dca-45dc-ac5e-093150a3ff01@lunn.ch>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108083641.2119616-1-xu.yang_2@nxp.com>

On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY[1]. While access to these registers is not required
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
> Link[1]: https://www.synopsys.com/dw/doc.php/phy/usb3.0/femto/phy/x652_usb3_ss14lpp_18_ns/4.07a/dwc_usb3.0_femtophy_ss14lpp_08V18V_x1_databook.pdf

Please don't ignore my comments to V2. Think about the code split
between the generic IP licensed from Synopsys and the vendor specific
code used for integration into the SoC. You want to avoid making a
mess you later need to cleanup because somebody else licensed the same
IP core from Synopsys, and need to put their own vendor specific
integration code around the generic code.

    Andrew
