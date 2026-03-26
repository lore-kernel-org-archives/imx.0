Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0CA3FAE11;
	Thu, 26 Mar 2026 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537641; cv=none; b=LOSU/e0K5qECkwUqBuk5Oggm3f3cILmBZFCESA+ldVvII5VBozHQ9mDhjmdwR8ILN3Ina/Aqs1Va8RhVp/wR/Sp4JzoORVlZkx0nP9VGaH+G0EiyVDgvuadbIotQa7Q3RgBqYANBFfU16BeR6BwQY4P9bfCc2WG3b2tNk35bUvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537641; c=relaxed/simple;
	bh=LO1oFh14z1O6KLrk2O+WUrI9N+3ROHB/C8xXT4WeNeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTD7y7ec1pCPnjWMV3XTlFGg3Rn2XCHSEnzdaDlkNOnz+EvC6BJVK2HgnR3AJG8+mx7EGxcipOmFleirplBssLXKOlHC7KIBMpogOSS9hPGDlONEC99osOmZp2Y+SQF8h2E+ipBoGcuIdro9nHlqXus1Nh3yYzacCxCXhRZf5jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=n5z6ZPE5; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="n5z6ZPE5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=owd16l7+Or4A0xmmYcujKyUBRd8f0q5codg/YsopPr0=; b=n5z6ZPE5137gKnKIsQiKbu/CHF
	nIS1YevwYFrxeZ2SbSi4e8GXHBAV+AX+uhHXhBjfnSRDJ6iQNG0C1Jsu3HteEzT9NcMfHwMzAYm6G
	fVJpfo2+FWqkrmkmDqXiHjTNlYXUx93goPqmB8uJ/OA2JwjVZrI2oFtrGJdjunDxxEok=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5mIi-00DUvB-BO; Thu, 26 Mar 2026 16:07:12 +0100
Date: Thu, 26 Mar 2026 16:07:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] arm64: dts: imx91-11x11-evk: remove unused
 property clock-frequency from mdio node
Message-ID: <309f557b-8008-4c65-8c01-6e1c68028af5@lunn.ch>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
 <20260326-b4-imx91-qsb-dts-v2-2-b991b81639e6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-2-b991b81639e6@nxp.com>

On Thu, Mar 26, 2026 at 03:51:38PM +0800, Joy Zou wrote:
> The clock-frequency property is not implemented. Remove it to clean up the
> device tree.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
