Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3996173320;
	Thu, 26 Sep 2024 02:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727318579; cv=none; b=ZQERiqhA877puBaQvTdO3JQY+CmepCf9PUib2gEC47SAOrnun/7wsa0ndbTO7+MWtksp6sVLFy+jk1wKErrrfDc6YeSHiJOJ14fEAgUXTqPWRKqWz8/fBt0H/oQZ5J80cVC0ymsC/5ffUZR8/gNeB6JPOYwsDBMiy6fhmbiBrH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727318579; c=relaxed/simple;
	bh=SBsfv9G2cKf7RTy1bhfbv4e+TyN17Gh9h5KKS1wDKD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpF6rmaX507DePqHU2N2Llu3KSVUWBiqZdKCNpSH6OvhPgH8lypeVWm9wKRZCUzy3/8usHU5FIkDTkoLlfaDGWBcfZywXcmBi/ndxFB7OnmblzpRMtggaER/wNgfKqDP8hea35ujhzhWJB4ecsSMeBCVd4dgxonNMiBw2+zXE48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqttN1Ap; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqttN1Ap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDCFC4CEC3;
	Thu, 26 Sep 2024 02:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727318578;
	bh=SBsfv9G2cKf7RTy1bhfbv4e+TyN17Gh9h5KKS1wDKD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqttN1Api4vX7Q+pEQzpgjo2JnTpoEFeZS/YbMtuaAXGy2bpAYd8Cpb5YLG8wqUWE
	 K0W3GjSMAxXJglyC4cDnMcE/A5dol/4RqZxhBTgO9J2ZkfLokTxa6KRM1cJjrTVJ83
	 w3pRJiJiYYHdkILsqUxUaS3JpuQLTeM/hoCoD7llQfgrJinl6qCSOpfGdGDkhdmueq
	 B+7rdHc3VG17xHGURtZHGEc+CCA2HZts1baKe/FqJUse5lFDYaitz4KD/RKkypxIST
	 f6s7ZG+5t6vXAwKup0ngwinE9yX3Eny7wllmRv/tkx2RAp3PrhufRa+fPypd+pb06i
	 raW6WGzhO0Dgg==
Date: Wed, 25 Sep 2024 21:42:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Hiago De Franco <hiago.franco@toradex.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-arm-kernel@lists.infradead.org,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	kernel@dh-electronics.com, imx@lists.linux.dev,
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Document DH i.MX8MP DHCOM
 SoM on DRC02 carrier board
Message-ID: <172731857648.2425652.8170546669366708307.robh@kernel.org>
References: <20240925160343.84388-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925160343.84388-1-marex@denx.de>


On Wed, 25 Sep 2024 18:03:07 +0200, Marek Vasut wrote:
> Document support for DH electronics i.MX8MP DHCOM SoM on DRC02 carrier board.
> This system is populated with two ethernet ports, two CANs, RS485 and RS232,
> USB, capacitive buttons and an OLED display.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Mathieu Othacehe <m.othacehe@gmail.com>
> Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Update subject prefix
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

