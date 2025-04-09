Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674CC25A324
	for <imx@lists.linux.dev>; Wed,  9 Apr 2025 07:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184673; cv=none; b=T7CSdQjUbD7+sSoVFfv7+EslzD1RhLz9O4h+7T/B5A0gfUCUKbDrDEi0aLQgSVQvm4tBvX9KPpqtX1WFE2B45zpTmpaleI+N5YuKEXzYoebv9yUQS6ZZrgK5Uk16N+i+qHp7xVSnJvM7bJeYx11kDjqSOTaDZ1NmPNtTrLKbePI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184673; c=relaxed/simple;
	bh=6/lISzTq668qQ7uGuyXccltwj34lZyxstw5bOAhTdQo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=Nc2IfRi/3CH5hBNF9HiUhz5i+VZqjyYu4bVoivZljT5BeNYFd5u+0h+6yvhZZ4ilBKkT3Pp2qIiRiGDqwTMgUWRSICPnm87otFnepzHcmjb8m5IlTilPg6n/YSJzrO0JQFM8jWj1RrJY1VidpgS+IMz6hxQIlA2seC8PksjqnxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KBN4MtLm; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KBN4MtLm"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4BAF44385;
	Wed,  9 Apr 2025 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744184669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=my7uBvqECB/sOAyowfZ/THu4bYXk54wQNm2Isuf7bmI=;
	b=KBN4MtLmPlhJT8jyUC4btDJo3IEAdZK//JQBMi7WbMu/B+rCd/e6Jjtu4cHLo5Kvj0EdSK
	cugph51E69gQ0bAP5GT4BfMviEgNRyDv+6Q2i207sMKEQ+GV5sawf6B9HJSK+Qsyn4X/PN
	4yPiF1OBscq24kUYPPVXW4w9d9VlbVXMqxUF0yNfYdo4rFZEZPVtEzqgkoHwrl0JJm7BzJ
	TSpA6RdHpamm5Yoj9OBR39bhxgTZKO8wDuumRem3GtazowyfpJjclvaPQM/0K9m+EiGHjT
	RDa4wOKHabrkyze9/YPiVgxCjo8zBIFHrKoSUYE+jAcFRe4jajvaKNcasMBX5g==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Apr 2025 09:44:25 +0200
Message-Id: <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
Cc: "Herve Codina" <herve.codina@bootlin.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Peter Rosin" <peda@axentia.se>, "Derek
 Kiernan" <derek.kiernan@amd.com>, "Dragan Cvetic" <dragan.cvetic@amd.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Rob Herring" <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Mark Brown" <broonie@kernel.org>, "Len Brown" <lenb@kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Daniel Scally"
 <djrscally@gmail.com>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Wolfram Sang"
 <wsa@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, "Allan Nielsen"
 <allan.nielsen@microchip.com>, "Horatiu Vultur"
 <horatiu.vultur@microchip.com>, "Steen Hegelund"
 <steen.hegelund@microchip.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>
From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
X-Mailer: aerc
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
 <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
In-Reply-To: <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdfvhhhomhgrshcurfgvthgriiiiohhnihdfuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeevledvgedtgfekgffffeefgfegieegffeivdekheejgfffueduvdehgeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: thomas.petazzoni@bootlin.com

On Tue Apr 8, 2025 at 5:38 PM CEST, Andrew Lunn wrote:

> "HW blocks inside an SoC." That would be the SoC .dtsi file. Anything
> outside of the SoC is in the .dts file. OEM vendors take the SoC,
> build a board around it, and name there .dts file after the board,
> describing how the board components are connected to the SoC.
>
> So..
>
> So by PCI endpoint, you mean the PCIe chip? So it sounds like there
> should be a .dtsi file describing the chip.
>
> Everything outside of the chip, like the SFP cages, are up to the
> vendor building the board. I would say that should be described in a
> .dtso file, which describes how the board components are connected to
> the PCIe chip? And that .dtso file should be named after the board,
> since there are going to many of them, from different OEM vendors.

Indeed, that makes sense. So if I get correctly your suggestion,
instead of having a .dtso that describes everything, it should be
split between:

 - A .dtsi that describes what's inside the LAN996x when used in PCI
   endpoint mode

 - A .dtso that includes the above .dtsi, and that describes what on
   the PCI board around the LAN966x.

Correct?

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

