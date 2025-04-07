Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A2A21638A
	for <imx@lists.linux.dev>; Mon,  7 Apr 2025 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046789; cv=none; b=HEpH+dJcAK8chr6LmmLm7SC4IK+rPy8clAmNdnZKxPwWPXOeIqGdZ1R3/fiAHaAv6NN7Rw5f+eduDRXxP3MYRVR3/kUOXP7C3A1YLn+6vWzRZCU4WuFnjR/TKJBRXEzFpLYlEQC4e6SRMAi5dkW6WUf/nRe3gy9HKoztyoE1mNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046789; c=relaxed/simple;
	bh=qCXjZbYfOUQdvaJOulkLaljFnMlS3JxgtFCl65KJ/WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=golQ+xx/8+IykE0p+JnwBs0BbIcwAS3OuGddjlPmoWNC261yZfTEtvG7lFqCIH4OuYoSHsEk8MNC8VyFkV3Au34DPzx15OfU6WbTAOowpov9+jjJXVbpeKGKFLFqHsQMmQN3BXNL7jz3aDivmBd/QH2xBH7YbwNVJvYXVGsjGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u1qEH-000000008Gs-2MWH;
	Mon, 07 Apr 2025 17:25:49 +0000
Date: Mon, 7 Apr 2025 18:25:43 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Li Yang <leoyang.li@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <michal.simek@amd.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Robert Hancock <robert.hancock@calian.com>,
	Saravana Kannan <saravanak@google.com>,
	Shawn Guo <shawnguo@kernel.org>, UNGLinuxDriver@microchip.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
Message-ID: <Z_QKl-4563l05WB3@makrotopia.org>
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390>
 <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
 <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
 <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
 <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>

On Mon, Apr 07, 2025 at 07:21:38PM +0200, Christian Marangi (Ansuel) wrote:
> Il giorno lun 7 apr 2025 alle ore 19:00 Sean Anderson
> > I agree that a "cells" approach would require this, but
> >
> > - There are no in-tree examples of where this is necessary
> > - I think this would be easy to add when necessary
> >
> 
> There are no in-tree cause only now we are starting to support
> complex configuration with multiple PCS placed outside the MAC.
> 
> I feel it's better to define a standard API for them now before
> we permit even more MAC driver to implement custom property
> and have to address tons of workaround for compatibility.

Qualcomm's PCS driver will require offering multiple phylink_pcs by a
single device/of_node. So while it's true that there is currently no
in-tree user for that, that very user is already knocking on our doors.

See
https://patchwork.kernel.org/project/netdevbpf/list/?series=931658&state=*
