Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92EA24468F
	for <imx@lists.linux.dev>; Mon, 12 May 2025 17:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747069919; cv=none; b=lFKg8TGoScGSmFySRX3/Bsq9F+bn0czrPFBTW02SUW7JKk1/jKWbsAzj/v1QJR+Y4y5s7OoDNnCJTpS6X+2UFpsSZd9CGiXFynYHq6X23RsSDn7bHYEgfaMbhacxwSSgOzNLTeoWGavNobJPH4sx5oNFOppT3eCe926yVQt9j/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747069919; c=relaxed/simple;
	bh=IVnOc9MOV2+02cQgtBlCO9R1yHhMZSXIztpUlnxj9J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUm+aW+IuO3j2UqzxP1UrMtzPJLLdEOR8PTSn5baf7gLTauZDXjS08KKKXhQBIykHpBwhxCPbe3Ii7w6tbhTox0K0XoC/iXUCq9rcUBvAF7n1YZ6l4Qza9zwWuobS0kPLIuxnf9H2GvCyb5lLuVNZpE16RTWdgNWLY9TETMjzM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uEWau-000000006LH-25Hs;
	Mon, 12 May 2025 17:11:32 +0000
Date: Mon, 12 May 2025 18:11:25 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>, upstream@airoha.com,
	Kory Maincent <kory.maincent@bootlin.com>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Robert Hancock <robert.hancock@calian.com>,
	Saravana Kannan <saravanak@google.com>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next PATCH v4 00/11] Add PCS core support
Message-ID: <aCIrvTAGP5ukmwnb@makrotopia.org>
References: <20250512161013.731955-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512161013.731955-1-sean.anderson@linux.dev>

On Mon, May 12, 2025 at 12:10:02PM -0400, Sean Anderson wrote:
> This series adds support for creating PCSs as devices on a bus with a
> driver (patch 3). As initial users,
> 
> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
> - The Cadence MACB driver is converted to support external PCSs (namely
>   the Xilinx PCS) (patches 9-10).

Are those changes tested on real hardware?
