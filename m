Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552EA306D2A;
	Wed, 24 Dec 2025 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766584282; cv=none; b=fq+qTNRF/S8pekXDDfmvTWqi7PkbQlfjzq5sbicGJlQ4SSXurZ7QM4Y4/EebrV4la6/k0W9dA2pbziYJQz1H48q3Gft1yMiHlA/FXCyyaFE2Qlzf3Lpvfc6d+73RRUnwcNanLby145zVK81GupAb27QAQnObBAn3Mt7VVZ3WzcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766584282; c=relaxed/simple;
	bh=MANxf/xYrcM2xy1mi99JUIYqoczSq7NTUnITZVnMN2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqVo4SYOneJrkVelgBRrYbdUVCh2pdUdQZDeR19lEHCg1KtSTzXNK/EEJAUn79gbfZFTrIO7rGijpAyzIfKJwENzLeTWTR50N7+qKLRsCnLQoYr96ShT29oNeQGdFDKDuBj1U3DyaRvp8nq+GJioti/mFNpOJSLBAXnNaXk9OAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZbU3d3vt; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZbU3d3vt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ZcZ9ud6MrIIt3E5p0vRM1dPZEBiHBks0OHn0td+hkMI=; b=Zb
	U3d3vtlqyDpe1L0fl3J7uYSGVrTcxGTwWZyWJjYAasK025G+XWWmsgTC/01EkPP1TThtZskrv+/CE
	c7VheYUc/Lg1IsCZ5Si+3l5Du+jUXmJoFrTmClnFjl+FegAJVTyXK8uT/ekBqYMgqbl+gqSmWj8t2
	R/38FW45C93M/EI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vYPGh-000QDv-2y; Wed, 24 Dec 2025 14:51:11 +0100
Date: Wed, 24 Dec 2025 14:51:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	Frank.Li@nxp.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <9870fd41-bafb-4ab0-91ff-8fcea53ca0a9@lunn.ch>
References: <20251224111716.2925597-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251224111716.2925597-1-xu.yang_2@nxp.com>

On Wed, Dec 24, 2025 at 07:17:16PM +0800, Xu Yang wrote:
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

Are the registers openly documented somewhere? Could you include a
link in the commit message.

     Andrew
