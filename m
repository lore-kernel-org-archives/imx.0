Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE7127F732
	for <imx@lists.linux.dev>; Wed, 18 Jun 2025 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238240; cv=none; b=ROKyBdV6PWC58XoTuu1VC0rl5DBV78YQ46jTk3XU2ktiCn79gkhPlty0Z0zXCoc+frQB4YJgkU5t9xrJ3DPn40QwTRK6rqw0YiH1bh4+L6DCYCnCgBuEWyXkkITgSvBj3F9DkBjCGWRnMhiEMDatT2cTFj+hQCISqqWIfuN8C1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238240; c=relaxed/simple;
	bh=9/y9FHBjcC0+yEMcHt+mytxyJj/uJFFXDYCq6SZ4OtY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mntv996CJUG6u0o7+qPHwyoI07ImqGKMF/GlOPbwttrw0GOhzM7MJ5pN5/KJWSJcXl92iO4O7Prx4y9dqBpOWde8hsAJIf6E1YsHy0G7bhH67DM2vRzdh5WVDA6h3s61F1tOHi62f9NoxfuXNRKosBA2NlqyujKXmcDnATjj8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IwwJeJbr; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IwwJeJbr"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 053624442B;
	Wed, 18 Jun 2025 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750238230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F98ijLO5pi6FUZlWFyCBwYzUs/rP2o8QKYXzxteZsmA=;
	b=IwwJeJbrTSaW/iHFSqrVITopalqsqiuFHsmPr8fWveZMQRUKIYp0Y6JsIyzINaTKWIMUkE
	QpQxavje7LE+TvlSs2psHa2HlNcTmDNz4Uwk7gzJn438AExYlRJX5gizS6bnJTL4bZz6d9
	e6aJUMdvjnp+HvnbDNznUgVqrIQ1BQUCQYCmFR/7EqRYW2DaJvSPW0zAIl90OQOX58Qn5V
	NF1CSjnJP9+OBMudRR8z+ITAW+RCHz7OlDzNwQlRDWALU+kzeQ74ze9KM0UjoP87MiIZHY
	BCbq1jrQYtdTGA6IPxSO3b/FVUJGK/tGtzFnThzjNnl16k3IypHJPrGvwfQq+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250602140946.941159-1-Frank.Li@nxp.com>
References: <20250602140946.941159-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: mtd: convert nxp-spifi.txt to yaml
 format
Message-Id: <175023822777.1656646.5704716073431650841.b4-ty@bootlin.com>
Date: Wed, 18 Jun 2025 11:17:07 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 02 Jun 2025 10:09:45 -0400, Frank Li wrote:
> Convert nxp-spifi.txt to yaml format.
> 
> Additional changes:
> - ref /schemas/spi/spi-controller.yaml.
> - remove label in example.
> - change node name to spi in example.
> - remove child node in example.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] dt-bindings: mtd: convert nxp-spifi.txt to yaml format
      commit: 27b045eb3e30ce9a436b8ee5bcb4869f7e3522a6

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

