Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2F01D0F54
	for <imx@lists.linux.dev>; Tue, 19 Nov 2024 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732034153; cv=none; b=FfenMebLyMXnB4pHwsNbvonf/lpvG6+kicB7m9OexcWAksmsk64rJVYwLnRMQ4OOEJIlS9VtTFl5eFo4H3q6aTQnFrHmmlta0zhFTWXZyRo0dEBtNpalY0ybGcgFixoE/dUIkX0Hija3kVV4H3/YjtMIGx1ti0IfKHtFS8RLcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732034153; c=relaxed/simple;
	bh=9hSWkMBgt870APoM/D9k2739I5SbHqE6+jg1F2AR9Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moXnKtlU4Ha2wr2tjL5nyAckKAr4U6ZXrR6a9TWfLDmIPhp98LHEBbVYWRlvyLkNAhzrQAIAeJHTdBJctmJg8R3zfA6VoXgI3kqQhHqCH9rntZQmuKJVVCIkdtK68rqu1FgkbzGAMRpF1RyQsEz9QdCn35Y1ajL1Wa5dYOkHoB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=UDpri3sO; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="UDpri3sO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7xA18VRo4Z9qnPm8nwpcEgS9wya8T5K5bzL5hA5cbhM=; b=UDpri3sOSy3XL6wD8vMGYXaz9I
	uFkGv8c9C6OrzOEX558YbBxIbG+wA4fNnowVtBRXPEuPzOcrh4R9JMyG9L9UchS7B+6YMQwt7noRM
	H60MpWZ5rmYhviuS4QRy77SDsnlrL48PfRUCkQfdx9UUhTL1oT2iBUzUIsRngk5vEPSjjbJ9ddKPK
	OvOhrs8UebepQWu0TtBJ3WdDMyJQfKN96yO24HMTwwZxP5Y5T4oBwlJ6ypqA1MFPRvbcIZiVmazIU
	SSXnHOk/rYkKCQci9B9IyJjirgrkpZ1euHCXp2ifT92GA7W6fgwNtbQn8JgWE1J0DPdL1Zu1NpU5r
	F6icPQPg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45606)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDRCH-0003vE-1T;
	Tue, 19 Nov 2024 16:35:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDRCD-0006Bj-2N;
	Tue, 19 Nov 2024 16:35:21 +0000
Date: Tue, 19 Nov 2024 16:35:21 +0000
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
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH v5 02/16] net: driver: stmmac: Extend CSR calc support
Message-ID: <Zzy-SYu3AgwaHeOD@shell.armlinux.org.uk>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-2-7dcc90fcffef@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-2-7dcc90fcffef@oss.nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Nov 19, 2024 at 04:00:08PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Add support for CSR clock range up to 800 MHz.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

These look fine.

Doing the calculations:

100M / 42 = 2.38MHz
150M / 62 = 2.42MHz
35M / 16 = 2.19MHz
60M / 26 = 2.31MHz
250M / 102 = 2.45MHz
300M / 124 = 2.42MHz
500M / 204 = 2.45MHz
800M / 324 = 2.47MHz

Since the target MDC clock frequency is 2.5MHz, these all look
reasonable to what is in the comment for the new clock selection
values.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
