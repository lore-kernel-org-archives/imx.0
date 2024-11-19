Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19AC1D0E39
	for <imx@lists.linux.dev>; Tue, 19 Nov 2024 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033795; cv=none; b=ldE4tY4jNbNP81QogjC2CU/NV5jbrvDCGnRFYM9GPplXaDGptR7JrN5jGrOc9f1jzB/LScHSlLc0U4NJRB9qAVRJmmaLiO2ooOHaVZjounX1N1qjSaMXMkqVZeH0gEHK7iATr1s7KA5ZfH0TBXeVFdV7Hrysz9iF1aow1F/NyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033795; c=relaxed/simple;
	bh=RXATsbGiXAylIA3CBbyEdpRy7B9Ix4MgCo6Xwj3gPkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNHS9EkH086uwekhDKoWDKWGxosqv09ZTrgCKpOUhFG8s5wwyPcuHXsuZB+FYBayOsL4VdHOXyBRZXvGH56+RqxDRhV/IcwuOdy0c2fxauXLF50hL9FZ9QQQKTMTyCnbUbhvmiZ5epNvMHwCMLU+3jnKJgGaPxcUXWzLO9qezv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Hl+xFznT; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Hl+xFznT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K6cvB2P8b6j3Lwm7hM2OTcs0P0dgEWuQp3DzRWBgfyM=; b=Hl+xFznT0ZO9nOiIDoP921nuAU
	wguQrdBji61yQDDhIoX32he25j7nI65IPKzsqg9Xcdo2P3GzxHo7o2qKS+YGaapmomzDGCosXv7gx
	3JaARgCvzBa+2lhl2gte0okv4X68JGdBJW2+BoXkU+Fm9dthr1deoqrGoIOWE7YaDgtspJLYDSsY7
	20c78olNCLCoM+vTyHxyO54rzyLQYW8hRnSwWvQdqfzj9dycaWfvcPWgd5Ia2vPHfpi+yeklr+NH4
	28bbf5ReTIxDisWJ71OWp4pDSS+RyxrYCcr7VJ73k/b+Puwrnce3QSv/+EuXAAdspOtlme0xo+PMc
	9O+AoNxA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38876)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDR6N-0003uM-2S;
	Tue, 19 Nov 2024 16:29:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDR6G-0006BT-0c;
	Tue, 19 Nov 2024 16:29:12 +0000
Date: Tue, 19 Nov 2024 16:29:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: jan.petrous@oss.nxp.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v5 03/16] net: stmmac: Fix clock rate variables size
Message-ID: <Zzy82JRZcT445lvA@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-3-7dcc90fcffef@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-3-7dcc90fcffef@oss.nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Nov 19, 2024 at 04:00:09PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The clock API clk_get_rate() returns unsigned long value.
> Expand affected members of stmmac platform data and
> convert the stmmac_clk_csr_set() and dwmac4_core_init() methods
> to defining the unsigned long clk_rate local variables.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

LGTM.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
