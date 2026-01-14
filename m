Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6536D35E544;
	Wed, 14 Jan 2026 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383598; cv=none; b=uGdEM5nloZJEJnkCEd3iyDYfLWsm2JxFSlxFnrf0Ai7GXtKjhicqVWI4sYuQQ6YXHZceIucoQqVOO2DHc/2LR9SfH6NOwiLYKiZm1tehuFjmso4E0fJynOYB0nocBajLifC7qHxieh1Av/h9LGvaNf1lZ5ZYlxgXBI0MJpVpEQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383598; c=relaxed/simple;
	bh=+GXQQLnzpHEdyH8KVg6e8QZ98cpG2jl4DlcMTaQxuJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJPQ4LBgeDTq62hEILPlqtWrzUlhHd6C/V5ZRTrpw6/1xVVjIMUZFPCqmQmoyeYaCJe6tlMA4QUKstEoOUMeuBja8JHvt+zDhl1XHhD28TVKlMCyH4qB5L5f4arGfqlw3UU/Z3oURBcIk0scYQZn6h5aZb9SfRSvXfy1z/Phdws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOL8KBix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOL8KBix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2A4C4CEF7;
	Wed, 14 Jan 2026 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768383598;
	bh=+GXQQLnzpHEdyH8KVg6e8QZ98cpG2jl4DlcMTaQxuJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOL8KBixIXVgTe+D9BYckQmKoVUpnaAUZfvP1BgU+CVQ4OnxryOOZCeXNP0BbnxQG
	 PtwzHVlmYg5J2UQx40Uw7SBsmjuAcNELO2k+usPpSQxRtAyDNUU3l++ynQH3pXQh0Q
	 AabjR2o1neRVlyvRZUkFGUiMIoLHfxezprrbQOMnf8P/fKaWC+1vkN7fCnvgcCR66E
	 W1dvyV1Tfc/nz2z6btswtF/eWPM3M8740faP3Jnz0HcDypJUbh+yRIhmPO7z37NYR3
	 62LbgstAfhKeKcvkZ2wfS3YhQcSc1CEuFlfr6sTjMQdgXKI0d3B0XwdGeu6nPuhZSv
	 V9pE+8auOTNIw==
Date: Wed, 14 Jan 2026 15:09:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Xu Yang <xu.yang_2@nxp.com>, neil.armstrong@linaro.org,
	shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, Frank.Li@nxp.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <aWdkapV39bOArR-d@vaman>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <c1425564-9dca-45dc-ac5e-093150a3ff01@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1425564-9dca-45dc-ac5e-093150a3ff01@lunn.ch>

On 08-01-26, 19:24, Andrew Lunn wrote:
> On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> > The CR port is a simple 16-bit data/address parallel port that is
> > provided for on-chip access to the control registers inside the
> > USB 3.0 femtoPHY[1]. While access to these registers is not required
> > for normal PHY operation, this interface enables you to access
> > some of the PHY’s diagnostic features during normal operation or
> > to override some basic PHY control signals.
> > 
> > 3 debugfs files are created to read and write control registers,
> > all use hexadecimal format:
> > ctrl_reg_base: the register offset to write, or the start offset
> >                to read.
> > ctrl_reg_count: how many continuous registers to be read.
> > ctrl_reg_value: read to show the continuous registers value from
> >                 the offset in ctrl_reg_base, to ctrl_reg_base
> >                 + ctrl_reg_count - 1, one line for one register.
> >                 when write, override the register at ctrl_reg_base,
> >                 one time can only change one 16bits register.
> > 
> > Link[1]: https://www.synopsys.com/dw/doc.php/phy/usb3.0/femto/phy/x652_usb3_ss14lpp_18_ns/4.07a/dwc_usb3.0_femtophy_ss14lpp_08V18V_x1_databook.pdf
> 
> Please don't ignore my comments to V2. Think about the code split
> between the generic IP licensed from Synopsys and the vendor specific
> code used for integration into the SoC. You want to avoid making a
> mess you later need to cleanup because somebody else licensed the same
> IP core from Synopsys, and need to put their own vendor specific
> integration code around the generic code.

Agree with Andrew here, please do mix, splitting would be better

> 
>     Andrew

-- 
~Vinod
